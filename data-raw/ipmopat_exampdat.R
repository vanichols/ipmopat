## code to prepare `DATASET` dataset goes here

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
  select(-question)

# 3. make a separate example with quetsions ------------------------------------------------------

d3 <-
  d1 %>%
  select(short, question)


# internal and external data ----------------------------------------------

impopat_exampdat <- d2
usethis::use_data(impopat_exampdat, overwrite = TRUE)
usethis::use_data(impopat_exampdat, internal = TRUE, overwrite = TRUE)

impopat_shortinfo <- d3
usethis::use_data(impopat_shortinfo, overwrite = TRUE)
