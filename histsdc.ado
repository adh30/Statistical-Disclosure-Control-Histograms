*! version 1.0.0 07Aug2023
* ADH 
program define histsdc
        version 14
		syntax varlist
		
		tempvar safecount xvar
		
		twoway__histogram_gen `varlist', freq gen(`safecount' `xvar')
		replace `safecount' = 10 if `safecount' <10 & `safecount'>0 //  option 1 as requested by Felicia

/* Other options 
option 2: replace safecount = 5 if rawcount <10 & rawcount>0. 5 might be a better choice 
than 19 since we are obscuring all data <10 and filling it with the midvalue 5 
could be more representative of the shape while still sufficiently uninformative.

option 3: this takes the approach used by the Scottish household survey 2018
replace safecount = 10 if rawcount <10 & rawcount>=5
replace safecount = 0 if rawcount<5 */

// graph
local a = trunc(`xvar'[2] - `xvar'[1]) // produces a sensible bar width
twoway (bar `safecount' `xvar',ysca(r(0)) barwidth(`a') note("Values < 10 & > 0 are shown as 10 for Statistical Disclosure Control (SDC) purposes"))

end