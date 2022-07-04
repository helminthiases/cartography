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


# test, subsequently proceed in parallel w.r.t. files
experiment <- read.csv(file = files[1])
case <- function (variable, item, type, experiment, root, affix) {
  estimates <- AddVariables(experiment = experiment, mapstring = file.path(root, type, variable, item),
                            name = paste0(variable, '_', type), affix = affix)
  return(list(estimates))
}
factors <- mapply(FUN = case, variable = variables,
            item = items,
            type = types,
            MoreArgs = list(experiment = experiment, root = root, affix = affix))
factors <- dplyr::bind_cols(factors)
frame <- base::merge(x = experiment, y = factors, by = 0, all.x = TRUE)


