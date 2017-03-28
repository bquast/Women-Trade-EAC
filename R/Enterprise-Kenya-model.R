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
k07_pr <- formula(female_share_prod    ~ international + capital_city + multi_establ + intern_certif)
k07_np <- formula(female_share_nonprod ~ international + capital_city + multi_establ + intern_certif)
k13_pr <- formula(female_share_prod    ~ international + eac_exporter + capital_city + multi_establ + intern_certif + Tariff + RoW)
k13_np <- formula(female_share_nonprod ~ international + eac_exporter + capital_city + multi_establ + intern_certif + Tariff + RoW)
k13_fo <- formula(female_owner         ~ d3a * eac_exporter  + capital_city + multi_establ + intern_certif)
k13_fs <- formula(female_ownership     ~ d3a * eac_exporter  + capital_city + multi_establ + intern_certif+ industry)

# estimate models
k07_pr_r1 <-  lm(k07_pr, data = Kenya_2007)
k07_pr_r2 <- glm(k07_pr, data = Kenya_2007, family = quasibinomial(link='logit') )
k07_np_r1 <-  lm(k07_np, data = Kenya_2007)
k07_np_r2 <- glm(k07_np, data = Kenya_2007, family = quasibinomial(link='logit') )

k13_pr_r1 <-  lm(k13_pr, data = Kenya_2013t)
k13_pr_r2 <- glm(k13_pr, data = Kenya_2013t, family = quasibinomial(link='logit') )
k13_np_r1 <-  lm(k13_np, data = Kenya_2013t)
k13_np_r2 <- glm(k13_np, data = Kenya_2013t, family = quasibinomial(link='logit') )

k13_fo_r1 <-  lm(k13_fo, data = Kenya_2013)
k13_fo_r2 <- glm(k13_fo, data = Kenya_2013, family = quasibinomial(link='logit') )
k13_fs_r1 <-  lm(k13_fs, data = Kenya_2013)
k13_fs_r2 <- glm(k13_fs, data = Kenya_2013, family = quasibinomial(link='logit') )


# view output
summary(k07_pr_r1)
summary(k07_pr_r2)
summary(k07_np_r1)
summary(k07_np_r2)

summary(k13_pr_r1)
summary(k13_pr_r2)
summary(k13_np_r1)
summary(k13_np_r2)

summary(k13_fo_r1) # d3a: y=female_owner
summary(k13_fo_r2) # d3a: y=female_owner
summary(k13_fs_r1)
summary(k13_fs_r2)

