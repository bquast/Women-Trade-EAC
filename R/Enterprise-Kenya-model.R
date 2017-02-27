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
m11 <- formula(female_share_prod ~ main_market + capital_city + multi_establ + intern_certif)
m12 <- formula(female_share_prod ~ international + capital_city + multi_establ + intern_certif)
m21 <- formula(female_share_nonprod ~ main_market + capital_city + multi_establ + intern_certif + eac_exporter + industry)
m22 <- formula(female_share_nonprod ~ international + capital_city + multi_establ + intern_certif + eac_exporter + industry)
m212 <- formula(female_share_nonprod ~ main_market + capital_city + multi_establ + intern_certif + industry)
m222 <- formula(female_share_nonprod ~ international + capital_city + multi_establ + intern_certif + industry)

# estimate models
k07_m11_r1 <-  lm(m11, data = Kenya_2007)
k07_m11_r2 <- glm(m11, data = Kenya_2007, family = quasibinomial(link='logit') )
k07_m21_r1 <-  lm(m212, data = Kenya_2007)
k07_m21_r2 <- glm(m212, data = Kenya_2007, family = quasibinomial(link='logit') )
k07_m12_r1 <-  lm(m12, data = Kenya_2007)
k07_m12_r2 <- glm(m12, data = Kenya_2007, family = quasibinomial(link='logit') )
k07_m22_r1 <-  lm(m222, data = Kenya_2007)
k07_m22_r2 <- glm(m222, data = Kenya_2007, family = quasibinomial(link='logit') )

k13_m11_r1 <-  lm(m11, data = Kenya_2013)
k13_m11_r2 <- glm(m11, data = Kenya_2013, family = quasibinomial(link='logit') )
k13_m21_r1 <-  lm(m21, data = Kenya_2013)
k13_m21_r2 <- glm(m21, data = Kenya_2013, family = quasibinomial(link='logit') )
k13_m12_r1 <-  lm(m12, data = Kenya_2013)
k13_m12_r2 <- glm(m12, data = Kenya_2013, family = quasibinomial(link='logit') )
k13_m22_r1 <-  lm(m22, data = Kenya_2013)
k13_m22_r2 <- glm(m22, data = Kenya_2013, family = quasibinomial(link='logit') )

# view output
summary(k07_m11_r1)
summary(k07_m11_r2)
summary(k07_m21_r1)
summary(k07_m21_r2)
summary(k07_m12_r1)
summary(k07_m12_r2)
summary(k07_m22_r1)
summary(k07_m22_r2)

summary(k13_m11_r1)
summary(k13_m11_r2)
summary(k13_m21_r1)
summary(k13_m21_r2)
summary(k13_m12_r1)
summary(k13_m12_r2) # good one
summary(k13_m22_r1)
summary(k13_m22_r2)
