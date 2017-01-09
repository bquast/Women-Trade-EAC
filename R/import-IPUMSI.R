# import-IPUMSI
# Bastiaan Quast
# bquast@gmail.com

# load data import library
library(haven)


# import data
ipumsi <- read_dta("data/IPUMSI/IPUMSI.dta")

# save data
save(ipumsi, file = 'data/IPUMSI/IPUMPSI.RData')

# load data explore library
library(explore) # from https://github.com/bquast/explore

# view data
View(explore(ipumsi))
