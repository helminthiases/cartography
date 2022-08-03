# Title     : FieldEstimates.R
# Objective : Field Estimates
# Created by: greyhypotheses
# Created on: 03/08/2022


FieldEstimates <- function (ISO2, ISO3, paths) {


  # A data file of miscellaneous features of a country
  # EPSG: 3857 -> fields x & y
  features <- read.csv(file = file.path(paths$features, paste0(ISO2, '.csv')), header = TRUE)
  features <- sf::st_as_sf(features, coords = c('x', 'y'), crs = 3857, dim = 'XY')
  features$x <- as.numeric(sf::st_coordinates(features)[, 1])
  features$y <- as.numeric(sf::st_coordinates(features)[, 2])


  # A country's data file of ESPEN field data
  # EPSG: 4326 -> fields longitude & latitude
  source <- read.csv(file = file.path(paths$experiment, paste0(ISO2, '.csv')), header = TRUE)
  experiment <- sf::st_as_sf(source, coords = c('longitude', 'latitude'), crs = 4326, dim = 'XY')
  experiment <- sf::st_transform(experiment, crs = 3857)
  experiment$x <- as.numeric(sf::st_coordinates(experiment)[, 1])
  experiment$y <- as.numeric(sf::st_coordinates(experiment)[, 2])
  experiment$longitude <- source$longitude
  experiment$latitude <- source$latitude


  # The variables of interest
  variables <- c('AnnualPrecip', 'AnPET', 'AridityIndex')


  # Reading-in a country's country boundary ...
  demarcation <- geodata::gadm(country = ISO3, level = 0, resolution = 1, path = tempdir(), version = '4.0')
  terra::crs(demarcation) <- 'EPSG:4326'
  demarcation <- sf::st_as_sf(demarcation)
  demarcation <- sf::st_transform(demarcation, crs = sf::st_crs(experiment)$srid)


  # Area
  template <- terra::rast(terra::ext(demarcation), resolution = 5000, crs = sf::st_crs(demarcation)$wkt)


  # Feature values estimator; per spatial point
  .estimate <- function (field) {

    # Rasterize the values of a <field> in <features>
    terrain.estimates <- terra::rasterize(terra::vect(features), template, field = field, fun = mean)

    # Subsequently, for each coordinate point of <experiment> estimate the <field> value
    # via the preceding raster
    estimates <- terra::extract(terrain.estimates, terra::vect(experiment), method = 'bilinear')

    # Ensuring order
    estimates <- estimates[base::order(estimates$ID), ]
    row.names(estimates) <- row.names(terrain.estimates)

    # Drop the record number field, i.e., drop <ID>
    estimates <- base::subset(x = estimates, select = -ID)

    # Retain the name <field>
    names(estimates) <- field

    # Hence
    return(estimates)

  }


  # Estimate feature values per spatial point
  T <- lapply(X = variables, FUN = .estimate)
  T <- dplyr::bind_cols(T)
  T <- cbind(experiment, T)
  T <- sf::st_drop_geometry(T)
  T <- base::subset(x = T, select = -c(x, y))


  # Write
  utils::write.table(x = T,
                     file = file.path(paths$storage, paste0(ISO2, '.csv')),
                     append = FALSE,
                     sep = ',',
                     na = '',
                     row.names = FALSE,
                     col.names = TRUE,
                     fileEncoding = 'UTF-8')

}
