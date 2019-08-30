#' Pubmed Search
#'
#' @return Number of results from a search of pubmed database
#' @param keyword Character string of pubmed search
#' 
#' @name pubmed_search
#' @rdname pubmed_search
#' 
#' @examples 
#' search("nursing[MeSH]")
#' 
#' 
#' @export
pubmed_search <- function(keyword){
  RISmed::QueryCount(RISmed::EUtilsSummary(keyword)) 
}
