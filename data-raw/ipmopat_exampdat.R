## code to prepare `DATASET` dataset goes here

library(readr)
library(dplyr)
library(tidyr)


# 1. read in data ---------------------------------------------------------

impopat_exampdat <-
  read_delim("data-raw/ABC-fairy dust lettuce.csv", delim = ";") %>%
  janitor::remove_empty() %>%
  fill(title)

# internal and external data ----------------------------------------------

usethis::use_data(impopat_exampdat, overwrite = TRUE)
usethis::use_data(impopat_exampdat, internal = TRUE)
