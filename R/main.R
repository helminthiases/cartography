# Title     : main.R
# Objective : Main
# Created by: greyhypotheses
# Created on: 29/06/2022


# Unload IHME WASH maps
source(file = 'R/src/WASH/interface.R')

# Add IHME WASH features to each STH experiments data file
source(file = 'R/features/WASH/interface.R')

# Add population density
source(file = 'R/features/population/interface.R')

# Add elevation
source(file = 'R/features/elevation/interface.R')


# external storage
external <- file.path(base::dirname(getwd()), 'modelling', 'data')
if (dir.exists(external)) {
  base::unlink(x = external, recursive = TRUE)
}
dir.create(path = external, recursive = TRUE)

src <- list.files(path = file.path(getwd(), 'warehouse', 'features', 'elevation'),
                   full.names = TRUE)
dst <- lapply(X = src, FUN = function (x) file.path(external, base::basename(x)))
dst <- unlist(dst)

# in parallel
cores <- parallel::detectCores()/2
doParallel::registerDoParallel(cores = cores)
clusters <- parallel::makeCluster(cores)
parallel::clusterMap(clusters, fun = file.copy, src, dst)
parallel::stopCluster(clusters)
rm(clusters, cores)