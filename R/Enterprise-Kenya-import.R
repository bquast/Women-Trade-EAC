# Women in East Africa
# Enterprise-Kenya-import.R
# Bastiaan Quast
# bquast@gmail.com

# load library
library(haven)

# import Kenya enterprise
Kenya_2007 <- read_dta(file = "data/Enterprise/Kenya/Kenya-2007--full data-1.dta")
Kenya_2013 <- read_dta(file = "data/Enterprise/Kenya/Kenya-2013-full data.dta")
Kenya_2007_Micro <- read_dta(file = "data/Enterprise/Kenya/Kenya_2007_cleanmicro.dta")
Kenya_2013_Micro <- read_dta(file = "data/Enterprise/Kenya/Kenya_Micro-2013-full data.dta")

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
