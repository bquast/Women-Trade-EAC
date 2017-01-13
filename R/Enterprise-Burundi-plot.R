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
Burundi_2014$b4a %>%
  na.omit() %>%
  to_factor() %>%
  qplot(main = 'Percentage of the firm owned by women')

## b7a | Is The Top Manager Female?
Burundi_2014$b7a %>%
  to_factor() %>%
  qplot(main = attributes(.)$label)

## by AF4b2 | Is the Top Manager a public official?
Burundi_2014 %>%
  to_factor() %>%
  group_by(AF4b2, b7a) %>%
  summarise(total = n()) %>%
  ggplot() %+%
    geom_bar(aes(x=total)) %+%
    facet_grid( AF4b2 ~ b7a)

## d3a | % of sales: National sales
Burundi_2014$d3a %>%
  to_factor() %>%
  qplot(main = attributes(.)$label)

## d3b | % of sales: Indirect exports
Burundi_2014$d3b %>%
  to_factor() %>%
  qplot(main = attributes(.)$label)

## d3c | % of sales: Direct exports
Burundi_2014$d3c %>%
  to_factor() %>%
  qplot(main = attributes(.)$label)


## l5a | Num. Full-time Employees At End Of Last Fiscal Yr: female production workers
Burundi_2014$l5 %>%
  na.omit() %>%
  to_factor() %>%
  qplot(main = 'Num. Full-time Employees At End Of Last Fiscal Yr: female production workers')

## l5b | Num. Full-time Employees At End Of Last Fiscal Yr: female non-production workers
Burundi_2014$l5a %>%
  na.omit() %>%
  to_factor() %>%
  qplot(main = 'Num. Full-time Employees At End Of Last Fiscal Yr: female non-production workers')

## l5 | Num. Full-time Employees At End Of Last Fiscal Yr: female
Burundi_2014$l5a %>%
  na.omit() %>%
  to_factor() %>%
  qplot(main = 'Num. Full-time Employees At End Of Last Fiscal Yr: female')
  
## l6 | Num. Full-Time Temporary Employees At End Of Last Fiscal Yr
Burundi_2014$l6 %>%
  to_factor() %>%
  table()

## l6a | Full-time female seasonal or temporary workers employed last fiscal year
Burundi_2014$l6a %>%
  to_factor() %>%
  table()

## l9a | Average Years Of Education For Typical Production Worker
Burundi_2014$l9a %>%
  as.numeric() %>%
  qplot(main = 'Average Years Of Education For Typical Production Worker')

## l9a2 | Average number of years of education of typical Female production worker
Burundi_2014$l9a2 %>%
  as.numeric() %>%
  qplot(main = 'Average number of years of education of typical Female production worker')
