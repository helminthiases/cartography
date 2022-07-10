# Title     : Densities.R
# Objective : Population Density Calculations
# Created by: greyhypotheses
# Created on: 10/07/2022


#' Population Densities
#'
#' @param file: the file path striing of an experiments file
#' @param years: the map years of the population density maps
#' @param root: the storage directory of the maps
#' @param affix: the affix, including map file extension, of the map files
#' @param storage: the storage path
#'
Densities <- function(file, years, root, affix, storage) {


  source(file = 'R/features/population/PointMapping.R')
  source(file = 'R/features/population/Interpolating.R')

  # An experiments file
  frame <- read.csv(file = file)


  # Per observation, and via its coordinates, the population density estimates per map year
  estimates <- mapply(FUN = PointMapping, year = years, MoreArgs = list(root = root, affix = affix, frame = frame))
  estimates <- dplyr::bind_rows(estimates)
  row.names(estimates) <- NULL


  # In <estimates> each observation of <frame> is associated with population density
  # estimates for the years {2000, 2005, 2010, 2015, 2020}.  Remember, the observation
  # code is field <id>.  The function Interpolating(.) estimates the population
  # densities of the intervening years.
  interpolations <- mapply(FUN = Interpolating, id = unique(estimates$id),
                           MoreArgs = list(estimates = estimates, years = years))
  interpolations <- dplyr::bind_rows(interpolations)
  row.names(interpolations) <- NULL
  interpolations <- rename(interpolations, 'p_density' = 'estimate')


  # Finally, appending a population density field to <frame>
  extended <- dplyr::left_join(x = frame, y = interpolations, by = c('id', 'year'))


  # Write
  utils::write.table(x = extended,
                     file = file.path(storage, base::basename(path = file)),
                     append = FALSE,
                     sep = ',',
                     row.names = FALSE,
                     col.names = TRUE,
                     fileEncoding = 'UTF-8')


}