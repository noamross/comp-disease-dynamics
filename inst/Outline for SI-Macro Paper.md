---
author: Noam Ross
date: 'September 16, 2014'
title: 'Comparative dynamics of SI and multiple-infection models'
...

Introduction
------------

1.  Response to disease outbreak often requires prediction of medium- and
    long-term behavior from early-phase dynamics of disease. However, at early
    phases, appropriate models for disease dynamics may not be known.

2.  Several forms of emerging wildlife and forest diseases (SOD, beech bark
    disease, chytridiomycosis, white nose syndrome), have been found to be
    driven by spore loads. [@Briggs2010, @KateSporeLoad, @DaphniaPapersbyDuffy]

(Here I use the term multi-infection to refer to such diseases)

3.  The multi-infection, or macroparasite framework [@Anderson1978] may be a
    more appropriate model for such diseases than SIR models.

    1.  Plant diseases potentially have macro-parasite-like mechanisms
        [@Dobson1994], but they are rarely modeled this way, even though some
        patterns justify it (See Martinez1996 for examples in mistletoe,
        @Waggoner1981 and @McRoberts2003 for more general examination of
        infection count distribution).

4.  Stage and age structure is often an important factor in the dynamics of
    these diseases (chytrid, SOD).

    There is a considerable literature on the dynamics of disease dynamics of in
    age-structured populations (e.g. Castillo-Chavez et al. 1989; Busenberg and
    Hadeler 1990; Diekmann and Heesterbeek 2000; Hethcote 2000; Dietz and
    Heesterbeek 2002; Thieme 2003), with a somewhat smaller literature on
    stage-structured populations [@Klepac2010].

The role of age structure in multi-infection (or macroparasite) models.

@Krasnov2006 showed, for instance, that parasite counts increase with age in
rodents. @Pacala1998 created a method to detect the mortality effect of
macroparasites based of the distribution of parasites among different age
groups. @Duerr2003 showed how a age-infection relationships could be modified by
a variety of age- time- and density-dependent processes, but also showed that
interpretation of such age-infection patterns was ambiguous if more than one
such process was operating.

@Briggs2010 created a stage-structured individual-based model of
*Batrachochytrium mycosa* (Bd) infections in frogs, finding that
low-susceptibility tadpoles could act as disease reservoirs and promote disease
persistence.

@Krkosek2013, using the @Anderson1978 simplication demonstrated that
macroparasites can induce an Allee effect.

In the case of an emerging disease, how important are the differences in
dynamics between multi-infection and

5.  Questions: How do the dynamics of SI and multi-infection models differ?

    1.  How do models with similar early-phase behavior compare in long-term
        behavior, and vice versa?

6.  How do patterns of disease in stage-structured populations differ between SI
    and multi-infection models

Methods
-------

1.  I compared dynamics in 3 ODE-based disease models: A simple $SI$ model, and
    multi-infection model after @Anderson1978, and an intermediate $SIV$
    (susceptible-infected-*very* infected) model.

    1.  A simple model of an $SI$ epidemic in a population with
        density-dependent recruitment and a two-stage population structure.

        $$\begin{aligned}
          \frac{dJ_S}{dt} &= fN(1 - N/K) -
                             J_S(d + g + \lambda J_I + \lambda A_I)
          &\frac{dA_S}{dt} &= g J_S - A_S(d + \lambda N) \\
          \frac{dJ_I}{dt} &= \lambda J_S (J_I + A_I) - J_I(d + g + \alpha)
          &\frac{dA_I}{dt} &= g J_I + \lambda A_S (J_I + A_I) -
                              A_I(d + \alpha) \\
          N &= J_S + A_S + J_I + A_I
        \end{aligned}$$

    2.  For the $SIV$ and multi-structure models, there are additional classes
        representing degrees of infection. Mortality $(\alpha)$ and infectivity
        $(\lambda)$ are additive in these models.

        $$\begin{aligned}
          \frac{dJ_0}{dt} &= fN(1 - N/K) - J_0(d + g + \Lambda)
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

        For $SIV$ model, $i_\max = k = 2$. I refer $N_0$ as $S$, $N_1$ as $I$
        and $N_2$ as $V$, and use $S$, $I$, and $V$, as subscripts for $J$, and
        $A$ as well.

In this paper, parameters (e.g., $\lambda$ and $\alpha$) are subscripted with
$\text{param}_{SI}$, $\text{param}_SIV$, or $\text{param}_\text{multi}$ when
referring to their values in each of the three models. I also use the term
"infected" to refer to individuals of either the $I$ class in the $SI$ model, or
having at least one infection in the $SIV$ or multi-infection models.

For the multi-infection model, $i_\max = k = \infty$. For numerical simulations,
this value is truncated to 150. Performed simulations in R (@REF), using the
deSolve package (@REF)

3.  These are *null models* of age structure, as both demographic and
    epidemiological parameters do not vary with age. When juvenile and adult
    classes are summed the growth therm $(g)$ drops out.

4.  We simulated the full model rather than the reduced model based on an
    assumption of negative-binomial distributions, as the negative- binomial
    only approximates the full model asymptotically @Adler1992. In Appendex
    @REF, we show that it also deviates from the full model at equilibrium when
    age structure is introduced.

As the models are different structurally. I parameterized the $SIV$ and
multi-infection models so that their behavior was identical according to several
different criteria. In all these comparisons, I consider the "infected" trees of
the SIV and multi-infection models as those with one or more infections.

The behavior of SIV and multi-infection models were adjusted by multiplying both
the infectivity $(\lambda_{SIV}, \lambda_{multi})$ and disease-induced mortality
$(\alpha_{SIV}, \alpha_{multi})$ parameters by a constant $c$. Where there there
were dual behavior criteria (behaviors (4) and (5) below), the $\lambda$ and
$\alpha$ were allowed to vary independently in order to minimize the objective
functions.

-   **Equilibrium mortality rate**. Models were parametrized so that the
    mortality rate of infected trees at equilibrium was equal. That is,

$$\alpha_{SI} = \alpha_SIV \frac{I + 2V}{I+V} 
              = \alpha_\text{multi} \frac{1}{N} \sum_i i N_i$$

-   Initial growth rate and acceleration of infected individuals. That is\
     $$\begin{aligned}
                \frac{dI}{dt}      &= \frac{d(I+V)}{dt} 
                                    = \frac{dN_{i > 0}}{dt} \text{, and} \\
                \frac{d^2 I}{dt^2} &= \frac{d^2(I+V)}{dt^2}
                                    = \frac{d^2 N_{i > 0}}{dt^2}
        \end{aligned}$$ at initial conditions of $S \approx N$,
    $I_{SI} = I_{SIV} = N_{1\, multi} \approx 0$ and
    $I_{SIV} = N_{i \geq 2\, multi} = 0$.

    Initial conditions in simulations were disease-free equilibrium, with 1% of
    individuals having a single infection (across both stage classes).

    Note that the first condition, of the initial growth rate of infected
    individuals, is identical at all cases under these initial conditions. Thus,
    we only fit to the second derivative.

    -   Time to 10%, 50%, and 90% infection. That is

        $$t\big|_{\frac{I}{S+I} = X\%} = t\big|_{\frac{I+V}{S+I+V} = X\%}
                                = t\big|_{\frac{N_{i \geq 1}}{N} = X\%}$$

    -   Time to 10% and equilibrium mortality rate combined.
    -   Minimizing the overall squared error between the models over time.\*

  Parameter                     Symbol      Base Case Value
  --------------------------- ----------- -----------------
  fecundity                       $f$                     1
  carrying capacity               $K$                     1
  transition rate                 $g$                   0.1
  mortality                       $d$                  0.01
  disease-induced mortality    $\alpha$                 0.2
  transmissivity               $\lambda$                  3

  : Base parameters for disease models

In the base case,

Results
-------

1.  Qualitative differences between SI and multi-infection models are largely
    present in the differences between SI and SIV models. As the number of
    infection classes increases, model behavior approaches the behavior of the
    infinite-class multiple-infection model.

2.  Bifurcation analysis

    1.  Calculation of $R_0$ for all 3 models. Demonstration that $R_0$, initial
        disease growth rate, are identical for all 3.

    2.  Common behavior above and below $R_0 = 1$. Disease suppresses
        equilibrium population size.

3.  Models with similar equilibrium behavior differ in their transients as
    epidemics get under way.

    1.  Models with equivalent equilibrium behavior will have very different
        invasion criteria. Multi-infection will be *less* likely to become
        epidemic from a single infection

    2.  Figure X shows the dynamic behavior of the $SI$, $SIV$, and
        multi-infection models calibrated to equivalent mortality at
        equilibrium. At equilibrium, the both population levels and mortality
        rates of the *aggregate* population (across all age classes), is
        identical across all models as all rates are equal.

Under this parameterization, the ratio of $\alpha$ values between the models is
equal to the mean number of infections at equilibrium in the multi-infection and
$SIV$ models.

![Figure: Dynamics of models parameterized to equivalent equilibrium mortality
rates](figure/equiv_equilib.png)

Here, the $SI$ model is fastest to reach equilibrium, while the $SIV$ model
takes longer and the multi-infection takes longest.

In the $SIV$ and multi-infection models, the apparent mortality rate of infected
individuals increases over time. Early in the epidemic, individuals have small
numbers of infections, thus the mortality rate across individuals with any level
of infection is small. As the epidemic progresses, the mean number of infections
per infected individual increases, raising the mortality rate of the infected
class until equilibrium is reached. The time to equilibrium is greater in the
multi-infection model than the $SIV$ model. In the $SI$ model, which only has a
single infected class, mortality rates remain constant.

4.  Models with similar initial behavior reach different equilibrium conditions

![Figure: Dynamics of models parameterized to equivalent equilibrium mortality
rates](figure/init_derivs.png)


When models are parameterized so that 1st and 2nd derivatives are the
same across SI and multi-infection, per-infection parameters in the
multi-infection models (mortality and infectivity), are the same as
per-individual parameters in the SI model.

As in previous parameterizations, mortality for infected individuals increase
over time until equilibrium is reached. Unlike the last parameterization,
however, mortality rates for the $SIV$ and multi-infection models start at
*higher* levels than the $SI$ model and further diverge over time.

Greater mortality rates among infected individuals results in a greater
suppression of equilibrium population in the $SIV$ and multi-infection models
than the $SI$ model, with the effect, as before, being greater but qualitatively
similar in the multi-infection model.

The $SIV$ and multi-infection models have greater fractions of infected
individuals, but fewer infected individuals overall, due to the suppressed
population.

Fig X shows the results when models were parameterized to have equivalent time
until 10% of the total population was infected. While initial mortality rates
differ from the matched-second-derivative parameterization, patterns are
qualitatively similar; mortality rates for individuals in $SIV$ and
multi-infection models increase before reaching equilibrium, resulting in lower
equilibrium population sizes and greater fractions of infected individuals.

![Figure: Dynamics of models parameterized to equivalent equilibrium mortality
rates](figure/time_to_I10.png)

These results are very similar to those under parameterizations of time to 30%
and 50% infection (not shown, in Appendix).

5.  Multi-infection models generate age-dependent effects not found in SI models

All three models exhibit a common pattern the dynamics of population stage
structure, with a decrease in the population of adult stages and an increase in
the population of the juvenile stage.

The infected population of adult trees peaks before declining late in the
epidemic.

![Figure: Dynamics of models parameterized to equivalent equilibrium mortality
rates](figure/progplot1.png)

![Figure: Dynamics of models parameterized to equivalent equilibrium mortality
rates](figure/progplot2.png)

In the $SIV$ and multi-infection models, the mortality rate of infected trees
diverges for juvenile and adults as the disease progresses. This occurs in all
parameterizations. At equilibrium, the mortality rate of adult infected trees is
greater than that of juvenile trees.

The reason for this can be found in figures X-Y, which show the distribution of
infections for both adult and juvenile populations over the course of the
epidemic in $SIV$ and multi-infection models. Adults and juveniles begin with
equal mean numbers of infections, but as the epidemic continues, adult trees
accumulate more infections than juveniles by both new infections on adult trees,
and already-infected juveniles recruiting into the adult population.

In a multi-infection model with age structure, individuals accumulate infections
over time, resulting in more infections, and thus greater mortality and
infectivity, among older individuals than younger individuals. Even in the
absence of age-driven variation in how individuals respond to disease (that is,
in a "null model"), different behavior is observed between age groups. In an SI
model, these differences do not arise.

1.  Figure showing evolution of infection distributions over time.

2.  These effects increase as the transition rate from juvenile to adult age
    classes increase. this changes the relative amount of time individuals in
    each class have had to acquire infections.

Discussion
----------

1.  Epidemics that appear to be well represented by $SI$ models during their
    outbreak phase may no longer be well represented in later stages.

    1.  A multi-infection model that behaves like an $SI$ model in early stages
        will have greater mortality rates at equilibrium, suppressing population
        more. A *smaller* fraction of the population will be infected at
        equilibrium, because it

2.  If a disease is driven by multi-infection mechanisms, age effects may (in
    part) be artifacts of infection accumulation in older individuals, rather
    than biological differences.

    @McCallum1995 suggested that comparison of infection counts between
    different aged individuals may be useful in inferring disease mortality
    rates. Similarly, these results suggest that, in the absence of infection
    counts, differences between age groups in effects of disease, such as
    mortality, may be indicative of load-driven disease mechanisms.

3.  Reduced version of multi-infection model (SIV) is sufficient for many
    applications.

4.  Future work

    1.  Can the models be distinguished in noisy data?
    2.  Detection thresholds higher than $i=1$
    3.  Compare *variation* in mortality rates across models with explicit
        variation/stochasticity.
    4.  Ultimate measure of the loss due to incorrect model is in relative
        utility of management presuming $SI$ or macroparasite models.

Appendix:
---------

1.  Show Klieber-Ludwig divergence of multi-infection model from negative
    binomial distribution during transient phase

2.  Show analysis of divergence of simplified version of multi-infection model
    [@Anderson1978] from full model when age structure.

**Notes from Meeting with Alan, September 16, 2014**

Different than epidemics, which are all transients, transients here with host
population dynamics.

Analysis of SIRs has been focused on total individuals getting disease, rather
than time scale of buildup. Assume separation of time scales.

Diekman's textbooks on that for review. From more mathematical perspective Fred
Bauer and Carlos Castilo Chavez. Springer books.
