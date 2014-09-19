

require(devtools)
install_github("noamross/noamtools")
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
require(foreach)
require(doMC)

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
  progress = 0,
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

parms4 = list(
  n_stages = 4,
  n_parasites = 150,
  f = c(15, 15, 15, 15),
  g = c(1, 1, 1, 0),
  d = c(0.2, 0.2, 0.2, 0.2),
  alpha = c(1,1,1,1),
  lamda = c(3, 3,3, 3),
  Beta = c(1, 1, 1, 1),
  mu = c(1, 1, 1, 1),
  xi = c(1, 1, 1, 1),
  omega = c(1,1, 1, 1),
  K = 10,
  progress = 1,
  times.min = 0,
  times.max = 2,
  times.by = 0.01,
  inits = 0,
  infect_vector = c(0, 0.0001, 0, 0)
  )

parms41 = list(
  n_stages = 4,
  n_parasites = 1,
  f = c(15, 15, 15, 15),
  g = c(1, 1, 1, 0),
  d = c(0.2, 0.2, 0.2, 0.2),
  alpha = c(1,1,1,1),
  lamda = c(3, 3,3, 3),
  Beta = c(1, 1, 1, 1),
  mu = c(1, 1, 1, 1),
  xi = c(1, 1, 1, 1),
  omega = c(1,1, 1, 1),
  K = 10,
  progress = 1,
  times.min = 0,
  times.max = 2,
  times.by = 0.01,
  inits = 0,
  infect_vector = c(0, 0.0001, 0, 0)
  )

parms4s = list(
  n_stages = 4,
  n_parasites = 150,
  f = c(15, 15, 15, 15),
  g = c(0.75, 0.75, 0.75, 0),
  d = c(0.2, 0.2, 0.2, 0.2),
  alpha = c(1,1,1,1),
  lamda = c(3, 3,3, 3),
  Beta = c(1, 1, 1, 1),
  mu = c(1, 1, 1, 1),
  xi = c(1, 1, 1, 1),
  omega = c(1,1, 1, 1),
  K = 10,
  progress = 1,
  times.min = 0,
  times.max = 2,
  times.by = 0.01,
  inits = 0,
  infect_vector = c(0, 0.0001, 0, 0)
  )

parms4sf = list(
  n_stages = 4,
  n_parasites = 150,
  f = c(1.5, 1.5, 1.5, 1.5),
  g = c(0.1, 0.1, 0.1, 0),
  d = c(0.02, 0.02, 0.02, 0.02),
  alpha = c(1,1,1,1),
  lamda = c(3, 3,3, 3),
  Beta = c(1, 1, 1, 1),
  mu = c(1, 1, 1, 1),
  xi = c(1, 1, 1, 1),
  omega = c(1,1, 1, 1),
  K = 10,
  progress = 1,
  times.min = 0,
  times.max = 10,
  times.by = 0.01,
  inits = 0,
  infect_vector = c(0, 0.0001, 0, 0)
  )

parms4sf2 = list(
  n_stages = 4,
  n_parasites = 150,
  f = c(1.5, 1.5, 1.5, 1.5),
  g = c(1, 1, 1, 0),
  d = c(0.02, 0.02, 0.02, 0.02),
  alpha = c(1,1,1,1),
  lamda = c(3, 3,3, 3),
  Beta = c(1, 1, 1, 1),
  mu = c(1, 1, 1, 1),
  xi = c(1, 1, 1, 1),
  omega = c(1,1, 1, 1),
  K = 10,
  progress = 1,
  times.min = 0,
  times.max = 10,
  times.by = 0.01,
  inits = 0,
  infect_vector = c(0, 0.0001, 0, 0)
  )

parms4sf3 = list(
  n_stages = 4,
  n_parasites = 150,
  f = c(1.5, 1.5, 1.5, 1.5),
  g = c(0.01, 0.01, 0.01, 0),
  d = c(0.02, 0.02, 0.02, 0.02),
  alpha = c(1,1,1,1),
  lamda = c(3, 3,3, 3),
  Beta = c(1, 1, 1, 1),
  mu = c(1, 1, 1, 1),
  xi = c(1, 1, 1, 1),
  omega = c(1,1, 1, 1),
  K = 10,
  progress = 1,
  times.min = 0,
  times.max = 10,
  times.by = 0.01,
  inits = 0,
  infect_vector = c(0, 0.0001, 0, 0)
  )

parms4sf4 = list(
  n_stages = 4,
  n_parasites = 150,
  f = c(1.5, 1.5, 1.5, 1.5),
  g = c(10, 10, 10, 0),
  d = c(0.02, 0.02, 0.02, 0.02),
  alpha = c(1,1,1,1),
  lamda = c(3, 3,3, 3),
  Beta = c(1, 1, 1, 1),
  mu = c(1, 1, 1, 1),
  xi = c(1, 1, 1, 1),
  omega = c(1,1, 1, 1),
  K = 10,
  progress = 1,
  times.min = 0,
  times.max = 10,
  times.by = 0.01,
  inits = 0,
  infect_vector = c(0, 0.0001, 0, 0)
  )

parms4sf = list(
  n_stages = 4,
  n_parasites = 150,
  f = c(1.5, 1.5, 1.5, 1.5),
  g = c(0.1, 0.1, 0.1, 0),
  d = c(0.02, 0.02, 0.02, 0.02),
  alpha = c(0.2,0.2,0.2,0.2),
  lamda = c(1, 1,1, 1),
  Beta = c(1, 1, 1, 1),
  mu = c(1, 1, 1, 1),
  xi = c(1, 1, 1, 1),
  omega = c(1,1, 1, 1),
  K = 10,
  progress = 1,
  times.min = 0,
  times.max = 25,
  times.by = 0.02,
  inits = 0,
  infect_vector = c(0, 0.0001, 0, 0)
  )

parms4sf2 = list(
  n_stages = 4,
  n_parasites = 150,
  f = c(1.5, 1.5, 1.5, 1.5),
  g = c(1, 1, 1, 0),
  d = c(0.02, 0.02, 0.02, 0.02),
  alpha = c(0.2,0.2,0.2,0.2),
  lamda = c(1, 1,1, 1),
  Beta = c(1, 1, 1, 1),
  mu = c(1, 1, 1, 1),
  xi = c(1, 1, 1, 1),
  omega = c(1,1, 1, 1),
  K = 10,
  progress = 1,
  times.min = 0,
  times.max = 25,
  times.by = 0.02,
  inits = 0,
  infect_vector = c(0, 0.0001, 0, 0)
  )

parms4sf3 = list(
  n_stages = 4,
  n_parasites = 150,
  f = c(1.5, 1.5, 1.5, 1.5),
  g = c(0.01, 0.01, 0.01, 0),
  d = c(0.02, 0.02, 0.02, 0.02),
  alpha = c(0.2,0.2,0.2,0.2),
  lamda = c(1, 1,1, 1),
  Beta = c(1, 1, 1, 1),
  mu = c(1, 1, 1, 1),
  xi = c(1, 1, 1, 1),
  omega = c(1,1, 1, 1),
  K = 10,
  progress = 1,
  times.min = 0,
  times.max = 25,
  times.by = 0.02,
  inits = 0,
  infect_vector = c(0, 0.0001, 0, 0)
  )

parms4sf4 = list(
  n_stages = 4,
  n_parasites = 150,
  f = c(1.5, 1.5, 1.5, 1.5),
  g = c(10, 10, 10, 0),
  d = c(0.02, 0.02, 0.02, 0.02),
  alpha = c(0.2,0.2,0.2,0.2),
  lamda = c(1, 1,1, 1),
  Beta = c(1, 1, 1, 1),
  mu = c(1, 1, 1, 1),
  xi = c(1, 1, 1, 1),
  omega = c(1,1, 1, 1),
  K = 10,
  progress = 1,
  times.min = 0,
  times.max = 25,
  times.by = 0.02,
  inits = 0,
  infect_vector = c(0, 0.0001, 0, 0)
  )



require(deSolve)

# out = run_sodp(parms)
# d = process_sodp(out)
# d = sodp_totals(d)
# stats = sodp_stats(d)
# stats.m = melt(stats, id.vars=c("time", "Species", "SizeClass"))
# 
# out1 = run_sodp(parms1)
# d1 = process_sodp(out1)
# d1 = sodp_totals(d1)
# stats1 = sodp_stats(d1)
# stats.m1 = melt(stats1, id.vars=c("time", "Species", "SizeClass"))
# 
# 
# 
# out2 = run_sodp(parms2)
# d2 = process_sodp(out2)
# d2 = sodp_totals(d2)
# stats2 = sodp_stats(d2)
# stats.m2 = melt(stats2, id.vars=c("time", "Species", "SizeClass"))
# 
# out4 = run_sodp(parms4)
# d4 = process_sodp(out4)
# d4 = sodp_totals(d4)
# stats4 = sodp_stats(d4)
# stats.m4 = melt(stats4, id.vars=c("time", "Species", "SizeClass"))
# 
# out41 = run_sodp(parms41)
# d41 = process_sodp(out41)
# d41 = sodp_totals(d41)
# stats41 = sodp_stats(d41)
# stats.m41 = melt(stats41, id.vars=c("time", "Species", "SizeClass"))
# 
# out4s = run_sodp(parms4s)
# d4s = process_sodp(out4s)
# d4s = sodp_totals(d4s)
# stats4s = sodp_stats(d4s)
# stats.m4s = melt(stats4s, id.vars=c("time", "Species", "SizeClass"))
# 
out4sf = run_sodp(parms4sf)
d4sf = process_sodp(out4sf)
d4sf = sodp_totals(d4sf)
stats4sf = sodp_stats(d4sf)
stats.m4sf = melt(stats4sf, id.vars=c("time", "Species", "SizeClass"))

out4sf2 = run_sodp(parms4sf2)
d4sf2 = process_sodp(out4sf2)
d4sf2 = sodp_totals(d4sf2)
stats4sf2 = sodp_stats(d4sf2)
stats.m4sf2 = melt(stats4sf2, id.vars=c("time", "Species", "SizeClass"))

out4sf3 = run_sodp(parms4sf3)
d4sf3 = process_sodp(out4sf3)
d4sf3 = sodp_totals(d4sf3)
stats4sf3 = sodp_stats(d4sf3)
stats.m4sf3 = melt(stats4sf3, id.vars=c("time", "Species", "SizeClass"))

out4sf4 = run_sodp(parms4sf4)
d4sf4 = process_sodp(out4sf4)
d4sf4 = sodp_totals(d4sf4)
stats4sf4 = sodp_stats(d4sf4)
stats.m4sf4 = melt(stats4sf4, id.vars=c("time", "Species", "SizeClass"))
 
# 
# ggplot(stats.m4, aes(x=time, y=value, col=SizeClass)) + 
#   facet_wrap(~variable, scales="free_y") +
#   geom_line() 
# 
# ggplot(stats.m41, aes(x=time, y=value, col=SizeClass)) + 
#   facet_wrap(~variable, scales="free_y") +
#   geom_line() 
# 
# ggplot(stats.m4s, aes(x=time, y=value, col=SizeClass)) + 
#   facet_wrap(~variable, scales="free_y") +
#   geom_line() 

plots = list()
x = 1
for(datt in list(stats.m4sf3, stats.m4sf, stats.m4sf2, stats.m4sf4)) {

datt = subset(datt, time < 25 & variable=="RMortInfRate" &SizeClass != "Total")  
datt$SizeClass = factor(datt$SizeClass, levels = c("4","3","2","1"))
plots[[x]] = ggplot(datt, aes(x=time, y=value, col=SizeClass)) + 
  geom_line(size=1) +
  ylab("Relative mortality rate of infected trees") +
  xlab("Time") +
  ylim(1,5.75) +
  scale_color_manual(name="Tree Size Class", breaks=c("1","2","3","4"), values=brewer.pal(6, "Blues")[3:6]) +
  theme_nr +
   theme(text=element_text(family="Lato"),
        legend.position = c(0.8, 0.7),
        legend.text = element_text(size=16),
        legend.title = element_text(size=18),
        axis.title.y=element_text(vjust=1),
        axis.title.x=element_text(vjust=-.5),
        axis.text=element_text(size=16),
        legend.key.size=unit(1.2, "cm")
        )
x = x+1
}

plots[[1]]
plots[[2]]
plots[[3]]
plots[[4]]

ggsave("~/Dropbox/Workspace/dyn2.png", plots[[2]], width = 10, height=7)
ggsave("~/Dropbox/Workspace/dyn4.png", plots[[4]], width = 10, height=7)

require(manipulate)

manipulate(ggplot(d4sf2[abs(time-TIME) < 1e-5 & SizeClass != "Total",], aes(x=Infected, y = Population, fill=SizeClass)) +
  geom_area(position="identity", alpha=0.5) + xlim(0,50),
      TIME = slider(min=min(d4sf4$time), max=max(d4sf4$time), 
                       step=0.02,
                       label="Time Step"))
library(dplyr)
library(RColorBrewer)
TIME = 1.9
d4sf2mm = d4sf2 %>% subset(abs(time-TIME) < 1e-5 & SizeClass != "Total") %>% 
  group_by(SizeClass) %>%
  summarize(maxpop=max(Population)) %>%
  arrange(-maxpop) %>% select(SizeClass) %>% as.data.frame
d4sf2mm = as.character(d4sf2mm$SizeClass)




TIME = 1.9
  
d4sf2$SizeClass = factor(d4sf2$SizeClass, levels = c(d4sf2mm, "Total"))
distplot1 = ggplot(d4sf2[(abs(time-TIME) < 1e-5) & SizeClass != "Total" & Population > 1e-5,],
       aes(x=Infected, y = Population, fill=SizeClass)) +
  geom_area(position="identity") +
  geom_area(color="black",position="identity", alpha=0.9, lwd=0.25, show_guide=FALSE) +
  xlim(0,50) + 
  theme_nr +
  scale_fill_manual(name = "Tree Size Class", breaks=c("1", "2", "3", "4"),
                    values = brewer.pal(4, "Blues")[c(1,4,3,2)]) +
  xlab("Number of Infections") +
  ylab("Population in Infection Class") +
  theme_nr +
  theme(text=element_text(family="Lato"),
        strip.text=element_text(size=16),
        strip.background=element_blank(),
        legend.position = c(0.8, 0.83),
        legend.text = element_text(size=16),
        legend.title = element_text(size=18),
        axis.title.y=element_text(vjust=1),
        axis.title.x=element_text(vjust=-.5),
        axis.text=element_text(size=16),
        panel.margin = unit(0, "cm"),
        legend.key.size=unit(1.2, "cm")
        )
distplot1
ggsave("~/Dropbox/Workspace/distplot1.png", distplot1, width = 10, height=7)


TIME = 2.3
  
d4sf2$SizeClass = factor(d4sf2$SizeClass, levels = c(d4sf2mm, "Total"))
distplot2 = ggplot(d4sf2[(abs(time-TIME) < 1e-5) & SizeClass != "Total" & Population > 1e-5,],
       aes(x=Infected, y = Population, fill=SizeClass)) +
  geom_area(position="identity") +
  geom_area(color="black",position="identity", alpha=0.9, lwd=0.25, show_guide=FALSE) +
  xlim(0,50) + 
  theme_nr +
  scale_fill_manual(name = "Tree Size Class", breaks=c("1", "2", "3", "4"),
                    values = brewer.pal(4, "Blues")[c(1,4,3,2)]) +
  xlab("Number of Infections") +
  ylab("Population in Infection Class") +
  theme_nr +
  theme(text=element_text(family="Lato"),
        strip.text=element_text(size=16),
        strip.background=element_blank(),
        legend.position = c(0.8, 0.83),
        legend.text = element_text(size=16),
        legend.title = element_text(size=18),
        axis.title.y=element_text(vjust=1),
        axis.title.x=element_text(vjust=-.5),
        axis.text=element_text(size=16),
        panel.margin = unit(0, "cm"),
        legend.key.size=unit(1.2, "cm")
        )

distplot2
ggsave("~/Dropbox/Workspace/distplot2.png", distplot2, width = 10, height=7)

TIME = 25

d4sf2mm = d4sf2 %>% subset(abs(time-TIME) < 1e-5 & SizeClass != "Total") %>% 
  group_by(SizeClass) %>%
  summarize(maxpop=max(Population)) %>%
  arrange(-maxpop) %>% select(SizeClass) %>% as.data.frame
d4sf2mm = as.character(d4sf2mm$SizeClass)
  
d4sf2$SizeClass = factor(d4sf2$SizeClass, levels = c(d4sf2mm, "Total"))
distplot3 = ggplot(d4sf2[(abs(time-TIME) < 1e-5) & SizeClass != "Total" & Population > 1e-5,],
       aes(x=Infected, y = Population, fill=SizeClass)) +
  geom_area(position="identity") +
  geom_area(color="black",position="identity", alpha=0.9, lwd=0.25, show_guide=FALSE) +
  xlim(0,50) + 
  theme_nr +
  scale_fill_manual(name = "Tree Size Class", breaks=c("1", "2", "3", "4"),
                    values = rev(brewer.pal(4, "Blues"))) +
  xlab("Number of Infections") +
  ylab("Population in Infection Class") +
  theme_nr +
  theme(text=element_text(family="Lato"),
        strip.text=element_text(size=16),
        strip.background=element_blank(),
        legend.position = c(0.8, 0.83),
        legend.text = element_text(size=16),
        legend.title = element_text(size=18),
        axis.title.y=element_text(vjust=1),
        axis.title.x=element_text(vjust=-.5),
        axis.text=element_text(size=16),
        panel.margin = unit(0, "cm"),
        legend.key.size=unit(1.2, "cm")
        )

distplot3
ggsave("~/Dropbox/Workspace/distplot3.png", distplot3, width = 10, height=7)

library(scales)
stats4sf4 = arrange(stats4sf4, time)
evol1 = ggplot(subset(stats4sf4, SizeClass=="Total"), aes(x=I/N, y = 1/MortInfRate)) +
  geom_point(size=2.5) +
  geom_path(size=.75) +
  theme_nr +
  ylab("Time to death after infection") +
  scale_x_continuous(labels = percent, name="Percent Individuals Infected") +
  theme(text=element_text(family="Lato"),
        axis.title.y=element_text(vjust=1),
        axis.title.x=element_text(vjust=-.5),
        axis.text=element_text(size=16))
evol1
ggsave("~/Dropbox/Workspace/evol1.png", evol1, width = 10, height=7)

evol2 = ggplot(subset(stats4sf4, SizeClass=="Total"), aes(x=I, y = 1/MortInfRate)) +
  geom_point(size=2.5) +
  geom_path(size=.75) +
  theme_nr +
  ylab("Time to death after infection") +
  scale_x_continuous("Number Individuals Infected") +
  theme(text=element_text(family="Lato"),
        axis.title.y=element_text(vjust=1),
        axis.title.x=element_text(vjust=-.5),
        axis.text=element_text(size=16))
evol2
ggsave("~/Dropbox/Workspace/evol2.png", evol2, width = 10, height=7)



manipulate(ggplot(droplevels(subset(stats4s, SizeClass != "Total" & abs(time - TIME) < 0.0001)),
         aes(x = SizeClass, y = MortInfRate)) + geom_bar(stat="identity") +
          # ylim(0, max(stats4s$MortInfRate, na.rm=TRUE)),
           ylim(0,30),
         TIME = slider(min=min(stats4s$time), max=max(stats4$time), 
                       step=0.02,
                       label="Time Step")
)

manipulate(ggplot(droplevels(subset(stats4, SizeClass != "Total" & abs(time - TIME) < 0.0001)),
         aes(x = SizeClass, y = N)) + geom_bar(stat="identity") +
           ylim(0, max(stats4$N, na.rm=TRUE)),
         TIME = slider(min=min(stats4$time), max=max(stats4$time), 
                       step=0.02,
                       label="Time Step")
)

manipulate(ggplot(droplevels(subset(stats41, SizeClass != "Total" & abs(time - TIME) < 0.0001)),
         aes(x = SizeClass, y = N)) + geom_bar(stat="identity") +
           ylim(0, max(stats41$N, na.rm=TRUE)),
         TIME = slider(min=min(stats4$time), max=max(stats4$time), 
                       step=0.02,
                       label="Time Step")
)


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
registerDoMC(23)
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
  facet_wrap(~K, scales="fixed") +
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
