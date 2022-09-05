# Title     : main.R
# Objective : Main
# Created by: greyhypotheses
# Created on: 29/06/2022


# Data
source(file = 'R/src/experiments/interface.R')
source(file = 'R/src/WASH/interface.R')
source(file = 'R/src/population/interface.R')
source(file = 'R/src/elevation/interface.R')


# The baseline: the basic experiments data
source(file = 'R/features/experiments/interface.R')

# Add IHME WASH features to each STH experiments data file
source(file = 'R/features/WASH/interface.R')

# Add population density
source(file = 'R/features/population/interface.R')

# Add elevation
source(file = 'R/features/elevation/interface.R')

# Export
source(file = 'R/export.R')


# the <url> list of the enhanced data files
files <- list.files(path = file.path(getwd(), 'warehouse', 'features', 'data'), full.names = TRUE)
files <- lapply(X = files, FUN = function (x) unlist(base::strsplit(x = x, split = 'spatial'))[2]) %>%
  unlist()
URL <- lapply(X = files, FUN = function (x) paste0('https://raw.githubusercontent.com/helminthiases/spatial/master', x)) %>%
  unlist()


# saving the <url> list of enhanced data files
utils::write.table(x = data.frame(path = URL), file = file.path(getwd(), 'warehouse', 'features', 'data.csv'),
                   append = FALSE, sep = ',', na = '',
                   row.names = FALSE, col.names = TRUE, fileEncoding = 'UTF-8')
