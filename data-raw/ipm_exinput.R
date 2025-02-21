#--create an example elicitation dataset

library(readr)
library(dplyr)
library(tidyr)


# 1. read in data ---------------------------------------------------------

d <- system.file("extdata", "ABC-fairy dust lettuce.csv", package = "ipmopat")

d1 <-
  read_delim(d, delim = ";") %>%
  janitor::remove_empty()


# 2. make it simpler ------------------------------------------------------

d2 <-
  d1 %>%
  select(-question, -value_metric)


ipm_exinput <- d2
usethis::use_data(ipm_exinput, overwrite = TRUE)
