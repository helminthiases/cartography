# Title     : interface.R
# Objective : interface
# Created by: greyhypotheses
# Created on: 30/06/2022


rm(list = ls())


# custom functions
source(file = 'R/features/WASH/Hygiene.R')


# the experiments data, and more
files <- list.files(path = file.path(getwd(), 'warehouse', 'features', 'data'),
                    full.names = TRUE)


# storage
storage <- file.path(getwd(), 'warehouse', 'features', 'data')


# arguments
repo <- file.path(getwd(), 'data', 'WASH')
types <- c(rep('sewer', times = 5), rep('water', times = 5))
items <- c('IHME_LMIC_WASH_2000_2017_S_IMP_PERCENT_MEAN_', 'IHME_LMIC_WASH_2000_2017_S_IMP_OTHER_PERCENT_MEAN_',
           'IHME_LMIC_WASH_2000_2017_S_OD_PERCENT_MEAN_', 'IHME_LMIC_WASH_2000_2017_S_PIPED_PERCENT_MEAN_',
           'IHME_LMIC_WASH_2000_2017_S_UNIMP_PERCENT_MEAN_', 'IHME_LMIC_WASH_2000_2017_W_IMP_PERCENT_MEAN_',
           'IHME_LMIC_WASH_2000_2017_W_IMP_OTHER_PERCENT_MEAN_', 'IHME_LMIC_WASH_2000_2017_W_SURFACE_PERCENT_MEAN_',
           'IHME_LMIC_WASH_2000_2017_W_PIPED_PERCENT_MEAN_', 'IHME_LMIC_WASH_2000_2017_W_UNIMP_PERCENT_MEAN_')
variables <- c('improved', 'unpiped', 'surface', 'piped', 'unimproved',
               'improved', 'unpiped', 'surface', 'piped', 'unimproved')
affix <- '_Y2020M06D02.TIF'


# in parallel
cores <- parallel::detectCores() - 2
doParallel::registerDoParallel(cores = cores)
clusters <- parallel::makeCluster(cores)
parallel::clusterMap(clusters, fun = Hygiene, files,
                     MoreArgs = list(variables = variables, items = items, types = types, 
                                     repo = repo, affix = affix, storage = storage))
parallel::stopCluster(clusters)
rm(clusters, cores)
