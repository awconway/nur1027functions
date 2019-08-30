#' Returns weighted kappa
#' 
#' 
#'  @name weightedKappa
#' @param data data
#' @rdname weightedKappa

#' @export
weightedKappa <- function(data){
  suppressMessages(library(agree))
  options(warn=-1)
  a <-  psych::cohen.kappa(table(data))
  paste("Weighted Kappa", round(a$weighted.kappa, 2), sep=" = ")
}