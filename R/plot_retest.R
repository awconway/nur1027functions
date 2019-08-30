#' Plot temperatures
#'
#' @return Line plot
#' @param x x axis
#' @param y y axis
#' 
#' @name plot_retest
#' @rdname plot_retest
#' 
#' @examples 
#' plot(x=time, y=temp)
#' 
#' 
#' @export
plot_retest <- function(x,y){
ggplot2::ggplot(data = retest::temperature, ggplot2::aes(x = {{x}}, y = {{ y }}, group = ID)) + 
  ggplot2::geom_line(ggplot2::aes(colour=ID), show.legend=F) + 
    ggplot2::labs(x="Measurement", y="Temperature") + ggplot2::theme_bw() + 
    ggplot2::theme(panel.border = ggplot2::element_blank(),  
        panel.grid.major = ggplot2::element_blank(), 
        panel.grid.minor = ggplot2::element_blank(), 
        axis.line = ggplot2::element_line(colour = "black"))
}
