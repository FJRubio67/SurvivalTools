# Survival Tools


## The Nelson-Aalen estimator

The Nelson-Aalen estimator is a non-parametric estimator of the cumulative hazard function. The following R Markdown illustrates 3 ways for obtaining this estimator for a sample containing right-censored observations.

- [The Nelson-Aalen estimator](https://rpubs.com/FJRubio/NelsonAalen)


## The Cox Proportional Hazards Model

The following R code shows an (probably suboptimal) implementation of the log partial likelihood function as well as three real-data examples illustrating the calculation of the MPLE (using the command `optim()`). A comparison with the results obtained using the `survival` R package is also presented.

- [The Cox Proportional Hazards Model and the Partial Likelihood function](https://rpubs.com/FJRubio/CPHM)
