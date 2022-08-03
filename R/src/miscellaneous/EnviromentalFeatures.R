# Title     : EnviromentalFeatures.R
# Objective : Environmental Features
# Created by: greyhypotheses
# Created on: 03/08/2022



EnvironmentalFeatures <- function (country, pathstr, ISO2) {


  # a spectrum of features vis-à-vis country
  sample <- variates[variates$ADMIN0 == country & !is.na(variates$ADMIN0), ]


  # assigning an identifier to each observation
  # sample <- cbind(features.index = 1:nrow(sample), sample)
  sample <- tibble::add_column(sample, id = 1:nrow(sample), .before = 1)
  sample <- sample[, c('id', 'x', 'y', 'AnnualPrecip', 'AnPET', 'AridityIndex')]


  # write
  utils::write.table(x = sample,
                     file = file.path(pathstr, paste0(ISO2, '.csv')),
                     append = FALSE,
                     sep = ',',
                     row.names = FALSE,
                     col.names = TRUE,
                     fileEncoding = 'UTF-8')

}
