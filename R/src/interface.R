# Title     : interface.R
# Objective : Interface
# Created by: greyhypotheses
# Created on: 30/06/2022


source(file = 'R/src/Unload.R')


# The end point & affix of the cloud data
endpoint <- 'https://cloud.ihme.washington.edu/s/bkH2X2tFQMejMxy/download?'
affix <- '_Y2020M06D02.TIF'


# Unload steps
case <- function (path, item, variable, segment) {
  root <- paste0(endpoint, 'path=', path, '&files=')
  storage <- file.path(getwd(), 'data', 'WASH', segment, variable)
  Unload(root = root, item = item, affix = affix, storage = storage)

  return(TRUE)
}


# The sewer data of interest
paths <- c('%2FS_IMP%20-%20Access%20to%20any%20improved%20sanitation%20facility%20%5BGeoTIFF%5D%2FPercent',
           '%2FS_IMP_OTHER%20-%20Access%20to%20a%20non-piped%20improved%20sanitation%20facility%20%5BGeoTIFF%5D%2FPercent',
           '%2FS_OD%20-%20Reliance%20on%20open%20defecation%20%5BGeoTIFF%5D%2FPercent',
           '%2FS_PIPED%20-%20Access%20to%20sewer%20and%20septic%20sanitation%20facilities%20%5BGeoTIFF%5D%2FPercent',
           '%2FS_UNIMP%20-%20Reliance%20on%20unimproved%20sanitation%20facilities%20%5BGeoTIFF%5D%2FPercent')
items <- c('IHME_LMIC_WASH_2000_2017_S_IMP_PERCENT_MEAN_', 'IHME_LMIC_WASH_2000_2017_S_IMP_OTHER_PERCENT_MEAN_',
           'IHME_LMIC_WASH_2000_2017_S_OD_PERCENT_MEAN_', 'IHME_LMIC_WASH_2000_2017_S_PIPED_PERCENT_MEAN_',
           'IHME_LMIC_WASH_2000_2017_S_UNIMP_PERCENT_MEAN_')
variables <- c('improved', 'unpiped', 'surface', 'piped', 'unimproved')

X <- mapply(FUN = case, variable = variables, path = paths, item = items, MoreArgs = list(segment = 'sewer'))


# The water data of interest
paths <- c('%2FW_IMP%20-%20Access%20to%20any%20improved%20water%20sources%20%5BGeoTIFF%5D%2FPercent',
           '%2FW_IMP_OTHER%20-%20Access%20to%20non-piped%20improved%20water%20sources%20%5BGeoTIFF%5D%2FPercent',
           '%2FW_SURFACE%20-%20Reliance%20on%20surface%20water%20%5BGeoTIFF%5D%2FPercent',
           '%2FW_PIPED%20-%20Access%20to%20piped%20water%20%5BGeoTIFF%5D%2FPercent',
           '%2FW_UNIMP%20-%20Reliance%20on%20unimproved%20water%20sources%20%5BGeoTIFF%5D%2FPercent')
items <- c('IHME_LMIC_WASH_2000_2017_W_IMP_PERCENT_MEAN_', 'IHME_LMIC_WASH_2000_2017_W_IMP_OTHER_PERCENT_MEAN_',
           'IHME_LMIC_WASH_2000_2017_W_SURFACE_PERCENT_MEAN_', 'IHME_LMIC_WASH_2000_2017_W_PIPED_PERCENT_MEAN_',
           'IHME_LMIC_WASH_2000_2017_W_UNIMP_PERCENT_MEAN_')
variables <- c('improved', 'unpiped', 'surface', 'piped', 'unimproved')

X <- mapply(FUN = case, variable = variables, path = paths, item = items, MoreArgs = list(segment = 'water'))
