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


  # the features function
  source(file = 'R/features/WASH/FetchVariables.R')


  # the experiments data set in focus
  experiment <- read.csv(file = file)
  years <- unique(experiment$year)
  period <- seq(from = 2000, to = 2017)


  # per WASH variable, this function will return the variable estimate per observation,
  # using the observation's geographic coordinates and its experiment year
  case <- function (variable, item, type, experiment, repo, affix) {
    estimates <- AddVariables(experiment = experiment, mapstring = file.path(repo, type, variable, item),
                              name = paste0(variable, '_', type), affix = affix)
    return(list(estimates))
  }


  # the function is applicable to observations wherein the experiment year ∈ [2000 2017]
  if (sum(years %in% period) > 0) {

    factors <- mapply(FUN = case, variable = variables,
                      item = items,
                      type = types,
                      MoreArgs = list(experiment = experiment, repo = repo, affix = affix))
    factors <- dplyr::bind_cols(factors)

    frame <- base::merge(x = experiment, y = factors, by = 0, all.x = TRUE, sort = FALSE)
    frame <- base::subset(x = frame, select = -Row.names)
    str(frame)

    utils::write.table(x = frame,
                       file = file.path(storage, base::basename(path = file)),
                       append = FALSE,
                       sep = ',',
                       row.names = FALSE,
                       col.names = TRUE,
                       fileEncoding = 'UTF-8')

  }

}