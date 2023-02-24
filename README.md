
<!-- README.md is generated from README.Rmd. Please edit that file -->

# brclimr

<!-- badges: start -->
<!-- badges: end -->

R package to fetch zonal weather indicators for Brazilian
municipalities.

## Installation

You can install the development version of brclimr like so:

``` r
remotes::install_gitlab(repo = "rdefreit/brclimr", host = "https://gitlab.inria.fr")
```

## Main functions

Currently, this package fetches zonal statistics from weather indicators
created for each Brazilian municipality with data from the BR-DWGD
project (Xavier et al. 2022). For each municipality and weather
indicator, a series of daily zonal statistics was calculated considering
the data cells that intersects the municipality, like mean, max, min, sd
and sum.

For the BR-DWGD project, the following data can be retrieved with this
package

``` r
library(brclimr)

product_info(product = "brdwgd")
#> Product: brdwgd
#> Maximum temperature [tmax] (°C) : min, max, mean, sd [Daily, 1963-01-01 to 2020-07-31]
#> Minimum temperature [tmin] (°C) : min, max, mean, sd [Daily, 1963-01-01 to 2020-07-31]
#> Precipitation [pr] (mm) : min, max, mean, sd, sum [Daily, 1963-01-01 to 2020-07-31]
#> Evapotranspiration [eto] (mm) : min, max, mean, sd, sum [Daily, 1963-01-01 to 2020-07-31]
#> Relative humidity [rh] (%) : min, max, mean, sd [Daily, 1963-01-01 to 2020-07-31]
#> Solar radiation [rs] (MJ/m2) : min, max, mean, sd [Daily, 1963-01-01 to 2020-07-31]
#> Wind speed [u2] (m/2) : min, max, mean, sd [Daily, 1963-01-01 to 2020-07-31]
```

To fetch data for a specific product, indicator and statistic, use the
fetch_data function. For example, lets consider the Rio de Janeiro, RJ
municipality (IBGE code number 3304557), data product “brdwgd”, average
relative humidity, from 2010-10-15 to 2010-10-20.

``` r
brclimr::fetch_data(
    code_muni = 3304557,
    product = "brdwgd",
    indicator = "rh",
    statistics = "mean",
    date_start = as.Date("2010-10-15"),
    date_end = as.Date("2010-10-20")
  )
#>         date    value
#> 1 2010-10-15 74.48010
#> 2 2010-10-16 73.53403
#> 3 2010-10-17 77.84841
#> 4 2010-10-18 90.10590
#> 5 2010-10-19 74.33522
#> 6 2010-10-20 71.50061
```

## Another example

``` r
tmax <- brclimr::fetch_data(
  code_muni = 3303401,
  product = "brdwgd",
  indicator = "tmax",
  statistics = "mean",
  date_start = as.Date("2010-01-01"),
  date_end = as.Date("2012-01-01")
)

tmin <- brclimr::fetch_data(
  code_muni = 3303401,
  product = "brdwgd",
  indicator = "tmin",
  statistics = "mean",
  date_start = as.Date("2010-01-01"),
  date_end = as.Date("2012-01-01")
)

pr <- brclimr::fetch_data(
  code_muni = 3303401,
  product = "brdwgd",
  indicator = "pr",
  statistics = "sum",
  date_start = as.Date("2010-01-01"),
  date_end = as.Date("2012-01-01")
)

tmax$name <- "Tmax_avg"
tmin$name <- "Tmin_avg"
```

``` r
library(ggplot2)

ggplot(data = rbind(tmax, tmin), aes(x = date, y = value, color = name)) +
  geom_line() +
  scale_x_date(date_breaks = "2 months", date_labels =  "%m/%y") +
  ylim(0, NA) +
  labs(
    title = "Nova Friburgo, RJ",
    x = "Date", 
    y = "Temperature (average)",
    color = ""
  ) +
  theme_bw() +
  theme(legend.position = "bottom", legend.direction = "horizontal")
```

<img src="man/figures/README-unnamed-chunk-5-1.png" width="100%" />

``` r
ggplot(data = pr, aes(x = date, y = value)) +
  geom_line(color = "blue") +
  scale_x_date(date_breaks = "2 months", date_labels =  "%m/%y") +
  ylim(0, NA) +
  labs(
    title = "Nova Friburgo, RJ",
    x = "Date", 
    y = "Precipitation (sum)",
    color = ""
  ) +
  theme_bw() +
  theme(legend.position = "bottom", legend.direction = "horizontal")
```

<img src="man/figures/README-unnamed-chunk-6-1.png" width="100%" />
