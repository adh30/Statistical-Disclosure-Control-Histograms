program binsafe, sortpreserve 
*! based on Nick Cox's eqprhistogram with modifications to ensure bin area >=10 and use Sturge's rule for bin number if this is true.
* ADH 1.0 Aug 2023
	if `c(version)' == 8 local binmax "<=20"
	version 8 
	syntax varname(numeric) [if] [in] [aweight fweight] /// 
	[ , bin(numlist int >1 `binmax') HORizontal rug mean PLOT(str asis) * ]

	if "`horizontal'" != "" { 
		di as txt ///
		"{p}horizontal? interesting idea, but not possible{p_end}"
		exit 0 
	} 	
	// number of bins
	marksample touse 
	qui count if `touse' 
	local obs=r(N)
	local unsafe = trunc(`obs'/10)
		
	// #bins defaults to use Sturges' rule unless <10 observations per bin when bin number is reduced to ensure N = 10 per bin
	if "`bin'" == "" { 
		local bin = trunc(1+(ln(`obs')/ln(2))) 		// Sturge's rule
	}
		
	if `bin'>`unsafe' {
		local bin = trunc(`obs'/10)
	}
		
	local binp1 = `bin' + 1 
	local binm1 = `bin' - 1 
	
	// enough data? 
	if r(N) < `binp1' { 
		di as err "insufficient observations" 
		error 2000
	} 
		
	tempvar quantile qnum density 
	qui {
		// get quantiles
		su `varlist' [`weight' `exp'] if `touse', meanonly 
		if "`mean'" != "" local mean = r(mean) 
		generate `quantile' = r(min) in 1 
		replace `quantile' = r(max) in `binp1'  
		_pctile `varlist' [`weight' `exp'] if `touse', nq(`bin') 
		forval i = 1/`binm1' { 
			replace `quantile' = r(r`i')  in `= `i' + 1' 
		} 

		// check for tied quantiles 
		bysort `quantile'  : ///
			gen byte `qnum' = _N * (`quantile' < .) 
		su `qnum', meanonly 
		if r(max) > 1 { 
			noi di as txt ///
	                "{p}{res:`varlist'} has tied quantiles: " /// 
			"try fewer bins? graph inappropriate?{p_end}" 
			exit 0 
		} 	
		
		// prepare graph
		gen `density' = ///
		1 / (`bin' * (`quantile'[_n+1] - `quantile')) 
		_crcslbl `quantile' `varlist' 
		label var `density' "Density" 

		sort `quantile' `density'

		if "`rug'" != "" {
			forval i = 1 / `binp1' { 
				local levels "`levels' `=`quantile'[`i']'" 
			} 	
			local rug "xtic(`levels', tposition(inside))" 
		} 
		
		if "`mean'" != "" { 
			local mean "xline(`mean', lpattern(shortdash))" 
		} 	
	} 	

    	twoway bar `density' `quantile',                        ///
	bartype(spanning) bstyle(histogram) yscale(range(0))    /// 
	`mean' `rug' `options'                                  ///
	|| `plot'                                               ///
	// blank 
end

/*  

N.B. tied quantiles => exit 0 

1. This is regarded as a limitation of the method, rather than 
the error of the user, i.e. the graph can be drawn only if the 
data are suitable. 

2. exit 0 means that we can loop more easily over a set of 
variables and/or a set of bin numbers, as errors are 
trapped gracefully.

*/ 
		