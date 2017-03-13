# Women in East Africa
# Enterprise-Rwanda-import.R
# Bastiaan Quast
# bquast@gmail.com

# load library
library(haven)
library(dplyr)
library(readr)

# import Rwanda enterprise
Rwanda_2006 <- read_dta(file = "data/Enterprise/Rwanda/Rwanda2006_manufacturing_clean.dta")
Rwanda_2011 <- read_dta(file = "data/Enterprise/Rwanda/Rwanda-2011-full data-.dta")

Rwanda_WITS <- read_delim("~/Women-Trade-EAC/data/WITS/Rwanda.csv", 
                            ",", escape_double = FALSE, trim_ws = TRUE)

# save
save(Rwanda_2006,
     Rwanda_2011,
     Rwanda_WITS,
     file = "data/Enterprise/Rwanda/Rwanda-Enterprise-Imported.RData")
