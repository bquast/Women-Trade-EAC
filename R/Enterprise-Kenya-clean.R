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

Kenya_2013[which(is.nan(Kenya_2013$l9a)),]$l9a <- NA
Kenya_2013[which(Kenya_2013$l9a < 0),]$l9a <- NA

Kenya_2013[which(is.nan(Kenya_2013$l9a2)),]$l9a2 <- NA
Kenya_2013[which(Kenya_2013$l9a2 < 0),]$l9a2 <- NA

summary(Kenya_2013$l9a2 / Kenya_2013$l9a)
hist(Kenya_2013$l9a2 / Kenya_2013$l9a)

Kenya_2013$l9a <- as.integer(Kenya_2013$l9a)
Kenya_2013$l9a2 <- as.integer(Kenya_2013$l9a2)


Kenya_2013$edu_ratio <- as.numeric(Kenya_2013$l9a2 / Kenya_2013$l9a)
Kenya_2013$edu_cat <- ifelse(Kenya_2013$edu_ratio <= 0.5, 0.5, ifelse(Kenya_2013$edu_ratio <= 1, 1, ifelse(Kenya_2013$edu_ratio <= 1.5, 1.5, ifelse(Kenya_2013$edu_ratio <= 2, 2, 3) ) ) )
table(Kenya_2013$edu_cat)

# compute ratios 2013
Kenya_2007$female_share_nonprod <- with(Kenya_2007, j2b2 / j2a2)
Kenya_2007$female_share_prod <- with(Kenya_2007, j2b1 / j2a1)

Kenya_2013$female_share_prod <- with(Kenya_2013, l5a/(l4a + l4b))
Kenya_2013$female_share_nonprod <- Kenya_2013$l5b / Kenya_2013$l3b
Kenya_2013$female_share_temp <- Kenya_2013$l6a / Kenya_2013$l6

# check computed ratios
summary(Kenya_2007$female_share_prod)
summary(Kenya_2007$female_share_nonprod)

summary(Kenya_2013$female_share_prod)
summary(Kenya_2013$female_share_nonprod)
summary(Kenya_2013$female_share_temp)

# create clear homogenous variable names
Kenya_2007$main_market <- to_factor(Kenya_2007$c5a)
Kenya_2007$international <- ifelse(Kenya_2007$main_market == 'International', TRUE, ifelse(Kenya_2007$main_market == 0, NA, FALSE))
Kenya_2007$capital_city <- ifelse(Kenya_2007$city == 'Nairobi', TRUE, FALSE)
Kenya_2007$business_city <- Kenya_2007$capital_city
Kenya_2007$industry <- as.factor(ifelse(Kenya_2007$industry == 10, 'Agriculture', ifelse(Kenya_2007$industry > 10, 'Services', ifels(Kenya_2007$industry <= 10 & Kenya_2007$industry > 1, 'Manufacturing', NA)) ) )
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
Kenya_2013$industry <- Kenya_2013$a4a
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


# kenya production workers international firms by sector
k7_pr_int_ind <- with(Kenya_2007[which(Kenya_2007$international == TRUE),], table(female_share_prod_cat, industry))
K13_pr_int_ind <- with(Kenya_2013[which(Kenya_2013$international == TRUE),], table(female_share_prod_cat, industry))
rbind(c(2007, 2007, 2013, 2013), cbind(k7_pr_int_ind, K13_pr_int_ind))

# kenya production workers non-international firms by sector
k7_pr_ni_ind <- with(Kenya_2007[which(Kenya_2007$international == FALSE),], table(female_share_prod_cat, industry))
K13_pr_ni_ind <- with(Kenya_2013[which(Kenya_2013$international == FALSE),], table(female_share_prod_cat, industry))
rbind(c(2007, 2007, 2013, 2013), cbind(k7_pr_ni_ind, K13_pr_ni_ind))

# kenya nonproduction workers international firms by sector
k7_np_int_ind <- with(Kenya_2007[which(Kenya_2007$international == TRUE),], table(female_share_nonprod_cat, industry))
K13_np_int_ind <- with(Kenya_2013[which(Kenya_2013$international == TRUE),], table(female_share_nonprod_cat, industry))
rbind(c(2007, 2007, 2013, 2013), cbind(k7_np_int_ind, K13_np_int_ind))

# kenya nonproduction workers non-international firms by sector
k7_np_ni_ind <- with(Kenya_2007[which(Kenya_2007$international == FALSE),], table(female_share_nonprod_cat, industry))
k13_np_ni_ind <- with(Kenya_2013[which(Kenya_2013$international == FALSE),], table(female_share_nonprod_cat, industry))

summary(Kenya_2013$d3a)
Kenya_2013$d3a[Kenya_2013$d3a < 0] <- NA
Kenya_2013$exporter <- ifelse(Kenya_2013$d3a == 100, FALSE, TRUE)
summary(Kenya_2013$exporter)

# simplify industry
Kenya_2007$industry <- ifelse(Kenya_2007$industry == 1, 'Agriculture', ifelse(Kenya_2007$industry > 1 & Kenya_2007$industry <= 10, 'Manufacturing', 'Services') )
Kenya_2013$industry <- ifelse(Kenya_2013$a4b < 20, 'Agriculture', ifelse(Kenya_2013$a4b < 40, 'Manufacturing', 'Services') )


Kenya_2013$firm_size <- Kenya_2013$l3a + Kenya_2013$l3b
Kenya_2013$firm_cat <- ifelse(Kenya_2013$l4a > 50, 'large', ifelse(Kenya_2013$l4a > 10 & Kenya_2013$l4a <= 50, 'medium', 'small'))
attach(Kenya_2013)
Kenya_2013$female_share_prod_cat <- ifelse(female_share_prod <= 0.2, 0.2, ifelse(female_share_prod <= 0.4, 0.4, ifelse(female_share_prod <= 0.6, 0.6, ifelse(female_share_prod <= 0.8, 0.8, 1))))
Kenya_2013$female_share_nonprod_cat <- ifelse(female_share_nonprod <= 0.2, 0.2, ifelse(female_share_nonprod <= 0.4, 0.4, ifelse(female_share_nonprod <= 0.6, 0.6, ifelse(female_share_prod <= 0.8, 0.8, 1))))
detach(Kenya_2013)
table(Kenya_2013$female_share_prod_cat, Kenya_2013$firm_cat)
table(Kenya_2013$female_share_nonprod_cat, Kenya_2013$firm_cat)

table(Kenya_2013$international, Kenya_2013$industry)


Kenya_2007$firm_cat <- ifelse(Kenya_2007$j2a <= 10, 'small', ifelse(Kenya_2007$j2a <= 50, 'medium', 'large'))
attach(Kenya_2007)
Kenya_2007$female_share_prod_cat <- ifelse(female_share_prod <= 0.2, 0.2, ifelse(female_share_prod <= 0.4, 0.4, ifelse(female_share_prod <= 0.6, 0.6, ifelse(female_share_prod <= 0.8, 0.8, 1))))
Kenya_2007$female_share_nonprod_cat <- ifelse(female_share_nonprod <= 0.2, 0.2, ifelse(female_share_nonprod <= 0.4, 0.4, ifelse(female_share_nonprod <= 0.6, 0.6, ifelse(female_share_nonprod <= 0.8, 0.8, 1))))
detach(Kenya_2007)



table(Kenya_2007$female_share_prod_cat, Kenya_2007$firm_cat)
table(Kenya_2007$female_share_nonprod_cat, Kenya_2007$firm_cat)


table(Kenya_2007$international, Kenya_2007$industry)

table(Kenya_2013$edu_cat, Kenya_2013$firm_cat)
table(Kenya_2013$edu_cat, Kenya_2013$international)


attach(Kenya_2013)
var_list <- c('female_share_prod', 'female_share_nonprod', 'eac_exporter', 'capital_city', 'business_city', 'intern_certif', 'industry', 'international', 'multi_establ', 'firm_size')

ken13 <- subset(Kenya_2013, select=var_list)
ken13 <- cbind(country = 'Kenya', ken13)


# save
save.image(file = "data/Enterprise/Kenya/Kenya-Enterprise.RData")
