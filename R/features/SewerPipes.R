# Title     : Fetch.R
# Objective : Sewer pipes
# Created by: greyhypotheses
# Created on: 29/06/2022


# functions
source(file = 'R/features/Fetch.R')


#' in progress
#'
#'
SewerPipes <- function (file) {

  # List the unique data years
  # Per year, extract the sewer pipes estimates from the appropriate <sewer pipes map>
  # Issue: The map years - from 2000 until 2017 - do not span all the data years


  # An experiments data set
  dataset <- read.csv(file = file)
  years <- unique(dataset$year)


  # In progress: Valid years
  years <- years[years %in% seq(from = 2000, to = 2017)]


  # Hence
  # Enhance w.r.t. ...
  
  estimates <- lapply(X = years, FUN = temporary)
  estimates <- dplyr::bind_rows(estimates)

}