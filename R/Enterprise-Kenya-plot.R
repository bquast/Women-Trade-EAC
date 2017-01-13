# Women in East Africa
# Enterprise-Kenya-plot.R
# Bastiaan Quast
# bquast@gmail.com

# load data
load(file = 'data/Enterprise/Kenya/Kenya-Enterprise.RData')

# load libraries
library(ggplot2)
library(dplyr)
library(labelled)

# plot relevant variables

# Enterprise | Kenya | 2013

## b4a | Percentage of the firm owned by women
Kenya_2013$b4a %>%
  na.omit() %>%
  to_factor() %>%
  qplot(main = 'Percentage of the firm owned by women')

## b7a | Is The Top Manager Female?
Kenya_2013$b7a %>%
  to_factor() %>%
  qplot(main = attributes(.)$label)

## by AF4b2 | Is the Top Manager a public official?
Kenya_2013 %>%
  to_factor() %>%
  group_by(AF4b2, b7a) %>%
  summarise(total = n()) %>%
  ggplot() %+%
    geom_bar(aes(x=total)) %+%
    facet_grid( AF4b2 ~ b7a)

## d3a | % of sales: National sales
Kenya_2013$d3a %>%
  to_factor() %>%
  qplot(main = attributes(.)$label)

## d3b | % of sales: Indirect exports
Kenya_2013$d3b %>%
  to_factor() %>%
  qplot(main = attributes(.)$label)

## d3c | % of sales: Direct exports
Kenya_2013$d3c %>%
  to_factor() %>%
  qplot(main = attributes(.)$label)


## l5a | Num. Full-time Employees At End Of Last Fiscal Yr: female production workers
Kenya_2013$l5a %>%
  na.omit() %>%
  to_factor() %>%
  qplot(main = 'Num. Full-time Employees At End Of Last Fiscal Yr: female production workers')

## l5b | Num. Full-time Employees At End Of Last Fiscal Yr: female non-production workers
Kenya_2013$l5a %>%
  na.omit() %>%
  to_factor() %>%
  qplot(main = 'Num. Full-time Employees At End Of Last Fiscal Yr: female non-production workers')

## l5 | Num. Full-time Employees At End Of Last Fiscal Yr: female
Kenya_2013$l5 %>%
  na.omit() %>%
  to_factor() %>%
  qplot(main = 'Num. Full-time Employees At End Of Last Fiscal Yr: female')
  
## l6 | Num. Full-Time Temporary Employees At End Of Last Fiscal Yr
Kenya_2013$l6 %>%
  to_factor() %>%
  table()

## l6a | Full-time female seasonal or temporary workers employed last fiscal year
Kenya_2013$l6a %>%
  to_factor() %>%
  table()

## l9a | Average Years Of Education For Typical Production Worker
Kenya_2013$l9a %>%
  as.numeric() %>%
  qplot(main = 'Average Years Of Education For Typical Production Worker')

## l9a2 | Average number of years of education of typical Female production worker
Kenya_2013$l9a2 %>%
  as.numeric() %>%
  qplot(main = 'Average number of years of education of typical Female production worker')
