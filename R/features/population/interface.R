# Title     : interface.R
# Objective :
# Created by: greyhypotheses
# Created on: 07/07/2022


# the list of experiment files
files <- list.files(path = file.path(getwd(), 'warehouse', 'ESPEN', 'experiments', 'extended'),
                    full.names = TRUE)


# an experiments file
frame <- read.csv(file = files[3])


# arguments
years <- seq(from = 2000, to = 2020, by = 5)
root <- file.path(getwd(), 'data', 'population')
affix <- '_30s.tif'


# delivers a data frame for each map year
temporary <- function (year, root, affix, frame) {

  # map
  path <- file.path(root, paste0(year, affix))
  map <- terra::rast(file.path(path))

  # The longitude & latitude points
  points <- frame[, c('longitude', 'latitude')]

  # Variable values w.r.t. ...
  derivations <- terra::extract(x = map, y = points, method = 'bilinear', xy = TRUE)
  row.names(derivations) <- row.names(frame[derivations$ID, ])

  # the field names
  estimate <- colnames(derivations)[startsWith(colnames(derivations), prefix = 'gpw_v4_')]
  derivations <- dplyr::rename(derivations, 'id' = 'ID', 'estimate' = estimate, 'longitude' = 'x', 'latitude' = 'y')

  derivations$id <- as.integer(derivations$id)
  derivations$year <- as.integer(year)

  return(list(derivations))

}


# collating
estimates <- mapply(FUN = temporary, year = years, MoreArgs = list(root = root, affix = affix, frame = frame))
estimates <- dplyr::bind_rows(estimates)
row.names(estimates) <- NULL


# a set of values w.r.t. a location
partition <- estimates[estimates$id == 1, c('year', 'estimate')]

missing <- seq(from = 2000, to = 2020)
missing <- missing[!(missing %in% years)]


# spline interpolation for missing years estimates
extra <- stats::spline(x = partition$year, y = partition$estimate, method = 'natural', xout = missing)
extra <- data.frame(extra)
extra <- dplyr::rename(extra, 'year' = 'x', 'estimate' = 'y')
extra$year <- as.integer(extra$year)

extra <- rbind(partition[, c('year', 'estimate')], extra)
extra <- extra[with(extra, order(year, estimate)), ]
