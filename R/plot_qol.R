#' Plot SF36
#' @rdname plot_qol
#' @name plot_qol
#' @export

plot_qol <- function(x,y){
  options(warn = -1)
  ggplot2::ggplot(data = nur1027functions::data, ggplot2::aes(x={{ x }}, y={{ y }})) +
  ggplot2::geom_point()
}
