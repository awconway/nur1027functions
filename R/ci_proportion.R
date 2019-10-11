#' Returns percent agreement
#' 
#' 
#'  @name ci_proportion
#' @param x numerator
#' @param n sample size

#' @rdname ci_proportion

#' @export

ci_proportion <- function(x, n){

results <- prop.test(x, n)
glue::glue("95% confidence intervals spanned from ",
           round(results$conf.int[1]*100,0),"%",
           " to ", round(results$conf.int[2]*100,0),"%")
}
