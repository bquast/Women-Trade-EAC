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
t06_m1 <- formula(female_share_prod    ~ international + capital_city + business_city + multi_establ + intern_certif)
t06_m2 <- formula(female_share_nonprod ~ international + capital_city + business_city + multi_establ + intern_certif)

t13_m1 <- formula(female_share_prod    ~ international + capital_city + business_city + multi_establ + intern_certif + eac_exporter + industry)
t13_m2 <- formula(female_share_nonprod ~ international + capital_city + business_city + multi_establ + intern_certif + eac_exporter + industry)

# estimate models
t06_m1_r1 <-  lm(t06_m1, data = Tanzania_2006)
t06_m1_r2 <- glm(t06_m1, data = Tanzania_2006, family = quasibinomial(link='logit') )
t06_m2_r1 <-  lm(t06_m2, data = Tanzania_2006)
t06_m2_r2 <- glm(t06_m2, data = Tanzania_2006, family = quasibinomial(link='logit') )

t13_m1_r1 <-  lm(t13_m1, data = Tanzania_2013)
t13_m1_r2 <- glm(t13_m1, data = Tanzania_2013, family = quasibinomial(link='logit') )
t13_m2_r1 <-  lm(t13_m2, data = Tanzania_2013)
t13_m2_r2 <- glm(t13_m2, data = Tanzania_2013, family = quasibinomial(link='logit') )

# view output
summary(t06_m1_r1)
summary(t06_m1_r2)
summary(t06_m2_r1)
summary(t06_m2_r2)

summary(t13_m1_r1)
summary(t13_m1_r2)
summary(t13_m2_r1) # good
summary(t13_m2_r2) # good
