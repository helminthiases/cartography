# Title     : sewer.R
# Objective : IHME LMIC WASH Estimates 2000 - 2017
# Created by: greyhypotheses
# Created on: 22/06/2022


# IHME LMIC WASH Estimates 2000 - 2017 Administration Level 2 Piped Sanitation Y2020M06D02
# Access to sewer and septic sanitation facilities [GeoTIFF]
uri <- 'data/points/IHME_LMIC_WASH_2000_2017_S_PIPED_ADMIN_2_Y2020M06D02.csv'
url <- 'https://cloud.ihme.washington.edu/s/bkH2X2tFQMejMxy?path=%2FData%20%5BCSV%5D%2FAdmin%202&files=IHME_LMIC_WASH_2000_2017_S_PIPED_ADMIN_2_Y2020M06D02.zip'

records <- data.table::fread(file = uri, strip.white = TRUE)
str(records)

# The number of unique countries
length(x = unique(records$ADM0_CODE))
