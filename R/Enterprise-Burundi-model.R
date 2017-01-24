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
m1 <- formula(gender_ratio_prod ~ to_factor(e1) ) # ratio female prod workers
m2 <- formula(gender_ratio_nonprod ~ to_factor(e1) ) # ratio female nonprod workers
m3 <- formula() # (partially) owned by female
m4 <- formula() # percentage owned by female

# estimate models
m1_r1 <- lm(m1, data = Burundi_2014)
m2_r1 <- lm(m2, data = Burundi_2014)

# view output
summary(m1_r1)
summary(m2_r1)

tidy(m1_r1)
tidy(m2_r1)