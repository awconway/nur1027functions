library(readxl)

library(tidyverse)
transplant <- read_excel("/Users/aaronconway/OneDrive - University of Toronto/Transplant/ihbi ecr grant/Screening tools/Heart_transplant_DEPRESSD_Conway.xlsx")
transplant <- transplant %>% 
  select(ID, contains("PHQ"), contains("SF"), Major_dep_currrent, Major_dep_rec) %>% 
  select(-ends_with("PHQ10"))

transplant <- transplant %>%
  mutate(PHQ9total = rowSums(.[grep("PHQ", names(.))], na.rm = TRUE))

transplant <- transplant %>% 
  mutate(SF36total = rowSums(.[grep("SF36", names(.))], na.rm = TRUE))

library(lbscorer)
SFscored <- sf36(SF36)
SFscored$PHQ9 <- transplant$PHQ9total
SFscored$ID <- transplant$ID
data <- SFscored


transplant <- transplant %>% 
  mutate(depressed = if_else(Major_dep_currrent==1|Major_dep_rec==1, "depressed", "not depressed"))
data$depressed <- transplant$depressed
data
