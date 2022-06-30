# Title     : Unload.R
# Objective : Unload
# Created by: greyhypotheses
# Created on: 30/06/2022


source(file = 'R/functions/Unlink.R')
source(file = 'R/functions/Link.R')


Unload <- function (root, item, affix, storage) {


  years <- seq(from = 2000, to = 2017)


  # Prepare
  UnlinkDirectories(path = storage)
  LinkDirectories(path = storage)


  # Unload map data
  temporary <- function (year) {
    httr::GET(url = paste0(root, item, year, affix),
              httr::write_disk(path = storage),
              overwrite = TRUE)
  }



}