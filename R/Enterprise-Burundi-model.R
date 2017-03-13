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
b06_pr <- formula(female_share_prod    ~ international + capital_city + multi_establ + intern_certif)
b06_np <- formula(female_share_nonprod ~ international + capital_city + multi_establ + intern_certif)
b14_pr <- formula(female_share_prod    ~ international + capital_city + multi_establ + intern_certif + eac_exporter)
b14_np <- formula(female_share_nonprod ~ international + capital_city + multi_establ + intern_certif  + Industry + eac_exporter)

b14_pr_t <- formula(female_share_prod    ~ international + capital_city + multi_establ + intern_certif + eac_exporter + Tariff)
b14_np_t <- formula(female_share_nonprod ~ international + capital_city + multi_establ + intern_certif + eac_exporter + Tariff)

# estimate models
b06_pr_r1 <-  lm(b06_pr, data = Burundi_2006)
b06_pr_r2 <- glm(b06_pr, data = Burundi_2006, family = quasibinomial(link='logit') )
b06_np_r1 <-  lm(b06_np, data = Burundi_2006)
b06_np_r2 <- glm(b06_np, data = Burundi_2006, family = quasibinomial(link='logit') )

b14_pr_r1 <-  lm(b14_pr, data = Burundi_2014)
b14_pr_r2 <- glm(b14_pr, data = Burundi_2014, family = quasibinomial(link='logit') )
b14_np_r1 <-  lm(b14_np, data = Burundi_2014)
b14_np_r2 <- glm(b14_np, data = Burundi_2014, family = quasibinomial(link='logit') )

b14_pr_t_r1 <-  lm(b14_pr_t, data = Burundi_2014)
b14_pr_t_r2 <- glm(b14_pr_t, data = Burundi_2014, family = quasibinomial(link='logit') )
b14_np_t_r1 <-  lm(b14_np_t, data = Burundi_2014)
b14_np_t_r2 <- glm(b14_np_t, data = Burundi_2014, family = quasibinomial(link='logit') )

# view output
summary(b06_pr_r1) # something
summary(b06_pr_r2)
summary(b06_np_r1)
summary(b06_np_r2)

summary(b14_pr_r1)
summary(b14_pr_r2)
summary(b14_np_r1) # good
summary(b14_np_r2) # good

summary(b14_pr_t_r1)
summary(b14_pr_t_r2)
summary(b14_np_t_r1)
summary(b14_np_t_r2)
