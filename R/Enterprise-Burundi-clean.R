# Women in East Africa
# Enterprise-Burundi-clean.R
# Bastiaan Quast
# bquast@gmail.com

# load library
library(haven)
library(dplyr)
library(labelled)

# load data
load(file = 'data/Enterprise/Burundi/Burundi-Enterprise-Imported.RData')

# check import
summary(Burundi_2006$j2a1)
summary(Burundi_2006$j2a2)
summary(Burundi_2006$j2b1)
summary(Burundi_2006$j2b2)

summary(Burundi_2014$l3a)
summary(Burundi_2014$l3b)
summary(Burundi_2014$l4a)
summary(Burundi_2014$l4b)
summary(Burundi_2014$l5a)
summary(Burundi_2014$l5b)

# filter negative values
Burundi_2014$d8[Burundi_2014$d8 < 0] <- NA

# compute ratios 2014
Burundi_2006$female_share_nonprod <- with(Burundi_2006, j2b2 / j2a2)
Burundi_2006$female_share_prod <- with(Burundi_2006, j2b1 / j2a1)

Burundi_2014$female_share_prod <- with(Burundi_2014, l5a/(l4a + l4b))
Burundi_2014$female_share_nonprod <- Burundi_2014$l5b / Burundi_2014$l3b

# check computed ratios
summary(Burundi_2006$female_share_prod)
summary(Burundi_2006$female_share_nonprod)

summary(Burundi_2014$female_share_prod)
summary(Burundi_2014$female_share_nonprod)

# create clear homogenous variable names
Burundi_2006$main_market <- to_factor(Burundi_2006$c5a)
Burundi_2006$international <- ifelse(Burundi_2006$main_market == 'International', TRUE, ifelse(Burundi_2006$main_market == 0, NA, FALSE))
Burundi_2006$capital_city <- ifelse(Burundi_2006$city == 'Bujumbura', TRUE, FALSE)
Burundi_2006$business_city <- Burundi_2006$capital_city
Burundi_2006$manufacturing <- ifelse(Burundi_2006$industry <= 10, TRUE, ifelse(Burundi_2006$industry > 10, FALSE, NA) )
Burundi_2006$multi_establ <- ifelse(Burundi_2006$multiest == 1, TRUE, FALSE)
Burundi_2006$intern_certif <- ifelse(Burundi_2006$e2b == 1, TRUE, FALSE)

Burundi_2014$main_market <- to_factor(Burundi_2014$e1)
Burundi_2014$international <- ifelse(Burundi_2014$main_market == 'International', TRUE, ifelse(Burundi_2014$main_market == 0, NA, FALSE))
Burundi_2014$capital_city <- ifelse(Burundi_2014$a3c == 1, TRUE, FALSE)
Burundi_2014$business_city <- ifelse(Burundi_2014$a3c == 1, TRUE, FALSE)
Burundi_2014$no_establishments <- ifelse(!is.na(Burundi_2014$a7a), Burundi_2014$a7a, 1)
Burundi_2014$multi_establ <- ifelse(Burundi_2014$no_establishments <= 1, FALSE, TRUE)
Burundi_2014$intern_certif <- ifelse(Burundi_2014$b8 < 0, NA, ifelse(Burundi_2014$b8 == 1, TRUE, FALSE))
Burundi_2014$eac_exporter <- ifelse(Burundi_2014$d8 >= 2010, TRUE, FALSE)
Burundi_2014$eac_exporter[is.na(Burundi_2014$eac_exporter)] <- FALSE

# check distribution
hist(Burundi_2006$female_share_prod)
hist(Burundi_2006$female_share_nonprod)

hist(Burundi_2014$female_share_prod)
hist(Burundi_2014$female_share_nonprod)

# simplify industry
Burundi_2014$industry <- ifelse(Burundi_2014$a4b < 20, 'Agriculture', ifelse(Burundi_2014$a4b < 40, 'Manufacturing', 'Services') )

# merge Burundi 2006 data into 2014 data.frame
# Burundi0614 <- select(Burundi_2006, panelid, c5a, female_share_prod, female_share_nonprod)

# save
save.image(file = "data/Enterprise/Burundi/Burundi-Enterprise.RData")
