library(R.cache)
#' Simulate the infinite set of equations
#' @export
#' @importFrom deSolve lsoda
run_sodp.reg <- function(parms) {
  times <- seq(parms$times.min, parms$times.max, by=parms$times.by)
  if(parms$inits==0) {
    inits <- DFE_init(parms)
  } else {
    inits <- parms$inits
  }
  parm_vector <- unlist(as.relistable(parms))
  out <- lsoda(inits, times, master_odes, parm_vector)
  attr(out, "parms") <- parms
  return(out)
  }

run_sodp <- addMemoization(run_sodp.reg)

init_derivs.reg <- function(parms, time=0, SI=FALSE) {
  parms$progress = 0
  if(parms$inits==0) {
    inits <- DFE_init(parms)
  } else {
    inits <- parms$inits
  }
  parm_vector <- unlist(as.relistable(parms))
  derivs = master_odes(time, inits, parm_vector)[[1]]
  if(SI) {
    derivs = c(sum(derivs[1:parms$n_stages]), sum(derivs[(parms$n_stages + 1):length(derivs)]))
    names(derivs) = c("S", "I")
  } else {
  names(derivs) =   paste0("H_",
                           rep(1:parms$n_stages, parms$n_parasites+1), "_",
                           rep(0:parms$n_parasites, each=parms$n_stages))
  }
  return(derivs)
}

init_derivs <- addMemoization(init_derivs.reg)

#' @import numDeriv
init_derivs2.reg <- function(parms, time=0, SI=FALSE) {
  parms$progress = 0
  if(parms$inits==0) {
    inits <- DFE_init(parms)
  } else {
    inits <- parms$inits
  }
  parm_vector <- unlist(as.relistable(parms))
  derivs = master_odes(time, inits, parm_vector)[[1]]
  derivfunc = function(inits) {
    return(master_odes(t=time, y=inits, parm_vector=parm_vector)[[1]])
  }

  jac = jacobian(derivfunc, inits, method.args=list(r=6))
  derivs2 = as.vector(jac %*% derivs)
  if(SI) {
    derivs = c(sum(derivs[1:parms$n_stages]), sum(derivs[(parms$n_stages + 1):length(derivs)]))
    derivs2 = c(sum(derivs2[1:parms$n_stages]), sum(derivs2[(parms$n_stages + 1):length(derivs2)]))
    
    names(derivs) = c("S", "I")
    names(derivs2) = c("S", "I")
    
  } else {
    names(derivs) =   paste0("H_",
                             rep(1:parms$n_stages, parms$n_parasites+1), "_",
                             rep(0:parms$n_parasites, each=parms$n_stages))
    names(derivs2) =   paste0("H_",
                             rep(1:parms$n_stages, parms$n_parasites+1), "_",
                             rep(0:parms$n_parasites, each=parms$n_stages))
  }
  return(rbind(derivs, derivs2))
}
  
init_derivs2 <- addMemoization(init_derivs2.reg)


master_odes <- function(t, y, parm_vector) {
  
  #extract parameters from the factor. This is faster than `relist`
  n_stages = parm_vector[1]
  n_parasites = parm_vector[2]
  f = parm_vector[3:(2+n_stages)]
  g = parm_vector[(3 + n_stages):(2 + 2*n_stages)]
  d = parm_vector[(3 + 2*n_stages):(2 + 3*n_stages)]
  alpha = parm_vector[(3 + 3*n_stages):(2 + 4*n_stages)]
  lamda = parm_vector[(3 + 4*n_stages):(2 + 5*n_stages)]
  Beta = parm_vector[(3 + 5*n_stages):(2 + 6*n_stages)]
  mu = parm_vector[(3 + 6*n_stages):(2 + 7*n_stages)]
  xi = parm_vector[(3 + 7*n_stages):(2 + 8*n_stages)]
  omega = parm_vector[(3 + 8*n_stages):(2 + 9*n_stages)]
  K = parm_vector[3 + 9*n_stages]
  progress = parm_vector[4 + 9*n_stages]
  times.max = parm_vector[6 + 9*n_stages]
  
  stages <- c(0, 1:n_stages)
  parasites <- c(0, 0:n_parasites, 0)
  H <- rbind(rep(0, n_parasites + 3), 
             cbind(rep(0, n_stages), 
                   matrix(y, n_stages, n_parasites+1),
                   rep(0, n_stages)))
  Lamda <- sum(c(0,lamda)*colSums(t(H)*parasites))
  derivs <- rep(NA, n_stages*(n_parasites + 1))
  
  for (i in 0:(n_parasites)) {
    for (j in 1:n_stages) {
      if (i == n_parasites) {
      derivs[i*n_stages + j] <- (H[j+1,i+1])*Beta[j]*Lamda +           #Infections accumulate in the largest infection class (reflecting boundary) 
        H[j,i+2]*c(0, g)[j] - 
        H[j+1,i+2]*(d[j] + g[j] + i*(mu[j] + alpha[j])) +
        H[j+1,i+3]*(i+1)*mu[j]
      } else {
      derivs[i*n_stages + j] <- (H[j+1,i+1] - H[j+1,i+2])*Beta[j]*Lamda + 
        H[j,i+2]*c(0, g)[j] - 
        H[j+1,i+2]*(d[j] + g[j] + i*(mu[j] + alpha[j])) +
        H[j+1,i+3]*(i+1)*mu[j]
      }
    }
  }

  derivs[1] <- (sum(c(0, f)*rowSums(H*outer(c(0, xi), parasites, "^")))*
                  (1 - sum(c(0, omega)*rowSums(H))/K)) - 
    H[2,2] * (d[1] + g[1] + Beta[1]*Lamda) + H[2,3]*mu[1]

  if(progress==1) cat("\r", t, " ", round(100*t/times.max, 1), "%    \r")
  return(list(derivs))
}

DFE_init <- function(parms) {
  dfe_inits <- parms$K * parms$omega / sum(parms$omega)
  parm_vector <- unlist(as.relistable(parms))
  DFE <- stode(y=dfe_inits, fun=df_odes, parms=parm_vector)
  inits <- create_state_vector(parms$n_stages, parms$n_parasites)
  df_vals <- DFE$y * (1-parms$infect_vector)
  inf_vals <- DFE$y * parms$infect_vector
  inits[1:(2*parms$n_stages)] <- c(df_vals, inf_vals)
  return(inits)
}

df_odes <- function(t, y, parm_vector) {
  n_stages = parm_vector[1]
  f = parm_vector[3:(2+n_stages)]
  g = parm_vector[(3 + n_stages):(2 + 2*n_stages)]
  d = parm_vector[(3 + 2*n_stages):(2 + 3*n_stages)]
  omega = parm_vector[(3 + 8*n_stages):(2 + 9*n_stages)]
  K = parm_vector[3 + 9*n_stages]
  A = matrix(0, ncol=n_stages, nrow=n_stages)
  A[1,] <- f * (1 - sum(y * omega) / K)
  diag(A) <- diag(A) - d - g
  A[(row(A) - col(A)) == 1] <- g[1:(length(g) - 1)]
  return(list(A %*% y))
}

create_state_vector <- function(n_stages, n_parasites) {
  state_vector <- rep(0, n_stages*(n_parasites+1))
  state_names <- paste0("H_",
                        rep(1:n_stages, n_parasites+1), "_",
                        rep(0:n_parasites, each=n_stages))
  names(state_vector) <- state_names
  return(state_vector)
}