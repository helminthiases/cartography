# Title     : interface.R
# Objective :
# Created by: greyhypotheses
# Created on: 07/07/2022


source(file = 'R/features/population/Densities.R')


# the list of experiment files
files <- list.files(path = file.path(getwd(), 'warehouse', 'WASH'),
                    full.names = TRUE)


# arguments
years <- seq(from = 2000, to = 2020, by = 5)
root <- file.path(getwd(), 'data', 'population')
affix <- '_30s.tif'


# storage
storage <- file.path(getwd(), 'warehouse', 'features', 'population')
if (dir.exists(storage)) {
  base::unlink(x = storage, recursive = TRUE)
}
dir.create(path = storage, recursive = TRUE)


# in parallel
cores <- parallel::detectCores() - 2
doParallel::registerDoParallel(cores = cores)
clusters <- parallel::makeCluster(cores)
parallel::clusterMap(clusters, fun = Densities, files,
                     MoreArgs = list(years = years, root = root, affix = affix, storage = storage))
parallel::stopCluster(clusters)
rm(clusters, cores)