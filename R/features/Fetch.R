# Title     : Fetch.R
# Objective : Sewer pipes
# Created by: greyhypotheses
# Created on: 29/06/2022


source(file = 'R/functions/Unlink.R')

#' Sewer Pipes Feature
#'
#' @description Unloads the LMIC (lower & middle income countries) sewer pipes map from
#'              IHME (institute for health metrics & evaluation )
#'
#' @param year: The sewer pipes year of interest
#'
Fetch <- function (path, item, year, affix) {

  # Read the map data
  # class(map)
  # cat(terra::crs(map))
  map <- terra::rast(file.path(path, paste0(item, year, affix)))


  return(map)


}