# Title     : Unload.R
# Objective : Unload
# Created by: greyhypotheses
# Created on: 30/06/2022


source(file = 'R/functions/Unlink.R')
source(file = 'R/functions/Link.R')


#' Unload
#'
#' @param root: The URL root string w.r.t. the IHME WASH item of interest
#' @param item: The IHME WASH item of interest
#' @param affix: The text, including file extension, appended to each cloud data set
#' @param storage: The directory wherein each downloaded data set is stored.
#'
Unload <- function (root, item, affix, storage) {


  years <- seq(from = 2000, to = 2017)


  # Prepare
  UnlinkDirectories(path = storage)
  LinkDirectories(path = storage)


  # Unload map data
  temporary <- function (year, root, item, affix, storage) {
    httr::GET(url = paste0(root, item, year, affix),
              httr::write_disk(path = file.path(storage, paste0(item, year, affix)), overwrite = TRUE),
              overwrite = TRUE)
  }


  # Unload in-parallel
  n_cores <- parallel::detectCores() - 1
  doParallel::registerDoParallel(cores = n_cores)
  C <- parallel::makeCluster(n_cores)
  parallel::clusterMap(C, fun = temporary, years,
                       MoreArgs = list(root = root, item = item, affix = affix, storage = storage))
  parallel::stopCluster(C)

  rm(C, n_cores)


}