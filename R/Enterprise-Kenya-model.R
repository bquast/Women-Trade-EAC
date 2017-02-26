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
m11 <- formula(female_share_prod ~ main_market)
m12 <- formula(female_share_prod ~ international)
m21 <- formula(female_share_nonprod ~ main_market)
m22 <- formula(female_share_nonprod ~ international)

# estimate models
k07_m11_r1 <-  lm(m11, data = Kenya_2007)
k07_m11_r2 <- glm(m11, data = Kenya_2007, family = quasibinomial(link='logit') )
k07_m21_r1 <-  lm(m21, data = Kenya_2007)
k07_m21_r2 <- glm(m21, data = Kenya_2007, family = quasibinomial(link='logit') )
k07_m12_r1 <-  lm(m12, data = Kenya_2007)
k07_m12_r2 <- glm(m12, data = Kenya_2007, family = quasibinomial(link='logit') )
k07_m22_r1 <-  lm(m22, data = Kenya_2007)
k07_m22_r2 <- glm(m22, data = Kenya_2007, family = quasibinomial(link='logit') )

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
summary(k13_m12_r2)
summary(k13_m22_r1)
summary(k13_m22_r2)
