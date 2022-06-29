# Title     : InstallPackages.R
# Objective : Install Packages
# Created by: greyhypotheses
# Created on: 22/06/2022


#' Official packages
InstallPackagesOfficial <- function (){

  packages <- c('data.table', 'tidyverse', 'moments', 'rmarkdown', 'latex2exp', 'mapview',
                'roxygen2', 'kableExtra', 'bookdown', 'sf', 'raster', 'tmap', 'terra', 'httr',
                'spData', 'tidygeocoder', 'rnaturalearth', 'geodata', 'leaflet',
                'splancs', 'paletteer', 'ggthemes', 'ggcorrplot')

  # Install
  .install <- function(x){
    if (!require(x, character.only = TRUE)) {
      install.packages(x, dependencies = TRUE)
      if (x == 'rmarkdown') {tinytex::install_tinytex()}
    }
  }
  lapply(packages, .install)

  # Activate
  .activate <- function (x){
    library(x, character.only = TRUE)
    if (x == 'rmarkdown') {library(tinytex)}
  }
  lapply(packages[!(packages %in% c('tidyverse', 'terra', 'sf', 'raster', 'tmap', 'terra', 'spData',
                                    'tidygeocoder', 'rnaturalearth', 'geodata', 'leaflet', 'splancs',
                                    'paletteer', 'ggthemes', 'ggcorrplot'))], .activate)

  # Special Case
  if ('tidyverse' %in% packages) {
    lapply(X = c('magrittr', 'dplyr', 'tibble', 'ggplot2', 'stringr', 'lubridate'), .activate)
  }

  # Active libraries
  sessionInfo()

}


#' Packages in development
InstallPackagesExtraneous <- function () {

  packages <- 'spDataLarge'
  repositories <- 'https://nowosad.r-universe.dev'

  # Install
  .install <- function(x, y){
    if (!require(x, character.only = TRUE)) {
      install.packages(x, repos = y, dependencies = TRUE)
      if (x == 'rmarkdown') {tinytex::install_tinytex()}
    }
  }
  mapply(FUN = .install, x = packages, y = repositories)

  # Activate
  .activate <- function (x){
    library(x, character.only = TRUE)
  }
  lapply(packages, .activate)

}