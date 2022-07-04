# Title     : PointMapping.R
# Objective : Point mapping
# Created by: greyhypotheses
# Created on: 30/06/2022


source(file = 'R/features/WASH/FetchMap.R')


PointMapping <- function (experiment, path, year) {

  # missing
  # map data of the correct year
  map <- FetchMap(path = path)

  # experiments data
  frame <- experiment[experiment$year == year, ]

  # The longitude & latitude points
  # dplyr::rename(points, 'lon' = 'longitude', 'lat' = 'latitude')
  points <- frame %>%
    dplyr::select(longitude, latitude)

  # Variable values w.r.t. ...
  derivations <- terra::extract(x = map, y = points, method = 'bilinear')
  row.names(derivations) <- row.names(frame[derivations$ID, ])
  derivations <- derivations %>% dplyr::select(!ID)
  names(derivations) <- 'estimate'

  return(derivations)

}