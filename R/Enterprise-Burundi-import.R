# Women in East Africa
# Enterprise-Burundi-import.R
# Bastiaan Quast
# bquast@gmail.com

# load library
library(haven)

# import Burundi enterprise
Burundi_2006 <- read_dta(file = "data/Enterprise/Burundi/Burundi2006_manufacturing_clean.dta")
Burundi_2014 <- read_dta(file = "data/Enterprise/Burundi/Burundi-2014-full data.dta")

# save
save(Burundi_2006,
     Burundi_2014,
     file = "data/Enterprise/Burundi/Burundi-Enterprise-Imported.RData")

