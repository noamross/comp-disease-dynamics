
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

parms <- list( 
  n_stages = 2,
  n_parasites = 150,
  f = c(15, 15),
  g = c(1, 0),
  d = c(0.2, 0.2),
  alpha = c(1,1),
  lamda = c(3, 3),
  Beta = c(1, 1),
  mu = c(1, 1),
  xi = c(1, 1),
  omega = c(1,1),
  K = 10,
  progress = 1,
  times.min = 0,
  times.max = 7.5,
  times.by = 0.01,
  inits = 0,
  infect_vector = c(0, 0.0001)
  )

require(deSolve)

Rprof("out.prof", line.profiling=TRUE)
out <- run_sodp(parms)
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
              MortRate=weighted.mean(parms$d[SizeClass[1]] + Infected*parms$alpha[SizeClass[1]], Population),
              MortRateInf=weighted.mean((parms$d[SizeClass[1]] + Infected*parms$alpha[SizeClass[1]])[which(Infected !=0)], Population[which(Infected != 0)])
              )

sumd <- ddply(sumd, .(time, Species), transform,
              PctPop = H/sum(H),
              Lamda = sum(parms$lamda[SizeClass]*P)
              )

sumd <- ddply(sumd, .(time, Species, SizeClass), transform,
              NewInfRate = parms$Beta[SizeClass] * Lamda)

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
lineplot <- ggplot(sumd, aes(x=time, y=H, col=as.factor(SizeClass))) + geom_line(lwd=1) + geom_line(mapping=aes(y=InfPerInd), lty=2) + theme_nr() + theme(legend.position=c(0.75,0.75)) + ylim(-0.5,max(c(sumd$H, sumd$InfPerInd))) + xlim(0,parms$times.max) + ylab('Host Population') + scale_color_discrete(labels=c("Small Trees", "Big Trees"))
pp <- function(timer) {
  lineplot2 <- lineplot + geom_point(data=subset(sumd, time==timer), cex=6) + geom_vline(aes(xintercept = time), data=subset(sumd, time==timer))
  distplot <- ggplot(subset(d,time==timer), aes(x=Infected, y=NormInfected, fill=as.factor(SizeClass))) + geom_area(stat="identity", position="identity", alpha=0.5) + theme_nr() + theme(legend.position="none") + xlim(-1,50) + ylab("Proportion of Population") + xlab("Number of Infections")
  grid.arrange(lineplot2, distplot)
  }

#for(timer in times[1:50]) {
#  pp(timer)
#}

require(manipulate)
manipulate(pp(x), x=slider(0,parms$times.max, step=parms$times.by))

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

require(scales)
ggplot(fitf, aes(x=time, y=k, col=factor(SizeClass))) + geom_line() + scale_y_continuous(oob=rescale_none, limits=c(0,20))

sumD <- ddply(sumd, .(time), summarize, H=sum(H))

ggplot(sumd, aes(x=time, y=H, col=factor(SizeClass))) + geom_line()
ggplot(sumD, aes(x=time, y=H)) + geom_line()

fitF <- ddply(d, .(time, Species), function(z) {
  v <- z$Population[z$SizeClass==1] + z$Population[z$SizeClass==2]
  v <- v[1:(min(which(v < 1e-300)[1] - 1, length(v), na.rm=TRUE))]
  opt <- NegBinFit(v)
  return(data.frame(mu=opt$par[1], k = opt$par[2], KLD = opt$value))
})

fitM <- melt(fitF, id.vars=c("time", "Species"))
ggplot(fitM, aes(x=time, y=value)) + geom_line() + facet_wrap(~variable, ncol=1, scales="free_y") + xlim(0,2)


NegBinFit(v)
str## ----infperind, warning=FALSE--------------------------------------------
ggplot(sumd, aes(x=time, y=InfPerInd, col=as.factor(SizeClass))) + geom_line(lwd=1) + theme_nr + ylab("Infections per Individual") + scale_color_discrete(labels=c("Small Trees", "Big Trees"))


## ----pctinf, warning=FALSE-----------------------------------------------
ggplot(sumd, aes(x=time, y=PctInf, col=as.factor(SizeClass))) + geom_line(lwd=1) + theme_nr + ylab("Percent of Trees Infected") + scale_color_discrete(labels=c("Small Trees", "Big Trees"))


## ----yrstomort, warning=FALSE--------------------------------------------
ggplot(sumd, aes(x=I, y=1/MortRateInf, col=as.factor(SizeClass))) + geom_segment(aes(xend=c(tail(I, n=-2), NA, NA), yend=c(tail(1/MortRateInf, n=-2), NA, NA)), arrow=arrow(length=unit(0.3,"cm")), lwd=1) + theme_nr + ylab("Mean Years to Mortality") + xlab("Number of Infected Trees") + scale_color_discrete(labels=c("Small Trees", "Big Trees"))


