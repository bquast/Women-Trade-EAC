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
