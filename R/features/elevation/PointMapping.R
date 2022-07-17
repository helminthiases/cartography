# Title     : PointMapping.R
# Objective : Point mapping
# Created by: greyhypotheses
# Created on: 15/07/2022



#' Extracting elevation values, metres, from a map
#'
#' @description Adds an elevation field to an experiments data set, via the data
#'              set's geographic coordinates.
#'
#' @param file: The path, and file name, of an experiments file.
#' @param storage: The storage directory for the extended.
#'
PointMapping <- function (file, storage) {

  # map
  path <- file.path('data/elevation/wc2.1_30s_elev.tif')
  map <- terra::rast(path)

  # The experiments file
  frame <- read.csv(file = file, encoding = 'UTF-8')

  # The longitude & latitude points
  points <- frame[, c('longitude', 'latitude')]

  # Extract elevation values
  derivations <- terra::extract(x = map, y = points, method = 'bilinear', xy = FALSE)

  # Ensure that the order of <derivations>, <points>, and <frame> are equivalent
  derivations <- derivations[base::order(derivations$ID), ]
  row.names(derivations) <- row.names(frame)

  # The field names
  estimate <- colnames(derivations)[endsWith(colnames(derivations), suffix = '_elev')]
  derivations <- dplyr::rename(derivations, 'elevation' = dplyr::all_of(estimate))
  derivations <- base::subset(x = derivations, select = -ID)

  # Merge
  frame <- base::merge(x = frame, y = derivations, by = 0, all.x = TRUE, sort = FALSE)
  frame[, 'Row.names'] <- NULL

  # Write
  utils::write.table(x = frame,
                     file = file.path(storage, base::basename(path = file)),
                     append = FALSE,
                     sep = ',',
                     na = '',
                     row.names = FALSE,
                     col.names = TRUE,
                     fileEncoding = 'UTF-8')

}
