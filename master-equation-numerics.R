
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
require(manipulate)
require(multicore)
require(doMC)
require(foreach)

registerDoMC(cores=5)

parms = list( 
  n_stages = 4,
  n_parasites = 150,
  f = c(15, 15, 15, 15),
  g = c(0.1, 0.1, 0.1, 0),
  d = c(0.2, 0.2, 0.2, 0.2),
  alpha = c(1, 1, 1, 1),
  lamda = c(3, 3, 3, 3),
  Beta = c(1, 1, 1, 1),
  mu = c(1, 1, 1, 1),
  xi = c(1, 1, 1, 1),
  omega = c(1, 1, 1, 1),
  K = 10,
  progress = 0,
  times.min = 0,
  times.max = 2,
  times.by = 0.0025,
  inits = 0,
  infect_vector = c(0.0001, 0.0001, 0.0001, 0.0001)
)

parms2 = list( 
  n_stages = 4,
  n_parasites = 150,
  f = c(15, 15, 15, 15),
  g = c(1, 1, 1, 0),
  d = c(0.2, 0.2, 0.2, 0.2),
  alpha = c(1, 1, 1, 1),
  lamda = c(3, 3, 3, 3),
  Beta = c(1, 1, 1, 1),
  mu = c(1, 1, 1, 1),
  xi = c(1, 1, 1, 1),
  omega = c(1, 1, 1, 1),
  K = 10,
  progress = 0,
  times.min = 0,
  times.max = 2,
  times.by = 0.0025,
  inits = 0,
  infect_vector = c(0.0001, 0.0001, 0.0001, 0.0001)
)

parms4 = list( 
  n_stages = 4,
  n_parasites = 150,
  f = c(15, 15, 15, 15),
  g = c(10, 10, 10, 0),
  d = c(0.2, 0.2, 0.2, 0.2),
  alpha = c(1, 1, 1, 1),
  lamda = c(3, 3, 3, 3),
  Beta = c(1, 1, 1, 1),
  mu = c(1, 1, 1, 1),
  xi = c(1, 1, 1, 1),
  omega = c(1, 1, 1, 1),
  K = 10,
  progress = 0,
  times.min = 0,
  times.max = 2,
  times.by = 0.0025,
  inits = 0,
  infect_vector = c(0.0001, 0.0001, 0.0001, 0.0001)
)

parms4a = list( 
  n_stages = 4,
  n_parasites = 150,
  f = c(15, 15, 15, 15),
  g = c(30, 30, 30, 0),
  d = c(0.2, 0.2, 0.2, 0.2),
  alpha = c(1, 1, 1, 1),
  lamda = c(3, 3, 3, 3),
  Beta = c(1, 1, 1, 1),
  mu = c(1, 1, 1, 1),
  xi = c(1, 1, 1, 1),
  omega = c(1, 1, 1, 1),
  K = 10,
  progress = 0,
  times.min = 0,
  times.max = 2,
  times.by = 0.0025,
  inits = 0,
  infect_vector = c(0.0001, 0.0001, 0.0001, 0.0001)
)

plist <- list(Run1 = parms, Run2 = parms2, Run3 = parms4, Run4 = parms4a)

bigd <- llply(plist, function(pars) {
  out = run_sodp(pars)
  d = process_sodp(out)
  d = sodp_totals(d)
  return(d)
}, .parallel=TRUE)

bigstat <- llply(bigd, sodp_stats, .parallel=TRUE)
bigstat.m <- llply(bigstat, function(z) {
  z.m <- melt(z, id.vars=c("time", "Species", "SizeClass"))
  attr(z.m, "parms") <- attr(z, "parms")
  return(z.m)}, .parallel=TRUE)

bigd <- data.table(ldply(bigd, function(z) z))
bigstat <- data.table(ldply(bigstat, function(z) z))
bigstat.m <- data.table(ldply(bigstat.m, function(z) z))
bigd[, .id:=factor(.id)]
bigstat[, .id:=factor(.id)]
bigstat.m[, .id:=factor(.id)]
bigd[, time:=round_any(time, .0025)]
bigstat[, time:=round_any(time, .0025)]
bigstat.m[, time:=round_any(time, .0025)]


ggplot(subset(bigstat.m, SizeClass=="Total"), aes(x=time, y=value, col=.id)) + 
  facet_wrap(~variable, scales="free_y") +
  geom_line()

manipulate(ggplot(subset(bigstat.m, variable==VAR &
                                    ((SZ & SizeClass != "Total") |
                                    (TOT & SizeClass == "Total")) &
                                    .id == SET), 
                  aes(x=time, y=value, col=SizeClass)) + 
             geom_line() +
             ylim(0, max(subset(bigstat.m, variable==VAR, value))),
           VAR=do.call(picker, as.list(levels(bigstat.m$variable))),
           TOT=checkbox(label="Include Totals?"),
           SZ=checkbox(initial=TRUE, label="Include Others?"),
           SET=picker(as.list(levels(bigstat.m$.id))))

NN <- max(bigd[, Infected])
fits = data.table(ddply(bigstat, .(time, Species, SizeClass, .id),
              function(z) {
                data.frame(
                Infected = 0:NN,
                FitPop = dnbinom(0:NN,
                                 mu=z$NegBin_mu, size=z$NegBin_k)*z$N)
              }, .parallel=TRUE))

manipulate({set = bigd[((SZ & SizeClass != "Total") |
                          (TOT & SizeClass == "Total")) & 
                         abs(time - TIME) < .000001 & .id==RUN,]
            set2 = fits[((SZ & SizeClass != "Total") |
                           (TOT & SizeClass == "Total")) &
                          abs(time - TIME) < .000001 & .id==RUN,]
           plot = ggplot(set, aes(x=Infected, y=Population, fill=as.factor(SizeClass)))
           if(FIT) {
             plot = plot + geom_line(mapping=aes(x=Infected, y=FitPop),
                                     data=set2, lty=1, lwd=.75, col="black")
    #           scale_color_manual(values=c("1"="red", "2"="green", "Total"="blue"))
           }
             plot = plot + geom_area(alpha = 0.5, position="identity",
                                    lwd=0.5) +
   #          scale_fill_manual(values=c("1"="red", "2"="green", "Total"="blue"))
             ggtitle(paste("Time =",TIME))

           plot},
           RUN = picker(as.list(levels(bigd$.id))),
           TIME=slider(min=min(bigd$time), max=max(bigd$time), 
                       step=0.0025,
                       label="Time Step"),
           TOT=checkbox(initial=TRUE, label="Include Totals?"),
           SZ=checkbox(label="Include Others?"),
           FIT=checkbox(label="Show negative binomial fit?"))

