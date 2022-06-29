# Title     : sewer.R
# Objective : IHME LMIC WASH Estimates 2000 - 2017
# Created by: greyhypotheses
# Created on: 22/06/2022


url <- 'https://cloud.ihme.washington.edu/s/bkH2X2tFQMejMxy/download?path=%2FS_PIPED%20-%20Access%20to%20sewer%20and%20septic%20sanitation%20facilities%20%5BGeoTIFF%5D%2FPercent&files='
item <- 'IHME_LMIC_WASH_2000_2017_S_PIPED_PERCENT_UPPER_'
year <- 2017
date <- '_Y2020M06D02.TIF'

httr::GET(url = paste0(url, item, year, date),
          httr::write_disk(path = file.path(getwd(), 'data', 'shapes', 'WASH', 'sewer', paste0(item, year, date))),
          overwrite = TRUE)

map <- terra::rast(file.path(getwd(), 'data', 'shapes', 'WASH', 'sewer', paste0(item, year, date)))
class(map)
cat(terra::crs(map))

tm_shape(map, raster.downsample = TRUE) +
  tm_layout(main.title = 'World', frame = FALSE) +
  tm_raster(title = 'Sewers')

