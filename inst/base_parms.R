#This chunk sets the base parameters for all of the simulations.

## ----setparms------------------------------------------------------------
parms_SI = list( 
  n_stages = 2,
  n_parasites = 1,
  f = c(1, 1),
  g = c(0.1, 0),
  d = c(0.01, 0.01),
  alpha = c(0.2, 0.2),
  lamda = c(0.5, 0.5),
  Beta = c(1, 1),
  mu = c(0, 0),
  xi = c(1, 1),
  omega = c(1,1),
  K = 1,
  progress = 0,
  times.min = 0,
  times.max = 75,
  times.by = 0.1,
  inits = 0,
  infect_vector = c(0.01, 0.01)
  )

parms_SIV =  parms_SI
parms_SIV$n_parasites = 2

parms_multi = parms_SI
parms_multi$n_parasites = 10