# Women in East Africa
# Enterprise-Kenya-import.R
# Bastiaan Quast
# bquast@gmail.com

# load library
library(haven)
library(dplyr)
library(readr)

# import Kenya enterprise
Kenya_2007 <- read_dta(file = "data/Enterprise/Kenya/Kenya-2007--full data-1.dta")
Kenya_2013 <- read_dta(file = "data/Enterprise/Kenya/Kenya-2013-full data.dta")

# save
save(Kenya_2007,
     Kenya_2013,
     file = "data/Enterprise/Kenya/Kenya-Enterprise-Imported.RData")
