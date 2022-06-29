# Title     : SewerPipes.R
# Objective : Sewer pipes
# Created by: greyhypotheses
# Created on: 29/06/2022


SewerPipes <- function (file) {

  # List the unique data years
  # Per year, extract the sewer pipes estimates from the appropriate <sewer pipes map>
  # Issue: The map years do not span all the data years


  # An experiments data set
  country <- read.csv(file = file)
  years <- unique(country$year)


  temporary <- function (year) {

    frame <- country[country$year == 2017, ]

    # The longitude & latitude points
    # dplyr::rename(points, 'lon' = 'longitude', 'lat' = 'latitude')
    points <- frame %>%
      dplyr::select(longitude, latitude)

    # Variable values w.r.t. ...
    derivations <- terra::extract(x = map, y = points, method = 'bilinear')
    names(derivations) <- c('id', 'estimate')

  }


}