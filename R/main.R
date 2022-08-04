# Title     : main.R
# Objective : Main
# Created by: greyhypotheses
# Created on: 29/06/2022


# Unload IHME WASH maps
# source(file = 'R/src/WASH/interface.R')

# Add IHME WASH features to each STH experiments data file
source(file = 'R/features/WASH/interface.R')

# Add population density
source(file = 'R/features/population/interface.R')

# Add elevation
source(file = 'R/features/elevation/interface.R')

# Add miscellaneous
source(file = 'R/features/miscellaneous/interface.R')

# Export
source(file = 'R/export.R')
