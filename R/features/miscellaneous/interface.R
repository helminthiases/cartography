# Title     : interface.R
# Objective : interface
# Created by: greyhypotheses
# Created on: 03/08/2022


source(file = 'R/features/miscellaneous/FieldEstimates.R')


# Preparing a data directory
pathstr <- file.path(getwd(), 'warehouse', 'features', 'miscellaneous')
if (dir.exists(paths = pathstr)) {
  base::unlink(pathstr, recursive = TRUE)
}
dir.create(path = pathstr, showWarnings = TRUE, recursive = TRUE)


# The stem names of the files undergoing enhancement.
codes <- list.files(path = file.path(getwd(), 'warehouse', 'features', 'elevation'), full.names = FALSE)
codes <- stringr::str_replace(codes, pattern = '.csv', replacement = '')
codes <- codes[!(codes %in% 'ZZ')]


# Paths
paths <- list(experiment = file.path(getwd(), 'warehouse', 'features', 'elevation'),
              features = file.path(getwd(), 'data', 'miscellaneous', 'disaggregates'),
              storage = pathstr)


# Countries
url <- 'https://raw.githubusercontent.com/helminthiases/infections/develop/warehouse/data/ESPEN/cartographies/countries.csv'
countries <- read.csv(file = url, header = TRUE)
countries <- countries[(countries$iso2 %in% codes), ]


# Proceed in parallel
ISO2 <- unique(countries$iso2)
ISO3 <- unique(countries$iso3)
cores <- parallel::detectCores()/2
doParallel::registerDoParallel(cores = cores)
clusters <- parallel::makeCluster(cores)
parallel::clusterMap(clusters, fun = FieldEstimates, ISO2, ISO3,
                     MoreArgs = list(paths = paths))
parallel::stopCluster(clusters)
rm(clusters, cores)
