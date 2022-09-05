# Title     : interface.R
# Objective : Interface
# Created by: greyhypotheses
# Created on: 04/09/2022


source(file = 'R/functions/Link.R')
source(file = 'R/functions/Unlink.R')


# storage
storage <- file.path(getwd(), 'data', 'experiments')


# directories
UnlinkDirectories(path = storage)
LinkDirectories(path = storage)


# the list of experiment files
T <- read.csv(file = 'https://raw.githubusercontent.com/helminthiases/infections/master/warehouse/data/ESPEN/experiments/data.csv')
URL <- T$path
names <- lapply(X = URL, FUN = function (x) basename(path = x)) %>% unlist()


# Unload fuction
temporary <- function (url, name, storage) {
  httr::GET(url = url,
            httr::write_disk(path = file.path(storage, name), overwrite = TRUE),
            overwrite = TRUE)
}


# Unload in-parallel
cores <- parallel::detectCores() / 2
doParallel::registerDoParallel(cores = cores)
clusters <- parallel::makeCluster(cores)
parallel::clusterMap(clusters, fun = temporary, URL, names,
                     MoreArgs = list(storage = storage))
parallel::stopCluster(clusters)
rm(clusters, cores)
