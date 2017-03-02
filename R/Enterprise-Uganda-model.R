# Women in East Africa
# Enterprise-Uganda-model.R
# Bastiaan Quast
# bquast@gmail.com

# load data
load(file = 'data/Enterprise/Uganda/Uganda-Enterprise.RData')

# load libraries
library(ggplot2)
library(dplyr)
library(labelled)
library(broom)

# define models
u6_m1 <- formula(female_share_prod ~ international + capital_city + business_city + multi_establ + intern_certif)
u6_m2 <- formula(female_share_nonprod ~ international + capital_city + business_city + multi_establ + intern_certif)
u13_m1 <- formula(female_share_prod ~ international + capital_city + business_city + multi_establ + intern_certif)
u13_m2 <- formula(female_share_nonprod ~ international + capital_city + business_city + multi_establ + intern_certif + eac_exporter + industry)

# estimate models
u06_m1_r1 <-  lm(u6_m1, data = Uganda_2006)
u06_m1_r2 <- glm(u6_m1, data = Uganda_2006, family = quasibinomial(link='logit') )
u06_m2_r1 <-  lm(u6_m2, data = Uganda_2006)
u06_m2_r2 <- glm(u6_m2, data = Uganda_2006, family = quasibinomial(link='logit') )

u13_m1_r1 <-  lm(u13_m1, data = Uganda_2013)
u13_m1_r2 <- glm(u13_m1, data = Uganda_2013, family = quasibinomial(link='logit') )
u13_m2_r1 <-  lm(u13_m2, data = Uganda_2013)
u13_m2_r2 <- glm(u13_m2, data = Uganda_2013, family = quasibinomial(link='logit') )

# view output
summary(u06_m1_r1)
summary(u06_m1_r2)
summary(u06_m2_r1)
summary(u06_m2_r2)

summary(u13_m1_r1)
summary(u13_m1_r2) # good one
summary(u13_m2_r1)
summary(u13_m2_r2)
