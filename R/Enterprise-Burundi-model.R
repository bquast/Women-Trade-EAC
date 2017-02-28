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
b06_m1 <- formula(female_share_prod    ~ international + capital_city + business_city + multi_establ + intern_certif + manufacturing)
b06_m2 <- formula(female_share_nonprod ~ international + capital_city + business_city + multi_establ + intern_certif + manufacturing)
b14_m1 <- formula(female_share_prod    ~ international + capital_city + business_city + intern_certif)
b14_m2 <- formula(female_share_nonprod ~ international + capital_city + business_city + intern_certif  + industry + eac_exporter)

# estimate models
b06_m1_r1 <-  lm(b06_m1, data = Burundi_2006)
b06_m1_r2 <- glm(b06_m1, data = Burundi_2006, family = quasibinomial(link='logit') )
b06_m2_r1 <-  lm(b06_m2, data = Burundi_2006)
b06_m2_r2 <- glm(b06_m2, data = Burundi_2006, family = quasibinomial(link='logit') )

b14_m1_r1 <-  lm(b14_m1, data = Burundi_2014)
b14_m1_r2 <- glm(b14_m1, data = Burundi_2014, family = quasibinomial(link='logit') )
b14_m2_r1 <-  lm(b14_m2, data = Burundi_2014)
b14_m2_r2 <- glm(b14_m2, data = Burundi_2014, family = quasibinomial(link='logit') )

# view output
summary(b06_m1_r1) # something
summary(b06_m1_r2)
summary(b06_m2_r1)
summary(b06_m2_r2)

summary(b14_m1_r1)
summary(b14_m1_r2)
summary(b14_m2_r1) # good
summary(b14_m2_r2) # good
