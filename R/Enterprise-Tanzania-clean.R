# Women in East Africa
# Enterprise-Tanzania-clean.R
# Bastiaan Quast
# bquast@gmail.com

# load library
library(haven)
library(dplyr)
library(labelled)

# load data
load(file = 'data/Enterprise/Tanzania/Tanzania-Enterprise-Imported.RData')

# check import
summary(Tanzania_2006$j2a1)
summary(Tanzania_2006$j2a2)
summary(Tanzania_2006$j2b1)
summary(Tanzania_2006$j2b2)

summary(Tanzania_2013$l3a)
summary(Tanzania_2013$l3b)
summary(Tanzania_2013$l4a)
summary(Tanzania_2013$l4b)
summary(Tanzania_2013$l5a)
summary(Tanzania_2013$l5b)

# filter negative values
Tanzania_2006$j2a1[Tanzania_2006$j2a1 < 0] <- NA
Tanzania_2006$j2a2[Tanzania_2006$j2a2 < 0] <- NA
Tanzania_2006$j2b1[Tanzania_2006$j2b1 < 0] <- NA
Tanzania_2006$j2b2[Tanzania_2006$j2b2 < 0] <- NA

Tanzania_2013$l3a[Tanzania_2013$l3a < 0] <- NA
Tanzania_2013$l3b[Tanzania_2013$l3b < 0] <- NA
Tanzania_2013$l4a[Tanzania_2013$l4a < 0] <- NA
Tanzania_2013$l4b[Tanzania_2013$l4b < 0] <- NA
Tanzania_2013$l5a[Tanzania_2013$l5a < 0] <- NA
Tanzania_2013$l5b[Tanzania_2013$l5b < 0] <- NA

# compute ratios 2013
Tanzania_2006$female_share_prod <- with(Tanzania_2006, j2b1 / j2a1)
Tanzania_2006$female_share_nonprod <- with(Tanzania_2006, j2b2 / j2a2)

Tanzania_2013$female_share_prod <- with(Tanzania_2013, l5a/(l4a + l4b))
Tanzania_2013$female_share_nonprod <- Tanzania_2013$l5b / Tanzania_2013$l3b

# check computed ratios
summary(Tanzania_2006$female_share_prod)
summary(Tanzania_2006$female_share_nonprod)

summary(Tanzania_2013$female_share_prod)

# fix ratio
Tanzania_2013$female_share_nonprod[Tanzania_2013$female_share_nonprod > 1] <- NA

# check ratio again
summary(Tanzania_2013$female_share_nonprod)

# check distribution
hist(Tanzania_2006$female_share_prod)
hist(Tanzania_2006$female_share_nonprod)

hist(Tanzania_2013$female_share_prod)
hist(Tanzania_2013$female_share_nonprod)

# create clear homogenous variable names
Tanzania_2006$main_market <- to_factor(Tanzania_2006$c5a)
Tanzania_2006$international <- ifelse(Tanzania_2006$main_market == 'International', TRUE, ifelse(Tanzania_2006$main_market == 0, NA, FALSE))
Tanzania_2006$capital_city <- ifelse(Tanzania_2006$city == 'dar es salaam', TRUE, FALSE)
Tanzania_2006$business_city <- Tanzania_2006$capital_city
Tanzania_2006$industry <- as.factor(ifelse(Tanzania_2006$industry <= 10, 'Manufacturing', ifelse(Tanzania_2006$industry > 10, 'Services', NA) ) )
Tanzania_2006$multi_establ <- ifelse(Tanzania_2006$multiest == 1, TRUE, FALSE)
Tanzania_2006$intern_certif <- ifelse(Tanzania_2006$e2b == 1, TRUE, FALSE)

Tanzania_2013$main_market <- to_factor(Tanzania_2013$e1)
Tanzania_2013$international <- ifelse(Tanzania_2013$main_market == 'International', TRUE, ifelse(Tanzania_2013$main_market == 0, NA, FALSE))
Tanzania_2013$capital_city <- ifelse(Tanzania_2013$a3b == 1, TRUE, FALSE)
Tanzania_2013$business_city <- ifelse(Tanzania_2013$a3c == 1, TRUE, FALSE)
Tanzania_2013$no_establishments <- Tanzania_2013$a7a
Tanzania_2013$multi_establ <- ifelse(Tanzania_2013$no_establishments == 1, FALSE, TRUE)
Tanzania_2013$intern_certif <- ifelse(Tanzania_2013$b8 < 0, NA, ifelse(Tanzania_2013$b8 == 1, TRUE, FALSE))
Tanzania_2013$eac_exporter <- ifelse(Tanzania_2013$d8 >= 2010, TRUE, FALSE)
Tanzania_2013$Industry <- to_factor(Tanzania_2013$a4a)
Tanzania_2013$female_owner <- ifelse(Tanzania_2013$b4 == 2, TRUE, ifelse(Tanzania_2013$b4 == 1, FALSE, NA))
Tanzania_2013$female_ownership <- ifelse(Tanzania_2013$b4a < 0, NA, Tanzania_2013$b4a/100)

# missing values to FALSE
Tanzania_2013$international[is.na(Tanzania_2013$international)] <- FALSE
Tanzania_2013$intern_certif[is.na(Tanzania_2013$intern_certif)] <- FALSE
Tanzania_2013$eac_exporter[is.na(Tanzania_2013$eac_exporter)] <- FALSE

# merge Tanzania 2006 data into 2013 data.frame
# Tanzania0713 <- select(Tanzania_2006, panelid, c5a, female_share_prod, female_share_nonprod)

# WITS data
Tanzania_WITS$Industry <- as.factor(Tanzania_WITS$Industry)
Tanzania_2013t <- merge(Tanzania_2013, Tanzania_WITS, by='Industry')

# save
save.image(file = "data/Enterprise/Tanzania/Tanzania-Enterprise.RData")
