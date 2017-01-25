# Women in East Africa
# Enterprise-Burundi-plot.R
# Bastiaan Quast
# bquast@gmail.com

# load data
load(file = 'data/Enterprise/Burundi/Burundi-Enterprise.RData')

# load libraries
library(ggplot2)
library(dplyr)
library(labelled)

# plot relevant variables

# Enterprise | Burundi | 2014

## b4a | Percentage of the firm owned by women
Burundi_2014 %>%
  ggplot(aes(x=b4a, fill=to_factor(e1)) ) %+%
  geom_histogram(binwidth = 10) %+%
  labs(title = 'Percentage of the firm owned by women') %+%
  xlab('share')

## b7a | Is The Top Manager Female?
Burundi_2014 %>%
  ggplot( aes(x=to_factor(e1), fill=to_factor(b7a)) ) %+%
  geom_histogram(stat='count') %+%
  scale_fill_brewer() %+%
  labs(title = 'Is the top manager female?',
       subtitle = 'by product destination') %+%
  xlab('product destination')

## by AF4b2 | Is the Top Manager a public official?
Burundi_2014 %>%
  to_factor() %>%
  group_by(AF4b2, b7a) %>%
  summarise(total = n()) %>%
  ggplot() %+%
  geom_bar(aes(x=total)) %+%
  facet_grid( AF4b2 ~ b7a)

## d3a | % of sales: National sales
Burundi_2014 %>%
  filter(d3a >= 0) %>%
  ggplot(aes(x=d3a)) %+%
  geom_histogram(binwidth = 10) %+%
  labs(title = 'Percentage of sales: National sales')

## d3b | % of sales: Indirect exports
Burundi_2014 %>%
  filter(d3b >= 0) %>%
  ggplot(aes(x=d3b)) %+%
  geom_histogram(binwidth = 10) %+%
  labs(title = 'Percentage of sales: Indirect exports')

## d3c | % of sales: Direct exports
Burundi_2014 %>%
  filter(d3c >= 0) %>%
  ggplot(aes(x=d3c)) %+%
  geom_histogram(binwidth = 10) %+%
  labs(title = 'Percentage of sales: Direct exports')

## l5 | Num. Full-time Employees At End Of Last Fiscal Yr: female
Burundi_2014 %>%
  filter(l5 >= 0) %>%
  ggplot(aes(x=l5)) %+%
  geom_histogram(binwidth = 5) %+%
  labs(title = 'Num. Full-time Employees At End Of Last Fiscal Yr: female')

## l5a | Num. Full-time Employees At End Of Last Fiscal Yr: female production workers
Burundi_2014 %>%
  filter(l5a >= 0) %>%
  ggplot(aes(x=l5a)) %+%
  geom_histogram(binwidth = 2) %+%
  labs(title = 'Num. Full-time Employees At End Of Last Fiscal Yr: female production workers')

## l5b | Num. Full-time Employees At End Of Last Fiscal Yr: female non-production workers
Burundi_2014 %>%
  filter(l5b >= 0) %>%
  ggplot(aes(x=l5b)) %+%
  geom_histogram(binwidth = 2) %+%
  labs(title = 'Num. Full-time Employees At End Of Last Fiscal Yr: female non-production workers')


## l6 | Num. Full-Time Temporary Employees At End Of Last Fiscal Yr
Burundi_2014 %>%
  filter(l6 >= 0) %>%
  ggplot(aes(x=l6)) %+%
  geom_histogram(binwidth = 20) %+%
  labs(title = 'Num. Full-Time Temporary Employees At End Of Last Fiscal Yr')

## l6a | Full-time female seasonal or temporary workers employed last fiscal year
Burundi_2014 %>%
  filter(l6a >= 0) %>%
  ggplot(aes(x=l6a)) %+%
  geom_histogram(binwidth = 20) %+%
  labs(title = 'Full-time female seasonal or temporary workers employed last fiscal year')

## l9a | Average Years Of Education For Typical Production Worker
Burundi_2014 %>%
  filter(l9a >= 0) %>%
  ggplot(aes(x=l9a)) %+%
  geom_histogram(binwidth = 2) %+%
  labs(title = 'Average Years Of Education For Typical Production Worker')

## l9a2 | Average number of years of education of typical Female production worker
Burundi_2014 %>%
  filter(l9a2 >= 0) %>%
  ggplot(aes(x=l9a2)) %+%
  geom_histogram(binwidth = 2) %+%
  labs(title = 'Average number of years of education of typical Female production worker')


## gender_ratio_prod by destination | 
Burundi_2014 %>%
  filter(gender_ratio_prod >= 0) %>%
  filter(gender_ratio_prod <= 1) %>%
  ggplot( aes(x=gender_ratio_prod, fill=to_factor(e1)) ) %+%
  geom_histogram(bins=20) %+%
  scale_fill_brewer() %+%
  labs(title = 'Production Workers: Female Ratio vs. Goods Destination',
       subtitle = 'by >= 10 employees (TRUE)') %+%
  facet_grid( . ~ l4a >= 10)

## gender_ratio_nonprod by destiation | 
Burundi_2014 %>%
  filter(gender_ratio_nonprod >= 0) %>%
  filter(gender_ratio_nonprod <= 1) %>%
  ggplot( aes(x=gender_ratio_nonprod, fill=to_factor(e1)) ) %+%
  geom_histogram(bins=20) %+%
  scale_fill_brewer() %+%
  labs(title = 'Non-Production Workers: Female Ratio vs. Goods Destination',
       subtitle = 'by >= 10 employees (TRUE)') %+%
  facet_grid( . ~ l4a >= 10)

## gender_ratio_prod by destination | 
Burundi_2014 %>%
  filter(gender_ratio_prod >= 0) %>%
  filter(gender_ratio_prod <= 1) %>%
  ggplot( aes(x=gender_ratio_prod, fill=to_factor(e1)) ) %+%
  geom_histogram(position='fill', bins=20) %+%
  scale_fill_brewer() %+%
  labs(title = 'Production Workers: Female Ratio vs. Goods Destination',
       subtitle = 'by >= 10 employees (TRUE)') %+%
  facet_grid( . ~ l4a >= 10)

## gender_ratio_nonprod by destiation | 
Burundi_2014 %>%
  filter(gender_ratio_nonprod >= 0) %>%
  filter(gender_ratio_nonprod <= 1) %>%
  ggplot( aes(x=gender_ratio_nonprod, fill=to_factor(e1)) ) %+%
  geom_histogram(position='fill', bins=20) %+%
  scale_fill_brewer() %+%
  labs(title = 'Non-Production Workers: Female Ratio vs. Goods Destination',
       subtitle = 'by >= 10 employees (TRUE)') %+%
  facet_grid( . ~ l4a >= 10)

## company size by destination
Burundi_2014 %>%
  filter(l4a >= 0) %>%
  filter(l4a < 100) %>%
  ggplot( aes(x=l4a, fill=to_factor(e1)) ) %+%
  geom_histogram() %+%
  scale_fill_brewer() %+%
  labs(title = 'Company size distribution',
       subtitle = 'by no of employees') %+%
  xlab('no. of employees')
