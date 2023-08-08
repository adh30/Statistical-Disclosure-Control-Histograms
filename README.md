# SDCHistograms
## Histograms compatible with Statistical Disclosure Control (SDC) guidance
These are simple Stata programs for producing histograms in conformance with SDC guidance (see Handbook on SDC.pdf)

**binsafe** plots a histogram of the distribution of a variable constructed so that each bar represents the same fraction of the data (constant area histogram). No fraction contains fewer than 10 observations to accord with SDC guidance [1]. If all bin areas are >10 then the bin number is assigned using Sturges' rule [2].

**histsdc**  plots a frequency histogram that is compatible with Statistical Disclosure Control (SDC) guidance by replacing any value less than 10 with the value 10. A note is added to the histogram to this effect.

To use these just copy the ado file and its associated sthlp file into your personal directory.
## Authors
Alun Hughes (Twitter: @alundhughes30; Github: https://github.com/adh30)
## Acknowledgments
**binsafe** draws extensively on **eqprhistogram** by Nick Cox (n.j.cox@durham.ac.uk)

## References
1. Emily Griffiths et al. (2019) Handbook on Statistical Disclosure Control for Outputs. The Safe Data Access Professionals Working Group.
2. Herbert A. Sturges. (1926). The choice of a class interval. Journal of the American Statistical Association. 21 (153): 65–66. doi:10.1080/01621459.1926.10502161
