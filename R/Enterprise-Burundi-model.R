# Women in East Africa
# Enterprise-Burundi-model.R
# Bastiaan Quast
# bquast@gmail.com

# load data
load(file = 'data/Enterprise/Burundi/Burundi-Enterprise.RData')

# load libraries
library(ggplot2)
library(dplyr)
library(labelled)
library(broom)

# define models
m11 <- formula(female_share_prod ~ main_market + capital_city + business_city + intern_certif)
m12 <- formula(female_share_prod ~ international + capital_city + business_city + intern_certif)
m21 <- formula(female_share_nonprod ~ main_market + capital_city + business_city + intern_certif + industry + eac_exporter)
m22 <- formula(female_share_nonprod ~ international + capital_city + business_city + intern_certif  + industry + eac_exporter)
m212 <- formula(female_share_nonprod ~ main_market + capital_city + business_city + multi_establ + intern_certif + manufacturing)
m222 <- formula(female_share_nonprod ~ international + capital_city + business_city + multi_establ + intern_certif + manufacturing)

# estimate models
b06_m11_r1 <-  lm(m11, data = Burundi_2006)
b06_m11_r2 <- glm(m11, data = Burundi_2006, family = quasibinomial(link='logit') )
b06_m21_r1 <-  lm(m212, data = Burundi_2006)
b06_m21_r2 <- glm(m212, data = Burundi_2006, family = quasibinomial(link='logit') )
b06_m12_r1 <-  lm(m12, data = Burundi_2006)
b06_m12_r2 <- glm(m12, data = Burundi_2006, family = quasibinomial(link='logit') )
b06_m22_r1 <-  lm(m222, data = Burundi_2006)
b06_m22_r2 <- glm(m222, data = Burundi_2006, family = quasibinomial(link='logit') )

b14_m11_r1 <-  lm(m11, data = Burundi_2014)
b14_m11_r2 <- glm(m11, data = Burundi_2014, family = quasibinomial(link='logit') )
b14_m21_r1 <-  lm(m21, data = Burundi_2014)
b14_m21_r2 <- glm(m21, data = Burundi_2014, family = quasibinomial(link='logit') )
b14_m12_r1 <-  lm(m12, data = Burundi_2014)
b14_m12_r2 <- glm(m12, data = Burundi_2014, family = quasibinomial(link='logit') )
b14_m22_r1 <-  lm(m22, data = Burundi_2014)
b14_m22_r2 <- glm(m22, data = Burundi_2014, family = quasibinomial(link='logit') )

# view output
summary(b06_m11_r1)
summary(b06_m11_r2)
summary(b06_m21_r1)
summary(b06_m21_r2)
summary(b06_m12_r1)
summary(b06_m12_r2)
summary(b06_m22_r1)
summary(b06_m22_r2)

summary(b14_m11_r1)
summary(b14_m11_r2)
summary(b14_m21_r1)
summary(b14_m21_r2)
summary(b14_m12_r1)
summary(b14_m12_r2)
summary(b14_m22_r1) # good one
summary(b14_m22_r2) # good one
