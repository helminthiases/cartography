# Title     : Fetch.R
# Objective : Sewer pipes
# Created by: greyhypotheses
# Created on: 29/06/2022


# functions
source(file = 'R/features/Fetch.R')


#' in progress
#'
#'
SewerPipes <- function (file) {

  # List the unique data years
  # Per year, extract the sewer pipes estimates from the appropriate <sewer pipes map>
  # Issue: The map years - from 2000 until 2017 - do not span all the data years


  # An experiments data set
  country <- read.csv(file = file)
  years <- unique(country$year)


  # In progress: Valid years
  years <- years[years %in% seq(from = 2000, to = 2017)]


  # Hence
  temporary <- function (year) {

    # missing
    # map data of the correct year
    map <- SewerPipesFeature(year = year)

    # experiments data
    frame <- country[country$year == year, ]

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
  estimates <- lapply(X = years, FUN = temporary)
  estimates <- dplyr::bind_rows(estimates)

}