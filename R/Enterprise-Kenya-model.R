# Women in East Africa
# Enterprise-Kenya-model.R
# Bastiaan Quast
# bquast@gmail.com

# load data
load(file = 'data/Enterprise/Kenya/Kenya-Enterprise.RData')

# load libraries
library(ggplot2)
library(dplyr)
library(labelled)
library(broom)

# define models
k06_m1 <- formula(female_share_prod    ~ international + capital_city + multi_establ + intern_certif + industry)
k06_m2 <- formula(female_share_nonprod ~ international + capital_city + multi_establ + intern_certif + industry)
k13_m1 <- formula(female_share_prod    ~ international + capital_city + multi_establ + intern_certif)
k13_m2 <- formula(female_share_nonprod ~ international + capital_city + multi_establ + intern_certif + eac_exporter + industry)

# estimate models
k07_m1_r1 <-  lm(k06_m1, data = Kenya_2007)
k07_m1_r2 <- glm(k06_m1, data = Kenya_2007, family = quasibinomial(link='logit') )
k07_m2_r1 <-  lm(k06_m1, data = Kenya_2007)
k07_m2_r2 <- glm(k06_m1, data = Kenya_2007, family = quasibinomial(link='logit') )

k13_m1_r1 <-  lm(k13_m1, data = Kenya_2013)
k13_m1_r2 <- glm(k13_m1, data = Kenya_2013, family = quasibinomial(link='logit') )
k13_m2_r1 <-  lm(k13_m2, data = Kenya_2013)
k13_m2_r2 <- glm(k13_m2, data = Kenya_2013, family = quasibinomial(link='logit') )

# view output
summary(k07_m1_r1)
summary(k07_m1_r2)
summary(k07_m2_r1)
summary(k07_m2_r2)

summary(k13_m1_r1)
summary(k13_m1_r2)
summary(k13_m2_r1)
summary(k13_m2_r2)
