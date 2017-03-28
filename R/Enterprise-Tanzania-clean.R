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
Tanzania_2006$female_share <- with(Tanzania_2006, (j2b1 + j2b2)/(j2a1 + j2a2) )

Tanzania_2013$female_share_prod <- with(Tanzania_2013, l5a/(l4a + l4b))
Tanzania_2013$female_share_nonprod <- Tanzania_2013$l5b / Tanzania_2013$l3b
Tanzania_2013$female_share <- with(Tanzania_2013, (l5a + l5b)/(l4a + l4b + l3b) )

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
Tanzania_2013t$eac_exporter <- ifelse(Tanzania_2013t$d8 >= 2005, TRUE, FALSE)
Tanzania_2013t[which(is.na(Tanzania_2013t$eac_exporter)),] <- 0
Tanzania_2013$Industry <- to_factor(Tanzania_2013$a4a)
Tanzania_2013$female_owner <- ifelse(Tanzania_2013$b4 == 2, TRUE, ifelse(Tanzania_2013$b4 == 1, FALSE, NA))
Tanzania_2013$female_ownership <- ifelse(Tanzania_2013$b4a < 0, NA, Tanzania_2013$b4a/100)

# missing values to FALSE
Tanzania_2013$international[is.na(Tanzania_2013$international)] <- FALSE
Tanzania_2013$intern_certif[is.na(Tanzania_2013$intern_certif)] <- FALSE
Tanzania_2013$eac_exporter[is.na(Tanzania_2013$eac_exporter)] <- FALSE


Tanzania_2013[which(is.nan(Tanzania_2013$l9a)),]$l9a <- NA
Tanzania_2013[which(Tanzania_2013$l9a < 0),]$l9a <- NA

Tanzania_2013[which(is.nan(Tanzania_2013$l9a2)),]$l9a2 <- NA
Tanzania_2013[which(Tanzania_2013$l9a2 < 0),]$l9a2 <- NA

summary(Tanzania_2013$l9a2 / Tanzania_2013$l9a)
hist(Tanzania_2013$l9a2 / Tanzania_2013$l9a)

Tanzania_2013$edu_ratio <- as.numeric(Tanzania_2013$l9a2 / Tanzania_2013$l9a)
Tanzania_2013$edu_cat <- ifelse(Tanzania_2013$edu_ratio <= 0.5, 0.5, ifelse(Tanzania_2013$edu_ratio <= 1, 1, ifelse(Tanzania_2013$edu_ratio <= 1.5, 1.5, ifelse(Tanzania_2013$edu_ratio <= 2, 2, 3) ) ) )
table(Tanzania_2013$edu_cat)



# merge Tanzania 2006 data into 2013 data.frame
# Tanzania0713 <- select(Tanzania_2006, panelid, c5a, female_share_prod, female_share_nonprod)

# WITS data
Tanzania_WITS$Industry <- as.factor(Tanzania_WITS$Industry)
Tanzania_2013t <- merge(Tanzania_2013, Tanzania_WITS, by='Industry')
Tanzania_2013$firm_size <- Tanzania_2013$l3a + Tanzania_2013$l3b

tan13 <- subset(Tanzania_2013t, select=var_list)
tan13 <- cbind(country = 'Tanzania', tan13)

merge13 <- rbind(ken13, tan13, uga13, bur13)


summary(Tanzania_2013$d3a)
Tanzania_2013$d3a[Tanzania_2013$d3a < 0] <- NA
Tanzania_2013$exporter <- ifelse(Tanzania_2013$d3a == 100, FALSE, TRUE)
summary(Tanzania_2013$exporter)

# simplify industry
Tanzania_2006$industry <- ifelse(Tanzania_2006$industry == 1, 'Agriculture', ifelse(Tanzania_2006$industry > 1 & Tanzania_2006$industry <= 10, 'Manufacturing', 'Services') )
Tanzania_2013$a4b <- ifelse(Tanzania_2013$a4b < 0, NA, Tanzania_2013$a4b)
Tanzania_2013$industry <- ifelse(Tanzania_2013$a4b <= 15, 'Agriculture', ifelse(Tanzania_2013$a4b <= 36, 'Manufacturing', 'Services') )
table(Tanzania_2013$industry)

Tanzania_2013$firm_size <- Tanzania_2013$l3a + Tanzania_2013$l3b
Tanzania_2013$firm_cat <- ifelse(Tanzania_2013$l4a > 50, 'large', ifelse(Tanzania_2013$l4a > 10 & Tanzania_2013$l4a <= 50, 'medium', 'small'))
attach(Tanzania_2013)
Tanzania_2013$female_share_prod_cat <- ifelse(female_share_prod <= 0.2, 0.2, ifelse(female_share_prod <= 0.4, 0.4, ifelse(female_share_prod <= 0.6, 0.6, ifelse(female_share_prod <= 0.8, 0.8, 1))))
Tanzania_2013$female_share_nonprod_cat <- ifelse(female_share_nonprod <= 0.2, 0.2, ifelse(female_share_nonprod <= 0.4, 0.4, ifelse(female_share_nonprod <= 0.6, 0.6, ifelse(female_share_prod <= 0.8, 0.8, 1))))
detach(Tanzania_2013)
table(Tanzania_2013$female_share_prod_cat, Tanzania_2013$firm_cat)
table(Tanzania_2013$female_share_nonprod_cat, Tanzania_2013$firm_cat)

table(Tanzania_2013$international, Tanzania_2013$industry)


Tanzania_2006$firm_cat <- ifelse(Tanzania_2006$j2a <= 10, 'small', ifelse(Tanzania_2006$j2a <= 50, 'medium', 'large'))
attach(Tanzania_2006)
Tanzania_2006$female_share_prod_cat <- ifelse(female_share_prod <= 0.2, 0.2, ifelse(female_share_prod <= 0.4, 0.4, ifelse(female_share_prod <= 0.6, 0.6, ifelse(female_share_prod <= 0.8, 0.8, 1))))
Tanzania_2006$female_share_nonprod_cat <- ifelse(female_share_nonprod <= 0.2, 0.2, ifelse(female_share_nonprod <= 0.4, 0.4, ifelse(female_share_nonprod <= 0.6, 0.6, ifelse(female_share_nonprod <= 0.8, 0.8, 1))))
detach(Tanzania_2006)



table(Tanzania_2006$female_share_prod_cat, Tanzania_2006$firm_cat)
table(Tanzania_2006$female_share_nonprod_cat, Tanzania_2006$firm_cat)


table(Tanzania_2006$international, Tanzania_2006$industry)

table(Tanzania_2013$edu_cat, Tanzania_2013$firm_cat)
table(Tanzania_2013$edu_cat, Tanzania_2013$international)


# save
save.image(file = "data/Enterprise/Tanzania/Tanzania-Enterprise.RData")
