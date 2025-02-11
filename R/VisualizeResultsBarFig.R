#' Combine six metrics into one summary
#'
#' @param f_dat1 Output from Ratings2Distributions function.
#' @param f_dat2 Output from CombineSixMetrics function.
#' @returns A figure using dot sizes to represent value
#' @export


VisualizeResultsBarFig <- function(f_dat1 = ipm_exampprocdat, f_dat2 = ipm_exampcombdat){



  #--needed things
  library(ggplot2)
  library(patchwork)

  av1 <-"#A50026"
  av2 <-"#FDAE61"
  av3 <-"#FFFFBF"
  av4 <- "#ABD9E9"
  av5 <- "#313695"

  th1 <- theme(axis.title.y = element_text(size = rel(1.5)),
               axis.text.y = element_blank(),
               axis.text = element_text(size = rel(0.8)),
               axis.ticks.y = element_blank(),
               strip.background = element_rect(fill = "gray80", color = "black"),
               plot.title = element_text(hjust = 0.5, size = rel(2)),
               strip.text.y.left = element_text(angle = 0),
               strip.text.x = element_text(size = rel(1.5)),
               panel.background = element_rect(fill = "white"),
               axis.text.x = element_text(angle = 45, hjust = 1))


  th2 <- theme(axis.title.y = element_text(size = rel(1.5)),
               axis.text = element_text(size = rel(0.8)),
               plot.title = element_text(size = rel(2), hjust = 0.5),
               strip.background = element_rect(fill = "white", color = "black"),
               strip.text = element_text(size = rel(1.5)),
               axis.text.y = element_text(face = c("italic", "italic", "italic", "italic", "italic", "italic", "bold")))

  #--function

  tmp.d1 <-
    f_dat1 %>%
    dplyr::left_join(ipm_shortinfo) %>%
    dplyr::bind_rows(f_dat2 %>%
                       dplyr::mutate(weight = 100)) %>%
     dplyr::mutate(mini_facet = ifelse(short == "all", "Combined", "Individual"),
           desc = paste0(value_metric, " (", weight, "%)"))

  tmp.title <- tmp.d1$title %>% unique()


  p1 <-
    tmp.d1 %>%
    dplyr::filter(short != "all") %>%
    dplyr::arrange(scenario, -weight) %>%
    dplyr::mutate(value_binF = as.factor(value_bin),
           value_metric = stringr::str_to_sentence(value_metric),
           descF = forcats::fct_inorder(desc),
           scenarioF = factor(scenario, levels = c("CCP", "IPM"))) %>%
    ggplot(aes(value_bin, score/100)) +
    geom_col(aes(fill = value_binF), linewidth = 1.5, color = "black", show.legend = F) +
    scale_fill_manual(values = c(av1, av2, av3, av4, av5)) +
    scale_y_continuous(labels = scales::label_percent()) +
    scale_x_continuous(
      breaks = c(1, 2, 3, 4, 5),
      labels = c("Very low value", "Low value", "Medium value", "Highly valuable", "Very highly valuable")) +
    labs(x = NULL,
         y = NULL) +
    th1 +
    facet_grid(descF ~ scenarioF, labeller = label_wrap_gen(), switch = "y")


  p2 <-
    tmp.d1 %>%
    dplyr::filter(short == "all") %>%
    dplyr::arrange(scenario, -weight) %>%
    dplyr::mutate(value_binF = as.factor(value_bin),
           value_metric = stringr::str_to_sentence(value_metric),
           descF = forcats::fct_inorder(desc),
           scenarioF = factor(scenario, levels = c("CCP", "IPM"))) %>%
    ggplot(aes(value_bin, score)) +
    geom_col(aes(fill = value_binF), linewidth = 1.5, color = "black", show.legend = F) +
    scale_fill_manual(values = c(av1, av2, av3, av4, av5)) +
    scale_y_continuous(limits = c(0, 1)) +
    scale_x_continuous(
      breaks = c(1, 2, 3, 4, 5),
      labels = c("Very low value", "Low value", "Medium value", "Highly valuable", "Very highly valuable")) +
    labs(x = NULL,
         y = NULL) +
    th1 +
    facet_grid(descF ~ scenarioF, labeller = label_wrap_gen(), switch = "y")


  layout <- "
AABB
AA##
AA##"

  theme_border <- theme_gray() +
    theme(plot.background = element_rect(fill = NA, colour = 'black', linewidth = 3),
          plot.title = element_text(size = 20, hjust = 0.5))

  p_all <-
    p1 + p2 +
    patchwork::plot_layout(design = layout) +
    patchwork::plot_annotation(title =   tmp.title,
                               theme = theme_border)

  return(p_all)

}
