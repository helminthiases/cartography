# Title     : main.R
# Objective : Main
# Created by: greyhypotheses
# Created on: 29/06/2022


# functions
source(file = 'R/features/SewerPipes.R')


# list of experiments
hub <- dirname(getwd())
source <- file.path(hub, 'infections', 'warehouse', 'data', 'ESPEN', 'experiments', 'equivalent')
files <- base::list.files(path = source, pattern = '.csv')


# A SpatRaster
map <- SewerPipes()

# A temporary extracion function
temporary <- function (file) {

  # An experiments data set
  frame <- read.csv(file = file.path(source, file))

  # It longitude & latitude points
  # dplyr::rename(points, 'lon' = 'longitude', 'lat' = 'latitude')
  points <- frame %>%
    dplyr::select(longitude, latitude)

  # Variable values w.r.t. ...
  derivations <- terra::extract(x = map, y = points, method = 'bilinear')
  derivations <- derivations %>% dplyr::select(!ID)
  names(derivations) <- 'estimate'
  sum(!is.na(derivations))


  # Alternatively
  country <- st_as_sf(frame, coords = c('longitude', 'latitude'))
  sf::st_crs(country) <- 'EPSG:4326'
  country <- st_transform(country, crs = 'EPSG:3587')
  sf::st_crs(country)

  reference <- terra::project(map, paste0('EPSG:', 3587), method = 'bilinear')
  cat(terra::crs(reference))

  derivations <- terra::extract(reference, terra::vect(country), method = 'bilinear')
  derivations <- derivations %>% dplyr::select(!ID)
  names(derivations) <- 'estimate'
  sum(!is.na(derivations))

}
lapply(X = files, FUN = temporary)
