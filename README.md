# Survival Tools


## The Nelson-Aalen estimator

The Nelson-Aalen estimator is a non-parametric estimator of the cumulative hazard function. The following R Markdown illustrates 3 ways for obtaining this estimator for a sample containing right-censored observations.

- [The Nelson-Aalen estimator](https://rpubs.com/FJRubio/NelsonAalen)


## The Cox Proportional Hazards Model

The following R code shows an (probably suboptimal) implementation of the log partial likelihood function as well as three real-data examples illustrating the calculation of the MPLE (using the command `optim()`). A comparison with the results obtained using the `survival` R package is also presented.

- [The Cox Proportional Hazards Model and the Partial Likelihood function](https://rpubs.com/FJRubio/CPHM)


## SurvLT: Calculating survival probabilities from a Life Table

The R command `spLT` from the `routinesSPLT.R` source file performs the following steps:

1. It calculates all the change points from the date of diagnosis (birthdays and new years) and merges them with the time points of interest.

2. It extracts the hazard rates at these points from the life table.

3. It calculates the integrals of the step function defined in the previous steps up to each time point of interest. These integrals represent the cumulative hazard function.

4. It calculates the survival probabilities using the usual relationship between the cumulative hazard function and the survival function $S(t) = \exp[-H(t)]$.


The following R code presents a step-by-step illustrative example on the calculation of the survival probabilities of a set of individuals based on life tables from England for the years 2010-2015.:

[SurvLT: Calculating survival probabilities from a Life Table](https://rpubs.com/FJRubio/SurvLT)

See also: [SimLT](https://github.com/FJRubio67/SimLT)

