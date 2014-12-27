#' This knit file runs the code to generate figures for the manuscript file.
#' 
## ----load_pkgs_code------------------------------------------------------
library(deSolve)
library(plyr)
library(rootSolve)
library(reshape2)
library(ggplot2)
library(data.table)
library(noamtools)
library(numDeriv)
library(gridExtra)
library(magrittr)
library(extrafont)
source('../R/process_sodp.R')
source('../R/run_sodp.R')

#' 
## ----base_models---------------------------------------------------------
out_SI = run_sodp(parms_SI)
SIsf = process_sodp(out_SI)
SIsf = sodp_totals(SIsf)
stats_SI = sodp_stats(SIsf)
stats_SI.m = melt(stats_SI, id.vars=c("time", "Species", "SizeClass"))

out_SIV = run_sodp(parms_SIV)
SIVsf = process_sodp(out_SIV)
SIVsf = sodp_totals(SIVsf)
stats_SIV = sodp_stats(SIVsf)
stats_SIV.m = melt(stats_SIV, id.vars=c("time", "Species", "SizeClass"))

out_multi = run_sodp(parms_multi)
multisf = process_sodp(out_multi)
multisf = sodp_totals(multisf)
stats_multi = sodp_stats(multisf)
stats_multi.m = melt(stats_multi, id.vars=c("time", "Species", "SizeClass"))


#' 
## ----progplot------------------------------------------------------------
times = c(0, 5, 15, 20, 25, 30, 50, 75)
df = data.frame(subset(multisf, time %in% times))
df = subset(df, SizeClass != "Total" & Population > 1e-5)
df = df[order(df$time),]
df$time = factor(paste("Time =", df$time), levels = paste("Time =", unique(df$time)))
progplot_SIV =ggplot(df, aes(x=Infected, y=Population, fill=SizeClass)) + 
  geom_area(position="identity", alpha = 0.5) +
  scale_fill_grey(labels = c("Juveniles", "Adults")) +
  theme_nr +
  xlab("Number of Infections") +
  theme(text=element_text(family="Lato")) +
  facet_wrap(~time, nrow=1)

df2 = data.frame(subset(SIVsf, time %in% times))
df2 = droplevels(subset(df2, SizeClass != "Total" & Population > 1e-5))
df2 = df2[order(df2$time),]
df2$time = factor(paste("Time =", df2$time), levels = paste("Time =", unique(df2$time)))
progplot_multi = ggplot(df2, aes(x=as.factor(Infected), y=Population, fill=SizeClass)) + 
  geom_bar(stat="identity", position="dodge", alpha = 0.5) +
  scale_fill_grey(labels = c("Juveniles", "Adults")) +
  scale_x_discrete(labels = c("S", "I", "V")) +
  theme_nr +
  xlab("Disease Class") +
  theme(text=element_text(family="Lato")) +
  facet_wrap(~time, nrow=1)

#' 
#' 
## ----base_comparison-----------------------------------------------------
stats = list(SI=stats_SI.m, SIV=stats_SIV.m, multi=stats_multi.m)
statsall = ldply(stats, function(x) x)

mortInf = ldply(stats, function(x) subset(x, variable %in% c("N")))
p1 = ggplot(mortInf, aes(x = time, y=value, col=.id, linetype=SizeClass, size=SizeClass)) +
  geom_line() +
  ylim(0, 1) +
  ylab("Host Population") +
  xlab(" ") +
  scale_linetype_manual(labels=c("Juv", "Adult", "Total"), values=c(2,6,1)) +
  scale_color_grey() +
  scale_size_manual(values=c(1,1, 2), guide='none') +
  scale_x_continuous(limits=c(0, 75), breaks=seq(0,75,25)) +
  theme_nr +
  theme(text=element_text(family="Lato")) +
  guides(linetype = guide_legend(reverse=TRUE))

mortInf = ldply(stats, function(x) subset(x, variable %in% c("I")))
p2 = ggplot(mortInf, aes(x = time, y=value, col=.id, linetype=SizeClass, size=SizeClass)) +
  geom_line() +
  ylim(0, 1) +
  ylab("Infected Hosts") +
  xlab("Time") +
  scale_linetype_manual(labels=c("Juv", "Adult", "Total"), values=c(2,6,1)) +
  scale_color_grey() +
  scale_size_manual(values=c(1,1, 2), guide='none') + 
  scale_x_continuous(limits=c(0, 75), breaks=seq(0,75,25)) +
  theme_nr +
  theme(text=element_text(family="Lato")) +
  guides(linetype = guide_legend(reverse=TRUE))

mortInf = ldply(stats, function(x) subset(x, variable %in% c("MortInfRate")))
mortInf$value = mortInf$value + + parms_SI$d[1]
p3 = ggplot(mortInf, aes(x = time, y=value, col=.id, linetype=SizeClass, size=SizeClass)) +
  geom_line() +
  ylim(0, 1) +
  ylab("Infected Mortality Rate") +
  xlab(" ") +
  scale_linetype_manual(labels=c("Juv", "Adult", "Total"), values=c(2,6,1)) +
  scale_color_grey() +
  scale_size_manual(values=c(1,1, 2), guide='none') + 
  scale_x_continuous(limits=c(0, 75), breaks=seq(0,75,25)) +
  theme_nr +
  theme(text=element_text(family="Lato")) +
  guides(linetype = guide_legend(reverse=TRUE))

g_legend <- function(p){
tmp <- ggplotGrob(p)
leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
legend <- tmp$grobs[[leg]]
return(legend)}

legend <- g_legend(p1)
lwidth <- sum(legend$width)
plotwidth = (unit(1, "npc") - lwidth)*(1/3)

one_inf_comp_plot = arrangeGrob(p1 + theme(legend.position="none"), 
             p2 + theme(legend.position="none"),
             p3 + theme(legend.position="none"),
             legend, 
             widths=unit.c(plotwidth, plotwidth, plotwidth, lwidth),
             main = textGrob("Epidemic Dynamics: 1-infection equivalence", gp=gpar(fontsize=20,fontfamily='Lato')),
              nrow=1)

#' 
## ----modparms------------------------------------------------------------

parms_SIVmod = parms_SIV

aa = optim(par = 1, f = function(mod_SIV) {
  parms_SIVmod$alpha = parms_SIV$alpha*mod_SIV
  parms_SIVmod$lamda = parms_SIV$lamda*mod_SIV
  out_SIVmod = run_sodp(parms_SIVmod)
  SIVmodsf = process_sodp(out_SIVmod)
  SIVmodsf = sodp_totals(SIVmodsf)
  stats_SIVmod = sodp_stats(SIVmodsf)
  val = subset(stats_SIVmod, time==parms_SIVmod$times.max & SizeClass=="Total")$MortInfRate
  if(interactive()) print(val)
  return((val - parms_SI$alpha[1])^2)
  }, method="Brent", lower=0, upper=2)


mod_SIV = aa$par
parms_SIVmod$alpha = parms_SIV$alpha*mod_SIV
parms_SIVmod$lamda = parms_SIV$lamda*mod_SIV
out_SIVmod = run_sodp(parms_SIVmod)
SIVmodsf = process_sodp(out_SIVmod)
SIVmodsf = sodp_totals(SIVmodsf)
stats_SIVmod = sodp_stats(SIVmodsf)
stats_SIVmod.m = melt(stats_SIVmod, id.vars=c("time", "Species", "SizeClass"))


parms_multimod = parms_multi


bb = optim(par = 0.6118, f = function(mod_multi) {
  parms_multimod$alpha = parms_multi$alpha*mod_multi
  parms_multimod$lamda = parms_multi$lamda*mod_multi
  out_multimod = run_sodp(parms_multimod)
  multimodsf = process_sodp(out_multimod)
  multimodsf = sodp_totals(multimodsf)
  stats_multimod = sodp_stats(multimodsf)
  val = subset(stats_multimod, time==parms_multimod$times.max & SizeClass=="Total")$MortInfRate
  if(interactive()) print(val)
  return((val - parms_SI$alpha[1])^2)
  }, method="Brent", lower=0, upper=2)

mod_multi = bb$par

parms_multimod$alpha = parms_multi$alpha*mod_multi
parms_multimod$lamda = parms_multi$lamda*mod_multi

out_multimod = run_sodp(parms_multimod)
multimodsf = process_sodp(out_multimod)
multimodsf = sodp_totals(multimodsf)
stats_multimod = sodp_stats(multimodsf)
stats_multimod.m = melt(stats_multimod, id.vars=c("time", "Species", "SizeClass"))

#' 
## ----equiv_equilib-------------------------------------------------------
stats = list(SI=stats_SI.m, SIV=stats_SIVmod.m, multi=stats_multimod.m)
statsall = ldply(stats, function(x) x)

mortInf = ldply(stats, function(x) subset(x, variable %in% c("N")))
p1 = ggplot(mortInf, aes(x = time, y=value, col=.id, linetype=SizeClass, size=SizeClass)) +
  geom_line() +
  ylim(0, 1) +
  ylab("Host Population") +
  xlab(" ") +
  scale_linetype_manual(labels=c("Juv", "Adult", "Total"), values=c(2,6,1)) +
  scale_color_grey() +
  scale_size_manual(values=c(1,1, 2), guide='none') +
  scale_x_continuous(limits=c(0, 75), breaks=seq(0,75,25)) +
  theme_nr +
  theme(text=element_text(family="Lato")) +
  guides(linetype = guide_legend(reverse=TRUE))

mortInf = ldply(stats, function(x) subset(x, variable %in% c("I")))
p2 = ggplot(mortInf, aes(x = time, y=value, col=.id, linetype=SizeClass, size=SizeClass)) +
  geom_line() +
  ylim(0, 1) +
  ylab("Infected Hosts") +
  xlab("Time") +
  scale_linetype_manual(labels=c("Juv", "Adult", "Total"), values=c(2,6,1)) +
  scale_color_grey() +
  scale_size_manual(values=c(1,1, 2), guide='none') + 
  scale_x_continuous(limits=c(0, 75), breaks=seq(0,75,25)) +
  theme_nr +
  theme(text=element_text(family="Lato")) +
  guides(linetype = guide_legend(reverse=TRUE))

mortInf = ldply(stats, function(x) subset(x, variable %in% c("MortInfRate")))
mortInf$value = mortInf$value + + parms_SI$d[1]
p3 = ggplot(mortInf, aes(x = time, y=value, col=.id, linetype=SizeClass, size=SizeClass)) +
  geom_line() +
  ylim(0, 0.6) +
  ylab("Infected Mortality Rate") +
  xlab(" ") +
  scale_linetype_manual(labels=c("Juv", "Adult", "Total"), values=c(2,6,1)) +
  scale_color_grey() +
  scale_size_manual(values=c(1,1, 2), guide='none') + 
  scale_x_continuous(limits=c(0, 75), breaks=seq(0,75,25)) +
  theme_nr +
  theme(text=element_text(family="Lato")) +
  guides(linetype = guide_legend(reverse=TRUE))

g_legend <- function(p){
tmp <- ggplotGrob(p)
leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
legend <- tmp$grobs[[leg]]
return(legend)}

legend <- g_legend(p1)
lwidth <- sum(legend$width)
plotwidth = (unit(1, "npc") - lwidth)*(1/3)

equiv_equilib_comp_plot = arrangeGrob(p1 + theme(legend.position="none"), 
             p2 + theme(legend.position="none"),
             p3 + theme(legend.position="none"),
             legend, 
             widths=unit.c(plotwidth, plotwidth, plotwidth, lwidth),
             main = textGrob("Epidemic Dynamics: Equilibrium Mortality Equivalence", gp=gpar(fontsize=20,fontfamily='Lato')),
              nrow=1)

#' 
## ----modparms2-----------------------------------------------------------

SI_Final = init_derivs2(parms_SI, SI=TRUE)[,2]

parms_SIVmod2 = parms_SIV



aa = optim(par = 1, fn = function(mod_SIV) {
  parms_SIVmod$alpha = parms_SIV$alpha*mod_SIV
  parms_SIVmod$lamda = parms_SIV$lamda*mod_SIV
  val = init_derivs2(parms_SIVmod, SI=TRUE)[,2]
  if(interactive()) print(val)
  return(sum(((val - SI_Final)/SI_Final)^2))
  })


mod_SIV = aa$par
parms_SIVmod2$alpha = parms_SIV$alpha*mod_SIV
parms_SIVmod2$lamda = parms_SIV$lamda*mod_SIV
out_SIVmod2 = run_sodp(parms_SIVmod2)
SIVmod2sf = process_sodp(out_SIVmod2)
SIVmod2sf = sodp_totals(SIVmod2sf)
stats_SIVmod2 = sodp_stats(SIVmod2sf)
stats_SIVmod2.m = melt(stats_SIVmod2, id.vars=c("time", "Species", "SizeClass"))


parms_multimod2 = parms_multi


bb = optim(par = aa$par, f = function(mod_multi) {
  parms_multimod$alpha = parms_multi$alpha*mod_multi
  parms_multimod$lamda = parms_multi$lamda*mod_multi
  val = init_derivs2(parms_multimod, SI=TRUE)[,2]
  if(interactive()) print(val)
  return(sum(((val - SI_Final)/SI_Final)^2))
  })

mod_multi = bb$par

parms_multimod2$alpha = parms_multi$alpha*mod_multi
parms_multimod2$lamda = parms_multi$lamda*mod_multi

out_multimod2 = run_sodp(parms_multimod2)
multimod2sf = process_sodp(out_multimod2)
multimod2sf = sodp_totals(multimod2sf)
stats_multimod2 = sodp_stats(multimod2sf)
stats_multimod2.m = melt(stats_multimod2, id.vars=c("time", "Species", "SizeClass"))


#' 
## ----init_derivs---------------------------------------------------------
stats = list(SI=stats_SI.m, SIV=stats_SIVmod2.m, multi=stats_multimod2.m)
statsall = ldply(stats, function(x) x)

mortInf = ldply(stats, function(x) subset(x, variable %in% c("N")))
p1 = ggplot(mortInf, aes(x = time, y=value, col=.id, linetype=SizeClass, size=SizeClass)) +
  geom_line() +
  ylim(0, 1) +
  ylab("Host Population") +
  xlab(" ") +
  scale_linetype_manual(labels=c("Juv", "Adult", "Total"), values=c(2,6,1)) +
  scale_color_grey() +
  scale_size_manual(values=c(1,1, 2), guide='none') + 
  scale_x_continuous(limits=c(0, 75), breaks=seq(0,75,25)) +
  theme_nr +
  theme(text=element_text(family="Lato")) +
  guides(linetype = guide_legend(reverse=TRUE))

mortInf = ldply(stats, function(x) subset(x, variable %in% c("I")))
p2 = ggplot(mortInf, aes(x = time, y=value, col=.id, linetype=SizeClass, size=SizeClass)) +
  geom_line() +
  ylim(0, 1) +
  ylab("Infected Hosts") +
  xlab("Time") +
  scale_linetype_manual(labels=c("Juv", "Adult", "Total"), values=c(2,6,1)) +
  scale_color_grey() +
  scale_size_manual(values=c(1,1, 2), guide='none') + 
  scale_x_continuous(limits=c(0, 75), breaks=seq(0,75,25)) +
  theme_nr +
  theme(text=element_text(family="Lato")) +
  guides(linetype = guide_legend(reverse=TRUE))

mortInf = ldply(stats, function(x) subset(x, variable %in% c("MortInfRate")))
mortInf$value = mortInf$value + parms_SI$d[1]
p3 = ggplot(mortInf, aes(x = time, y=value, col=.id, linetype=SizeClass, size=SizeClass)) +
  geom_line() +
  ylim(0, 0.6) +
  ylab("Infected Mortality Rate") +
  xlab(" ") +
  scale_linetype_manual(labels=c("Juv", "Adult", "Total"), values=c(2,6,1)) +
  scale_color_grey() +
  scale_size_manual(values=c(1,1, 2), guide='none') + 
  scale_x_continuous(limits=c(0, 75), breaks=seq(0,75,25)) +
  theme_nr +
  theme(text=element_text(family="Lato")) +
  guides(linetype = guide_legend(reverse=TRUE))

g_legend <- function(p){
tmp <- ggplotGrob(p)
leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
legend <- tmp$grobs[[leg]]
return(legend)}

legend <- g_legend(p1)
lwidth <- sum(legend$width)
plotwidth = (unit(1, "npc") - lwidth)*(1/3)

init_derivs_comp_plot = arrangeGrob(p1 + theme(legend.position="none"), 
             p2 + theme(legend.position="none"),
             p3 + theme(legend.position="none"),
             legend, 
             widths=unit.c(plotwidth, plotwidth, plotwidth, lwidth),
             main = textGrob("Epidemic Dynamics: Equivalent Initial Derivatives", gp=gpar(fontsize=20,fontfamily='Lato')),
             nrow=1)

#' 
#' 
## ----modparms3-----------------------------------------------------------


frac_I = 0.1
sit = subset(stats_SI, SizeClass=="Total", select=c("time", "FracInf"))
sit = sit[order(sit$time),]
timeToFracI_fn = function(sit, frac_I) {
  afti = min(which(sit$FracInf >= frac_I), na.rm=TRUE)
  if(is.na(afti) || afti==Inf) return(max(sit$time))
  befi = min(which(sit$FracInf >= frac_I)) - 1
  befx = sit$time[befi]
  befy = sit$FracInf[befi]
  aftx = sit$time[afti]
  afty = sit$FracInf[afti]
  slope = (afty-befy)/(aftx-befx)
  return(befx + (frac_I - befy)/slope)
  }
timeToFracI = timeToFracI_fn(sit, frac_I)
parms_SIVmod3 = parms_SIV
parms_SIVmod3$times.max = 18
parms_SIVmod3$times.by = 0.01


cc = optim(par = 1, fn = function(mod_SIV) {
  parms_SIVmod3$alpha = parms_SIV$alpha*mod_SIV
  parms_SIVmod3$lamda = parms_SIV$lamda*mod_SIV
  out_SIVmod = run_sodp(parms_SIVmod3)
  SIVmodsf = process_sodp(out_SIVmod)
  SIVmodsf = sodp_totals(SIVmodsf)
  stats_SIVmod = sodp_stats(SIVmodsf)
  sitSIVmod = subset(stats_SIVmod, SizeClass=="Total", select=c("time", "FracInf"))
  sitSIVmod = sitSIVmod[order(sitSIVmod$time),]
  timeToFracISIVmod = timeToFracI_fn(sitSIVmod, frac_I)
  if(interactive()) print(timeToFracISIVmod)
  val = ((timeToFracISIVmod - timeToFracI)/timeToFracI)^2
  return(val)
  }, method="Brent", lower=0, upper=2)


mod_SIV = cc$par
parms_SIVmod3$alpha = parms_SIV$alpha*mod_SIV
parms_SIVmod3$lamda = parms_SIV$lamda*mod_SIV
parms_SIVmod3$times.max = 75
parms_SIVmod3$times.by = 0.1
out_SIVmod3 = run_sodp(parms_SIVmod3)
SIVmod3sf = process_sodp(out_SIVmod3)
SIVmod3sf = sodp_totals(SIVmod3sf)
stats_SIVmod3 = sodp_stats(SIVmod3sf, dofit=FALSE)
stats_SIVmod3.m = melt(stats_SIVmod3, id.vars=c("time", "Species", "SizeClass"))


parms_multimod3 = parms_multi
parms_multimod3$times.max = 18
parms_multimod3$times.by = 0.01

dd = optim(par = cc$par, f = function(mod_multi) {
  parms_multimod3$alpha = parms_multi$alpha*mod_multi
  parms_multimod3$lamda = parms_multi$lamda*mod_multi
  out_multimod = run_sodp(parms_multimod3)
  multimodsf = process_sodp(out_multimod)
  multimodsf = sodp_totals(multimodsf)
  stats_multimod = sodp_stats(multimodsf)
  sitmultimod = subset(stats_multimod, SizeClass=="Total", select=c("time", "FracInf"))
  sitmultimod = sitmultimod[order(sitmultimod$time),]
  timeToFracImultimod = timeToFracI_fn(sitmultimod, frac_I)
  if(interactive()) print(timeToFracImultimod)
  val = ((timeToFracImultimod - timeToFracI)/timeToFracI)^2
  return(val)
  }, method="Brent", lower=0, upper=2)

mod_multi = dd$par

parms_multimod3$alpha = parms_multi$alpha*mod_multi
parms_multimod3$lamda = parms_multi$lamda*mod_multi
parms_multimod3$times.max = 75
parms_multimod3$times.by = 0.1
out_multimod3 = run_sodp(parms_multimod3)
multimod3sf = process_sodp(out_multimod3)
multimod3sf = sodp_totals(multimod3sf)
stats_multimod3 = sodp_stats(multimod3sf, dofit=FALSE)
stats_multimod3.m = melt(stats_multimod3, id.vars=c("time", "Species", "SizeClass"))


#' 
## ----time_to_I10---------------------------------------------------------
stats = list(SI=stats_SI.m, SIV=stats_SIVmod3.m, multi=stats_multimod3.m)
statsall = ldply(stats, function(x) x)

mortInf = ldply(stats, function(x) subset(x, variable %in% c("N")))
p1 = ggplot(mortInf, aes(x = time, y=value, col=.id, linetype=SizeClass, size=SizeClass)) +
  geom_line() +
  ylim(0, 1) +
  ylab("Host Population") +
  xlab(" ") +
  scale_linetype_manual(labels=c("Juv", "Adult", "Total"), values=c(2,6,1)) +
  scale_color_grey() +
  scale_size_manual(values=c(1,1, 2), guide='none') + 
  scale_x_continuous(limits=c(0, 75), breaks=seq(0,75,25)) +
  theme_nr +
  theme(text=element_text(family="Lato")) +
  guides(linetype = guide_legend(reverse=TRUE))

mortInf = ldply(stats, function(x) subset(x, variable %in% c("I")))
p2 = ggplot(mortInf, aes(x = time, y=value, col=.id, linetype=SizeClass, size=SizeClass)) +
  geom_line() +
  ylim(0, 1) +
  ylab("Infected Hosts") +
  xlab("Time") +
  scale_linetype_manual(labels=c("Juv", "Adult", "Total"), values=c(2,6,1)) +
  scale_color_grey() +
  scale_size_manual(values=c(1,1, 2), guide='none') + 
  scale_x_continuous(limits=c(0, 75), breaks=seq(0,75,25)) +
  theme_nr +
  theme(text=element_text(family="Lato")) +
  guides(linetype = guide_legend(reverse=TRUE))

mortInf = ldply(stats, function(x) subset(x, variable %in% c("MortInfRate")))
mortInf$value = mortInf$value + + parms_SI$d[1]
p3 = ggplot(mortInf, aes(x = time, y=value, col=.id, linetype=SizeClass, size=SizeClass)) +
  geom_line() +
  ylim(0, 0.6) +
  ylab("Infected Mortality Rate") +
  xlab(" ") +
  scale_linetype_manual(labels=c("Juv", "Adult", "Total"), values=c(2,6,1)) +
  scale_color_grey() +
  scale_size_manual(values=c(1,1, 2), guide='none') + 
  scale_x_continuous(limits=c(0, 75), breaks=seq(0,75,25)) +
  theme_nr +
  theme(text=element_text(family="Lato")) +
  guides(linetype = guide_legend(reverse=TRUE))

g_legend <- function(p){
tmp <- ggplotGrob(p)
leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
legend <- tmp$grobs[[leg]]
return(legend)}

legend <- g_legend(p1)
lwidth <- sum(legend$width)
plotwidth = (unit(1, "npc") - lwidth)*(1/3)

time_to_I10_comp_plot = arrangeGrob(p1 + theme(legend.position="none"), 
             p2 + theme(legend.position="none"),
             p3 + theme(legend.position="none"),
             legend,
             widths=unit.c(plotwidth, plotwidth, plotwidth, lwidth),
             main = textGrob("Epidemic Dynamics: Equivalent Time to 10% infection", gp=gpar(fontsize=20,fontfamily='Lato')),
             nrow=1)

#' 
## ----modparms4-----------------------------------------------------------


frac_I = 0.1
frac_I2 = 0.3
sit = subset(stats_SI, SizeClass=="Total", select=c("time", "FracInf"))
sit = sit[order(sit$time),]
timeToFracI = timeToFracI_fn(sit, frac_I)
timeToFracI[2] = timeToFracI_fn(sit, frac_I2)


parms_SIVmod4 = parms_SIV
parms_SIVmod4$progress = 0
parms_SIVmod4$times.max = 25
parms_SIVmod4$times.by = 0.01

ee = optim(par = c(1, 1), fn = function(mod_SIV) {
  parms_SIVmod4$alpha = parms_SIV$alpha*mod_SIV[1]
  parms_SIVmod4$lamda = parms_SIV$lamda*mod_SIV[2]
  out_SIVmod = run_sodp(parms_SIVmod4)
  SIVmodsf = process_sodp(out_SIVmod)
  SIVmodsf = sodp_totals(SIVmodsf)
  stats_SIVmod = sodp_stats(SIVmodsf)
  sitSIVmod = subset(stats_SIVmod, SizeClass=="Total", select=c("time", "FracInf"))
  sitSIVmod = sitSIVmod[order(sitSIVmod$time),]
  timeToFracISIVmod = timeToFracI_fn(sitSIVmod, frac_I)
  timeToFracISIVmod[2] = timeToFracI_fn(sitSIVmod, frac_I2)
  if(interactive()) print(timeToFracISIVmod)
  val = sum(((timeToFracISIVmod - timeToFracI)/timeToFracI)^2)
  return(val)
  })


mod_SIV = ee$par
parms_SIVmod4$alpha = parms_SIV$alpha*mod_SIV[1]
parms_SIVmod4$lamda = parms_SIV$lamda*mod_SIV[2]
parms_SIVmod4$times.max = 75
parms_SIVmod4$times.by = 0.1
out_SIVmod4 = run_sodp(parms_SIVmod4)
SIVmod4sf = process_sodp(out_SIVmod4)
SIVmod4sf = sodp_totals(SIVmod4sf)
stats_SIVmod4 = sodp_stats(SIVmod4sf, dofit=FALSE)
stats_SIVmod4.m = melt(stats_SIVmod4, id.vars=c("time", "Species", "SizeClass"))


parms_multimod4 = parms_multi
parms_multimod4$progress = 0
parms_multimod4$times.max = 25
parms_multimod4$times.by = 0.01


ff = optim(par = ee$par, f = function(mod_multi) {
  parms_multimod4$alpha = parms_multi$alpha*mod_multi[1]
  parms_multimod4$lamda = parms_multi$lamda*mod_multi[2]
  out_multimod = run_sodp(parms_multimod4)
  multimodsf = process_sodp(out_multimod)
  multimodsf = sodp_totals(multimodsf)
  stats_multimod = sodp_stats(multimodsf)
  sitmultimod = subset(stats_multimod, SizeClass=="Total", select=c("time", "FracInf"))
  sitmultimod = sitmultimod[order(sitmultimod$time),]
  timeToFracImultimod = timeToFracI_fn(sitmultimod, frac_I)
  timeToFracImultimod[2] = timeToFracI_fn(sitmultimod, frac_I2)
  if(interactive()) print(timeToFracImultimod)
  val = sum(((timeToFracImultimod - timeToFracI)/timeToFracI)^2)
  return(val)
  })

mod_multi = ff$par

parms_multimod4$alpha = parms_multi$alpha*mod_multi[1]
parms_multimod4$lamda = parms_multi$lamda*mod_multi[2]
parms_multimod4$times.max = 75
parms_multimod4$times.by = 0.1
out_multimod4 = run_sodp(parms_multimod4)
multimod4sf = process_sodp(out_multimod4)
multimod4sf = sodp_totals(multimod4sf)
stats_multimod4 = sodp_stats(multimod4sf, dofit=FALSE)
stats_multimod4.m = melt(stats_multimod4, id.vars=c("time", "Species", "SizeClass"))


#' 
## ----time_to_I1030-------------------------------------------------------
stats = list(SI=stats_SI.m, SIV=stats_SIVmod4.m, multi=stats_multimod4.m)
statsall = ldply(stats, function(x) x)

mortInf = ldply(stats, function(x) subset(x, variable %in% c("N")))
p1 = ggplot(mortInf, aes(x = time, y=value, col=.id, linetype=SizeClass, size=SizeClass)) +
  geom_line() +
  ylim(0, 1) +
  ylab("Host Population") +
  xlab(" ") +
  scale_linetype_manual(labels=c("Juv", "Adult", "Total"), values=c(2,6,1)) +
  scale_color_grey() +
  scale_size_manual(values=c(1,1, 2), guide='none') + 
  scale_x_continuous(limits=c(0, 75), breaks=seq(0,75,25)) +
  theme_nr +
  theme(text=element_text(family="Lato")) +
  guides(linetype = guide_legend(reverse=TRUE))

mortInf = ldply(stats, function(x) subset(x, variable %in% c("I")))
p2 = ggplot(mortInf, aes(x = time, y=value, col=.id, linetype=SizeClass, size=SizeClass)) +
  geom_line() +
  ylim(0, 1) +
  ylab("Infected Hosts") +
  xlab("Time") +
  scale_linetype_manual(labels=c("Juv", "Adult", "Total"), values=c(2,6,1)) +
  scale_color_grey() +
  scale_size_manual(values=c(1,1, 2), guide='none') + 
  scale_x_continuous(limits=c(0, 75), breaks=seq(0,75,25)) +
  theme_nr +
  theme(text=element_text(family="Lato")) +
  guides(linetype = guide_legend(reverse=TRUE))

mortInf = ldply(stats, function(x) subset(x, variable %in% c("MortInfRate")))
mortInf$value = mortInf$value + + parms_SI$d[1]
p3 = ggplot(mortInf, aes(x = time, y=value, col=.id, linetype=SizeClass, size=SizeClass)) +
  geom_line() +
  ylim(0, 0.6) +
  ylab("Infected Mortality Rate") +
  xlab(" ") +
  scale_linetype_manual(labels=c("Juv", "Adult", "Total"), values=c(2,6,1)) +
  scale_color_grey() +
  scale_size_manual(values=c(1,1, 2), guide='none') + 
  scale_x_continuous(limits=c(0, 75), breaks=seq(0,75,25)) +
  theme_nr +
  theme(text=element_text(family="Lato")) +
  guides(linetype = guide_legend(reverse=TRUE))

g_legend <- function(p){
tmp <- ggplotGrob(p)
leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
legend <- tmp$grobs[[leg]]
return(legend)}

legend <- g_legend(p1)
lwidth <- sum(legend$width)
plotwidth = (unit(1, "npc") - lwidth)*(1/3)

time_to_I1030_comp_plot = arrangeGrob(p1 + theme(legend.position="none"), 
             p2 + theme(legend.position="none"),
             p3 + theme(legend.position="none"),
             legend, 
             widths=unit.c(plotwidth, plotwidth, plotwidth, lwidth),
             main = textGrob("Epidemic Dynamics: Equivalent time to 10% and 30% infection", gp=gpar(fontsize=20,fontfamily='Lato')),
              nrow=1)

#' 
#' 
## ----modparms5-----------------------------------------------------------
 

frac_I = 0.1
sit = subset(stats_SI, SizeClass=="Total", select=c("time", "FracInf"))
sit = sit[order(sit$time),]
timeToFracI = timeToFracI_fn(sit, frac_I)
timeToFracI[2] = subset(stats_SI, time==parms_SI$times.max & SizeClass=="Total")$FracInf

parms_SIVmod5 = parms_SIV
parms_SIVmod5$progress = 0
parms_SIVmod5$times.by = 0.01

gg = optim(par = c(1, 1), fn = function(mod_SIV) {
  parms_SIVmod5$alpha = parms_SIV$alpha*mod_SIV[1]
  parms_SIVmod5$lamda = parms_SIV$lamda*mod_SIV[2]
  out_SIVmod = run_sodp(parms_SIVmod5)
  SIVmodsf = process_sodp(out_SIVmod)
  SIVmodsf = sodp_totals(SIVmodsf)
  stats_SIVmod = sodp_stats(SIVmodsf)
  sitSIVmod = subset(stats_SIVmod, SizeClass=="Total", select=c("time", "FracInf"))
  sitSIVmod = sitSIVmod[order(sitSIVmod$time),]
  timeToFracISIVmod = timeToFracI_fn(sitSIVmod, frac_I)
  timeToFracISIVmod[2]= subset(stats_SIVmod, time==parms_SIVmod5$times.max & SizeClass=="Total")$FracInf
  if(interactive()) print(timeToFracISIVmod)
  val = sum(((timeToFracISIVmod - timeToFracI)/timeToFracI)^2)
  return(val)
  })


mod_SIV = gg$par
parms_SIVmod5$alpha = parms_SIV$alpha*mod_SIV[1]
parms_SIVmod5$lamda = parms_SIV$lamda*mod_SIV[2]
parms_SIVmod5$times.by = 0.1
out_SIVmod5 = run_sodp(parms_SIVmod5)
SIVmod5sf = process_sodp(out_SIVmod5)
SIVmod5sf = sodp_totals(SIVmod5sf)
stats_SIVmod5 = sodp_stats(SIVmod5sf, dofit=FALSE)
stats_SIVmod5.m = melt(stats_SIVmod5, id.vars=c("time", "Species", "SizeClass"))


parms_multimod5 = parms_multi
parms_multimod5$progress = 0
parms_multimod5$times.by = 0.01


hh = optim(par = gg$par, f = function(mod_multi) {
  parms_multimod5$alpha = parms_multi$alpha*mod_multi[1]
  parms_multimod5$lamda = parms_multi$lamda*mod_multi[2]
  out_multimod = run_sodp(parms_multimod5)
  multimodsf = process_sodp(out_multimod)
  multimodsf = sodp_totals(multimodsf)
  stats_multimod = sodp_stats(multimodsf)
  sitmultimod = subset(stats_multimod, SizeClass=="Total", select=c("time", "FracInf"))
  sitmultimod = sitmultimod[order(sitmultimod$time),]
  timeToFracImultimod = timeToFracI_fn(sitmultimod, frac_I)
  timeToFracImultimod[2] = subset(stats_multimod, time==parms_multimod5$times.max & SizeClass=="Total")$FracInf
  if(interactive()) print(timeToFracImultimod)
  val = sum(((timeToFracImultimod - timeToFracI)/timeToFracI)^2)
  return(val)
  })

mod_multi = hh$par

parms_multimod5$alpha = parms_multi$alpha*mod_multi[1]
parms_multimod5$lamda = parms_multi$lamda*mod_multi[2]
parms_multimod5$times.max = 75
parms_multimod5$times.by = 0.1
out_multimod5 = run_sodp(parms_multimod5)
multimod5sf = process_sodp(out_multimod5)
multimod5sf = sodp_totals(multimod5sf)
stats_multimod5 = sodp_stats(multimod5sf, dofit=FALSE)
stats_multimod5.m = melt(stats_multimod5, id.vars=c("time", "Species", "SizeClass"))


#' 
## ----time_to_I10_equib---------------------------------------------------
stats = list(SI=stats_SI.m, SIV=stats_SIVmod5.m, multi=stats_multimod5.m)
statsall = ldply(stats, function(x) x)

mortInf = ldply(stats, function(x) subset(x, variable %in% c("N")))
p1 = ggplot(mortInf, aes(x = time, y=value, col=.id, linetype=SizeClass, size=SizeClass)) +
  geom_line() +
  ylim(0, 1) +
  ylab("Host Population") +
  xlab(" ") +
  scale_linetype_manual(labels=c("Juv", "Adult", "Total"), values=c(2,6,1)) +
  scale_color_grey() +
  scale_size_manual(values=c(1,1, 2), guide='none') + 
  scale_x_continuous(limits=c(0, 75), breaks=seq(0,75,25)) +
  theme_nr +
  theme(text=element_text(family="Lato")) +
  guides(linetype = guide_legend(reverse=TRUE))

mortInf = ldply(stats, function(x) subset(x, variable %in% c("I")))
p2 = ggplot(mortInf, aes(x = time, y=value, col=.id, linetype=SizeClass, size=SizeClass)) +
  geom_line() +
  ylim(0, 1) +
  ylab("Infected Hosts") +
  xlab("Time") +
  scale_linetype_manual(labels=c("Juv", "Adult", "Total"), values=c(2,6,1)) +
  scale_color_grey() +
  scale_size_manual(values=c(1,1, 2), guide='none') + 
  scale_x_continuous(limits=c(0, 75), breaks=seq(0,75,25)) +
  theme_nr +
  theme(text=element_text(family="Lato")) +
  guides(linetype = guide_legend(reverse=TRUE))

mortInf = ldply(stats, function(x) subset(x, variable %in% c("MortInfRate")))
mortInf$value = mortInf$value + + parms_SI$d[1]
p3 = ggplot(mortInf, aes(x = time, y=value, col=.id, linetype=SizeClass, size=SizeClass)) +
  geom_line() +
  ylim(0, 0.6) +
  ylab("Infected Mortality Rate") +
  xlab(" ") +
  scale_linetype_manual(labels=c("Juv", "Adult", "Total"), values=c(2,6,1)) +
  scale_color_grey() +
  scale_size_manual(values=c(1,1, 2), guide='none') + 
  scale_x_continuous(limits=c(0, 75), breaks=seq(0,75,25)) +
  theme_nr +
  theme(text=element_text(family="Lato")) +
  guides(linetype = guide_legend(reverse=TRUE))

g_legend <- function(p){
tmp <- ggplotGrob(p)
leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
legend <- tmp$grobs[[leg]]
return(legend)}

legend <- g_legend(p1)
lwidth <- sum(legend$width)
plotwidth = (unit(1, "npc") - lwidth)*(1/3)

time_to_I10eq_comp_plot = arrangeGrob(p1 + theme(legend.position="none"), 
             p2 + theme(legend.position="none"),
             p3 + theme(legend.position="none"),
             legend, 
             widths=unit.c(plotwidth, plotwidth, plotwidth, lwidth),
             main = textGrob("Epidemic Dynamics: Equivalent time to 10% infection and equilibrium mortality", gp=gpar(fontsize=20,fontfamily='Lato')),
              nrow=1)

#' 
#' Currently matching model by equilibrium mortality.  Next, match the models by
#' initial growth behavior.  That is, growth rate at time zero, or R0.   How do
#' models behave comparatively if they have initial growth rate of infected
#' individuals that is the same?  What if we peg both initial rate and final
#' equilibrium mortality rate, but free both $\alpha$ and $\lambda$ to vary
#' independently?  How will models behave differently?
#' 
#' Need too calculate this rate for the given initial number of infected individuals
#' Model may need to be modified to only have initial infected individuals be of
#' lowest disease class, not all disease classes.
#' 
#' At initiation, when all individuals are either susceptible or only have one
#' infection, the growth in infected individuals is
#' 
#' $$\lambda_{I_1} - d - \alpha$$
#' 
#' 
#' Note that the 2nd derivative of $V$ is very small no matter when $I$ is small at $V=H=0$:
#' 
#' $$\frac{d^2V}{dt^2} = - I^{3} \lambda^{2} + I^{2} \left(2 S \lambda^{2} - 4 \alpha \lambda - 3 d \lambda\right)$$
