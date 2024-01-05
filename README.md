# Survival Tools

This repository contains a compilation of R and Julia tools for survival analysis I have developed.

## JuliaSurv

Julia code bits for survival analysis.

- [https://github.com/FJRubio67/JuliaSurv](https://github.com/FJRubio67/JuliaSurv)

## The Nelson-Aalen estimator

The Nelson-Aalen estimator is a non-parametric estimator of the cumulative hazard function. The following R Markdown illustrates 3 ways for obtaining this estimator for a sample containing right-censored observations.

- [The Nelson-Aalen estimator](https://rpubs.com/FJRubio/NelsonAalen)

## KMSim (R Package)

An R package for simulating times to event from a Kaplan-Meier (KM) estimator of a survival function, based on a sample of times to event (either for the entire sample, a subgroup, or an individual).

- [KMSim (R Package)](https://github.com/FJRubio67/KMSim)

## SimLT (R package)

The `SimLT` R package allows for simulating times to event, based on the information in a life table. 

- [SimLT (R package)](https://github.com/FJRubio67/SimLT)

## HazReg (R package)

The `HazReg` R package implements the following parametric hazard-based regression models for (overall) survival data.

- [HazReg (R package)](https://github.com/FJRubio67/HazReg)

## SurvLT: Calculating survival probabilities from a Life Table

- [SurvLT](https://github.com/FJRubio67/SurvLT)


## The Cox Proportional Hazards Model

The following R code shows an (probably suboptimal) implementation of the log partial likelihood function as well as three real-data examples illustrating the calculation of the MPLE (using the command `optim()`). A comparison with the results obtained using the `survival` R package is also presented.

- [The Cox Proportional Hazards Model and the Partial Likelihood function](https://rpubs.com/FJRubio/CPHM)
