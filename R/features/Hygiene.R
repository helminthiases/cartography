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
#' @param source: The directory within which the sewer & water data directories are located.
#' @param affix: The terminating string of each file.  An IHME peculiarity.
#'
Hygiene <- function (file, variables, items, types, source, affix) {

  
  experiment <- read.csv(file = file)


  case <- function (variable, item, type, experiment, source, affix) {
    estimates <- AddVariables(experiment = experiment, mapstring = file.path(source, type, variable, item),
                              name = paste0(variable, '_', type), affix = affix)
    return(list(estimates))
  }


  factors <- mapply(FUN = case, variable = variables,
                    item = items,
                    type = types,
                    MoreArgs = list(experiment = experiment, source = source, affix = affix))
  factors <- dplyr::bind_cols(factors)


  frame <- base::merge(x = experiment, y = factors, by = 0, all.x = TRUE)


}