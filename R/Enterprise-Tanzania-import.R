# Women in East Africa
# Enterprise-Tanzania-import.R
# Bastiaan Quast
# bquast@gmail.com

# load library
library(haven)
library(dplyr)

# import Tanzania enterprise
Tanzania_2006 <- read_dta(file = "data/Enterprise/Tanzania/Tanzania2006_manufacturing_clean.dta")
Tanzania_2013 <- read_dta(file = "data/Enterprise/Tanzania/Tanzania-2013-full data.dta")

# save
save(Tanzania_2006,
     Tanzania_2013,
     file = "data/Enterprise/Tanzania/Tanzania-Enterprise-Imported.RData")
