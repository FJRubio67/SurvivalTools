######################################################################
# Counting process function
# Number of events up to time t
######################################################################
#t : positive argument
N_count <- Vectorize(function(t){
  ind_int <- ( (time <= t) & (status == 1) )
  return(sum(ind_int))
})

######################################################################
# At-risk process function
# Number of individuals alive and not censored 
######################################################################
# t: positive argument
N_risk <- function(t){
  ind_int <- ( time >= t)
  return(sum(ind_int))
}

######################################################################
# Nelson-Aalen estimator
######################################################################
# time: vector of positive times to event
# status: right-censoring status (1 - observed, 0 - right-censored)

NA_Est <- function(time, status){
  
  # Counting process function (using data input)
  N_count <- Vectorize(function(t){
    ind_int <- ( (time <= t) & (status == 1) )
    return(sum(ind_int))
  })
  
  # At-risk process function (using data input)
  N_risk <- Vectorize(function(t){
    ind_int <- ( time >= t)
    return(sum(ind_int))
  })
  
  # Sorted unique times
  sutimes <- sort(unique(time))
  
  # Number of events (n_i) and total individuals at risk (r_i) at unique times
  Yi <- N_risk(sutimes)
  Ni <-  diff( c( 0, N_count(sutimes) ) )
  
  # Nelson-Aalen estimator for each time t_i
  na_vals <- as.matrix( rbind( c(0,0),
    cbind(sutimes, cumsum(Ni/Yi))) )
  
  colnames(na_vals) <- c("times", "CHaz")
  
  return(na_vals)
}