#' Returns percent agreement
#' 
#' 
#'  @name percent
#' @param data dataframe with ratings
#' @rdname percent

#' @export
percent <- function(data){
  suppressMessages(library(agree))
 a <-  irr::agree(data)
 paste(round(a$value,0), "%", sep = "")
}
