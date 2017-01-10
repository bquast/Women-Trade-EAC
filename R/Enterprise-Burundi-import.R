# import.R
# Women in East Africa
# Bastiaan Quast
# bquast@gmail.com

# load library
library(haven)

# import Burundi enterprise
Burundi_2006 <- read_dta(file = "data/Enterprise/Burundi/Burundi-2006-Employees-full data-1.dta")
Burundi_2014 <- read_dta(file = "data/Enterprise/Burundi/Burundi-2014-full data.dta")
Burundi_2006_Micro <- read_dta(file = "data/Enterprise/Burundi/Burundi-2006-Micro-full data-1.dta")

# save
save.image(Burundi_2006, Burundi_2014, Burundi_2006_Micro, file = "data/Enterprise/Burundi/Burundi-Enterprise.RData")

# load explore library
library(explore)

# explore data
explore(Burundi_2006)
explore(Burundi_2014)
explore(Burundi_2006_Micro)
