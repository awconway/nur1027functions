#' Plot linear regression model
#' @rdname corrPlot
#' @name corrPlot
#' @export

corrPlot <- function(x,y){
  options(warn = -1)
  p <- ggplot2::ggplot(data = data, ggplot2::aes(x={{ x }}, y={{ y }})) +
    ggplot2::geom_point()+
    ggplot2::annotate(geom = "text", x=50, y=22, 
                      label="Pearson's correlation = -0.75; p<0.001", 
                      colour = "Red") +
    ggplot2::geom_smooth()+
    ggplot2::scale_x_continuous(limits = c(15, 75), expand = c(0, 0))+
    ggplot2::scale_y_continuous(limits = c(-2, 30), expand = c(0, 0))
  suppressMessages(print(p))
}