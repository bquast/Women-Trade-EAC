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
m1 <- formula()

# estimate models
m1_r1 <- lm(m1, data = Kenya_2007)
m1_r2 <- lm(m1, data = Kenya_2013)

# view output
summary(m1_r1)
summary(m1_r2)
