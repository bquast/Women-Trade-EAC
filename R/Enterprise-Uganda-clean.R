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

# create clear homogenous variable names
Uganda_2006$main_market <- to_factor(Uganda_2006$c5a)
Uganda_2006$international <- ifelse(Uganda_2006$main_market == 'International', TRUE, ifelse(Uganda_2006$main_market == 0, NA, FALSE))
Uganda_2006$capital_city <- ifelse(Uganda_2006$city == 'Kampala', TRUE, FALSE)
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
Uganda_2013$Industry <- to_factor(Uganda_2013$a4a)
Uganda_2013$female_owner <- ifelse(Uganda_2013$b4 == 2, TRUE, ifelse(Uganda_2013$b4 == 1, FALSE, NA))
Uganda_2013$female_ownership <- ifelse(Uganda_2013$b4a < 0, NA, Uganda_2013$b4a/100)

# check distribution
hist(Uganda_2006$female_share_prod)
hist(Uganda_2006$female_share_nonprod)

hist(Uganda_2013$female_share_prod)
hist(Uganda_2013$female_share_nonprod)


# simplify industry
Uganda_2006$industry <- ifelse(Uganda_2006$industry == 1, 'Agriculture', ifelse(Uganda_2006$industry > 1 & Uganda_2006$industry <= 10, 'Manufacturing', 'Services') )
Uganda_2013$a4b <- ifelse(Uganda_2013$a4b < 0, NA, Uganda_2013$a4b)
Uganda_2013$industry <- ifelse(Uganda_2013$a4b <= 15, 'Agriculture', ifelse(Uganda_2013$a4b <= 36, 'Manufacturing', 'Services') )
table(Uganda_2013$industry)

Uganda_2013$firm_size <- Uganda_2013$l3a + Uganda_2013$l3b
Uganda_2013$firm_cat <- ifelse(Uganda_2013$l4a > 50, 'large', ifelse(Uganda_2013$l4a > 10 & Uganda_2013$l4a <= 50, 'medium', 'small'))
attach(Uganda_2013)
Uganda_2013$female_share_prod_cat <- ifelse(female_share_prod <= 0.2, 0.2, ifelse(female_share_prod <= 0.4, 0.4, ifelse(female_share_prod <= 0.6, 0.6, ifelse(female_share_prod <= 0.8, 0.8, 1))))
Uganda_2013$female_share_nonprod_cat <- ifelse(female_share_nonprod <= 0.2, 0.2, ifelse(female_share_nonprod <= 0.4, 0.4, ifelse(female_share_nonprod <= 0.6, 0.6, ifelse(female_share_prod <= 0.8, 0.8, 1))))
detach(Uganda_2013)
table(Uganda_2013$female_share_prod_cat, Uganda_2013$firm_cat)
table(Uganda_2013$female_share_nonprod_cat, Uganda_2013$firm_cat)

table(Uganda_2013$international, Uganda_2013$industry)


Uganda_2006$firm_cat <- ifelse(Uganda_2006$j2a <= 10, 'small', ifelse(Uganda_2006$j2a <= 50, 'medium', 'large'))
attach(Uganda_2006)
Uganda_2006$female_share_prod_cat <- ifelse(female_share_prod <= 0.2, 0.2, ifelse(female_share_prod <= 0.4, 0.4, ifelse(female_share_prod <= 0.6, 0.6, ifelse(female_share_prod <= 0.8, 0.8, 1))))
Uganda_2006$female_share_nonprod_cat <- ifelse(female_share_nonprod <= 0.2, 0.2, ifelse(female_share_nonprod <= 0.4, 0.4, ifelse(female_share_nonprod <= 0.6, 0.6, ifelse(female_share_nonprod <= 0.8, 0.8, 1))))
detach(Uganda_2006)



table(Uganda_2006$female_share_prod_cat, Uganda_2006$firm_cat)
table(Uganda_2006$female_share_nonprod_cat, Uganda_2006$firm_cat)

Uganda_2013$edu_ratio <- as.numeric(Uganda_2013$l9a2 / Uganda_2013$l9a)
Uganda_2013$edu_cat <- ifelse(Uganda_2013$edu_ratio <= 0.5, 0.5, ifelse(Uganda_2013$edu_ratio <= 1, 1, ifelse(Uganda_2013$edu_ratio <= 1.5, 1.5, ifelse(Uganda_2013$edu_ratio <= 2, 2, 3) ) ) )
table(Uganda_2013$edu_cat)
table(Uganda_2013$edu_cat, Uganda_2013$firm_cat)
table(Uganda_2013$edu_cat, Uganda_2013$international)

table(Uganda_2006$international, Uganda_2006$industry)




# simplify industry
# Uganda_2013$industry <- ifelse(Uganda_2013$a4b < 20, 'Agriculture', ifelse(Uganda_2013$a4b < 40, 'Manufacturing', 'Services') )

# if no exporting here year found, assume before 2010
Uganda_2013$eac_exporter[is.na(Uganda_2013$eac_exporter)] <- FALSE

# WITS data
Uganda_WITS$Industry <- as.factor(Uganda_WITS$Industry)
Uganda_2013t <- merge(Uganda_2013, Uganda_WITS, by='Industry')


Uganda_2013$firm_size <- Uganda_2013$l3a + Uganda_2013$l3b
uga13 <- subset(Uganda_2013, select=var_list)
uga13 <- cbind(country = 'Uganda', uga13)

# save
save.image(file = "data/Enterprise/Uganda/Uganda-Enterprise.RData")
