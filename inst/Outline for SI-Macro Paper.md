---
author: Noam Ross
date: 'October 8, 2014'
title: 'Comparative dynamics of SI and multiple-infection models: Outline with draft methods and results.'
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

### Model Structure

I compared dynamics in 3 ODE-based disease models: A simple $SI$ model, an
multi-infection model based on @Anderson1978, and an intermediate $SIV$
(susceptible-infected-*very* infected) model.

Each model has a two-stage population structure (population $N$ = juveniles
$J$ + adults $A$). New individuals enter the uninfected, juvenile stage via
density-dependent recruitment ($fN(1-N/K)$, where $f$ is fecunidity and $K$
carrying capacity). Individuals move from juvenile to adult classes at the
transition rate $g$.

Disease transmission is density-dependent; susceptible individuals $(J_S, A_S)$
become infected $(J_I, A_I)$ at a rate equal to the density of other infected
individuals times the transmissivity of the disease $(\lambda)$. All individuals
die at the a base rate $(d)$, and diseased individuals have additional mortality
$(\alpha)$

The complete $SI$ model is

$$\begin{aligned}
  \frac{dJ_S}{dt} &= fN(1 - N/K) -
                     J_S(d + g + \lambda J_I + \lambda A_I)
  &\frac{dA_S}{dt} &= g J_S - A_S(d + \lambda N) \\
  \frac{dJ_I}{dt} &= \lambda J_S (J_I + A_I) - J_I(d + g + \alpha)
  &\frac{dA_I}{dt} &= g J_I + \lambda A_S (J_I + A_I) -
                      A_I(d + \alpha) \\
  N &= J_S + A_S + J_I + A_I
\end{aligned}$$

Note that this is a *null model* of age structure; neither demographic nor
epidemiological parameters vary with age. When juvenile and adult classes are
summed, the growth term $g$ drops out, and $dN/dt$ is independent of $g$.

The other two models are extensions of the $SI$ model with additional disease
classes representing degrees of infection. In the multi-infection model, there
are an infinite number of disease classes designated
$i = 0, 1, 2, \dots, \infty$. For purposes of simulation, the number of classes
is truncated, with a maximum value of $k$. Transmissivity $(\lambda)$ and
mortality $(\alpha)$ and are additive in these models. Trees advance to the next
disease class at rate $\Lambda$, the overall force of infection, which is the
sum of each tree's contribution, $i\lambda$. Trees in each stage die at rate
$d + i\alpha$. The complete multi-infection model.

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

The $SIV$ model is merely a truncated version of the multi-infection model, with
$k = 2$. For this model I refer $N_0$ as $S$, $N_1$ as $I$ and $N_2$ as $V$, and
use $S$, $I$, and $V$, as subscripts for $J$, and $A$ as well.

In this paper, parameters (e.g., $\lambda$ and $\alpha$) are subscripted with
$\text{param}_{SI}$, $\text{param}_{SIV}$, or $\text{param}_\text{multi}$ when
referring to their values in each of the three models. I also use the term
"infected" to refer to individuals of either the $I$ class in the $SI$ model, or
having at least one infection in the $SIV$ or multi-infection models.

Multi-infection models typically assume a distribution of infections in order to
reduce the system of equations [@Anderson1978]. Negative-binomial distributions
of infections allow tractable analysis of such models and match empirical
studies of infection distribution in the wild [@REF]. However, the reduced model
only approximates the full model asymptotically [@Adler1992], and key
assumptions of the reduced model break down in the presence of age structure
(See Appendix.) Instead, I avoided making such assumptiosn by simulating the the
infinite system of equations truncating at $k$.

### Comparative parameterization

I compared the models' behaviors under "equivalent" parameterizations. As the
models have different structures, their parameters in the models have different
interpretations. Specifically, $\lambda$ and $\alpha$ operate on a
per-individual basis in the $SI$ model, while they operate on a per-infection
basis on the $SIV$ and multi-infection models. Thus, they are not *identical*
parameterizations.

In order to determine equivalent parameterizations between models, I set
parameters for the $SI$ model to those in Table 1. I then fit the $SIV$ and
multi-infection models so that they would exhibit identical *behavior* to the
$SI$ model under different criteria. The behavior of SIV and multi-infection
models were adjusted by multiplying both the infectivity
$(\lambda_{SIV}, \lambda_{multi})$ and disease-induced mortality
$(\alpha_{SIV}, \alpha_{multi})$ parameters by a constant $c$. Where there there
were dual behavior criteria (behaviors (4) and (5) below), the $\lambda$ and
$\alpha$ values were allowed to vary independently.

Initial conditions in simulations were set at the disease-free equilibrium of
the system, modified with 1% of both juveniles and adults having a single
infection.

  Parameter                                          Symbol      Base Case Value
  ------------------------------------------------ ----------- -----------------
  fecundity                                            $f$                     1
  carrying capacity                                    $K$                     1
  transition rate                                      $g$                   0.1
  mortality                                            $d$                  0.01
  disease-induced mortality                         $\alpha$                 0.2
  transmissivity                                    $\lambda$                  3
  max number of infections (SIV/multi-infection)       $k$               3 / 150

Table 1: Base parameters for disease models

**Equilibrium mortality rate**. The first behavioral criterion was identical
equilibrium mortality rate across models. $c$ was varied to match the overall
disease-induced mortality rate (and thus the total mortality rate) between
models. That is, at steady state,
$$\alpha_{SI} = \alpha_{SIV} \frac{I + 2V}{I+V} 
              = \alpha_\text{multi} \frac{1}{N} \sum_i i N_i$$

**Initial growth and acceleration rates of infected individuals.** $c$ was
adjusted to match behavior under initial conditions. This is,

$$\begin{aligned}
            \frac{dI}{dt}      &= \frac{d(I+V)}{dt} 
                                = \frac{dN_{i > 0}}{dt} \text{, and} \\
            \frac{d^2 I}{dt^2} &= \frac{d^2(I+V)}{dt^2}
                                = \frac{d^2 N_{i > 0}}{dt^2}
    \end{aligned}$$ at initial conditions of $S \approx N$,
$I_{SI} = I_{SIV} = N_{1\, multi} \approx 0$ and
$I_{SIV} = N_{i \geq 2\, multi} = 0$.

Note that the first condition, of the initial growth rate of infected
individuals, is identical at all cases under these initial conditions. Thus, we
only fit to the second derivative. Derivatives were determined numerically using
the numDeriv packages [@REF].

**Time to 10% infection**. This criterion was selected to match behavior among
models during the early transient period of disease. $c$ was adjusted so that
the $SIV$ and multi-infection models would reach 10% infection in the same time
period as the $SI$ model. That is,

$$t\big|_{\frac{I}{S+I} = 0.1} = t\big|_{\frac{I+V}{S+I+V} = 0.1}
                        = t\big|_{\frac{N_{i \geq 1}}{N} = 0.1}$$

All simulations simulations were performed in R (@REF), using the deSolve
package (@REF) for simulation and the ggplot (@REF) package for plotting. Code
to reproduce these results is archived online [@Ross2014].

Results
-------

### Aggregate dynamics

<!-- [BIFURCATION RESULTS FIRST HERE] -->
**Models with similar equilibrium behavior differ in initial transient
behavior**. Figure 1 shows the dynamic behavior of the $SI$, $SIV$, and
multi-infection models calibrated to equivalent mortality at equilibrium. At
equilibrium. Under the base case parameterization, all models reach an internal
equilibrium with a population level suppressed from the disease-free equilibrium
at which they started. As all other rates are equal, the equilibrium populations
are identical between the models, as well.

Under this parameterization, the ratio of $\alpha$ values between the models is
the inverse of the mean number of infections at equilibrium in the
multi-infection and $SIV$ models.

![Figure: Dynamics of models parameterized to equivalent equilibrium mortality
rates](figure/equiv_equilib.png)

<!--TODO: Get the \alpha values for the parameterized models -->
<!--FIX: The plot only shows \alpha.  It should show \alpha + d->
<!--FIX: Change plot "macro" to multi-->
<!--FIX: Plots need to go past 50 to reach age dist equilibrium-->
In the $SIV$ and multi-infection models, the apparent mortality rate of infected
individuals increases over time. Early in the epidemic, individuals have small
numbers of infections, thus the mortality rate across individuals with any level
of infection is low. As the epidemic progresses, the mean number of infections
per infected individual increases, raising the mortality rate of the infected
class until equilibrium is reached.

The change in mortality rates is driven by changes in the distribution of
infections over time, shown in Figures 2 and 3. As the disease progresses
through the population, the proportion of individuals in teh $I$ and $V$ classes
increases for both juveniles and adults. Similarly, in the multi-infection
model, the mean number of infections in each individual increases over time,
increasing the mortality rate.

![Figure: Dynamics of models parameterized to equivalent equilibrium mortality
rates](figure/progplot2.png)

![Figure: Dynamics of models parameterized to equivalent equilibrium mortality
rates](figure/progplot1.png)

While equilibrium behaviors are identical and models start at the same initial
conditions, transient behavior differs. The time to equilibrium is greater in
the multi-infection model than the $SIV$ model, and greater in both than the
$SI$ model. It takes longer in the $SIV$ model, and longest in the
multi-infection model, for the disease to emerge.

**Models with similar initial behavior reach different equilibrium conditions.**
Figure 4 shows the dynamics of the three models in the case where the initial
first and second derivatives are equivalent. As in the matching-equilibrium
parameterizations, mortality for infected individuals increases over time until
equilibrium is reached. Unlike that parameterization, per-infection parameters
in the $SIV$/multi-infection models (mortality and infectivity), are higher than
than per-individual parameters in the $SI$ model. Total mortality rates for the
$SIV$ and multi-infection models start at *higher* levels than the $SI$ model
and further diverge over time.

The $SIV$ and multi-infection models have nearly identical behavior. At
equilibrium, their populations are suppressed to lower levels than in the $SI$
model, and a smaller number of the individuals are infected. This is because the
difference in mortality rates of infected individuals between the $SI$ and the
other models is greater, increasing turnover of infected individuals. In this
case, the $SIV$ and multi-infection models reach equilibrium *before* the $SI$
model.

![Figure: Dynamics of models parameterized to equivalent initial growth rates of
diseased individuals](figure/init_derivs.png)

Fig 5 shows the results when models were parameterized to have equivalent time
until 10% of the total population was infected. Here, the initial mortality
rates of the $SIV$ and multi-infection models are similar to those in the $SI$
model; per-infection parameters in $SIV$/multi-infection models are similar to
per-individual parameters in the $SI$ model.

![Figure: Dynamics of models parameterized to equivalent time to 10%
infection](figure/time_to_I10.png)

Patterns in the time-to-10%-infection parameterizations are qualitatively
similar to the matched-second-derivative parameterization. Mortality rates for
individuals in $SIV$ and multi-infection models increase before reaching
equilibrium, resulting in lower population sizes and lower populations of
infected individuals at equilibrium. Dynamics for the $SIV$ and multi-infection
models are again very similar, though not as similar as in the
matched-derivative case. Also, in this case, the number of infected individuals
reaches a peak before going down to reach equilibrium levels.

### Age effects

<!-- FIX: Something is up with the patterning of age classes in the middle panel
of all the plots -->
**Multi-infection models generate age-dependent effects not found in SI
models.**

All three models, under all three parameterization exhibit some common patterns
in the dynamics of population stages. From the disease-free equilibrium
dominated by adults, disease outbreak decreases the population of adult stages
and and increases both the relative and absolute population of the juvenile
stages. The infected population of both stages increases, with the adult
infected stage reaching a peak before equilibrium and the juvenile infected
stage reaching a smaller equilibrium with no peak.

In the equivalent equilibrium mortality parameterization, The $SIV$ and
multi-infection stage structures are slower to reach an equilibrium than the
$SI$ stage structure, with the multi-infection case being slowest. This is
similar to the aggregate dynamics for this parameterization. In the case of
equivalent initial derivatives, as will as the case of equivalent time to 10%
infection, the change in age structure from the disease-free equilibrium is
greater in the $SIV$ and multi-infection models than the $SI$ model. at
equilibrium, there are more juveniles and fewer adults in the
$SIV$/multi-infection cases.

In the $SIV$ and multi-infection models, the mortality rate of infected
juveniles and adults increases as the disease progresses, and their mortality
rate diverges, with adults having greater mortality rates than juveniles at
equilibrium. This occurs in all parameterizations. The reason for this can be
found in figures 2 and 3, which show the distribution of infections for both
adult and juvenile populations over the course of the epidemic in $SIV$ and
multi-infection models. Adults and juveniles begin with equal mean numbers of
infections, but as the epidemic continues, adult trees accumulate more
infections than juveniles by both new infections on adult trees and
already-infected juveniles recruiting into the adult population.

In a multi-infection model with age structure, individuals accumulate infections
over time, resulting in more infections, and thus greater mortality and
infectivity, among older individuals than younger individuals. Even in the
absence of age-driven variation in how individuals respond to disease (that is,
in a "null model"), different behavior is observed between age groups. In an SI
model, these differences do not arise.

<!-- ADD figs for:
1.  Models with equivalent equilibrium behavior will have very different
    invasion criteria. Multi-infection will be *less* likely to become
    epidemic from a single infection

2.  These effects increase as the transition rate from juvenile to adult age
    classes increase. this changes the relative amount of time individuals in
    each class have had to acquire infections.  -->
    

Discussion
----------

1.  Epidemics that appear to be well represented by $SI$ models during their
    outbreak phase may no longer be well represented in later stages.

    A multi-infection model that behaves like an $SI$ model in early stages will
    have greater mortality rates at equilibrium, suppressing population more. A
    *smaller* fraction of the population will be infected at equilibrium,
    because it

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

    Qualitative differences between SI and multi-infection models are largely
    present in the differences between SI and SIV models. As the number of
    infection classes increases, model behavior approaches the behavior of the
    infinite-class multiple-infection model.

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
