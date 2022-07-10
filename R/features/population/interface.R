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

# In <estimates> each observation of <frame> is associated with population density
# estimates for the years {2000, 2005, 2010, 2015, 2020}.  Remember, the observation
# code is field <id>.  The function Interpolating(.) estimates the population
# densities of the intervening years.
interpolations <- mapply(FUN = Interpolating, id = unique(estimates$id),
                         MoreArgs = list(estimates = estimates, years = years))
interpolations <- dplyr::bind_rows(interpolations)
row.names(interpolations) <- NULL
interpolations <- rename(interpolations, 'p_density' = 'estimate')

# finally, appending a population density field to <frame>
extended <- dplyr::left_join(x = frame, y = interpolations, by = c('id', 'year'))
