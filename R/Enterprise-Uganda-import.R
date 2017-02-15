# Women in East Africa
# Enterprise-Uganda-import.R
# Bastiaan Quast
# bquast@gmail.com

# load library
library(haven)
library(dplyr)

# import Uganda enterprise
Uganda_2006 <- read_dta(file = "data/Enterprise/Uganda/Uganda2006_manufacturing_clean.dta")
Uganda_2013 <- read_dta(file = "data/Enterprise/Uganda/Uganda-2013-full data.dta")

# compute ratios 2013
Uganda_2013$female_share_nonprod <- Uganda_2013$l5b / Uganda_2013$l3b
Uganda_2013$female_share_prod <- with(Uganda_2013, l5a/(l4a + l4b))
Uganda_2013$female_share_nonprod <- ifelse(Uganda_2013$female_share_nonprod == -Inf, NA, Uganda_2013$female_share_nonprod)

# computer ratios 2006
Uganda_2006$female_share_nonprod <- with(Uganda_2006, j2b2 / j2a2)
Uganda_2006$female_share_prod <- with(Uganda_2006, j2b1 / j2a1)

# simplify industry
Uganda_2013$a4c <- ifelse(Uganda_2013$a4b < 20, 'Agriculture', ifelse(Uganda_2013$a4b < 40, 'Manufacturing', 'Services') )

# save
save(Uganda_2006,
     Uganda_2013,
     file = "data/Enterprise/Uganda/Uganda-Enterprise.RData")

# load explore library
library(explore)

# explore data
explore(Uganda_2006)
explore(Uganda_2013)
explore(Uganda_2006_Micro)
explore(Uganda_2013_Micro)

