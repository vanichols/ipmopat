#' Combine six metrics into one summary
#'
#' @param f_dat Output from Ratings2Distributions function.
#' @returns A dataframe
#' @export


CombineSixMetrics <- function(f_dat = ipmopat_exampprocdat, f_nsamp = 10000){

  f_theimps <-
    f_dat %>%
    dplyr::pull(short) %>%
    unique()

  tmp.scen <-
    f_dat %>%
    dplyr::pull(scenario) %>%
    unique()

  bayes.value.vector <- NULL

  for(k in 1:length(f_theimps)){

    tmp.impact <- f_theimps[k]

    tmp.df <-
      f_dat %>%
      select(short, value_bin, score) %>%
      filter(short == tmp.impact)

    tmp.wt <-
      f_dat %>%
      select(weight, short) %>%
      filter(short == tmp.impact) %>%
      distinct() %>%
      pull(weight)

    tmp.samp <- sample(x = tmp.df$value_bin, prob = tmp.df$score, size = f_nsamp*tmp.wt, replace = TRUE)

    bayes.value.vector <- c(bayes.value.vector, tmp.samp)

    k <- k + 1

  }

  dat <-
    tibble::tibble(value_bin = bayes.value.vector) %>%
    dplyr::group_by(value_bin) %>%
    dplyr::summarise(score = n()/10000) %>%
    dplyr::mutate(weight = 100,
           confidence = "-",
           title = "All categories combined",
           short = "all",
           scenario = tmp.scen)

  return(dat)

}
