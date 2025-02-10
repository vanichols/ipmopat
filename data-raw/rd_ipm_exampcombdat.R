## code to prepare the internal dataset int_binned_betas

## it is internal data bc the functions will need to call it

#--recreate the beta distributions the EUCLID project used
#   for assigning uncertainty to the ratings
#   and distribute them amongst five bins

#--I used this code as a helper tool, I created the distribution cheat sheet by hand

library(readr)
library(dplyr)
library(tidyr)


# 1. read in data ---------------------------------------------------------

d1 <- read_delim("data-raw/CombineSixMetrics-output.csv")


# 2. make package data ----------------------------------------------------

ipm_exampcombdat <- d1

usethis::use_data(ipm_exampcombdat, overwrite = TRUE)

