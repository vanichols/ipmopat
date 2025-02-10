#' Combine six metrics into one summary
#'
#' @param f_dat Output from Ratings2Distributions function.
#' @returns A dataframe
#' @export


CombineSixMetrics <- function(f_dat = ipm_exampprocdat, f_nsamp = 10000){

  f_theimps <-
    f_dat %>%
    dplyr::pull(short) %>%
    unique()

  tmp.scen <-
    f_dat %>%
    dplyr::pull(scenario) %>%
    unique()


  #--first scenario
  f_dat1 <-
    f_dat %>%
    dplyr::filter(scenario == tmp.scen[1])

  bayes.value.vector <- NULL

  for(k in 1:length(f_theimps)){

    tmp.impact <- f_theimps[k]

    tmp.df <-
      f_dat1 %>%
      dplyr::select(short, value_bin, score) %>%
      dplyr::filter(short == tmp.impact)

    tmp.wt <-
      f_dat %>%
      dplyr::select(weight, short) %>%
      dplyr::filter(short == tmp.impact) %>%
      dplyr::distinct() %>%
      dplyr::pull(weight)

    tmp.samp <- sample(x = tmp.df$value_bin, prob = tmp.df$score, size = f_nsamp*tmp.wt, replace = TRUE)

    bayes.value.vector <- c(bayes.value.vector, tmp.samp)

    k <- k + 1

  }

  dat1 <-
    tibble::tibble(value_bin = bayes.value.vector) %>%
    dplyr::group_by(value_bin) %>%
    dplyr::summarise(score = n()/10000) %>%
    dplyr::mutate(weight = 100,
           confidence = "-",
           value_metric  = "All categories combined",
           short = "all",
           scenario = tmp.scen[1])

  #--second scenario
  f_dat2 <-
    f_dat %>%
    dplyr::filter(scenario == tmp.scen[2])

  bayes.value.vector2 <- NULL

  for(k in 1:length(f_theimps)){

    tmp.impact <- f_theimps[k]

    tmp.df <-
      f_dat2 %>%
      dplyr::select(short, value_bin, score) %>%
      dplyr::filter(short == tmp.impact)

    tmp.wt <-
      f_dat %>%
      dplyr::select(weight, short) %>%
      dplyr::filter(short == tmp.impact) %>%
      dplyr::distinct() %>%
      dplyr::pull(weight)

    tmp.samp <- sample(x = tmp.df$value_bin, prob = tmp.df$score, size = f_nsamp*tmp.wt, replace = TRUE)

    bayes.value.vector2 <- c(bayes.value.vector2, tmp.samp)

    k <- k + 1

  }

  dat2 <-
    tibble::tibble(value_bin = bayes.value.vector2) %>%
    dplyr::group_by(value_bin) %>%
    dplyr::summarise(score = n()/10000) %>%
    dplyr::mutate(weight = 100,
                  confidence = "-",
                  value_metric = "All categories combined",
                  short = "all",
                  scenario = tmp.scen[2])

  dat <-
    dplyr::bind_rows(dat1, dat2) %>%
    dplyr::mutate(title = f_dat$title %>% unique()) %>%
    select(title, scenario, short, value_metric, value_bin, score)

  return(dat)

}
