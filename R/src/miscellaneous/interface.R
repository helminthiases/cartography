# Title     : interface.R
# Objective : interface
# Created by: greyhypotheses
# Created on: 03/08/2022



# Functions
source(file = 'R/src/miscellaneous/EnviromentalFeatures.R')


# Preparing a directory for disaggregated miscellaneous features
pathstr <- file.path(getwd(), 'data', 'miscellaneous', 'disaggregates')
if (dir.exists(paths = pathstr)) {
  base::unlink(pathstr, recursive = TRUE)
}
dir.create(path = pathstr, showWarnings = TRUE, recursive = TRUE)


# A spectrum of features of a few countries
variates <- readr::read_rds(file = 'data/miscellaneous/covariates_10km.rds')


# ESPEN gazetteer
url <- 'https://raw.githubusercontent.com/helminthiases/infections/develop/warehouse/data/ESPEN/cartographies/countries.csv'
countries <- read.csv(file = url, header = TRUE)
countries$admin0 <- stringr::str_replace(countries$admin0, pattern = 'Eswatini', replacement = 'Swaziland')


# Creating a miscellaneous features data file per country of interest
codes <- list.files(path = file.path(getwd(), 'warehouse', 'features', 'WASH'), full.names = FALSE)
codes <- stringr::str_replace(codes, pattern = '.csv', replacement = '')
for (code in codes) {
  section <- countries[countries$iso2 == code & !is.na(countries$iso2), ]
  EnvironmentalFeatures(country = section$admin0, pathstr = pathstr, ISO2 = code)
}
