

Ratings_2_Distributions <- function(f_dat = impopat_exampdat){

  d_dat <- int_binned_betas

  #--get list of the six metrics
  t.cats <-
    f_dat %>%
    pull(short)

  #--separate data into ccp data and ipm data
  f_dat_ccp <-
    f_dat %>%
    select(title, weight, short, rating = ccp_rating, confidence = ccp_confidence)


  t.sum_ccp <- NULL

  for(i in 1:length(t.cats)){

    #--get single metric rating and confidence combo
    t1_ccp <-
      f_dat_ccp %>%
      filter(short == t.cats[i])

    #--merge with beta dist for that combo
    t2_ccp <-
      t1_ccp %>%
      left_join(
        d_dat %>%
          filter(rating == t1_ccp$rating,
                 confidence == t1_ccp$confidence)
      ) %>%
      mutate(scenario = "CCP")

    t.sum_ccp <-
      bind_rows(t.sum_ccp, t2_ccp)

    i <- i + 1

  }

  #--separate data into ccp data and ipm data
  f_dat_ipm <-
    f_dat %>%
    select(title, weight, short,
           rating = ipm_rating,
           confidence = ipm_confidence)


  t.sum_ipm <- NULL

  for(i in 1:length(t.cats)){

    #--get single metric rating and confidence combo
    t1_ipm <-
      f_dat_ipm %>%
      filter(short == t.cats[i])

    #--merge with beta dist for that combo
    t2_ipm <-
      t1_ipm %>%
      left_join(
        d_dat %>%
          filter(rating == t1_ipm$rating,
                 confidence == t1_ipm$confidence)
      ) %>%
      mutate(scenario = "IPM")

    t.sum_ipm <-
      bind_rows(t.sum_ipm, t2_ipm)

    i <- i + 1

  }

  t.sum <-
    bind_rows(t.sum_ccp, t.sum_ipm)

  return(t.sum)
}
