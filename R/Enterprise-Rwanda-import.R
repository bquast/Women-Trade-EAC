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

# eliminate negatives
# l1
# l5
# j2b2
# j2a2
# j2b1
# j2a1

# compute ratios 2011
Rwanda_2011$female_share <- Rwanda_2011$l5 / Rwanda_2011$l1

# computer ratios 2006
Rwanda_2006$female_share_nonprod <- with(Rwanda_2006, j2b2 / j2a2)
Rwanda_2006$female_share_prod <- with(Rwanda_2006, j2b1 / j2a1)

# simplify industry
Rwanda_2011$a4c <- ifelse(Rwanda_2011$a4b < 20, 'Agriculture', ifelse(Rwanda_2011$a4b < 40, 'Manufacturing', 'Services') )

# save
save(Rwanda_2006,
     Rwanda_2011,
     file = "data/Enterprise/Rwanda/Rwanda-Enterprise.RData")

# load explore library
library(explore)

# explore data
explore(Rwanda_2006)
explore(Rwanda_2011)
explore(Rwanda_2006_Micro)
explore(Rwanda_2011_Micro)

