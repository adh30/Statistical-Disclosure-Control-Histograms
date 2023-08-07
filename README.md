# SDCHistograms
## Histograms compatible with Statistical Disclosure Control (SDC) guidance
**binsafe** plots a histogram of the distribution of a variable constructed so that each bar represents the same fraction of the data (constant area histogram). No fraction contains fewer than 10 observations to accord with Statistical Disclosure Control (SDC) guidance [1]. If all bin areas are >10 then the bin number is assigned using Sturges' rule.

**histsdc**  plots a frequency histogram that is compatible with Statistical Disclosure Control (SDC) guidance by replacing any value less than 10 with the value 10. A note is added to the histogram to this effect.
## Authors
Alun Hughes (Twitter: @alundhughes30; Github: https://github.com/adh30)
## Acknowledgments
**binsafe** is a minor modification of **eqprhistogram** by Nick Cox (n.j.cox@durham.ac.uk)

## References
[1] Emily Griffiths et al. (2019) Handbook on Statistical Disclosure Control for Outputs. The Safe Data Access Professionals Working Group.
