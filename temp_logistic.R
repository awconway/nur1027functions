
table <- data.frame(colnames(temp_logistic), Definition=c("Study ID",
                                                          "Body mass index",
                                                          "Outcome variable - temp <36°C",
                                                          "Use of propofol for sedation",
                                                          "Male or Female",
                                                          "Height in cm",
                                                          "Weight in kg",
                                                          "Inpatient or outpatient",
                                                          "Received oral sedative premedication before procedure",
                                                          "Room temperature in degrees Celsius",
                                                          "Total dose of midazolam",
                                                          "Total dose of fentanyl",
                                                          "Total dose of propofol",
                                                          "Total time in cath lab",
                                                          "Procedure duration",
                                                          "Age in years",
                                                          "Time of day that outcome variable 'hypothermia' was measured")) %>% 
  rename("Variable" = colnames.temp_logistic.) %>% 
  gt::gt() %>% 
  gt::cols_align(align = "left")

gt::gtsave(table, "table.png")