# Women in East Africa
# Enterprise-Burundi-import.R
# Bastiaan Quast
# bquast@gmail.com

# load library
library(haven)

# import Burundi enterprise
Burundi_2006 <- read_dta(file = "data/Enterprise/Burundi/Burundi-2006-Employees-full data-1.dta")
Burundi_2006_manu <- read_dta(file = "data/Enterprise/Burundi/Burundi2006_manufacturing_clean.dta")
Burundi_2014 <- read_dta(file = "data/Enterprise/Burundi/Burundi-2014-full data.dta")
Burundi_2006_Micro <- read_dta(file = "data/Enterprise/Burundi/Burundi-2006-Micro-full data-1.dta")

# compute ratios
Burundi_2014$female_share_nonprod <- Burundi_2014$l5b / Burundi_2014$l3b
Burundi_2014$female_share_prod <- with(Burundi_2014, l5a/(l4a + l4b))

# computer ratios 2006
Burundi_2006_manu$female_share_nonprod <- with(Burundi_2006_manu, j2b2 / j2a2)
Burundi_2006_manu$female_share_prod <- with(Burundi_2006_manu, j2b1 / j2a1)

# simplify industry
Burundi_2014$a4c <- ifelse(Burundi_2014$a4b < 20, 'Agriculture', ifelse(Burundi_2014$a4b < 40, 'Manufacturing', 'Services') )


# save
save(Burundi_2006,
     Burundi_2014,
     Burundi_2006_Micro,
     Burundi_2006_manu,
     file = "data/Enterprise/Burundi/Burundi-Enterprise.RData")

# load explore library
library(explore)

# explore data
explore(Burundi_2006)
explore(Burundi_2014)
explore(Burundi_2006_Micro)
