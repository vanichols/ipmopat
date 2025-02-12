#' Intakes elicitation data
#'
#' @param f_dat The elicited data.
#' @returns An image
#' @export


MonsterFxn <- function(f_dat = ipm_exinput){

  print("Working on it")
  #
  #
  # ## in the process of being made
  #
  # #--make sure weight is a numeric value, fill title
  # f_dat2 <-
  #   f_dat %>%
  #   mutate(weight = as.numeric(weight)) %>%
  #   fill(title)
  #
  # #--get list of the six metrics
  # t.cats <-
  #   f_dat2 %>%
  #   dplyr::pull(short)
  #
  # #--separate data into ccp data and ipm data
  # f_dat_ccp <-
  #   f_dat2 %>%
  #   dplyr::select(title, weight, short, rating = ccp_rating, confidence = ccp_confidence)
  #
  #
  # t.sum_ccp <- NULL
  #
  # for(i in 1:length(t.cats)){
  #
  #   #--get single metric rating and confidence combo
  #   t1_ccp <-
  #     f_dat_ccp %>%
  #     dplyr::filter(short == t.cats[i])
  #
  #   #--merge with beta dist for that combo
  #   t2_ccp <-
  #     t1_ccp %>%
  #     dplyr::left_join(
  #       d_dat %>%
  #         dplyr::filter(rating == t1_ccp$rating,
  #                confidence == t1_ccp$confidence)
  #     ) %>%
  #     dplyr::mutate(scenario = "CCP")
  #
  #   t.sum_ccp <-
  #     dplyr::bind_rows(t.sum_ccp, t2_ccp)
  #
  #   i <- i + 1
  #
  # }
  #
  # #--separate data into ccp data and ipm data
  # f_dat_ipm <-
  #   f_dat2 %>%
  #   dplyr::select(title, weight, short,
  #          rating = ipm_rating,
  #          confidence = ipm_confidence)
  #
  #
  # t.sum_ipm <- NULL
  #
  # for(i in 1:length(t.cats)){
  #
  #   #--get single metric rating and confidence combo
  #   t1_ipm <-
  #     f_dat_ipm %>%
  #     dplyr::filter(short == t.cats[i])
  #
  #   #--merge with beta dist for that combo
  #   t2_ipm <-
  #     t1_ipm %>%
  #     dplyr::left_join(
  #       d_dat %>%
  #         dplyr::filter(rating == t1_ipm$rating,
  #                confidence == t1_ipm$confidence)
  #     ) %>%
  #     dplyr::mutate(scenario = "IPM")
  #
  #   t.sum_ipm <-
  #     dplyr::bind_rows(t.sum_ipm, t2_ipm)
  #
  #   i <- i + 1
  #
  # }
  #
  # t.sum <-
  #   dplyr::bind_rows(t.sum_ccp, t.sum_ipm)
  #
  # return(t.sum)
}
