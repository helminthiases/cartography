# Title     : PointMapping.R
# Objective : Point mapping
# Created by: greyhypotheses
# Created on: 30/06/2022


source(file = 'R/features/WASH/FetchMap.R')


PointMapping <- function (experiment, path, year) {

  # map data of the correct year
  map <- FetchMap(path = path)

  # experiments data
  frame <- experiment[experiment$year == year, ]

  # The longitude & latitude points
  # points <- frame %>% dplyr::select(longitude, latitude)
  points <- frame[, c('longitude', 'latitude')]

  # Variable values w.r.t. ...
  derivations <- terra::extract(x = map, y = points, method = 'bilinear')
  row.names(derivations) <- row.names(frame[derivations$ID, ])

  # Exclude ID
  # derivations <- derivations %>% dplyr::select(!ID)
  derivations <- base::subset(x = derivations, select = -ID)
  names(derivations) <- 'estimate'

  return(derivations)

}