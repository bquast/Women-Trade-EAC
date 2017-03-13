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
r11_f <- formula(female_share ~  capital_city + multi_establ + intern_certif) # ratio female prod workers
r11_f_t <- formula(female_share ~ capital_city + business_city + multi_establ + intern_certif + Tariff)
r11_fo <- formula(female_share ~ capital_city + business_city + multi_establ + intern_certif + Tariff)
r11_fs <- formula(female_share ~ capital_city + business_city + multi_establ + intern_certif + Tariff)

# estimate models
r11_f_r1 <- lm(r11_f, data = Rwanda_2011t)
r11_f_r2 <- glm(r11_f, data = Rwanda_2011t, family = quasibinomial(link='logit') )

r11_f_t_r1 <- lm(r11_f_t, data = Rwanda_2011t)
r11_f_t_r2 <- glm(r11_f_t, data = Rwanda_2011t, family = quasibinomial(link='logit') )


# view output
summary(r11_f_r1)
summary(r11_f_r2)

summary(r11_f_t_r1)
summary(r11_f_t_r2)
