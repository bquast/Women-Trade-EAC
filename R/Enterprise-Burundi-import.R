# Women in East Africa
# Enterprise-Burundi-import.R
# Bastiaan Quast
# bquast@gmail.com

# load library
library(haven)

# import Burundi enterprise
Burundi_2006 <- read_dta(file = "data/Enterprise/Burundi/Burundi-2006-Employees-full data-1.dta")
Burundi_2014 <- read_dta(file = "data/Enterprise/Burundi/Burundi-2014-full data.dta")
Burundi_2006_Micro <- read_dta(file = "data/Enterprise/Burundi/Burundi-2006-Micro-full data-1.dta")

# compute ratios
Burundi_2014$gender_ratio_nonprod <- Burundi_2014$l5b / Burundi_2014$l3b
Burundi_2014$gender_ratio_prod <- with(Burundi_2014, l5a/(l4a + l4b))

# save
save(Burundi_2006,
     Burundi_2014,
     Burundi_2006_Micro,
     file = "data/Enterprise/Burundi/Burundi-Enterprise.RData")

# load explore library
library(explore)

# explore data
explore(Burundi_2006)
explore(Burundi_2014)
explore(Burundi_2006_Micro)
