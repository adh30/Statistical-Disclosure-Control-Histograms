{smcl}
{* *! version 1.0beta  7 Aug 2023}{...}
{bf:histsdc} {hline 2} Statistical Disclosure Control (SDC) compatible frequency histograms

{marker syntax}{...}
{title:Syntax}
{p 8 16 2}

{cmdab:histsdc} {it:variable} {ifin}

{title:Description}
{pstd}{cmd:histsdc} plots a frequency histogram that is compatible with Statistical Disclosure Control (SDC) guidance by replacing any value less than 10 with the value 10. A note is added to the histogram to this effect. 

{marker examples}{...}
{title:Examples}
{pstd}Setup{p_end}
{phang2}{cmd:. webuse lbw}{p_end}
{pstd}Plot the histogram{p_end}
{phang2}{cmd:. histsdc bwt}{p_end}

{pstd}Setup{p_end}
{phang2}{cmd:. sysuse auto}{p_end}
{pstd}Plot the histogram{p_end}
{phang2}{cmd:. histsdc price}{p_end}

{title:Author}
{pstd}Alun Hughes,{p_end}
{pstd}UCL, London, UK.{p_end}
{pstd}alun.hughes@ucl.ac.uk{p_end}

{title:References}
{pstd} Emily Griffiths et al. (2019) Handbook on Statistical Disclosure Control for Outputs. The Safe Data Access Professionals Working Group.  



