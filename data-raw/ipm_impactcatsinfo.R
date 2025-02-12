
d <- system.file("extdata", "ABC-fairy dust lettuce.csv", package = "ipmopat")

d1 <-
  readr::read_delim(d, delim = ";") %>%
  janitor::remove_empty()

d2 <-
  d1 %>%
  dplyr::select(short, value_metric, question)


ipm_impactcatsinfo <- d2

usethis::use_data(ipm_impactcatsinfo, overwrite = TRUE)
