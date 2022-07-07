# Title     : interface.R
# Objective : Interface
# Created by: greyhypotheses
# Created on: 07/07/2022


source(file = 'R/functions/Link.R')
source(file = 'R/functions/Unlink.R')


# storage
storage <- file.path(getwd(), 'data', 'population')


# directories
UnlinkDirectories(path = storage)
LinkDirectories(path = storage)


# arguments
years <- seq(from = 2000, to = 2020, by = 5)
root <- 'https://geodata.ucdavis.edu/geodata/pop/gpw_v4_population_density_rev11_'
affix <- '_30s.tif'


# Unload fuction
temporary <- function (year, root, affix, storage) {
  httr::GET(url = paste0(root, year, affix),
            httr::write_disk(path = file.path(storage, paste0(year, affix)), overwrite = TRUE),
            overwrite = TRUE)
}


# Unload in-parallel
cores <- parallel::detectCores() / 2
doParallel::registerDoParallel(cores = cores)
clusters <- parallel::makeCluster(cores)
parallel::clusterMap(clusters, fun = temporary, years,
                     MoreArgs = list(root = root, affix = affix, storage = storage))
parallel::stopCluster(clusters)

rm(clusters, cores)
