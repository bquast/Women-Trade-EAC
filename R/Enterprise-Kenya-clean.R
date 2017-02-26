# Women in East Africa
# Enterprise-Kenya-clean.R
# Bastiaan Quast
# bquast@gmail.com

# load library
library(haven)
library(dplyr)

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

# check distribution
hist(Kenya_2007$female_share_prod)
hist(Kenya_2007$female_share_nonprod)

hist(Kenya_2013$female_share_prod)
hist(Kenya_2013$female_share_nonprod)

# simplify industry
Kenya_2013$a4c <- ifelse(Kenya_2013$a4b < 20, 'Agriculture', ifelse(Kenya_2013$a4b < 40, 'Manufacturing', 'Services') )

# merge Kenya 2007 data into 2013 data.frame
Kenya0713 <- select(Kenya_2007, panelid, c5a, female_share_prod, female_share_nonprod)

# save
save.image(file = "data/Enterprise/Kenya/Kenya-Enterprise.RData")
