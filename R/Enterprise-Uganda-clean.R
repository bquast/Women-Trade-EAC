# Women in East Africa
# Enterprise-Uganda-clean.R
# Bastiaan Quast
# bquast@gmail.com

# load library
library(haven)
library(dplyr)
library(labelled)

# load data
load(file = 'data/Enterprise/Uganda/Uganda-Enterprise-Imported.RData')

# check import
summary(Uganda_2006$j2a1)
summary(Uganda_2006$j2a2)
summary(Uganda_2006$j2b1)
summary(Uganda_2006$j2b2)

summary(Uganda_2013$l3a)
summary(Uganda_2013$l3b)
summary(Uganda_2013$l4a)
summary(Uganda_2013$l4b)
summary(Uganda_2013$l5a)
summary(Uganda_2013$l5b)

# filter negative values
Uganda_2006$j2a1[Uganda_2006$j2a1 < 0] <- NA
Uganda_2006$j2a2[Uganda_2006$j2a2 < 0] <- NA
Uganda_2006$j2b1[Uganda_2006$j2b1 < 0] <- NA
Uganda_2006$j2b2[Uganda_2006$j2b2 < 0] <- NA

Uganda_2013$l3a[Uganda_2013$l3a < 0] <- NA
Uganda_2013$l3b[Uganda_2013$l3b < 0] <- NA
Uganda_2013$l4a[Uganda_2013$l4a < 0] <- NA
Uganda_2013$l4b[Uganda_2013$l4b < 0] <- NA
Uganda_2013$l5a[Uganda_2013$l5a < 0] <- NA
Uganda_2013$l5b[Uganda_2013$l5b < 0] <- NA

# compute ratios 2013
Uganda_2006$female_share_nonprod <- with(Uganda_2006, j2b2 / j2a2)
Uganda_2006$female_share_prod <- with(Uganda_2006, j2b1 / j2a1)

Uganda_2013$female_share_prod <- with(Uganda_2013, l5a/(l4a + l4b))
Uganda_2013$female_share_nonprod <- Uganda_2013$l5b / Uganda_2013$l3b

# check computed ratios
summary(Uganda_2006$female_share_prod)
summary(Uganda_2006$female_share_nonprod)

summary(Uganda_2013$female_share_prod)
summary(Uganda_2013$female_share_nonprod)

# fix ratio
Uganda_2013$female_share_nonprod[Uganda_2013$female_share_nonprod > 1] <- NA

# create clear homogenous variable names
Uganda_2006$main_market <- to_factor(Uganda_2006$c5a)
Uganda_2006$international <- ifelse(Uganda_2006$main_market == 'International', TRUE, ifelse(Uganda_2006$main_market == 0, NA, FALSE))
Uganda_2006$capital_city <- ifelse(Uganda_2006$city == 'dar es salaam', TRUE, FALSE)
Uganda_2006$business_city <- Uganda_2006$capital_city
Uganda_2006$industry <- as.factor(ifelse(Uganda_2006$industry <= 10, 'Manufacturing', ifelse(Uganda_2006$industry > 10, 'Services', NA) ) )
Uganda_2006$multi_establ <- ifelse(Uganda_2006$multiest == 1, TRUE, FALSE)
Uganda_2006$intern_certif <- ifelse(Uganda_2006$e2b == 1, TRUE, FALSE)

Uganda_2013$main_market <- to_factor(Uganda_2013$e1)
Uganda_2013$international <- ifelse(Uganda_2013$main_market == 'International', TRUE, ifelse(Uganda_2013$main_market == 0, NA, FALSE))
Uganda_2013$capital_city <- ifelse(Uganda_2013$a3b == 1, TRUE, FALSE)
Uganda_2013$business_city <- ifelse(Uganda_2013$a3c == 1, TRUE, FALSE)
Uganda_2013$no_establishments <- Uganda_2013$a7a
Uganda_2013$multi_establ <- ifelse(Uganda_2013$no_establishments == 1, FALSE, TRUE)
Uganda_2013$intern_certif <- ifelse(Uganda_2013$b8 < 0, NA, ifelse(Uganda_2013$b8 == 1, TRUE, FALSE))
Uganda_2013$eac_exporter <- ifelse(Uganda_2013$d8 >= 2010, TRUE, FALSE)



# check distribution
hist(Uganda_2006$female_share_prod)
hist(Uganda_2006$female_share_nonprod)

hist(Uganda_2013$female_share_prod)
hist(Uganda_2013$female_share_nonprod)

# simplify industry
Uganda_2013$industry <- ifelse(Uganda_2013$a4b < 20, 'Agriculture', ifelse(Uganda_2013$a4b < 40, 'Manufacturing', 'Services') )

# merge Uganda 2006 data into 2013 data.frame
# Uganda0613 <- select(Uganda_2006, panelid, c5a, female_share_prod, female_share_nonprod)

# save
save.image(file = "data/Enterprise/Uganda/Uganda-Enterprise.RData")