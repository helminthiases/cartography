# Title     : export.R
# Objective : Export
# Created by: greyhypotheses
# Created on: 23/07/2022


# external storage
external <- file.path(base::dirname(getwd()), 'modelling', 'data')
if (dir.exists(external)) {
  base::unlink(x = external, recursive = TRUE)
}
dir.create(path = external, recursive = TRUE)


# the files to be delivered to the <modelling> repository
src <- list.files(path = file.path(getwd(), 'warehouse', 'features', 'miscellaneous'),
                  full.names = TRUE)


# delivery paths
dst <- lapply(X = src, FUN = function (x) file.path(external, base::basename(x)))
dst <- unlist(dst)


# in parallel
cores <- parallel::detectCores()/2
doParallel::registerDoParallel(cores = cores)
clusters <- parallel::makeCluster(cores)
parallel::clusterMap(clusters, fun = file.copy, src, dst)
parallel::stopCluster(clusters)
rm(clusters, cores)
