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
m1 <- formula(female_share_prod ~ main_market)
m2 <- formula(female_share_nonprod ~ main_market)

# estimate models
k07_m1_r1 <- lm(m1, data = Kenya_2007)
k07_m1_r2 <- glm(m1, data = Kenya_2007, family = quasibinomial(link='logit') )
k07_m2_r1 <- lm(m2, data = Kenya_2007)
k07_m2_r2 <- glm(m2, data = Kenya_2007, family = quasibinomial(link='logit') )

k13_m1_r1 <- lm(m1, data = Kenya_2013)
k13_m1_r2 <- glm(m1, data = Kenya_2013, family = quasibinomial(link='logit') )
k13_m2_r1 <- lm(m2, data = Kenya_2013)
k13_m2_r2 <- glm(m2, data = Kenya_2013, family = quasibinomial(link='logit') )

# view output
summary(k07_m1_r1)
summary(k07_m1_r2)
summary(k07_m2_r1)
summary(k07_m2_r2)

summary(k13_m1_r1)
summary(k13_m1_r2)
summary(k13_m2_r1)
summary(k13_m2_r2)


tidy(m1_r1)
tidy(m2_r1)

tidy(m21_r1)
tidy(m22_r1)
