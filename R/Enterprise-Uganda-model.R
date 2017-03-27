# Women in East Africa
# Enterprise-Uganda-model.R
# Bastiaan Quast
# bquast@gmail.com

# load data
load(file = 'data/Enterprise/Uganda/Uganda-Enterprise.RData')

# load libraries
library(ggplot2)
library(dplyr)
library(labelled)
library(broom)

# u06 = Tanzania 2006
# u13 = Tanzania 2013
# pr  = female share of production
# np  = female share of non production
# fo  = female owner
# t   = tariff

# define models
u06_pr <- formula(female_share_prod ~ international + capital_city + business_city + multi_establ + intern_certif)
u06_np <- formula(female_share_nonprod ~ international + capital_city + business_city + multi_establ + intern_certif)

u13_pr <- formula(female_share_prod ~ international + capital_city + business_city + multi_establ + intern_certif + eac_exporter)
u13_np <- formula(female_share_nonprod ~ international + capital_city + business_city + multi_establ + intern_certif + eac_exporter + industry)

u13_pr_t <- formula(female_share_prod ~ international + capital_city + business_city + multi_establ + intern_certif + eac_exporter + Tariff)
u13_np_t <- formula(female_share_nonprod ~ international + capital_city + business_city + multi_establ + intern_certif + eac_exporter + Tariff)

# estimate models
u06_pr_r1 <-  lm(u06_pr, data = Uganda_2006)
u06_pr_r2 <- glm(u06_pr, data = Uganda_2006, family = quasibinomial(link='logit') )
u06_np_r1 <-  lm(u06_np, data = Uganda_2006)
u06_np_r2 <- glm(u06_np, data = Uganda_2006, family = quasibinomial(link='logit') )

u13_pr_r1 <-  lm(u13_pr, data = Uganda_2013)
u13_pr_r2 <- glm(u13_pr, data = Uganda_2013, family = quasibinomial(link='logit') )
u13_np_r1 <-  lm(u13_np, data = Uganda_2013)
u13_np_r2 <- glm(u13_np, data = Uganda_2013, family = quasibinomial(link='logit') )

u13_pr_t_r1 <-  lm(u13_pr_t, data = Uganda_2013t)
u13_pr_t_r2 <- glm(u13_pr_t, data = Uganda_2013t, family = quasibinomial(link='logit') )
u13_np_t_r1 <-  lm(u13_np_t, data = Uganda_2013t)
u13_np_t_r2 <- glm(u13_np_t, data = Uganda_2013t, family = quasibinomial(link='logit') )

# view output
summary(u06_pr_r1)
summary(u06_pr_r2)
summary(u06_np_r1)
summary(u06_np_r2)

summary(u13_pr_r1)
summary(u13_pr_r2) # good one
summary(u13_np_r1)
summary(u13_np_r2)

summary(u13_pr_t_r1)
summary(u13_pr_t_r2)
summary(u13_np_t_r1)
summary(u13_np_t_r2)
