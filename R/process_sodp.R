#' @import data.table
#' @export
process_sodp <- function(sodp) {
  d <- data.table(melt(as.data.frame(sodp), id.vars="time", value.name="Population"))
  newCols <- c("Species", "SizeClass", "Infected") 
  d[, c(newCols) := as.list(strsplit(as.character(variable), "_")[[1]]), by=variable ]
  d[, c(newCols) := lapply(.SD, factor), .SDcols=newCols]
  d[, variable := NULL]
  d[, SizeClass := as.factor(as.character(SizeClass))]
  d[, Infected := as.integer(as.character(Infected))]
  setcolorder(d,c(1,3,4,5,2))
  attr(d, "parms") <- attr(sodp, "parms")
  return(d)
}

KLD <- function(par, dat) {
  negbin <- dnbinom(x=0:(length(dat)-1), mu=par[1], size=par[2])
  KLD <- sum(dat*log(dat/negbin))
  return(KLD)
}

NegBinFit <- function(dat) {
  lastval <- which(dat < 1e-300)[1] - 1
  lastval <- ifelse(is.na(lastval), length(dat), lastval)
  dat = dat[1:lastval]
  dat = dat/sum(dat)
  bins = 0:(length(dat) - 1)
  mu.start = weighted.mean(bins, dat)
  size.start = mu.start^2 / (max(0.01, sum(dat * (bins - mu.start)^2) - mu.start))
  size.start = ifelse(size.start==0, 1, size.start)
  mu.start = ifelse(mu.start==0, 0.00001, mu.start)
  return(optim(c(mu=mu.start, size=size.start), KLD, dat=dat))
}

sodp_stats <- function(processed) {
  stats <- ddply(processed, .(time, Species, SizeClass), summarize,
                 N = sum(Population),
                 P = sum(Population*Infected),
                 S = sum(Population[which(Infected == 0)]),
                 I = sum(Population[which(Infected != 0)]),
                 FracInf = I/N,
                 Mean = P/N,
                 Var = sum(Infected * ((Population - Mean)^2))/sum(Infected),
                 Skew = sum(Infected * ((Population - Mean)^3))/sum(Infected),
                 Kurt = sum(Infected * ((Population - Mean)^4))/sum(Infected) - 3,
                 Var_Mean_Ratio = Var/Mean)
  fit <- ddply(processed, .(time, Species, SizeClass), function(z) {
    nbf <- NegBinFit(z$Population)
    data.frame(NegBin_mu = nbf$par[1], NegBin_k = nbf$par[2], KLD = nbf$value)
  })
  stats <- merge(stats, fit)
  attr(stats, "parms") <- attr(processed, "parms")
  return(stats)
}


sodp_totals <- function(processed_sodp) {
  tot = processed_sodp[, list(SizeClass=factor("Total"),
                               Population=sum(Population)),
                        by="time,Species,Infected"]
  setcolorder(tot, c("time", "Species", "SizeClass", "Infected", "Population"))
  tot = rbind(processed_sodp, tot)
  attr(tot, "parms") <- attr(processed_sodp, "parms")
  return(tot)
}