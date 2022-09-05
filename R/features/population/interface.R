# Title     : interface.R
# Objective : Interface
# Created by: greyhypotheses
# Created on: 07/07/2022


source(file = 'R/features/population/Densities.R')


# the experiments data, and more
files <- list.files(path = file.path(getwd(), 'warehouse', 'features', 'data'),
                    full.names = TRUE)


# storage
storage <- file.path(getwd(), 'warehouse', 'features', 'data')


# arguments
years <- seq(from = 2000, to = 2020, by = 5)
root <- file.path(getwd(), 'data', 'population')
affix <- '_30s.tif'


# in parallel
cores <- parallel::detectCores() - 2
doParallel::registerDoParallel(cores = cores)
clusters <- parallel::makeCluster(cores)
parallel::clusterMap(clusters, fun = Densities, files,
                     MoreArgs = list(years = years, root = root, affix = affix, storage = storage))
parallel::stopCluster(clusters)
rm(clusters, cores)
