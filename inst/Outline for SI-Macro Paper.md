---
author: Noam Ross
date: 'September 16, 2014'
title: 'Comparative dynamics of SI and multiple-infection models'
...

Introduction
------------

1.  Response to disease outbreak often requires prediction of medium- and long-term behavior from early-phase dynamics of disease. However, at early phases, appropriate models for disease dynamics may not be known.

2.  Several forms of emerging wildlife and forest diseases (SOD, beech bark disease, chytridiomycosis, white nose syndrome), have been found to be driven by spore loads. [@Briggs2010, @KateSporeLoad, @DaphniaPapersbyDuffy]

(Here I use the term multi-infection to refer to such diseases)

3.  The multi-infection, or macroparasite framework [@Anderson1978] may be a more appropriate model for such diseases than SIR models.

    1.  Plant diseases potentially have macro-parasite-like mechanisms [@Dobson1994], but they are rarely modeled this way, even though some patterns justify it (See Martinez1996 for examples in mistletoe, @Waggoner1981 and @McRoberts2003 for more general examination of infection count distribution).

4.  Stage and age structure is often an important factor in the dynamics of these diseases (chytrid, SOD).

    There is a considerable literature on the dynamics of disease dynamics of in age-structured populations (e.g. Castillo-Chavez et al. 1989; Busenberg and Hadeler 1990; Diekmann and Heesterbeek 2000; Hethcote 2000; Dietz and Heesterbeek 2002; Thieme 2003), with a somewhat smaller literature on stage-structured populations [@Klepac2010].

The role of age structure in multi-infection (or macroparasite) models.

@Krasnov2006 showed, for instance, that parasite counts increase with age in rodents. @Pacala1998 created a method to detect the mortality effect of macroparasites based of the distribution of parasites among different age groups. @Duerr2003 showed how a age-infection relationships could be modified by a variety of age- time- and density-dependent processes, but also showed that interpretation of such age-infection patterns was ambiguous if more than one such process was operating.

    @Briggs2010 created a stage-structured individual-based model of *Batrachochytrium mycosa* (Bd) infections in frogs, finding that low-susceptibility tadpoles could act as disease reservoirs and promote disease persistence.

@Krkosek2013, using the @Anderson1978 simplication demonstrated that macroparasites can induce an Allee effect.

In the case of an emerging disease, how important are the differences in dynamics between multi-infection and

5.  Questions: How do the dynamics of SI and multi-infection models differ?
    1.  How do models with similar early-phase behavior compare in long-term behavior, and vice versa?
    2.  How do patterns of disease in stage-structured populations differ between SI and multi-infection models

Methods
-------

1.  I compared dynamics in 3 ODE-based disease models: A simple $SI$ model, and multi-infection model after @Anderson1978, and an intermediate $SIV$ (susceptible-infected-*very* infected) model.

    1.  A simple model of an $SI$ epidemic in a population with density-dependent recruitment and a two-stage population structure.

        $$\begin{aligned}
          \frac{dJ_S}{dt} &= N(1 - N) -
                             J_S(d + g + \lambda J_I + \lambda A_I)
          &\frac{dA_S}{dt} &= g J_S - A_S(d + \lambda N) \\
          \frac{dJ_I}{dt} &= \lambda J_S (J_I + A_I) - J_I(d + g + \alpha)
          &\frac{dA_I}{dt} &= g J_I + \lambda A_S (J_I + A_I) -
                              A_I(d + \alpha) \\
          N &= J_S + A_S + J_I + A_I
        \end{aligned}$$

    2.  For the $SIV$ and multi-structure models, there are additional classes representing degrees of infection. Mortality $(\alpha)$ and infectivity $(\lambda)$ are additive in these models.

        $$\begin{aligned}
          \frac{dJ_0}{dt} &= N(1 - N) - J_0(d + g + \Lambda)
          &\frac{dA_0}{dt} &= g J_0 - A_0(d + \Lambda) \\
          \frac{dJ_i}{dt} &= \Lambda dJ_{i-1} -
                             J_i(d + g + i\alpha + \Lambda)
          &\frac{dA_i}{dt} &= g J_i + \Lambda A_{i-1} -
                             A_i(d + i\alpha + \Lambda) \\
          \frac{dJ_k}{dt} &= \Lambda dJ_{k-1} - J_k(d + g + k\alpha)
          &\frac{dA_k}{dt} &= g J_k + \Lambda A_{k-1} - A_k(d + k\alpha) \\
          N &= \sum_{i=0}^k J_0 + A_0
          &\Lambda &= \lambda \sum_{i=1}^k i(J_i + A_i)
        \end{aligned}$$

        For $SIV$ model, $i_\max = k = 3$. For the multi-infection model, $i_\max = k = \infty$. For numerical simulations, this value is truncated to 150. Performed simulations in R (@REF), using the deSolve package (@REF)

    3.  These are *null models* of age structure, as both demographic and epidemiological parameters do not vary with age.

    4.  We simulated the full model rather than the reduced model based on an assumption of negative-binomial distributions, as the negative- binomial only approximates the full model asymptotically @Adler1992. In Appendex @REF, we show that it also deviates from the full model at equilibrium when age structure is introduced.

2.  As the models are different structurally. I parameterized the $SIV$ and multi-infection models so that their behavior was identical according to several different criteria. In all these comparisons, I consider the "infected" trees of the SIV and multi-infection models as those with one or more infections.

    -   **Equilibrium mortality rate**. Models were parametrized so that the mortality rate of infected trees at equilibrium was equal. That is, \$\alpha\_I\bigg|\text{eq} = \$\sum \alpha
    -   Initial growth rate and acceleration $(dI/dt and d^2I/dt^2)$
    -   Time to 10%, 50%, and 90% infection.
    -   Time to 10% and equilibrium mortality rate combined.
    -   Minimizing the overall squared error between the models over time.\*

Results
-------

1.  Qualitative differences between SI and multi-infection models are largely present in the differences between SI and SIV models. As the number of infection classes increases, model behavior approaches the behavior of the infinite-class multiple-infection model.

2.  Bifurcation analysis

    1.  Calculation of $R_0$ for all 3 models. Demonstration that $R_0$, initial disease growth rate, are identical for all 3.

    2.  Common behavior above and below $R_0 = 1$. Disease suppresses equilibrium population size.

3.  Models with similar equilibrium behavior differ in their transients as epidemics get under way.

    1.  Models with equivalent equilibrium behavior will have very different invasion criteria. Multi-infection will be *less* likely to become epidemic from a single infection

    2.  A repeated-infection model with an equivalent equilibrium state (number of individuals, fraction infected, mean mortality rate), to an SI model will take longer to reach equilibrium than the SI model. During the initial transient, the mortality rate of infected trees starts below the equilibrium state and increases to the equilibrium state, while in the SI model it remains constant.

4.  Models with similar initial behavior reach different equilibrium conditions

    1.  When models are parameterized so that 1st and 2nd derivatives are the same across SI and multi-infection, per-infection parameters in the multi-infection models (mortality and infectivity), are the same as per-individual parameters in the SI model.

5.  Multi-infection models generate age-dependent effects not found in SI models

    1.  In a multi-infection model with age structure, individuals accumulate infections over time, resulting in more infections, and thus greater mortality and infectivity, among older individuals than younger individuals. Even in the absence of age-driven variation in how individuals respond to disease (that is, in a "null model"), different behavior is observed between age groups. In an SI model, these differences do not arise.

        1.  Figure showing evolution of infection distributions over time.

    2.  These effects increase as the transition rate from juvenile to adult age classes increase. this changes the relative amount of time individuals in each class have had to acquire infections.

Discussion
----------

1.  Epidemics that appear to be well represented by $SI$ models during their outbreak phase may no longer be well represented in later stages.

    1.  A multi-infection model that behaves like an $SI$ model in early stages will have greater mortality rates at equilibrium, suppressing population more. A *smaller* fraction of the population will be infected at equilibrium, because it

2.  If a disease is driven by multi-infection mechanisms, age effects may (in part) be artifacts of infection accumulation in older individuals, rather than biological differences.

    @McCallum1995 suggested that comparison of infection counts between different aged individuals may be useful in inferring disease mortality rates. Similarly, these results suggest that, in the absence of infection counts, differences between age groups in effects of disease, such as mortality, may be indicative of load-driven disease mechanisms.

3.  Reduced version of multi-infection model (SIV) is sufficient for many applications.

4.  Future work

    1.  Can the models be distinguished in noisy data?
    2.  Detection thresholds higher than $i=1$
    3.  Compare *variation* in mortality rates across models with explicit variation/stochasticity.
    4.  Ultimate measure of the loss due to incorrect model is in relative utility of management presuming $SI$ or macroparasite models.

Appendix:
---------

1.  Show Klieber-Ludwig divergence of multi-infection model from negative binomial distribution during transient phase

2.  Show analysis of divergence of simplified version of multi-infection model [@Anderson1978] from full model when age structure.

**Notes from Meeting with Alan, September 16, 2014**

Different than epidemics, which are all transients, transients here with host population dynamics.

Analysis of SIRs has been focused on total individuals getting disease, rather than time scale of buildup. Assume separation of time scales.

Diekman's textbooks on that for review. From more mathematical perspective Fred Bauer and Carlos Castilo Chavez. Springer books.
