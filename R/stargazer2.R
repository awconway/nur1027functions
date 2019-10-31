#' Logistic regression table with odd ratios
#'
#' @param model A non-empty list containing one or more glm models
#' @param odd.ratio A logical value indicating whether you want odd ratios (TRUE)
#'  instead of the usual log odds (FALSE).
#' @param ... further aguments passed to the stargazer function. See ?stargazer::stargazer
#'
#' @return A stargazer table with correct odd ratios, standard errors and p values
#' @export
#'
#
stargazer2 <- function(model, odd.ratio = TRUE, ...) {
  suppressMessages(library(stargazer))
  
  if(!("list" %in% class(model))) model <- list(model)
  
  if (odd.ratio) {
    coefOR2 <- lapply(model, function(x) exp(stats::coefficients(x)))
    seOR2 <- lapply(model, function(x) exp(stats::coefficients(x)) * summary(x)$coef[, 2])
    p2 <- lapply(model, function(x) summary(x)$coefficients[, 4])
    stargazer::stargazer(model, coef = coefOR2, se = seOR2, p = p2, type = "text", single.row = TRUE,
                         ci=TRUE, omit.stat=c("aic", "ll"), ...)
    
  } else {
    stargazer::stargazer(model, ...)
  }
}