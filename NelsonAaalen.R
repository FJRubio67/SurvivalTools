## ---------------------------------------------------------------------------------------------------------
rm(list=ls())

# Required packages and sources
library(spBayesSurv)
library(survival)
library(mice)
# https://github.com/FJRubio67/SurvivalTools
source("routinesNA.R")


data("LeukSurv")

# Times to event
time <- LeukSurv$time/365.24
# Vital status indicators
status <- LeukSurv$cens


########################################################################################
# Nelson-Aalen estimator: direct implementation
########################################################################################

naest0 <- NA_Est(time, status)

head(naest0)

# Function
NAEst <- Vectorize(function(t){
  out <- stepfun(x = naest0[-1,1], y = naest0[,2], f = 0  )(t)
  return( out )
})

curve(NAEst,0, max(time), xlab = "Time (Years)", ylab = "Cumulative Hazard", n = 1000,
     cex.lab = 1.5, cex.axis = 1.5, lwd = 2, col = "black")

########################################################################################
# Nelson-Aalen estimator: using the `survival` R package
########################################################################################

fit <- survfit(Surv(time, status) ~ 1)

naest1 <- cumsum(fit$n.event/fit$n.risk)


########################################################################################
# Nelson-Aalen estimator: using the `mice` R package
########################################################################################

naest2 <- nelsonaalen(LeukSurv, time, cens)

#---------------------------------------------------------------------------------
# Comparison: cumulative hazard functions
#---------------------------------------------------------------------------------

plot(naest0, xlab = "Time (Years)", ylab = "Cumulative Hazard",
     cex.lab = 1.5, cex.axis = 1.5, lwd = 2, col = "black", type = "s")
points(fit$time, naest1, type = "s", col = "red")
points(x = LeukSurv$time/365.24, y = naest2, type = "s", col = "blue")
legend("bottomright", legend = c("Direct", "survival", "mice"), lwd = c(2,2,2),
       lty = c(1,1,1), col = c("black", "red", "blue"))


#---------------------------------------------------------------------------------
# Comparison: Survival functions
#---------------------------------------------------------------------------------

plot(naest0[,1], exp(-naest0[,2]), xlab = "Time (Years)", ylab = "Survival",
     cex.lab = 1.5, cex.axis = 1.5, lwd = 2, col = "black", type = "s")
points(fit$time, exp(-naest1), type = "s", col = "red")
points(x = LeukSurv$time/365.24, y = exp(-naest2), type = "s", col = "blue")
legend("topright", legend = c("Direct", "survival", "mice"), lwd = c(2,2,2),
       lty = c(1,1,1), col = c("black", "red", "blue"))


