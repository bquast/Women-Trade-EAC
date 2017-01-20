# Women in East Africa
# Enterprise-Kenya-import.R
# Bastiaan Quast
# bquast@gmail.com

# load library
library(haven)
library(dplyr)

# import Kenya enterprise
Kenya_2007 <- read_dta(file = "data/Enterprise/Kenya/Kenya-2007--full data-1.dta")
Kenya_2013 <- read_dta(file = "data/Enterprise/Kenya/Kenya-2013-full data.dta")
Kenya_2007_Micro <- read_dta(file = "data/Enterprise/Kenya/Kenya_2007_cleanmicro.dta")
Kenya_2013_Micro <- read_dta(file = "data/Enterprise/Kenya/Kenya_Micro-2013-full data.dta")

# compute ratios 2013
Kenya_2013$gender_ratio_nonprod <- Kenya_2013$l5b / Kenya_2013$l3b
Kenya_2013$gender_ratio_prod <- with(Kenya_2013, l5a/(l4a + l4b))

# computer ratios 2007
Kenya_2007$gender_ratio_nonprod <- with(Kenya_2007, j2b2 / j2a2)
Kenya_2007$gender_ratio_prod <- with(Kenya_2007, j2b1 / j2a1)

# merge Kenya 2007 data into 2013 data.frame
ken07 <- select(Kenya_2007, panelid, c5a, gender_ratio_prod, gender_ratio_nonprod)

# save
save(Kenya_2007,
     Kenya_2013,
     Kenya_2007_Micro,
     Kenya_2013_Micro,
     file = "data/Enterprise/Kenya/Kenya-Enterprise.RData")

# load explore library
library(explore)

# explore data
explore(Kenya_2007)
explore(Kenya_2013)
explore(Kenya_2007_Micro)
explore(Kenya_2013_Micro)

