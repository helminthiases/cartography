# Title     : AddVariables.R
# Objective : Add Variables
# Created by: greyhypotheses
# Created on: 09/07/2022



#' Add Variables
#'
#' @param experiment: An experiments data set.
#' @param variables: The set of sewer & water variables of interest.
#' @param items: Their corresponding, and distinctive, file name patterns.
#' @param types: A sewer or water variable?
#' @param repo: The directory within which the sewer & water data directories are located.
#' @param affix: The terminating string of each file.  An IHME peculiarity.
#' @param storage: The storage directory
#'
AddVariables <- function (experiment, variables, items, types, repo, affix, storage, name) {


  # the features fetch function
  source(file = 'R/features/WASH/FetchVariables.R')


  # per WASH variable, this function will return the variable estimate per observation,
  # using the observation's geographic coordinates and its experiment year
  case <- function (variable, item, type, experiment, repo, affix) {
    estimates <- FetchVariables(experiment = experiment, mapstring = file.path(repo, type, variable, item),
                                name = paste0(variable, '_', type), affix = affix)
    return(list(estimates))
  }


  # hence
  factors <- mapply(FUN = case, variable = variables,
                    item = items,
                    type = types,
                    MoreArgs = list(experiment = experiment, repo = repo, affix = affix))
  factors <- dplyr::bind_cols(factors)


  # experiment + variables
  frame <- base::merge(x = experiment, y = factors, by = 0, all.x = TRUE, sort = FALSE)
  frame <- base::subset(x = frame, select = -Row.names)
  str(frame)


  # write
  utils::write.table(x = frame,
                     file = file.path(storage, name),
                     append = FALSE,
                     quote = TRUE,
                     sep = ',',
                     row.names = FALSE,
                     col.names = TRUE,
                     fileEncoding = 'UTF-8')


}