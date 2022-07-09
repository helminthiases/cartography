# Title     : PointMapping.R
# Objective : Point Mapping
# Created by: greyhypotheses
# Created on: 09/07/2022



PointMapping <- function (year, root, affix, frame) {

  # map
  path <- file.path(root, paste0(year, affix))
  map <- terra::rast(file.path(path))

  # The longitude & latitude points
  points <- frame[, c('longitude', 'latitude')]

  # Extract population density values
  derivations <- terra::extract(x = map, y = points, method = 'bilinear', xy = TRUE)

  # Ensure that the order of <derivations>, <points>, and <frame> are equivalent
  derivations <- derivations[base::order(derivations$ID), ]
  row.names(derivations) <- row.names(frame)

  # Drop the record number field, i.e., drop <ID>
  derivations <- base::subset(x = derivations, select = -ID)

  # The field names
  estimate <- colnames(derivations)[startsWith(colnames(derivations), prefix = 'gpw_v4_')]
  derivations <- dplyr::rename(derivations, 'estimate' = dplyr::all_of(estimate), 'longitude' = 'x', 'latitude' = 'y')

  # observation number
  derivations$number <- seq(from = 1, to = nrow(derivations))

  # year
  derivations$year <- as.integer(year)

  return(list(derivations))

}