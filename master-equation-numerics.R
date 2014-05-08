
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

parms = list( 
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
  times.max = 2,
  times.by = 0.01,
  inits = 0,
  infect_vector = c(0, 0.0001)
  )

parms1 = list( 
  n_stages = 2,
  n_parasites = 1,
  f = c(15, 15),
  g = c(1, 0),
  d = c(0.2, 0.2),
  alpha = c(8.5,8.5),
  lamda = c(3, 3),
  Beta = c(1, 1),
  mu = c(1, 1),
  xi = c(1, 1),
  omega = c(1,1),
  K = 10,
  progress = 1,
  times.min = 0,
  times.max = 2,
  times.by = 0.01,
  inits = 0,
  infect_vector = c(0, 0.0001)
  )

parms2 = list( 
  n_stages = 1,
  n_parasites = 150,
  f = c(15),
  g = c(1),
  d = c(0.2),
  alpha = c(1),
  lamda = c(3),
  Beta = c(1),
  mu = c(1),
  xi = c(1),
  omega = c(1),
  K = 10,
  progress = 1,
  times.min = 0,
  times.max = 2,
  times.by = 0.01,
  inits = 0,
  infect_vector = c(0.0001)
)

require(deSolve)

out = run_sodp(parms)
d = process_sodp(out)
d = sodp_totals(d)
stats = sodp_stats(d)
stats.m = melt(stats, id.vars=c("time", "Species", "SizeClass"))

out1 = run_sodp(parms1)
d1 = process_sodp(out1)
d1 = sodp_totals(d1)
stats1 = sodp_stats(d1)
stats.m1 = melt(stats1, id.vars=c("time", "Species", "SizeClass"))



out2 = run_sodp(parms2)
d2 = process_sodp(out2)
d2 = sodp_totals(d2)
stats2 = sodp_stats(d2)
stats.m2 = melt(stats2, id.vars=c("time", "Species", "SizeClass"))



ggplot(stats.m, aes(x=time, y=value, col=SizeClass)) + 
  facet_wrap(~variable, scales="free_y") +
  geom_line() 

ggplot(stats.m1, aes(x=time, y=value, col=SizeClass)) + 
  facet_wrap(~variable, scales="free_y") +
  geom_line() 

require(manipulate)
manipulate(ggplot(subset(SET, variable==VAR & (TOT | SizeClass != "Total")), 
                  aes(x=time, y=value, col=SizeClass)) + 
             geom_line(),
           VAR=do.call(picker, c(as.list(levels(stats.m$variable)),
                                 label="Variable")),
           TOT=checkbox(label="Include Totals?"),
           SET=picker(list(age=stats.m, none=stats.m2)))

fits = data.table(ddply(stats, .(time, Species, SizeClass),
              function(z) {
                data.frame(
                Infected = 0:attr(stats, "parms")$n_parasites,
                FitPop = dnbinom(0:attr(stats, "parms")$n_parasites,
                                 mu=z$NegBin_mu, size=z$NegBin_k)*z$N)
              }))

manipulate({set = d[(TOT | SizeClass!="Total") & time==TIME,]
            set2 = fits[(TOT | SizeClass!="Total") & time==TIME,]
           plot = ggplot(set, aes(x=Infected, y=Population, fill=SizeClass))
           if(FIT) {
             plot = plot + geom_line(mapping=aes(x=Infected, y=FitPop,
                                                 col=SizeClass),
                                     data=set2, lty=2, lwd=1.5) +
               scale_color_manual(values=c("1"="red", "2"="green", "Total"="blue"))
           }
             plot = plot + geom_area(alpha = 0.5, position="identity") +
             scale_fill_manual(values=c("1"="red", "2"="green", "Total"="blue"))
             ggtitle(paste("Time =",TIME))

           plot},
           TIME=slider(min=min(d$time), max=max(d$time), 
                       step=0.02,
                       label="Time Step"),
           TOT=checkbox(label="Include Totals?"),
           FIT=checkbox(label="Show negative binomial fit?"))

Ks = c(1, seq(5,100, 5))
names(Ks) = Ks
multparms = parms
multparms$progress = 0
multstats = adply(Ks, 1, function(K) {
                          multparms$K = K
                          out = run_sodp(multparms)
                          d = process_sodp(out)
                          d = sodp_totals(d)
                          stats = sodp_stats(d)
                          stats$K = K
                          return(stats) },
                  .progress="time")
multstats$X1 = NULL
multstats.m = melt(multstats, id.vars=c("K", "time", "Species", "SizeClass"))


ggplot(subset(multstats.m, variable=="MortInfRate"), aes(x=time, y=value, col=SizeClass)) + 
  facet_wrap(~K, scales="free_y") +
  geom_line() 

manipulate(ggplot(subset(multstats.m, variable==VAR & (TOT | SizeClass != "Total") & (time > TIME)), 
                  aes(x=time, y=value, col=SizeClass)) + 
             facet_wrap(~K, scales=SCALE) + geom_line(),
           VAR=do.call(picker, c(as.list(levels(stats.m$variable)),
                                 label="Variable")),
           TOT=checkbox(label="Include Totals?"),
           SCALE = picker(list(Free="free_y", Fixed="fixed"), label="Scales"),
           TIME = slider(min=min(multstats.m$time), max=max(multstats.m$time), 
                       step=0.02,
                       label="Start Time"))



multstats = multstats[order(multstats$K, multstats$SizeClass, multstats$time),]

ggplot(multstats, aes(x=I, y=1/MortInfRate, col=SizeClass)) + 
  facet_wrap(~K, scales="free") +
 # geom_point()
  geom_segment(aes(xend=c(tail(I, n=-1),NA), yend=c(tail(1/MortInfRate, n=-1), NA)), arrow=arrow(length=unit(0.2,"cm")), lwd=0.75)

manipulate(ggplot(subset(multstats, time==TIME), aes(x=I, y=1/MortInfRate, col=SizeClass)) + geom_line(),
           TIME = slider(min=min(multstats.m$time), max=max(multstats.m$time), 
                       step=0.02,
                       label="Time"))
