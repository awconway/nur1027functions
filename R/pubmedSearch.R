#' Pubmed Search
#'
#' @return Number of results from a search of pubmed database
#' @param keyword Character string of pubmed search
#' 
#' @name search
#' @rdname search
#' 
#' @examples 
#' search("nursing[MeSH]")
#' 
#' 
#' @export
search <- function(keyword){
  RISmed::QueryCount(RISmed::EUtilsSummary(keyword)) 
}
