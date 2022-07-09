# Title     : Hygiene.R
# Objective : Hygiene
# Created by: greyhypotheses
# Created on: 04/07/2022



#' IHME Hygiene Features
#'
#' @param file: The path to a STH experments data file that includes longitude & latitude coordinates
#' @param variables: The set of sewer & water variables of interest.
#' @param items: Their corresponding, and distinctive, file name patterns.
#' @param types: A sewer or water variable?
#' @param repo: The directory within which the sewer & water data directories are located.
#' @param affix: The terminating string of each file.  An IHME peculiarity.
#' @param storage: The storage directory
#'
Hygiene <- function (file, variables, items, types, repo, affix, storage) {


  # the features add function
  source(file = 'R/features/WASH/AddVariables.R')


  # the experiments data set in focus
  experiment <- read.csv(file = file)
  years <- unique(experiment$year)
  period <- seq(from = 2000, to = 2017)


  # the function is applicable to observations wherein the experiment year ∈ [2000 2017]
  if (sum(years %in% period) > 0) {
    AddVariables(experiment = experiment, variables = variables, items = items,
                 types = types, repo = repo, affix = affix, storage = storage)
  }


}