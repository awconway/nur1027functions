
#' Returns burnout plot
#' 
#' 
#'  @name plot_burnout
#' @rdname plot_burnout

#' @export
plot_burnout <- function(x, y){
library(ggplot2)
ggplot(dataset, aes(x = {{x}}, y= {{y}}))+
  geom_point()+
  theme_minimal()+
  theme_bw() + 
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())+
  geom_hline(yintercept=mean({{y}}),linetype="dashed", color = "gray", size = 1) +
  geom_segment(aes(x=dataset[1,2], xend=dataset[1,2], y=dataset[1,1], yend=mean({{y}})))+
  geom_segment(aes(x=dataset[2,2], xend=dataset[2,2], y=dataset[2,1], yend=mean({{y}})))+
  geom_segment(aes(x=dataset[3,2], xend=dataset[3,2], y=dataset[3,1], yend=mean({{y}})))+
  geom_segment(aes(x=dataset[4,2], xend=dataset[4,2], y=dataset[4,1], yend=mean({{y}})))+
  geom_segment(aes(x=dataset[5,2], xend=dataset[5,2], y=dataset[5,1], yend=mean({{y}})))+
  geom_segment(aes(x=dataset[6,2], xend=dataset[6,2], y=dataset[6,1], yend=mean({{y}})))+
  geom_rect(aes(ymin=mean({{y}})-sd({{y}}), ymax=mean({{y}})+sd({{y}}), xmin=0, xmax=Inf), alpha = 0.05, fill="#FF6666")+
  geom_hline(yintercept=mean({{y}})-sd({{y}}), color = "#FF6666", size = 1) +
  geom_hline(yintercept=mean({{y}})+sd({{y}}), color = "#FF6666", size = 1)+
  annotate("text", colour = "white", size = 4, x = dataset[6,2], y = 108, label = "mean = 106")
}