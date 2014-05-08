% Progress of an Epidemic under Age Structure and Repeated Infections
% Noam Ross
% 13-12-04 10:56:32

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
    - Sudden Oak Death
    - What else? Chestnut blight, 
    

The transient phase is often of importance, especially in the case of newly invading diseases.

@Adler1992 showed that the third moment of the distribution was a function of the mean and mean/variance ratio, but only *asympotically*
## Models

-   A version of @Anderson1978 ODEs with age structure
-   An infinite set of ODEs with age structure
-   An equivalent stochastic poisson-process based model with multiple
    infections and age structure
    
## Results

-   Analytics: Show how the @Anderson1978 deviates from the infinite set of
    equations when there is age structure
-   Numerical results: Show the multi-modality of infection distribution
-   Show how how looking at data as only SI would result in mis-characterization
    of relative parameters of age classes
-   Compare each ODE model with outputs of stochastic model. How do each compare
    to steady-state and transient conditions?

## Discussion

-   Underlying assumptions of infection/parasite distribution break down in the
    face of other population structure
-   Disease structure can reflect underlying pop structure
-   What diseases should be represented with multiple infections? What disease
    have age-related patterns that may be due to repreated infections?
    
    
## General Notes

-   Bimodal distributions occur even in the absence of age structure. They occur
    In the transient due to the arrival of new individuals in the space occupied
    by the recently killed invididuals.  Total behavior in the face of age
    divisions with no demographic differences in age strucutre is identical
-   Neg. binomial always problematic with new births occurring.  Real
    distibution as more zero and small values than predicted with negative
    binomial.
-   Diseased equilibrium always has lower N, and smaller-individual skewed stage
    distribution than DFE.
-   Relative mortality rates diverge during invasion, then converge a little.
    The degree of shrinkage is greater with low growth rates; with high growth
    rates, mortality rates don't spread out or bounce back as much.
-   Equilbrium mortality rates aren't that different across growth rates.
-   In slow-growing conditions, mortality rate diverge later, because at first
    very little of the mortality in older plants is from infections while
    they are younger. 
-   Also, in slow-growing conditions, mortality in each group will be higher,
    though since more individuals will be small, overall mortality remains the
    same across growth rates.
    
    


Key points: variability in infectious period

Management implications: Remove the *most* infected trees 
