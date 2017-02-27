# Women in East Africa
# Enterprise-Rwanda-clean.R
# Bastiaan Quast
# bquast@gmail.com

# load library
library(haven)
library(dplyr)
library(labelled)

# load data
load(file = 'data/Enterprise/Rwanda/Rwanda-Enterprise-Imported.RData')

# check import
summary(Rwanda_2006$j2a1)
summary(Rwanda_2006$j2a2)
summary(Rwanda_2006$j2b1)
summary(Rwanda_2006$j2b2)

summary(Rwanda_2011$l3a)
summary(Rwanda_2011$l3b)
summary(Rwanda_2011$l4a)
summary(Rwanda_2011$l4b)
summary(Rwanda_2011$l5a)
summary(Rwanda_2011$l5b)

# filter negative values
Rwanda_2006$j2b2[Rwanda_2006$j2b2 < 0] <- NA

Rwanda_2011$l3a[Rwanda_2011$l3a < 0] <- NA
Rwanda_2011$l3b[Rwanda_2011$l3b < 0] <- NA
Rwanda_2011$l4a[Rwanda_2011$l4a < 0] <- NA
Rwanda_2011$l4b[Rwanda_2011$l4b < 0] <- NA
Rwanda_2011$l5a[Rwanda_2011$l5a < 0] <- NA
Rwanda_2011$l5b[Rwanda_2011$l5b < 0] <- NA

# compute ratios 2011
Rwanda_2006$female_share_nonprod <- with(Rwanda_2006, j2b2 / j2a2)
Rwanda_2006$female_share_prod <- with(Rwanda_2006, j2b1 / j2a1)

Rwanda_2011$female_share_prod <- with(Rwanda_2011, l5a/(l4a + l4b))
Rwanda_2011$female_share_nonprod <- Rwanda_2011$l5b / Rwanda_2011$l3b

# check computed ratios
summary(Rwanda_2006$female_share_prod)
summary(Rwanda_2006$female_share_nonprod)

summary(Rwanda_2011$female_share_prod)
summary(Rwanda_2011$female_share_nonprod)

# create clear homogenous variable names
Rwanda_2006$main_market <- to_factor(Rwanda_2006$c5a)
Rwanda_2006$international <- ifelse(Rwanda_2006$main_market == 'International', TRUE, ifelse(Rwanda_2006$main_market == 0, NA, FALSE))
Rwanda_2006$capital_city <- ifelse(Rwanda_2006$city == 'Nairobi', TRUE, FALSE)
Rwanda_2006$business_city <- Rwanda_2006$capital_city
Rwanda_2006$industry <- as.factor(ifelse(Rwanda_2006$industry <= 10, 'Manufacturing', ifelse(Rwanda_2006$industry > 10, 'Services', NA) ) )
Rwanda_2006$multi_establ <- ifelse(Rwanda_2006$multiest == 1, TRUE, FALSE)
Rwanda_2006$intern_certif <- ifelse(Rwanda_2006$e2b == 1, TRUE, FALSE)

Rwanda_2011$main_market <- to_factor(Rwanda_2011$e1)
Rwanda_2011$international <- ifelse(Rwanda_2011$main_market == 'International', TRUE, ifelse(Rwanda_2011$main_market == 0, NA, FALSE))
Rwanda_2011$capital_city <- ifelse(Rwanda_2011$a3b == 1, TRUE, FALSE)
Rwanda_2011$business_city <- ifelse(Rwanda_2011$a3c == 1, TRUE, FALSE)
Rwanda_2011$no_establishments <- Rwanda_2011$a7a
Rwanda_2011$multi_establ <- ifelse(Rwanda_2011$no_establishments == 1, FALSE, TRUE)
Rwanda_2011$intern_certif <- ifelse(Rwanda_2011$b8 < 0, NA, ifelse(Rwanda_2011$b8 == 1, TRUE, FALSE))
Rwanda_2011$eac_exporter <- ifelse(Rwanda_2011$d8 >= 2010, TRUE, FALSE)



# check distribution
hist(Rwanda_2006$female_share_prod)
hist(Rwanda_2006$female_share_nonprod)

hist(Rwanda_2011$female_share_prod)
hist(Rwanda_2011$female_share_nonprod)

# simplify industry
Rwanda_2006$industry <- ifelse(Rwanda_2006$industry < 0, NA, Rwanda_2006$industry)

# merge Rwanda 2006 data into 2011 data.frame
Rwanda0611 <- select(Rwanda_2006, panelid, c5a, female_share_prod, female_share_nonprod)

# save
save.image(file = "data/Enterprise/Rwanda/Rwanda-Enterprise.RData")
