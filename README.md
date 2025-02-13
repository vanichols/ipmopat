
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ipmopat

<!-- badges: start -->
<!-- badges: end -->

The goal of **ipmopat** is to provide open-source processing of data
elicited from projects in the ADOPT-IPM consortium. It is an Integrated
Pest Management (IPM) Open-source Performance Assessment Tool (OPAT),
thus the clunky name, IPMOPAT.

## Quick overview of data flow

1.  An ADOPT-IPM project leader or collaborator will choose a Common
    Commercial Practice (CCP) and a new IPM-based method to compare.
2.  The expert will assign weights to each of the six value categories,
    according to their priorities:

- Crop value
- Health and safety
- Direct costs
- Environment
- Time and management
- Coordination requirements

3.  Starting with the CCP scenario, the expert will rate each value
    category (very low value, low, medium, high, very high)
4.  The expert will also assign a confidence level (low, medium, high,
    very high) to their ratings
5.  The expert will repeat steps 3 and 4 for the IPM scenario
6.  This **impopat** R package will

- take those ratings/confidence level pairs, and create value
  distributions for each of the six categories
- combine the six categories into a summary value distribution
- create visualizations that compare the value of the two scenarios with
  bar graphs

## Installation

You can install the development version of ipmopat from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("vanichols/ipmopat")
```

## Example

Look at example data. This example is comparing glyphosate and fairy
dust in lettuce for weed control. This example data should be used as a
template.

``` r
library(ipmopat)
ipm_exinput
#> # A tibble: 6 × 7
#>   title         weight short ccp_rating ccp_confidence ipm_rating ipm_confidence
#>   <chr>          <dbl> <chr> <chr>      <chr>          <chr>      <chr>         
#> 1 ABC - Using …  50    crop… low impact H              low impact H             
#> 2 <NA>           12.5  heal… medium im… M              low impact VH            
#> 3 <NA>           12.5  dire… very low … H              low impact M             
#> 4 <NA>           12.5  envi… low impact H              medium im… M             
#> 5 <NA>            6.25 time… very low … H              low impact H             
#> 6 <NA>            6.25 coor… very low … H              medium im… M
```

See more details about the impact categories, it will have some more
detail added as we refine the questionaire…

``` r
ipm_impactcatsinfo
#> # A tibble: 6 × 3
#>   short                     value_metric                           question     
#>   <chr>                     <chr>                                  <chr>        
#> 1 crop value                Maintaining crop value                 Crop value l…
#> 2 health and safety         Reducing health and safety risks       Worker (non-…
#> 3 direct costs              Minimizing direct costs                The cost of …
#> 4 environment               Minimizing environmental impacts       The potentia…
#> 5 time and management       Minimizing time and management demands The time and…
#> 6 coordination requirements Immediate usability                    The coordina…
```

One monster function will intake your data, and pop out a bar graph
visualization (color blind friendly, we believe). Here we use the
example data as input.Thanks for reading.Note there is a function to
make output in a way Python will recognize.

``` r
MakeImage4R(f_dat = ipm_exinput)
#> Joining with `by = join_by(value_bin)`
#> Joining with `by = join_by(value_bin)`
#> Joining with `by = join_by(short)`
```

<img src="man/figures/README-example4-1.png" width="100%" />
