# Title     : interface.R
# Objective : interface
# Created by: greyhypotheses
# Created on: 30/06/2022


rm(list = ls())


# custom functions
source(file = 'R/features/AddVariables.R')


# the list of experiment files
files <- list.files(path = file.path(dirname(getwd()),
                                     'infections', 'warehouse', 'data', 'ESPEN', 'networks', 'graphs'),
                    full.names = TRUE)


# arguments
root <- file.path(getwd(), 'data', 'WASH')
types <- c(rep('sewer', times = 5), rep('water', times = 5))
items <- c('IHME_LMIC_WASH_2000_2017_S_IMP_PERCENT_MEAN_', 'IHME_LMIC_WASH_2000_2017_S_IMP_OTHER_PERCENT_MEAN_',
           'IHME_LMIC_WASH_2000_2017_S_OD_PERCENT_MEAN_', 'IHME_LMIC_WASH_2000_2017_S_PIPED_PERCENT_MEAN_',
           'IHME_LMIC_WASH_2000_2017_S_UNIMP_PERCENT_MEAN_', 'IHME_LMIC_WASH_2000_2017_W_IMP_PERCENT_MEAN_',
           'IHME_LMIC_WASH_2000_2017_W_IMP_OTHER_PERCENT_MEAN_', 'IHME_LMIC_WASH_2000_2017_W_SURFACE_PERCENT_MEAN_',
           'IHME_LMIC_WASH_2000_2017_W_PIPED_PERCENT_MEAN_', 'IHME_LMIC_WASH_2000_2017_W_UNIMP_PERCENT_MEAN_')
variables <- c('improved', 'unpiped', 'surface', 'piped', 'unimproved',
               'improved', 'unpiped', 'surface', 'piped', 'unimproved')
affix <- '_Y2020M06D02.TIF'


# test
case <- function (variable, item, type, file, root, affix) {
  experiment <- read.csv(file = file)
  estimates <- AddVariables(experiment = experiment, mapstring = file.path(root, type, variable, item),
                            name = paste0(variable, '_', type), affix = affix)
  return(list(estimates))
}
E <- mapply(FUN = case, variable = variables,
            item = items,
            type = types,
            MoreArgs = list(file = files[1], root = root, affix = affix))
dplyr::bind_cols(E)
