# Title     : interface.R
# Objective : Interface
# Created by: greyhypotheses
# Created on: 04/09/2022


# functions
source(file = 'R/functions/Link.R')
source(file = 'R/functions/Unlink.R')


# storage
storage <- file.path(getwd(), 'data', 'elevation')


# the storage directories
UnlinkDirectories(path = storage)
LinkDirectories(path = storage)


# the data source
url <- 'https://biogeo.ucdavis.edu/data/worldclim/v2.1/base/wc2.1_30s_elev.zip'


# download the geographic elevation data file
httr::GET(url = url,
          httr::write_disk(path = file.path(storage, basename(url)), overwrite = TRUE),
          overwrite = TRUE)


# the elevation data file is a zip file, hence unzip
unzip(zipfile = file.path(storage, basename(url)) , overwrite = TRUE, junkpaths = TRUE, exdir = storage)


# delete the zip file
UnlinkFiles(path = file.path(storage, basename(url)))

