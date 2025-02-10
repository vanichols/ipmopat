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

d1 <- read_delim("data-raw/Ratings2Distributions-output.csv")


# 3. create internal dataset (not working)----------------------------------------------

ipmopat_exampprocdat <- d1
int_exampprocdat <- d1

usethis::use_data(ipmopat_exampprocdat, overwrite = TRUE)
#--this internal data thing is not working...
#usethis::use_data(int_exampprocdat, internal = TRUE, overwrite = TRUE)

