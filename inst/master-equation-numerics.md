% Master equation for multi-infection model
% Noam Ross
% 13-06-25 11:49:10

<head>
<link rel="stylesheet" href="http://dl.dropbox.com/u/3356641/blogstuff/anim_assets/css/reset.css" />
<link rel="stylesheet" href="http://dl.dropbox.com/u/3356641/blogstuff/anim_assets/css/styles.css" />
<link rel="stylesheet" href="http://dl.dropbox.com/u/3356641/blogstuff/anim_assets/css/scianimator.css" />
<link rel="stylesheet" href="http://dl.dropbox.com/u/3356641/blogstuff/anim_assets/css/shCore.css" />
<link rel="stylesheet" href="http://dl.dropbox.com/u/3356641/blogstuff/anim_assets/css/shThemeDefault.css" />
<script src="http://dl.dropbox.com/u/3356641/blogstuff/anim_assets/js/jquery-1.4.4.min.js"></script>
<script src="http://dl.dropbox.com/u/3356641/blogstuff/anim_assets/js/jquery.scianimator.min.js"></script>
<script src="http://dl.dropbox.com/u/3356641/blogstuff/anim_assets/js/shCore.js"></script>
<script src="http://dl.dropbox.com/u/3356641/blogstuff/anim_assets/js/shAutoloader.js"></script>
</head>

[Alan](http://two.ucdavis.edu/~me/) and I discused [analysis of the 
multi-infection SOD model](www.noamross.net/blog/2013/6/21/multi-infection-analytic.html).
Alan pointed out that, since the Anderson and May [-@Anderson1978] was based
on an *approximation* of behavior under Poisson or negative binomial
distributions, the deviations I derived under age structure could be artifacts
of that approximation.  So now I'm going back and examining the master equation
of the system before any reductions.

Note for later: this has been done before, but under slightly different
assumptions.  @Pugliese2004 showed that, in a model with continuous age structure,
there exists a stable equilibrium with infection if $R_0 > 1$, and a stable disease-free
equilibrium if $R_0 < 1$.

I've generalized this slightly to include hosts $(H)$ arbitrary number of age classes $(j)$, each of which may have a number of infections $i$.  The master equation is infinite, but can be summarized as follows:

$$\begin{aligned}
\frac{dH_{0,0}}{dt} &= \sum_j f_j \sum_i H_{i,j} \xi^i \left(1 - \frac{\sum_j \omega_j \sum_i H_{i,j}}{K}\right) - H_{0,0} (d_0 + g_0 + \beta_0 \Lambda) + H_{0,1} \mu_1 \\
\frac{dH_{0,i}}{dt} &=  - \beta_0 \Lambda H_{0,i} + \beta_0 \Lambda H_{0, i-1} - H_{0,i} (d_0 - g_0 - i(\mu_0 + \alpha_0)) + (i+1)\mu_j H_{0, i+1} \\
\frac{dH_{j,0}}{dt} &= -\beta_j \Lambda H_{j,0} - H_{j,0}(d_j + g_j + (1)(\mu_j + \alpha_j)) + g_{j-1} H_{j-1,0} - (1)\mu_j {H_{j,1}} \\
\frac{dH_{j,i}}{dt} &= -\beta_j \Lambda H_{j,i} + \beta_j \Lambda H_{j, i-1} - H_{j,i}(d_j + g_j + i(\mu_j + \alpha_j)) + (i+1)\mu_j H_{0, i+1} \\
\Lambda &= \sum_j \lambda_j \sum_i iH_{j,i} \\
\end{aligned}$$

$$\begin{aligned}
H_j = \sum_i H_{j,i} && P_J = \sum_j iH_{j,i}
\end{aligned}$$

$j$ are a finite number of age classes but $i$ are an infinite number of classes infected by $i$ parasites. Summing across the equations above, and assuming $\xi=1$ for now, 

$$\begin{aligned}
\frac{dH_0}{dt} &= \sum_j H_j f_j \left(1 - \frac{\sum_j \omega_j H_j}{K}\right) - H_0 (d_0 + g_0) - P_0 \alpha \\
\frac{dP_0}{dt} &=  \beta_0 \Lambda H_0 - P_0(d_0 + \mu_0 + g_0) - \alpha_j \sum_i^\infty i^2 H_{i,0} \\
\frac{dH_j}{dt} &= H_{j-1}g_{j-1}  - H_j(d_j + g_j) - P_j \alpha \\
\frac{dP_j}{dt} &= \beta_j \Lambda H_j - P_j (d_j + \mu_j + g_j) + P_{j-1} g_{j-1} - \alpha_j \sum_i^\infty i^2 H_{i,j}
\end{aligned}$$

Now, if we assume all parameters across age classes are the same, what happens when we sum these equations across $j$?

$$\begin{aligned}
\frac{dH}{dt} &= Hf(1 - \frac{H}{J}) - Hd - P\alpha \\
\frac{dP}{dt} &=  \beta \lambda P H - P(d + \mu) - \alpha \sum_i i^2 H_i
\end{aligned}$$ 

So the master equation tells me that there shouldn't be any total effects effects if the parameters don't vary with age structure.  This doesn't tell us of affects between the age classes, though.

## Simulating the Infinite Model

Here I simulate the master equation above. Since there are an infinite number of
equations, I do so by truncating the system at a maximum number of infections.

Here's the set-up:


```r
require(abind)
```

```
## Loading required package: abind
```

```r
require(deSolve)
```

```
## Loading required package: deSolve
```

```r
require(plyr)
```

```
## Loading required package: plyr
```

```r
require(rootSolve)
```

```
## Loading required package: rootSolve
```

```r
require(reshape2)
```

```
## Loading required package: reshape2
```

```r
require(ggplot2)
```

```
## Loading required package: ggplot2
```

```r
require(data.table)
```

```
## Loading required package: data.table
```

```r
require(grid)
```

```
## Loading required package: grid
```

```r
require(gridExtra)
```

```
## Loading required package: gridExtra
```

```r
require(animation)
```

```
## Loading required package: animation
```

```r
require(noamtools)
```

```
## Loading required package: noamtools
```

   

```r
create_state_vector <- function(n_stages, n_parasites) {
    state_vector <- rep(0, n_stages * (n_parasites + 1))
    state_names <- paste0("H_", rep(1:n_stages, n_parasites + 1), "_", rep(0:n_parasites, 
        each = n_stages))
    names(state_vector) <- state_names
    return(state_vector)
}
```


I use roughly the same parameters as before.  There are a few new parameters,
$\xi$ and $\omega$, which represent the fecundity effects of disease and the
competitive coefficients of the trees, but I set these to unity for now.  I set
the maximum number of infections on a tree to 250, start the simulation at
disease-free equilibrium population size, and initiate with a very small (0.1%) of each size
cass infected.


```r
parm_list <- list(n_stages = 2, n_parasites = 250, f = c(0.01, 0.01), g = c(0.1, 
    0), d = c(0.005, 0.005), alpha = c(0.05, 0.05), lamda = c(0.3, 0.3), beta = c(1, 
    1), mu = c(0, 0), xi = c(1, 1), omega = c(1, 1), K = 50)

parm_vector <- unlist(as.relistable(parm_list))

J_ss = with(parm_list, K * (1 - d[1]/f[1])/(1 + g[1]/d[2]))
A_ss = with(parm_list, J_ss * g[1]/d[2])

init <- create_state_vector(parm_list$n_stages, parm_list$n_parasites)
init[1:4] <- c(0.9999 * J_ss, 0.9999 * A_ss, 1e-04 * J_ss, 1e-04 * A_ss)

times <- seq(1, 20, by = 0.1)
```


Here's the function for the master differential equations:


```r
master_odes <- function(t, y, parm_vector) {
    list2env(relist(parm_vector), environment())
    stages <- 1:n_stages
    parasites <- 0:n_parasites
    H <- matrix(y, n_stages, n_parasites + 1)
    Lamda <- sum(lamda * colSums(t(H) * parasites))
    dH_1_0 <- (sum(f * rowSums(H * outer(xi, parasites, "^"))) * (1 - sum(omega * 
        rowSums(H))/K)) - H[1, 1] * (d[1] + g[1] + beta[1] * Lamda) + H[1, 2] * 
        mu[1]
    cases <- as.matrix(expand.grid(j = stages, i = parasites))
    derivs <- aaply(cases[-1, ], 1, function(case) {
        j <- case[1]
        i <- case[2]
        d <- ifelse(i == 0, 0, H[j, i] * beta[j] * Lamda) + ifelse(j == 1, 0, 
            H[j - 1, i + 1] * g[j - 1]) - H[j, i + 1] * (d[j] + g[j] + i * (mu[j] + 
            alpha[j])) + ifelse(i == n_parasites, 0, H[j, i + 2] * (i + 1) * 
            mu[j] - H[j, i + 1] * beta[j] * Lamda)
        return(d)
    })
    derivatives <- c(dH_1_0, derivs)
    names(derivatives) <- paste0("dH_", cases[, "j"], "_", cases[, "i"])
    return(list(derivatives))
}
```


Run the model:


```r
# Rprof('out.prof', line.profiling=TRUE)
out <- lsoda(init, times, master_odes, parm_vector)
# Rprof(NULL)
```


Organize the data and calculate summary statistics:


```r
d <- data.table(melt(as.data.frame(out), id.vars = "time", value.name = "Population"))
newCols <- c("Species", "SizeClass", "Infected")
d[, `:=`(c(newCols), as.list(strsplit(as.character(variable), "_")[[1]])), by = variable]
d[, `:=`(c(newCols), lapply(.SD, factor)), .SDcols = newCols]
d[, `:=`(variable, NULL)]
d[, `:=`(SizeClass, as.integer(as.character(SizeClass)))]
d[, `:=`(Infected, as.integer(as.character(Infected)))]
setcolorder(d, c(1, 3, 4, 5, 2))
d[, `:=`(NormInfected, Population/sum(Population)), by = time]

sumd <- ddply(d, .(time, Species, SizeClass), summarize, S = sum(Population[which(Infected == 
    0)]), I = sum(Population[which(Infected != 0)]), H = sum(Population), P = sum(Population * 
    Infected), InfPerInd = P/H, PctInf = I/H, MortRate = weighted.mean(parm_list$d[SizeClass[1]] + 
    Infected * parm_list$alpha[SizeClass[1]], Population), MortRateInf = weighted.mean((parm_list$d[SizeClass[1]] + 
    Infected * parm_list$alpha[SizeClass[1]])[which(Infected != 0)], Population[which(Infected != 
    0)]))

sumd <- ddply(sumd, .(time, Species), transform, PctPop = H/sum(H), Lamda = sum(parm_list$lamda[SizeClass] * 
    P))

sumd <- ddply(sumd, .(time, Species, SizeClass), transform, NewInfRate = parm_list$beta[SizeClass] * 
    Lamda)
```


## Results



Below I include an animation that shows the change in population over time and
how the disease is distrubuted among individuals:


```r
lineplot <- ggplot(sumd, aes(x = time, y = H, col = as.factor(SizeClass))) + 
    geom_line(lwd = 1) + theme_nr + theme(legend.position = c(0.75, 0.75)) + 
    ylim(-0.5, 26) + xlim(0, 22) + ylab("Host Population") + scale_color_discrete(labels = c("Small Trees", 
    "Big Trees"))
```

```
## Error: object 'theme_nr' not found
```

```r
pp <- function(timer) {
    lineplot2 <- lineplot + geom_point(data = subset(sumd, time == timer), cex = 6) + 
        geom_vline(aes(xintercept = time), data = subset(sumd, time == timer))
    distplot <- ggplot(subset(d, time == timer), aes(x = Infected, y = NormInfected, 
        fill = as.factor(SizeClass))) + geom_area(stat = "identity", position = "identity") + 
        theme_nr + theme(legend.position = "none") + xlim(-1, 251) + ylab("Proportion of Population") + 
        xlab("Number of Infections")
    grid.arrange(lineplot2, distplot)
}
for (timer in times[1:50]) {
    pp(timer)
}
```

```
## Error: object 'lineplot' not found
```


As you can see, the disease causes a drop in the population very quickly. Adults
accumulate a large number of infections, and eventually juveniles become the more
abundant class.  For a period of time during the course of the disease, the distribution
of disease in adults is bimodal - it clearly cannot be approximated by a negative binomial or Poisson distribution.

Now, let's look at some other views on the data.  Here's the mean infections per
individual, by tree size class. As before, we see that large trees carry a greater number of infections through the epidemic.


```r
ggplot(sumd, aes(x = time, y = InfPerInd, col = as.factor(SizeClass))) + geom_line(lwd = 1) + 
    theme_nr + ylab("Infections per Individual") + scale_color_discrete(labels = c("Small Trees", 
    "Big Trees"))
```

![plot of chunk infperind](figure/infperind.png) 


Essentially 100% of trees are infected relatively quickly in this model.  This
seems unrealistic.  Not all trees are infected, especially this quickly.  This
may be due to a lack of spatial effects, implicit or explicit, in the model. We
do see that the number of infected adults remains higher than juveniles once the
peak epidemic has passed:


```r
ggplot(sumd, aes(x = time, y = PctInf, col = as.factor(SizeClass))) + geom_line(lwd = 1) + 
    theme_nr + ylab("Percent of Trees Infected") + scale_color_discrete(labels = c("Small Trees", 
    "Big Trees"))
```

![plot of chunk pctinf](figure/pctinf.png) 


Here's the years-to-mortality statistic against the number of infected individuals,
as it changes through the course of the epidemic.  In the initial years, as the epidemic progresses,
we see the same pattern as teh empirical data:


```r
ggplot(sumd, aes(x = I, y = 1/MortRateInf, col = as.factor(SizeClass))) + geom_segment(aes(xend = c(tail(I, 
    n = -2), NA, NA), yend = c(tail(1/MortRateInf, n = -2), NA, NA)), arrow = arrow(length = unit(0.3, 
    "cm")), lwd = 1) + theme_nr + ylab("Mean Years to Mortality") + xlab("Number of Infected Trees") + 
    scale_color_discrete(labels = c("Small Trees", "Big Trees"))
```

![plot of chunk yrstomort](figure/yrstomort.png) 


## Dealing with Space

This model lacks an expression of the spatial clustering of infection, which
we would expect to slow rate of infection in the population and reduce the peak
infection rate.  @Cobb2012 added explicit age structure to their model in order
to generate more realisitc rates of infection.  However, doing so here presents
a computational challenge.  Given that we are already solving 500 equations
adding even a modest explicit spatial grid (20 $\times$ 20, say), makes the system
extremely high-dimensional.

In $SI$ models, one way to deal with space is to apply a power law to contact rates [@Bjornstad2002], so that the force of transmission becomes:

$$\lambda = \beta I^{1+\alpha} S^{1+\Phi}$$.

Here, when $\alpha < 0$, the logic behind this functional form is that under high disease prevalance, infected individuals are less likely
to encounter susceptible individuals in the population due to spatial clustering, and thus there are fewer infection events.  With a multiple infection model, the number of infection events should *not* decrease with higher disease prevalance.  Instead, the infections should be more likely in already-infected individuals, but the total number of infections should not change.

@Brown2004, examine the role of space in the spread of disease in a plant population.  Also using an $SI$ model, they give the following expression for the force of infection:

$$\lambda = \beta (1 + \mathcal{\bar C}_{SI}) SI$$

$\mathcal{\bar C}_SI$ is the population-weighted, dispersal-kernel-scaled spatial covariance between $S$ and $I$ populations. That is, it is a clustering index.  When $\mathcal{\bar C}_{SI} < 0$, spatial clustering reduces infection rates, in the same manner as the power law above.

This can be adapted to our situation, as we can define of $\mathcal{\bar C}$ as a matrix of spatial covariances not between $S$ and $I$ but between the different infection levels $i$ of the vector of hosts $\boldsymbol{H}$.  In this case, the force of infection becomes a vector $\boldsymbol\lambda$ with elements for each infection level

$$\boldsymbol\lambda = \{1,2,\ldots,i\} \circ \mathcal{\bar C} \boldsymbol{H}$$

The elements of $\mathcal{\bar C}$ should sum to 1, as no class of tree will not be infected due to its infection status.  

$\mathcal{\bar C}$ evolves with time as the spatial distribution of the disease changes.  @Brown2004 approximate this evolution via pairwise
approximation.  However in our case the number of pairs to track is $i^2 - i$, or in the case of 250 disease classes 62,250 pairs.  In addition, this approximation may give us the same problem that the negative binomial assumption did before - it does not represent
transient behavior well.  

One option is to move to an individual-based model.  Sites in the plot network vary from 5,000 to 175,000 trees each. 20,000-30,000 trees would be appropriate for the system.  Might be able to aggregate them spatially for purposes of calculating distance.

It may be computationally unreasonable to do this in the current model because we very quickly have an absurd number of equations (infection classes X age classes X species X location)

In some ways the parasite model simplifies things, because infected hosts can continue to acquire infections, an infection will occur no matter
what the disease state of the organism a spore contacts.  Contact heterogeneity should be constant in time. However, we have to deal with the resultant clustering of infections.

Can we derive something about contact hetergeneity from the distribution of infection number?  Let's say we have a defined contact structure/distance matrix of locations.  All locations have the same relative contact structure (sampling from infinite space).

One approximation is to say infected individuals are more likely to be infected than non-infected.  This might actually be the case, not just for spatial reasons, but it's a poor approximation of the spatial process for many other reasons.

In any case it's likely that there's spatial correlation, so that classes are more likely to infect classes with a similar number of infections.

However, due to the separation of cohorts, this won't really hold.  New trees could appear anywhere, or especially in infected areas.

We want to approximate the correlation matrix of all of the infection level classes.

If we consider the force of infection to be a vector $\boldsymbol{\Lambda}$, it is equal to 

$$\beta\lambda \times i [\boldsymbol{H} \mathcal{C}]$$

$\mathcal{C}$ is the clustering matrix - the difference between the spatial correlation between classes and what would be expected in a mass-action model.

In general, we would expect positive values of $\mathcal{C}$ for similar values of $i$ and negative values for distance values of $i$ as the disease evolves, due to clustering of the disease.  This follows @Brown2004, which uses:

$\Lambda = \lambda(1 + \matchal{C}_{SI})I$

as the force of infection

Should values of $\mathcal{C}$ sum to zero?  Only under frequency dependence.  However, they should sum to $K$, or something similar as all disease classes are capable of being infected.

The trouble with abandoning the negative binomial approximation is that we no longer have a convenient way to introduce other clustering forces, such as those driven by space.

The power law approximation has been used to mimic

###

Individual-based model

Pre-determine the age distribution
Create a fixed number of locations using a poisson process (spatstat:::rmpoispp)
Now each point has a transition probability equation.
Create a distance matrix of points and a dispersal matrix based on the dispersal kernel.
Note that the number of points may be fewer than the grid size in previous models.

Oh, crap, how do we do new trees?  #Skip for now, separation of time scales
 - Resprouts occur in the same location
 - New trees in random location?







