# Title     : interface.R
# Objective : Interface
# Created by: greyhypotheses
# Created on: 04/09/2022


# storage
storage <- file.path(getwd(), 'warehouse', 'features', 'data')
if (dir.exists(storage)) {
  base::unlink(x = storage, recursive = TRUE)
}
dir.create(path = storage, recursive = TRUE)


# the experiments data files
src <- list.files(path = file.path(getwd(), 'data', 'experiments'),
                  full.names = TRUE)


# the concurrent delivery paths
dst <- lapply(X = src, FUN = function (x) file.path(storage, base::basename(x)))
dst <- unlist(dst)


# in parallel: from <src> to <dst>
cores <- parallel::detectCores()/2
doParallel::registerDoParallel(cores = cores)
clusters <- parallel::makeCluster(cores)
parallel::clusterMap(clusters, fun = file.copy, src, dst)
parallel::stopCluster(clusters)
rm(clusters, cores)
