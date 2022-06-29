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
  points <- frame %>%
    dplyr::select(longitude, latitude)
  dplyr::rename(points, 'lon' = 'longitude', 'lat' = 'latitude')

  # Variable values w.r.t. ...
  derivations <- terra::extract(x = map, y = points, method = 'simple')
  derivations <- derivations %>% dplyr::select(!ID)
  names(derivations) <- 'estimate'
  
  print(head(derivations))

}
lapply(X = files, FUN = temporary)
