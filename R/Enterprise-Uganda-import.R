# Women in East Africa
# Enterprise-Uganda-import.R
# Bastiaan Quast
# bquast@gmail.com

# load library
library(haven)
library(dplyr)
library(readr)

# import Uganda enterprise
Uganda_2006 <- read_dta(file = "data/Enterprise/Uganda/Uganda2006_manufacturing_clean.dta")
Uganda_2013 <- read_dta(file = "data/Enterprise/Uganda/Uganda-2013-full data.dta")

Uganda_WITS <- read_delim("~/Women-Trade-EAC/data/WITS/Uganda.csv", 
                            ",", escape_double = FALSE, trim_ws = TRUE)


# save
save(Uganda_2006,
     Uganda_2013,
     file = "data/Enterprise/Uganda/Uganda-Enterprise-Imported.RData")
