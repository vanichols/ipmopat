
library(readr)
library(dplyr)
library(tidyr)


# 1. read in data ---------------------------------------------------------

d1 <-
  read_delim("data-raw/ABC-fairy dust lettuce.csv", delim = ";") %>%
  janitor::remove_empty() %>%
  fill(title)


# 2. make it simpler ------------------------------------------------------

d2 <-
  d1 %>%
  select(-question, -value_metric)

# 3. make a separate example with quetsions ------------------------------------------------------

d3 <-
  d1 %>%
  select(value_metric, short, question)


# internal and external data ----------------------------------------------

ipm_exampdat <- d2
usethis::use_data(ipm_exampdat, overwrite = TRUE)
#usethis::use_data(ipm_exampdat, internal = TRUE, overwrite = TRUE)

ipm_shortinfo <- d3
usethis::use_data(ipm_shortinfo, overwrite = TRUE)
