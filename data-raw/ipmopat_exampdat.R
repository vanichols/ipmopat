#' Example input data
#'
#' A dataset containing dummy ratings and confidences for the six metrics
#'
#' @format A data frame with 6 rows and 7 variables:
#' \describe{
#'   \item{title}{A title describing the comparison being done}
#'   \item{weight}{Weights given to each metric}
#'   \item{short}{Weights given to each metric}
#'   \item{ccp_rating}{Rating of CCP scenario}
#'   \item{ccp_confidence}{Confidence in rating of CCP scenario}
#'   \item{ipm_rating}{Rating of IPM scenario}
#'   \item{ipm_confidence}{Confidence in rating of IPM scenario}
#' }
"impopat_exampdat"


## code to prepare dataset goes here

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
