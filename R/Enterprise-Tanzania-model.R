# Women in East Africa
# Enterprise-Tanzania-model.R
# Bastiaan Quast
# bquast@gmail.com

# load data
load(file = 'data/Enterprise/Tanzania/Tanzania-Enterprise.RData')

# load libraries
library(ggplot2)
library(dplyr)
library(labelled)
library(broom)

# define models
m11 <- formula(female_share_prod ~ main_market + capital_city + business_city + multi_establ + intern_certif)
m12 <- formula(female_share_prod ~ international + capital_city + business_city + multi_establ + intern_certif)
m21 <- formula(female_share_nonprod ~ main_market + capital_city + business_city + multi_establ + intern_certif + eac_exporter + industry)
m22 <- formula(female_share_nonprod ~ international + capital_city + business_city + multi_establ + intern_certif + eac_exporter + industry)
m212 <- formula(female_share_nonprod ~ main_market + capital_city + business_city + multi_establ + intern_certif + industry)
m222 <- formula(female_share_nonprod ~ international + capital_city + business_city + multi_establ + intern_certif + industry)

# estimate models
t06_m11_r1 <-  lm(m11, data = Tanzania_2006)
t06_m11_r2 <- glm(m11, data = Tanzania_2006, family = quasibinomial(link='logit') )
t06_m21_r1 <-  lm(m212, data = Tanzania_2006)
t06_m21_r2 <- glm(m212, data = Tanzania_2006, family = quasibinomial(link='logit') )
t06_m12_r1 <-  lm(m12, data = Tanzania_2006)
t06_m12_r2 <- glm(m12, data = Tanzania_2006, family = quasibinomial(link='logit') )
t06_m22_r1 <-  lm(m222, data = Tanzania_2006)
t06_m22_r2 <- glm(m222, data = Tanzania_2006, family = quasibinomial(link='logit') )

t13_m11_r1 <-  lm(m11, data = Tanzania_2013)
t13_m11_r2 <- glm(m11, data = Tanzania_2013, family = quasibinomial(link='logit') )
t13_m21_r1 <-  lm(m21, data = Tanzania_2013)
t13_m21_r2 <- glm(m21, data = Tanzania_2013, family = quasibinomial(link='logit') )
t13_m12_r1 <-  lm(m12, data = Tanzania_2013)
t13_m12_r2 <- glm(m12, data = Tanzania_2013, family = quasibinomial(link='logit') )
t13_m22_r1 <-  lm(m22, data = Tanzania_2013)
t13_m22_r2 <- glm(m22, data = Tanzania_2013, family = quasibinomial(link='logit') )

# view output
summary(t06_m11_r1)
summary(t06_m11_r2)
summary(t06_m21_r1)
summary(t06_m21_r2)
summary(t06_m12_r1)
summary(t06_m12_r2)
summary(t06_m22_r1)
summary(t06_m22_r2)

summary(t13_m11_r1)
summary(t13_m11_r2)
summary(t13_m21_r1)
summary(t13_m21_r2)
summary(t13_m12_r1)
summary(t13_m12_r2) # good one
summary(t13_m22_r1)
summary(t13_m22_r2)
