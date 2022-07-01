# Title     : interface.R
# Objective : interface
# Created by: greyhypotheses
# Created on: 30/06/2022


source(file = 'R/features/AddVariables.R')


# the list of experiment files
files <- list.files(path = file.path(dirname(getwd()),
                                     'infections', 'warehouse', 'data', 'ESPEN', 'experiments', 'equivalent'),
                    full.names = TRUE)


# arguments
root <- file.path(getwd(), 'data', 'WASH', 'sewer')
items <- c('IHME_LMIC_WASH_2000_2017_S_IMP_PERCENT_MEAN_', 'IHME_LMIC_WASH_2000_2017_S_IMP_OTHER_PERCENT_MEAN_',
           'IHME_LMIC_WASH_2000_2017_S_OD_PERCENT_MEAN_', 'IHME_LMIC_WASH_2000_2017_S_PIPED_PERCENT_MEAN_',
           'IHME_LMIC_WASH_2000_2017_S_UNIMP_PERCENT_MEAN_')
variables <- c('improved', 'unpiped', 'surface', 'piped', 'unimproved')
affix <- '_Y2020M06D02.TIF'


# test
file <- files[1]
experiment <- read.csv(file = file)

X <- AddVariables(experiment = experiment, mapstring = file.path(root, variables[1], items[1]),
                  variable = variables[1], affix = affix)
Y <- AddVariables(experiment = experiment, mapstring = file.path(root, variables[2], items[2]),
                  variable = variables[2], affix = affix)
Z <- AddVariables(experiment = experiment, mapstring = file.path(root, variables[3], items[3]),
                  variable = variables[3], affix = affix)

dplyr::bind_cols(list(X, Y, Z))
