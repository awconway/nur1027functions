library(tidyverse)
library(haven)
temp_logistic <- read_dta("~/OneDrive - University of Toronto/mild peri-procedural hypothermia/THERMISED observational study/data_4.2.15.dta")
temp_logistic <- temp_logistic %>% 
  select(ID, BMI, Hypothermic, Propofol_used, Sex, Height, Weight, ADMISSION_SOURCE,
         PREMED, ROOM_TEMP, MIDAZOLAM, FENTANYL, PROPOFOL, Time_theatre, Procedure_duration,
         Age, POST_TEMP_TIME) %>% 
  filter(!is.na(BMI))

use_data(temp_logistic, overwrite = TRUE)

model <- temp_logistic %>% 
glm(formula = Hypothermic ~ Propofol_used,family = "binomial")

tidy <- broom::tidy(model)

tidy <- tidy %>% 
  mutate(oddsratio= exp(estimate))


confint <- confint(model) %>% 
  exp

tidy <- cbind(tidy, confint)
tidy


model <- temp_logistic %>% 
  glm(formula = Hypothermic ~ BMI,family = "binomial")

tidy <- broom::tidy(model)

tidy <- tidy %>% 
  mutate(oddsratio= exp(estimate))


confint <- confint(model) %>% 
  exp

tidy <- cbind(tidy, confint)
tidy

model <- temp_logistic %>% 
  glm(formula = Hypothermic ~ Propofol_used + BMI,family = "binomial")

tidy <- broom::tidy(model)

tidy <- tidy %>% 
  mutate(oddsratio= exp(estimate))


confint <- confint(model) %>% 
  exp

tidy <- cbind(tidy, confint)
tidy
temp_logistic$pro
ggplot(temp_logistic, aes(x = BMI, y=Hypothermic))+
  geom_jitter(width = 0, height = 0.05, alpha = 0.3)+
  theme_minimal(
    
  )
