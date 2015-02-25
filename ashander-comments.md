General comments
------------

This is an interesting comparative study of multi-infection models
(more on this terminology below) versus SI models, motivated by fungal
disease. The paper argues that multi-infection models are better
representations of fungal diseases than the SI models often used in
the literature. The main focus is demonstrating consequences of
misclassifying dynamics as SI when a process is multi-infection (or
vice versa), with a secondary focus on generation of age-dependent
effects in multi-infection models.  To explore these issues, the paper
sets up several mathematical models, then uses numerical simulation to
explore their full dynamics. The paper has nice exposition of the
matematical models, and is well-motivated by a biological question.

My overall reactions:

**Transient vs equilibrium differences in behavior-- focus on mortality rate**

The quantitative effects on population numbers shown as consquences
of misclassifying dynamics as SI when the are multi-infection (ie Fig
1, 4, 5) seem small for (5 % adult abundance). If maintaining any
metion of these effects on abundance, then need to make better case
for why they matter. However, the change in mortality seems larger,
more meaningful, and related to age-specific patterns in mortality
that I think are more interesting. I would:

* eliminate one of the initial conditions conditions as they seem the same (mention it, put figures in supplement)
* eliminate the infected hosts and host population panels, making the mortality transient a two panel figure depending on the initial-conditions or equlibirium conditions parameterization


**Focus the paper on this: Multi-infection models generate age-dependent effects not found in SI models.**

I found this section much more potentially interesting. But here, the
graphics are much less illustrative. To me, the main idea stated in
the discussion is compelling (is it novel?):

> Multiple-infection models indicate that age- or stage-related
patterns in disease mortality can arise from the accumulation of
infections over time, even in the absence of biological differences
among age class in susceptibility to disease.

So even in a trivial model of age strucure these age-dependent
differnences in distribution can drive differneces in observed mortality.
Cool stuff. But, need to show it better graphically. Some ideas:

* for SIV: stacked bar chart at 2-3 time points, or stacked ribbon plot over timeseries
* for multi: density plots at several time points or for the whole series
* **actual plots of the mortality**

Caveats/concerns:

* Even with this focus I'm skeptical about the mortality transient being interesting. At the very least the transient provides a nice illustration of the point you raise at the end of discussion -- that changes in mortality rate are necessary (not sufficient) indicators of these dynamics
* If the goal is to discuss dangers of misdetection at equlibirium vs initial phase of establishment, why not take a data-simulation + model fitting approach (with power analysis / ROC, etc)?

Terminology:
* describing  structured models as null seems correct, but atypical in my expereince 
* terming AM type macroparisite models as "multi-infection models" is
  sensible given goals of this paper, but risks confusion with ideas
  of multiple-infection in epidemiology (which refers to multiple
  strains). What to Duerr, Krasnov or Pacala & Dobson call these?

Figs:
* more descriptive captions!
* change the linetype to key off model type since that is the main comparison
* also it's confusing to have order (from light to dark) SIV, SI, multi but this would disappear if omitting figure legends and describe linetype meanings in caption
* better infection plots to show age-dependent effects
* time to 10 % == equivalent initial so put one in the supplement 

Structure:
* final p'graph of intro would be stronger if stating concretely the questions examined. (Some give away the results at this point too.)
* first p'graph of discussion should state concretely the most interesting finding


Minutae:
1. avoid using _italics_ for emphasis -- some jounals don't allow them and they're arguably a crutch that avoids structural and syntactic methods to emphasize key points
2. grammar /typo/spell check needed
