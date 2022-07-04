# Title     : FetchMap.R
# Objective : Fetch map
# Created by: greyhypotheses
# Created on: 29/06/2022


#' Fetches the map of a feature
#'
#' @description Uploads a LMIC (lower & middle income countries) WASH map
#'
#' @param path: The location of a map file
#'
FetchMap <- function (path) {

  # Read the map data
  # class(map)
  # cat(terra::crs(map))
  map <- terra::rast(file.path(path))

  return(map)

}