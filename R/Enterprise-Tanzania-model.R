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

# t06 = Tanzania 2006
# t13 = Tanzania 2013
# pr  = female share of production
# np  = female share of non production
# fo  = female owner
# t   = tariff

# define models
t06_pr <- formula(female_share_prod    ~ international + capital_city + business_city + multi_establ + intern_certif)
t06_np <- formula(female_share_nonprod ~ international + capital_city + business_city + multi_establ + intern_certif)

t13_pr <- formula(female_share_prod    ~ international + capital_city + business_city + multi_establ + intern_certif + eac_exporter + industry)
t13_np <- formula(female_share_nonprod ~ international + capital_city + business_city + multi_establ + intern_certif + eac_exporter + industry)

t13_pr_t <- formula(log(female_share_prod+1)    ~ international + capital_city + business_city + multi_establ + intern_certif + eac_exporter + log(Tariff+1) )
t13_np_t <- formula(log(female_share_nonprod+1) ~ international + capital_city + business_city + multi_establ + intern_certif + eac_exporter + log(Tariff+1) )

t13_fo <- formula(female_owner ~ international + capital_city + business_city + multi_establ + intern_certif + eac_exporter + industry)
t13_fs <- formula(female_ownership ~ international + capital_city + business_city + multi_establ + intern_certif + eac_exporter + industry)

# estimate models
t06_pr_r1 <-  lm(t06_pr, data = Tanzania_2006)
t06_pr_r2 <- glm(t06_pr, data = Tanzania_2006, family = quasibinomial(link='logit') )
t06_np_r1 <-  lm(t06_np, data = Tanzania_2006)
t06_np_r2 <- glm(t06_np, data = Tanzania_2006, family = quasibinomial(link='logit') )

t13_pr_r1 <-  lm(t13_pr, data = Tanzania_2013)
t13_pr_r2 <- glm(t13_pr, data = Tanzania_2013, family = quasibinomial(link='logit') )
t13_np_r1 <-  lm(t13_np, data = Tanzania_2013)
t13_np_r2 <- glm(t13_np, data = Tanzania_2013, family = quasibinomial(link='logit') )
t13_fo_r1 <-  lm(t13_fo, data = Tanzania_2013)
t13_fo_r2 <- glm(t13_fo, data = Tanzania_2013, family = quasibinomial(link='logit') )
t13_fs_r1 <-  lm(t13_fs, data = Tanzania_2013)
t13_fs_r2 <- glm(t13_fs, data = Tanzania_2013, family = quasibinomial(link='logit') )

t13_pr_t_r1 <-  lm(t13_pr_t, data = Tanzania_2013t)
t13_pr_t_r2 <- glm(t13_pr_t, data = Tanzania_2013t, family = quasibinomial(link='logit') )
t13_np_t_r1 <-  lm(t13_np_t, data = Tanzania_2013t)
t13_np_t_r2 <- glm(t13_np_t, data = Tanzania_2013t, family = quasibinomial(link='logit') )

# view output
summary(t06_pr_r1) # capital multi_est
summary(t06_pr_r2) # capital multi_est
summary(t06_np_r1)
summary(t06_np_r2)

summary(t13_pr_r1) # -manufacturing
summary(t13_pr_r2) # -manufacturing
summary(t13_np_r1) # international
summary(t13_np_r2) # international

summary(t13_pr_t_r1) # tariff
summary(t13_pr_t_r2) # tariff
summary(t13_np_t_r1) # international
summary(t13_np_t_r2) # international

summary(t13_fo_r1) # international business manufacturing
summary(t13_fo_r2) # international business manufacturing
summary(t13_fs_r1) # intern_certif manufacturing
summary(t13_fs_r2) # intern_certif manufacturing
