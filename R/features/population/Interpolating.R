# Title     : Interpolating.R
# Objective : Interpolations/Interpolating
# Created by: greyhypotheses
# Created on: 09/07/2022


Interpolations <- function (id, estimates, years) {


  # the set of values w.r.t. an observation
  partition <- estimates[estimates$id == id, c('year', 'estimate')]


  # missing
  missing <- seq(from = 2000, to = 2020)
  missing <- missing[!(missing %in% years)]


  # spline interpolation for missing years estimates
  extra <- stats::spline(x = partition$year, y = partition$estimate, method = 'natural', xout = missing)
  extra <- data.frame(extra)
  extra <- dplyr::rename(extra, 'year' = 'x', 'estimate' = 'y')
  extra$year <- as.integer(extra$year)


  # altogether
  extra <- rbind(partition[, c('year', 'estimate')], extra)
  extra <- extra[with(extra, order(year, estimate)), ]


  # the unique observation code
  extra$id <- as.integer(id)


  return(list(extra))
}