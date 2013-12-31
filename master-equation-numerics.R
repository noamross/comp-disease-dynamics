
require(abind)
require(deSolve)
require(plyr)
require(rootSolve)
require(reshape2)
require(ggplot2)
require(data.table)
require(grid)
require(gridExtra)
require(animation)
require(noamtools)

create_state_vector <- function(n_stages, n_parasites) {
  state_vector <- rep(0, n_stages*(n_parasites+1))
  state_names <- paste0("H_",
                                rep(1:n_stages, n_parasites+1), "_",
                                rep(0:n_parasites, each=n_stages))
  names(state_vector) <- state_names
  return(state_vector)
}

parm_list <- list( 
  n_stages=2,
  n_parasites=250,
  f=c(0.01, 0.01),
  g=c(0.1, 0),
  d=c(0.005, 0.005),
  alpha=c(0.05,0.05),
  lamda=c(0.3, 0.3),
  Beta = c(1, 1),
  mu = c(0.00, 0.00),
  xi = c(1, 1),
  omega = c(1,1),
  K=1000,
  prog = 1
  )

adler_parms <- list( 
  n_stages=2,
  n_parasites=150,
  f=c(15, 15),
  g=c(1, 0),
  d=c(0.2, 0.2),
  alpha=c(1,1),
  lamda=c(3, 3),
  Beta = c(1, 1),
  mu = c(1, 1),
  xi = c(1, 1),
  omega = c(1,1),
  K=10,
  prog = 1
  )

parm_list <- adler_parms

parm_vector <- unlist(as.relistable(parm_list))

J_ss = with(parm_list, K*(1- d[1]/f[1])/(1+g[1]/d[2]))
A_ss = with(parm_list, J_ss*g[1]/d[2])


init <- create_state_vector(parm_list$n_stages, parm_list$n_parasites)
init[1:4] <- c(J_ss, A_ss*0.9999, 0, A_ss*.00001)

times.min <- 0
times.max <- 7.5
times.by <- 0.01
times <- seq(times.min, times.max, by=times.by)

master_odes <- function(t, y, parm_vector) {
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
  
  stages <- c(0, 1:n_stages)
  parasites <- c(0, 0:n_parasites, 0)
  H <- rbind(rep(0, n_parasites + 3), 
             cbind(rep(0, n_stages), 
                   matrix(y, n_stages, n_parasites+1),
                   rep(0, n_stages)))
  Lamda <- sum(c(0,lamda)*colSums(t(H)*parasites))
  derivs <- rep(NA, n_stages*(n_parasites + 1))

  for (i in 0:n_parasites) {
    for (j in 1:n_stages) {
      derivs[i*n_stages + j] <- (H[j+1,i+1] - H[j+1,i+2])*Beta[j]*Lamda + 
                                H[j,i+2]*c(0, g)[j] - 
                                H[j+1,i+2]*(d[j] + g[j] + i*(mu[j] + alpha[j])) +
                                H[j+1,i+3]*(i+1)*mu[j]
    }
  }
  derivs[1] <- (sum(c(0, f)*rowSums(H*outer(c(0, xi), parasites, "^")))*
               (1 - sum(c(0, omega)*rowSums(H))/K)) - 
               H[2,2] * (d[1] + g[1] + Beta[1]*Lamda) + H[2,3]*mu[1]
#  names(derivatives) <- paste0("dH_", cases[,"j"], "_", cases[,"i"])
#  if(prog==1) setTxtProgressBar(BAR, t)
  if(prog==1) cat("\r", t, " ", round(100*t/times.max, 1), "%    \r")
  return(list(derivs))
}


## ----run, cache=TRUE, dependson=c('setparms', 'model-function')----------
#if(parm_list$prog==1) {BAR <- txtTimerBar(times.max)}

Rprof("out.prof", line.profiling=TRUE)
out <- lsoda(init, times, master_odes, parm_vector)
Rprof(NULL)


## ----orgdata, results='hide'---------------------------------------------
d <- data.table(melt(as.data.frame(out), id.vars="time", value.name="Population"))
newCols <- c("Species", "SizeClass", "Infected") 
d[, c(newCols) := as.list(strsplit(as.character(variable), "_")[[1]]), by=variable ]
d[, c(newCols) := lapply(.SD, factor), .SDcols=newCols]
d[, variable := NULL]
d[, SizeClass := as.integer(as.character(SizeClass))]
d[, Infected := as.integer(as.character(Infected))]
setcolorder(d,c(1,3,4,5,2))
d[, NormInfected :=Population/sum(Population), by=time]

sumd <- ddply(d, .(time, Species, SizeClass), summarize, 
              S=sum(Population[which(Infected == 0)]), 
              I=sum(Population[which(Infected != 0)]),
              H=sum(Population),
              P=sum(Population*Infected),
              InfPerInd=P/H,
              PctInf=I/H,
              MortRate=weighted.mean(parm_list$d[SizeClass[1]] + Infected*parm_list$alpha[SizeClass[1]], Population),
              MortRateInf=weighted.mean((parm_list$d[SizeClass[1]] + Infected*parm_list$alpha[SizeClass[1]])[which(Infected !=0)], Population[which(Infected != 0)])
              )

sumd <- ddply(sumd, .(time, Species), transform,
              PctPop = H/sum(H),
              Lamda = sum(parm_list$lamda[SizeClass]*P)
              )

sumd <- ddply(sumd, .(time, Species, SizeClass), transform,
              NewInfRate = parm_list$Beta[SizeClass] * Lamda)

require(moments)
weighted.moments <- function(counts, weights) {
  mean.val <- weighted.mean(counts, weights)
  sum.weights = sum(weights)
  variance <- sum(weights * ((counts - mean.val)^2))/sum.weights
  skew <- sum(weights * ((counts - mean.val))^3)/sum.weights
  kurt <- sum(weights * ((counts - mean.val))^4)/sum.weights - 3
  VarMeanRatio <- variance/mean.val
  SumVars <- mean.val + VarMeanRatio
  return(c(mean.val, variance, skew, kurt, VarMeanRatio, SumVars))
}

moments <- as.data.frame(
             d[, list(Moment=c("Mean","Variance","Skewness","Kurtosis",
                               "VarMeanRatio", "SumVars"),
                    Value=weighted.moments(Infected, Population)),
               by="time,Species,SizeClass"]
          )
moments$Moment <- factor(moments$Moment,
                         levels=c("Mean","Variance","Skewness","Kurtosis",
                                  "VarMeanRatio", "SumVars"))
moments$SizeClass <- as.factor(moments$SizeClass)


ggplot(moments, aes(x=time, y=Value, col=SizeClass)) + 
  geom_line() +
  facet_wrap(~Moment, scales="free_y", ncol=1)
    
require(reshape2)
moments2 <- dcast(moments, time + Species + SizeClass ~ Moment,
                  value.var="Value")
ggplot(moments2, aes(x=Mean, y=VarMeanRatio, col=SizeClass)) + 
  geom_path(arrow=arrow(angle=20, type="closed"))


ggplot(moments2, aes(x=SumVars, y=Skewness, col=SizeClass)) + 
  geom_path(arrow=arrow(angle=20, type="closed")) 

## ----animplot, warning=FALSE, fig.show='animate', interval=0.1, cache=TRUE, dependson=c('setparms', 'master_odes', 'run')----
lineplot <- ggplot(sumd, aes(x=time, y=H, col=as.factor(SizeClass))) + geom_line(lwd=1) + geom_line(mapping=aes(y=InfPerInd), lty=2) + theme_nr() + theme(legend.position=c(0.75,0.75)) + ylim(-0.5,max(c(sumd$H, sumd$InfPerInd))) + xlim(0,times.max) + ylab('Host Population') + scale_color_discrete(labels=c("Small Trees", "Big Trees"))
pp <- function(timer) {
  lineplot2 <- lineplot + geom_point(data=subset(sumd, time==timer), cex=6) + geom_vline(aes(xintercept = time), data=subset(sumd, time==timer))
  distplot <- ggplot(subset(d,time==timer), aes(x=Infected, y=NormInfected, fill=as.factor(SizeClass))) + geom_area(stat="identity", position="identity", alpha=0.5) + theme_nr() + theme(legend.position="none") + xlim(-1,50) + ylab("Proportion of Population") + xlab("Number of Infections")
  grid.arrange(lineplot2, distplot)
  }

#for(timer in times[1:50]) {
#  pp(timer)
#}

require(manipulate)
manipulate(pp(x), x=slider(0,times.max, step=times.by))

library(bbmle)

KLD <- function(par, dat) {
  negbin <- dnbinom(x=0:(length(dat)-1), mu=par[1], size=par[2])
  KLD <- sum(dat*log(dat/negbin))
  return(KLD)
}

NegBinFit <- function(dat) {
  dat = dat/sum(dat)
  bins <- 0:(length(dat) - 1)
  mu.start = weighted.mean(bins, dat)
  size.start = mu.start^2 / (max(0.01, sum(dat * (bins - mu.start)^2) - mu.start))
  size.start = ifelse(size.start==0, 1, size.start)
  mu.start = ifelse(mu.start==0, 0.00001, mu.start)
  return(optim(c(mu=mu.start, size=size.start), KLD, dat=dat))
}

fitf <- ddply(d, .(time, Species, SizeClass), function(z) {
  v <- z$Population
  v <- v[1:(min(which(v < 1e-300)[1] - 1, length(v), na.rm=TRUE))]
  opt <- NegBinFit(v)
  return(data.frame(mu=opt$par[1], k = opt$par[2], KLD = opt$value))
})

fitm <- melt(fitf, id.vars=c("time", "Species", "SizeClass"))
ggplot(fitm, aes(x=time, y=value, col=factor(SizeClass))) + geom_line() + facet_wrap(~variable, ncol=1, scales="free_y")

NegBinFit(v)
str## ----infperind, warning=FALSE--------------------------------------------
ggplot(sumd, aes(x=time, y=InfPerInd, col=as.factor(SizeClass))) + geom_line(lwd=1) + theme_nr + ylab("Infections per Individual") + scale_color_discrete(labels=c("Small Trees", "Big Trees"))


## ----pctinf, warning=FALSE-----------------------------------------------
ggplot(sumd, aes(x=time, y=PctInf, col=as.factor(SizeClass))) + geom_line(lwd=1) + theme_nr + ylab("Percent of Trees Infected") + scale_color_discrete(labels=c("Small Trees", "Big Trees"))


## ----yrstomort, warning=FALSE--------------------------------------------
ggplot(sumd, aes(x=I, y=1/MortRateInf, col=as.factor(SizeClass))) + geom_segment(aes(xend=c(tail(I, n=-2), NA, NA), yend=c(tail(1/MortRateInf, n=-2), NA, NA)), arrow=arrow(length=unit(0.3,"cm")), lwd=1) + theme_nr + ylab("Mean Years to Mortality") + xlab("Number of Infected Trees") + scale_color_discrete(labels=c("Small Trees", "Big Trees"))


