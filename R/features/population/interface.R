# Title     : interface.R
# Objective :
# Created by: greyhypotheses
# Created on: 07/07/2022


source(file = 'R/features/population/PointMapping.R')
source(file = 'R/features/population/Interpolating.R')


# the list of experiment files
files <- list.files(path = file.path(getwd(), 'warehouse', 'ESPEN', 'experiments', 'extended'),
                    full.names = TRUE)


# an experiments file
frame <- read.csv(file = files[3])


# arguments
years <- seq(from = 2000, to = 2020, by = 5)
root <- file.path(getwd(), 'data', 'population')
affix <- '_30s.tif'


# per observation, via its coordinates, the population density estimates per map year
estimates <- mapply(FUN = PointMapping, year = years, MoreArgs = list(root = root, affix = affix, frame = frame))
estimates <- dplyr::bind_rows(estimates)
row.names(estimates) <- NULL






