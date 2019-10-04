#' Plot SF36
#' @rdname plot_ci
#' @name plot_ci
#' @export

plot_ci <- function(dots, shade){
  suppressMessages(library(tidyverse))
  library(nur1027functions)
  library(infer)
  library(dabestr)
  options(warn = -1)
  
  sample_mean_diff <- data %>% 
    specify(GH ~ depressed) %>%
    calculate(stat = "diff in means", 
              order = c("depressed", "not depressed"))
  
  unpaired_mean_diff <- dabestr::dabest(data, depressed, GH,
                                        idx = c("not depressed", "depressed"),
                                        paired = FALSE, reps = 1000, seed = 272)
  
  bootstaps <- data.frame(stat = c(unlist(unpaired_mean_diff$result$bootstraps))) 
  
  bootstaps%>% 
    ggplot2::ggplot(aes(stat)) +
    geom_dotplot(binwidth=1.2, method='histodot', colour = "white", fill = {{dots}}, alpha=0.3) +
    scale_y_continuous(limits = c(0,1))+
    theme_minimal()+
    geom_vline(xintercept = 0, size = 1, color = "black")+
    labs(x = "Difference in mean score between groups", y = NULL, title = "")+
    geom_vline(xintercept = sample_mean_diff$stat, size = 1, color = "red", linetype = "dashed" )+
    annotate("rect", xmin = sample_mean_diff$stat, xmax = unpaired_mean_diff$result$bca_ci_high, ymin = 0, ymax = Inf,
             alpha = .2, fill = {{shade}}) +
    annotate("rect", xmin = unpaired_mean_diff$result$bca_ci_low, xmax = sample_mean_diff$stat, ymin = 0, ymax = Inf,
             alpha = .2, fill = {{shade}}) +
    geom_errorbarh(aes(y = 0.8, xmax = unpaired_mean_diff$result$bca_ci_high, xmin = unpaired_mean_diff$result$bca_ci_low, height = .2))+
    annotate(geom = "text", x = unpaired_mean_diff$result$bca_ci_high, y = 0.93, label = round(unpaired_mean_diff$result$bca_ci_high, 1), hjust = "center", size = 5)+
    annotate(geom = "text", x = unpaired_mean_diff$result$bca_ci_low, y = 0.93, label = round(unpaired_mean_diff$result$bca_ci_low, 1), hjust = "center", size = 5)
  
}