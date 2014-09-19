---
author:
- Noam Ross
date: '13-12-04 10:56:32'
title: Progress of an Epidemic under Age Structure and Repeated Infections
...

Abstract
========

Age structure in a model with repeated infections violates standard assumptions
of disease distribution, changing disease dynamics. When disease and demographic
time scales are similar, the formation of disease "cohorts" can lead to
multi-modal distributions of infections.

Introduction
============

-   Review of age structure in disease model (limited, as this is large)
    -   Recent Caswell paper on matrix models [@Klepac2010]
-   Review of multiple-infection literature (less limited)
    -   [@Anderson1978]
-   Review of overlap of the two (only a couple of papers)
    -   [@Pugliese2004; @Pugliese2008]
-   Diseases modeled as SI for which multiple infection may be appropriate.
    -   Sudden Oak Death
    -   What else? Chestnut blight,

The transient phase is often of importance, especially in the case of newly
invading diseases.

@Adler1992 showed that the third moment of the distribution was a function of
the mean and mean/variance ratio, but only *asymptotically*

Models
------

I created a model representing a stage-structured population invaded by a
macroparasite-like disease. The population is divided into classes by stage
$(i)$ and number of infections $j$. New individuals enter the smallest
disease-free, stage $(i = 1, j = 0)$, via density-dependent recruitment function
$F(\cdot)$:

$$F(\cdot) = \sum_{i,j} f_i N_i 
            \left( 1 - \frac{\sum_{i,j} \omega_i N_i}{K}\right)$$

Individuals advance to larger stages at constant rates $g_i$. Each stage has
specific fecundity $f_i$ and disease-independent mortality $(d_i)$ rates, and
contribution to density dependent $\omega_i$, reflecting the increased shading
of larger trees.

Infection in the model is density-dependent. Each infection on each individual
produces spores at rate $\lambda_i$ resulting in a total spore burden
$(\Lambda)$ of

$$\sum_i \lambda_i \sum_j j N_{i,h}$$

Individuals become infected, advancing from $j$ to $j + 1$ at rate
$\beta_i \Lambda$. Individual infections may recover at rate $\mu_i$.

Trees die of disease at a rate proportional to their number of infections
determined stage-specific parameter $\alpha_i$, for a total mortality rate of
$d_i + j \alpha_i$.

In the first version of the model, demographic and epidemiological rates were
set to constant values across stages.

The model is represented by the following infinite set of equations:

Equations \$\$

While the number of infection classes $j$ is infinite, for purposes of
simulation we limited the number of infection classes to $j_{\max} = 150$.
Individuals with the maximum number of infections $(j = j_\max)$ were assumed to
have zero vulnerability $(\lambda)$ to new infections.

By setting the maximum number of infections per individual $(j_{\max})$ to one,
this is converted to a stage-structured $SI$ disease model where $N = S + I$ and
$I = P$.

The multiple-infection model and the $SI$ model represent

In the first comparison, I increased the disease-mortality rate $(\alpha)$ in
the $SI$ model so as to produce identical overall mortality rates of infected
trees \$(j \geq 1) at equilibrium.

In the second comparison, I modified age-specific mortality rates in the $SI$
model so as to match the equilibrium mortality rates of infected trees in each
stage class in the multiple-infection model.

Equilibrium analysis
--------------------

At identical equilibrium mortality rates for infected individuals $\alpha_{SI}$
model is related to \$\alpha\_{\text{multi}} by

Here I assume the negative binomial distribution in calculating equilibrium
rates.

At equilibrium, individuals in later stages have considerably higher mortality
rates. To produce this activity in the $SI$ model, I modify the $\alpha_i$
vector.

Transient dynamics
------------------

@Anderson1978 approximate this infinite system by assuming a negative-binomial
distribution of the number of infections across individuals. However, this
approximation breaks down in the case of discrete stage structure (shown in
Appendix I). Also, @Adler1992 demonstrated that the distribution of infections
only approached a stable form at equilibrium. Thus simulation of the infinite
system is necessary for analysis of transient dynamics.

In Figure X, I show the Klieber-Luwdig (\#SP) divergence (KLD) (\#REF) of the
distribution of infections relative to a best-fit negative-binomial
approximation determined by maximum likelihood. Over the course of the epidemic
the distribution of infections, both within and across stage classes, diverges
wildly from a negative-binomial distribution. As the system approaches
equilibrium, the distribution's form comes to resemble the negative-binomial,
but it does not approach this.

Figures Xa-c demonstrate why this occurs by showing the full distribution of
infections for each stage at several snapshots in time. Individuals infected
early in the epidemic enter larger stage classes carrying infections, leading to
high mean infections in these older classes. Shortly after, the pulse of
mortality following the epidemic results in new recruitment (due to density
dependence), and many uninfected individuals entering the smallest size class.
Overall, this results in a bimodal distribution of infections. Later in the
course of the epidemic, the distribution become unimodal. Even at equilibrium,
though, the the regular influx of new, uninfected individuals, which is balanced
by mortality, means the system never approaches a negative binomial
distribution.

[The online version of this article contains an interactive graphic of this]

-   A version of @Anderson1978 ODEs with age structure
-   An infinite set of ODEs with age structure
-   An equivalent stochastic poisson-process based model with multiple
    infections and age structure

Results
-------

-   Analytics: Show how the @Anderson1978 deviates from the infinite set of
    equations when there is age structure
-   Numerical results: Show the multi-modality of infection distribution
-   Show how how looking at data as only SI would result in mis-characterization
    of relative parameters of age classes
-   Compare each ODE model with outputs of stochastic model. How do each compare
    to steady-state and transient conditions?

Discussion
----------

-   Underlying assumptions of infection/parasite distribution break down in the
    face of other population structure
-   Disease structure can reflect underlying pop structure
-   What diseases should be represented with multiple infections? What disease
    have age-related patterns that may be due to repreated infections?

General Notes
-------------

-   Bimodal distributions occur even in the absence of age structure. They occur
    In the transient due to the arrival of new individuals in the space occupied
    by the recently killed invididuals. Total behavior in the face of age
    divisions with no demographic differences in age structure is identical
-   Neg. binomial always problematic with new births occurring. Real distibution
    has more zero and small values than predicted with negative binomial.
    However, it is a much bigger problem during the transient period of the
    disease. (As was previously discussed by XXXX). As the disease approaches a
    long-term equilibrium, the distribution is close but not quite negative
    binomial.

-   Diseased equilibrium always has lower N, and smaller-individual skewed stage
    distribution than DFE.
-   Relative mortality rates diverge during invasion, then converge a little.
    Divergence occurs in stages as infected individuals enter each successive
    age class, increasing its mortality rate. The degree of shrinkage is greater
    with low growth rates; with high growth rates, mortality rates don't spread
    out or bounce back as much.
-   Equilbrium mortality rates aren't that different across growth rates.
-   In slow-growing conditions, mortality rate diverge later, because at first
    very little of the mortality in older plants is from infections while they
    are younger.  
-   Also, in slow-growing conditions, mortality in each group will be higher,
    though since more individuals will be small, overall mortality remains the
    same across growth rates.

Key points: variability in infectious period

Management implications: Remove the *most* infected trees

If the ability to cull infected individuals is limited, the epidemic is likely
to be better contained by removing the *most* infected trees.

One challenge is to distinguish between number of infections and disease stage.
These are likely to be very challenging to disentangle in the field, as
late-stage individuals also likely will have been infected multiple times, as
well.

@Cobb2012 found that mortality rates in infected trees were infected, suggesting
that mean

Possible other systems: Chytrid fungus, white nose syndrome.

