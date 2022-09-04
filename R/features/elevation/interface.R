# Title     : interface.R
# Objective : interface
# Created by: greyhypotheses
# Created on: 15/07/2022


source(file = 'R/features/elevation/PointMapping.R')


# the experiments data, and more
files <- list.files(path = file.path(getwd(), 'warehouse', 'features', 'data'),
                    full.names = TRUE)


# storage
storage <- file.path(getwd(), 'warehouse', 'features', 'data')


# in parallel
cores <- parallel::detectCores()/2
doParallel::registerDoParallel(cores = cores)
clusters <- parallel::makeCluster(cores)
parallel::clusterMap(clusters, fun = PointMapping, files,
                     MoreArgs = list(storage = storage))
parallel::stopCluster(clusters)
rm(clusters, cores)
