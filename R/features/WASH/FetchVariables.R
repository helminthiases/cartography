# Title     : FetchVariables.R
# Objective : Add variables
# Created by: greyhypotheses
# Created on: 30/06/2022


source(file = 'R/features/WASH/PointMapping.R')


#' A mind boggling investigation in progress
#'
#' @param experiment: An experiments data set
#' @param mapstring: must point to either /data/WASH/sewer/... or /data/WASH/water/...
#' @param name: either improved, piped, surface, unimproved, or unpiped
#' @param affix:
#'
FetchVariables <- function (experiment, mapstring, name, affix) {


  # The years of the experiments data set
  years <- unique(experiment$year)
  years <- years[years %in% seq(from = 2000, to = 2017)]


  # IHME WASH
  case <- function(year, experiment, mapstring, name, affix) {

    # map path
    path <- paste0(mapstring, year, affix)

    # the feature values at a coordiate point
    derivations <- PointMapping(experiment, path, year)
    names(derivations) <- name

    # year
    # derivations$year <- year

    return(list(derivations))
  }


  # structuring
  estimates <- mapply(FUN = case,
                      year = years,
                      MoreArgs = list(experiment = experiment, mapstring = mapstring, name = name, affix = affix))
  estimates <- dplyr::bind_rows(estimates)


  return(estimates)


}