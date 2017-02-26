# Women in East Africa
# Enterprise-Rwanda-model.R
# Bastiaan Quast
# bquast@gmail.com

# load data
load(file = 'data/Enterprise/Rwanda/Rwanda-Enterprise.RData')

# load libraries
library(ggplot2)
library(dplyr)
library(labelled)
library(broom)

# define models
m1 <- formula(female_share ~ to_factor(e1) ) # ratio female prod workers
m3 <- formula() # (partially) owned by female
m4 <- formula() # percentage owned by female

m21 <- formula(female_share_prod ~ to_factor(c5a))
m22 <- formula(female_share_nonprod ~ to_factor(c5a))

# estimate models
m1_r1 <- lm(m1, data = Rwanda_2011)
m1_r2 <- glm(m1, data = Rwanda_2011, family = quasibinomial(link='logit') )
m2_r1 <- lm(m2, data = Rwanda_2011)

m21_r1 <- lm(m21, data = Rwanda_2006)
m22_r1 <- lm(m22, data = Rwanda_2006)



# view output
summary(m1_r1)
summary(m2_r1)

summary(m21_r1)
summary(m22_r1)



tidy(m1_r1)
tidy(m2_r1)

tidy(m21_r1)
tidy(m22_r1)