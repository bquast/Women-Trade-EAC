# Women in East Africa
# Enterprise-Kenya-clean.R
# Bastiaan Quast
# bquast@gmail.com

# load library
library(haven)
library(dplyr)
library(labelled)

# load data
load(file = 'data/Enterprise/Kenya/Kenya-Enterprise-Imported.RData')

# check import
summary(Kenya_2007$j2a1)
summary(Kenya_2007$j2a2)
summary(Kenya_2007$j2b1)
summary(Kenya_2007$j2b2)

summary(Kenya_2013$l3a)
summary(Kenya_2013$l3b)
summary(Kenya_2013$l4a)
summary(Kenya_2013$l4b)
summary(Kenya_2013$l5a)
summary(Kenya_2013$l5b)

# filter negative values
Kenya_2007$j2b2[Kenya_2007$j2b2 < 0] <- NA

Kenya_2013$l3a[Kenya_2013$l3a < 0] <- NA
Kenya_2013$l3b[Kenya_2013$l3b < 0] <- NA
Kenya_2013$l4a[Kenya_2013$l4a < 0] <- NA
Kenya_2013$l4b[Kenya_2013$l4b < 0] <- NA
Kenya_2013$l5a[Kenya_2013$l5a < 0] <- NA
Kenya_2013$l5b[Kenya_2013$l5b < 0] <- NA

# compute ratios 2013
Kenya_2007$female_share_nonprod <- with(Kenya_2007, j2b2 / j2a2)
Kenya_2007$female_share_prod <- with(Kenya_2007, j2b1 / j2a1)

Kenya_2013$female_share_prod <- with(Kenya_2013, l5a/(l4a + l4b))
Kenya_2013$female_share_nonprod <- Kenya_2013$l5b / Kenya_2013$l3b

# check computed ratios
summary(Kenya_2007$female_share_prod)
summary(Kenya_2007$female_share_nonprod)

summary(Kenya_2013$female_share_prod)
summary(Kenya_2013$female_share_nonprod)

# create clear homogenous variable names
Kenya_2007$main_market <- to_factor(Kenya_2007$c5a)
Kenya_2007$international <- ifelse(Kenya_2007$main_market == 'International', TRUE, ifelse(Kenya_2007$main_market == 0, NA, FALSE))
Kenya_2007$capital_city <- ifelse(Kenya_2007$city == 'Nairobi', TRUE, FALSE)
Kenya_2007$business_city <- Kenya_2007$capital_city
Kenya_2007$industry <- as.factor(ifelse(Kenya_2007$industry <= 10, 'Manufacturing', ifelse(Kenya_2007$industry > 10, 'Services', NA) ) )
Kenya_2007$multi_establ <- ifelse(Kenya_2007$multiest == 1, TRUE, FALSE)
Kenya_2007$intern_certif <- ifelse(Kenya_2007$e2b == 1, TRUE, FALSE)

Kenya_2013$main_market <- to_factor(Kenya_2013$e1)
Kenya_2013$international <- ifelse(Kenya_2013$main_market == 'International', TRUE, ifelse(Kenya_2013$main_market == 0, NA, FALSE))
Kenya_2013$capital_city <- ifelse(Kenya_2013$a3b == 1, TRUE, FALSE)
Kenya_2013$business_city <- ifelse(Kenya_2013$a3c == 1, TRUE, FALSE)
Kenya_2013$no_establishments <- Kenya_2013$a7a
Kenya_2013$multi_establ <- ifelse(Kenya_2013$no_establishments == 1, FALSE, TRUE)
Kenya_2013$intern_certif <- ifelse(Kenya_2013$b8 < 0, NA, ifelse(Kenya_2013$b8 == 1, TRUE, FALSE))
Kenya_2013$eac_exporter <- ifelse(Kenya_2013$d8 >= 2010, TRUE, FALSE)
Kenya_2013$industry <- as.factor(Kenya_2013$industry)
Kenya_2013$female_owner <- ifelse(Kenya_2013$b4 == 2, TRUE, ifelse(Kenya_2013$b4 == 1, FALSE, NA))
Kenya_2013$female_ownership <- ifelse(Kenya_2013$b4a < 0, NA, Kenya_2013$b4a/100)

# filter NAs
Kenya_2013$intern_certif[is.na(Kenya_2013$intern_certif)] <- FALSE
Kenya_2013$international[is.na(Kenya_2013$international)] <- FALSE
# Kenya_2013$eac_exporter[is.na(Kenya_2013$eac_exporter)] <- FALSE

# check distribution
hist(Kenya_2007$female_share_prod)
hist(Kenya_2007$female_share_nonprod)

hist(Kenya_2013$female_share_prod)
hist(Kenya_2013$female_share_nonprod)

# simplify industry
Kenya_2013$industry <- ifelse(Kenya_2013$a4b < 20, 'Agriculture', ifelse(Kenya_2013$a4b < 40, 'Manufacturing', 'Services') )

# merge Kenya 2007 data into 2013 data.frame
Kenya0713 <- select(Kenya_2007, panelid, c5a, female_share_prod, female_share_nonprod)

# save
save.image(file = "data/Enterprise/Kenya/Kenya-Enterprise.RData")
