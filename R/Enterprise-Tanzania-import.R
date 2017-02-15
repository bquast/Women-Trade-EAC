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

# compute ratios 2013
Tanzania_2013$female_share_nonprod <- Tanzania_2013$l5b / Tanzania_2013$l3b
Tanzania_2013$female_share_prod <- with(Tanzania_2013, l5a/(l4a + l4b))
Tanzania_2013$female_share_nonprod <- ifelse(Tanzania_2013$female_share_nonprod == -Inf, NA, Tanzania_2013$female_share_nonprod)

# computer ratios 2006
Tanzania_2006$female_share_nonprod <- with(Tanzania_2006, j2b2 / j2a2)
Tanzania_2006$female_share_prod <- with(Tanzania_2006, j2b1 / j2a1)

# simplify industry
Tanzania_2013$a4c <- ifelse(Tanzania_2013$a4b < 20, 'Agriculture', ifelse(Tanzania_2013$a4b < 40, 'Manufacturing', 'Services') )


# merge Tanzania 2006 data into 2013 data.frame
ken07 <- select(Tanzania_2006, panelid, c5a, female_share_prod, female_share_nonprod)

# save
save(Tanzania_2006,
     Tanzania_2013,
     file = "data/Enterprise/Tanzania/Tanzania-Enterprise.RData")

# load explore library
library(explore)

# explore data
explore(Tanzania_2006)
explore(Tanzania_2013)
explore(Tanzania_2006_Micro)
explore(Tanzania_2013_Micro)

