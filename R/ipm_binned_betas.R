#' Lookup table with binned beta distributions
#'
#' Lookup table pairing binned beta distributions with a rating and confidence level pair
#'
#' @format A data frame with 34 rows and 16 columns.
#' describe{
#' item{rating}{The user-supplied rating (very low impact, low impact, medium impact, high impact, very high impact)}
#' item{confidence}{The confidence (L, M, H, or VH) the user has in the rating}
#' item{score}{the score (out of 100) to place in a given bin}
#' item{value_bin}{the value bin}
#' }
#' @source Created by Deepsha Menghani by watching the show and counting the number of F**ks used in sentences and as gestures
#'
#' @examples
#' data(ipm_binned_betas)
"ipm_binned_betas"
