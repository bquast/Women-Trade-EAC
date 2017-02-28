# Women in East Africa
# Enterprise-Rwanda-import.R
# Bastiaan Quast
# bquast@gmail.com

# load library
library(haven)
library(dplyr)

# import Rwanda enterprise
Rwanda_2006 <- read_dta(file = "data/Enterprise/Rwanda/Rwanda2006_manufacturing_clean.dta")
Rwanda_2011 <- read_dta(file = "data/Enterprise/Rwanda/Rwanda-2011-full data-.dta")

# save
save(Rwanda_2006,
     Rwanda_2011,
     file = "data/Enterprise/Rwanda/Rwanda-Enterprise-Imported.RData")

# load explore library
library(explore)

# explore data
explore(Rwanda_2006)
explore(Rwanda_2011)
explore(Rwanda_2006_Micro)
explore(Rwanda_2011_Micro)
