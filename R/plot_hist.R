#' Plot linear regression model
#' @rdname plot_hist
#' @name plot_hist
#' @export

plot_hist <- function(N){
  suppressMessages(library(ggplot2))
  options(warn = -1)
  m <- do.call(rbind, lapply(1:1000, function(x) mean(rnorm(N, 10, 2))))
  m <- as.data.frame(m)
  colnames(m) <- "Height"
  ggplot(data = m, aes(x = Height)) +
    geom_histogram(binwidth = 0.1, color = "white", fill="green3") +
    theme_light() +
    scale_y_continuous(expand = c(0,0)) +
    xlim(5,15) + 
    labs(x=paste0("Sample means N = ", N), y="Frequency") +
    theme(panel.border=element_blank(), panel.grid.minor=element_blank())  
}