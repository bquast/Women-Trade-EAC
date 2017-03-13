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
summary(Rwanda_2006$b3b1) # female owners 
summary(Rwanda_2006$c5a)  # main market
summary(Rwanda_2006$c4a)  # use email?
summary(Rwanda_2006$c4b)  # has website?
summary(Rwanda_2006$c6b1) # In what year did you begin exporting directly?
summary(Rwanda_2006$c6b2a)# What percentage of this establishment's direct export sales were to: Neighbouring countries within Sub-saharan Africa	
summary(Rwanda_2006$j2a1)
summary(Rwanda_2006$j2a2)
summary(Rwanda_2006$j2b1)
summary(Rwanda_2006$j2b2)

summary(Rwanda_2011$a4a) # industry
summary(Rwanda_2011$a7a) # no. of establishments
summary(Rwanda_2011$AFb3a)# gender composition owners
summary(Rwanda_2011$b7a) # top manager female
summary(Rwanda_2011$b8)  # international quality
summary(Rwanda_2011$c22a)# use email?
summary(Rwanda_2011$c22b)# has website?
summary(Rwanda_2011$c28) # cell phones used?

summary(Rwanda_2011$l1)  # full time employees 
summary(Rwanda_2011$l5)  # full time employees female

# filter negative values
Rwanda_2011$l1[Rwanda_2011$l1 < 0] <- NA
Rwanda_2011$l5[Rwanda_2011$l5 < 0] <- NA

# compute ratios
Rwanda_2006$female_share_nonprod <- with(Rwanda_2006, j2b2 / j2a2)
Rwanda_2006$female_share_prod <- with(Rwanda_2006, j2b1 / j2a1)

Rwanda_2011$female_share <- with(Rwanda_2011, l5 / l1)

# check computed ratios
hist(Rwanda_2006$female_share_prod)
hist(Rwanda_2006$female_share_nonprod)

summary(Rwanda_2011$female_share)

# create clear homogenous variable names
Rwanda_2006$main_market <- to_factor(Rwanda_2006$c5a)
Rwanda_2006$international <- ifelse(Rwanda_2006$main_market == 'International', TRUE, ifelse(Rwanda_2006$main_market == 0, NA, FALSE))
Rwanda_2006$capital_city <- ifelse(Rwanda_2006$city == 'Nairobi', TRUE, FALSE)
Rwanda_2006$business_city <- Rwanda_2006$capital_city
Rwanda_2006$multi_establ <- ifelse(Rwanda_2006$multiest == 1, TRUE, FALSE)
Rwanda_2006$intern_certif <- ifelse(Rwanda_2006$e2b == 1, TRUE, FALSE)

# Rwanda_2011$main_market <- to_factor(Rwanda_2011$e1)
# Rwanda_2011$international <- ifelse(Rwanda_2011$main_market == 'International', TRUE, ifelse(Rwanda_2011$main_market == 0, NA, FALSE))
Rwanda_2011$capital_city <- ifelse(Rwanda_2011$a3b == 1, TRUE, FALSE)
Rwanda_2011$business_city <- ifelse(Rwanda_2011$a3c == 1, TRUE, FALSE)
Rwanda_2011$no_establishments <- Rwanda_2011$a7a
Rwanda_2011$multi_establ <- ifelse(Rwanda_2011$no_establishments == 1, FALSE, TRUE)
Rwanda_2011$intern_certif <- ifelse(Rwanda_2011$b8 < 0, NA, ifelse(Rwanda_2011$b8 == 1, TRUE, FALSE))
# Rwanda_2011$eac_exporter <- ifelse(Rwanda_2011$d8 >= 2010, TRUE, FALSE)
Rwanda_2011$female_owner <- ifelse(Rwanda_2011$AFb3b == 1, TRUE, ifelse(Rwanda_2011$AFb3b == 2, FALSE, NA))
Rwanda_2011$female_ownership <- ifelse(Rwanda_2011$AFb3a < 0, NA, ifelse(Rwanda_2011$AFb3a == 1, FALSE, TRUE))


# check distribution
hist(Rwanda_2006$female_share_prod)
hist(Rwanda_2006$female_share_nonprod)

hist(Rwanda_2011$female_share)

# simplify industry
Rwanda_2006$industry <- ifelse(Rwanda_2006$industry < 0, NA, Rwanda_2006$industry)
Rwanda_2011$Industry <- to_factor(Rwanda_2011$a4a)

# merge Rwanda 2006 data into 2011 data.frame
# Rwanda0611 <- select(Rwanda_2006, panelid, c5a, female_share_prod, female_share_nonprod)


# WITS data
Rwanda_WITS$Industry <- as.factor(Rwanda_WITS$Industry)
Rwanda_2011t <- merge(Rwanda_2011, Rwanda_WITS, by='Industry')

# save
save.image(file = "data/Enterprise/Rwanda/Rwanda-Enterprise.RData")
