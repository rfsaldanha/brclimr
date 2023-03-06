
<!-- README.md is generated from README.Rmd. Please edit that file -->

# brclimr

<!-- badges: start -->
<!-- badges: end -->

R package to fetch zonal weather indicators for Brazilian
municipalities.

This package fetches zonal statistics from weather indicators created
for each Brazilian municipality with data from the BR-DWGD and
TerraClimate projects. For each municipality and weather indicator,
zonal statistics were calculated considering the data cells that
intersects the municipality, like mean, max, min, sd and sum.

Details about the used methodology to calculate the zonal statistics are
available at *Articles \> Methodology*.

## Installation

``` r
remotes::install_github(repo = "rfsaldanha/brclimr")
```

## Example

For the BR-DWGD project, the following indicators and zonal statistics
can be retrieved.

``` r
library(brclimr)

product_info(product = "brdwgd")
#> <list>
#> ├─tmax: <list>
#> │ ├─link: "https://brdwgd.nyc3.cdn.digitalo..."
#> │ ├─name: "Maximum temperature"
#> │ ├─unit: "°C"
#> │ ├─date_range: "Daily, 1961-01-01 to 2020-07-31"
#> │ └─stats: <list>
#> │   ├─min: "Tmax_min"
#> │   ├─max: "Tmax_max"
#> │   ├─mean: "Tmax_mean"
#> │   └─sd: "Tmax_sd"
#> ├─tmin: <list>
#> │ ├─link: "https://brdwgd.nyc3.cdn.digitalo..."
#> │ ├─name: "Minimum temperature"
#> │ ├─unit: "°C"
#> │ ├─date_range: "Daily, 1961-01-01 to 2020-07-31"
#> │ └─stats: <list>
#> │   ├─min: "Tmin_min"
#> │   ├─max: "Tmin_max"
#> │   ├─mean: "Tmin_mean"
#> │   └─sd: "Tmin_sd"
#> ├─pr: <list>
#> │ ├─link: "https://brdwgd.nyc3.cdn.digitalo..."
#> │ ├─name: "Precipitation"
#> │ ├─unit: "mm"
#> │ ├─date_range: "Daily, 1961-01-01 to 2020-07-31"
#> │ └─stats: <list>
#> │   ├─min: "pr_min"
#> │   ├─max: "pr_max"
#> │   ├─mean: "pr_mean"
#> │   ├─sd: "pr_sd"
#> │   └─sum: "pr_sum"
#> ├─eto: <list>
#> │ ├─link: "https://brdwgd.nyc3.cdn.digitalo..."
#> │ ├─name: "Evapotranspiration"
#> │ ├─unit: "mm"
#> │ ├─date_range: "Daily, 1961-01-01 to 2020-07-31"
#> │ └─stats: <list>
#> │   ├─min: "ETo_min"
#> │   ├─max: "ETo_max"
#> │   ├─mean: "ETo_mean"
#> │   ├─sd: "ETo_sd"
#> │   └─sum: "ETo_sd"
#> ├─rh: <list>
#> │ ├─link: "https://brdwgd.nyc3.cdn.digitalo..."
#> │ ├─name: "Relative humidity"
#> │ ├─unit: "%"
#> │ ├─date_range: "Daily, 1961-01-01 to 2020-07-31"
#> │ └─stats: <list>
#> │   ├─min: "RH_min"
#> │   ├─max: "RH_max"
#> │   ├─mean: "RH_mean"
#> │   └─sd: "RH_sd"
#> ├─rs: <list>
#> │ ├─link: "https://brdwgd.nyc3.cdn.digitalo..."
#> │ ├─name: "Solar radiation"
#> │ ├─unit: "MJ/m2"
#> │ ├─date_range: "Daily, 1961-01-01 to 2020-07-31"
#> │ └─stats: <list>
#> │   ├─min: "Rs_min"
#> │   ├─max: "Rs_max"
#> │   ├─mean: "Rs_mean"
#> │   └─sd: "Rs_sd"
#> └─u2: <list>
#>   ├─link: "https://brdwgd.nyc3.cdn.digitalo..."
#>   ├─name: "Wind speed"
#>   ├─unit: "m/2"
#>   ├─date_range: "Daily, 1961-01-01 to 2020-07-31"
#>   └─stats: <list>
#>     ├─min: "u2_min"
#>     ├─max: "u2_max"
#>     ├─mean: "u2_mean"
#>     └─sd: "u2_sd"
```

To fetch data for a specific product, indicator and statistic, use the
fetch_data function. For example, lets consider the Rio de Janeiro, RJ
municipality (IBGE code number 3304557), data product “brdwgd”, average
relative humidity, from 2010-10-15 to 2010-10-20.

``` r
fetch_data(
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

If you need to query several municipalities, indicators and zonal
statistics, we recommend to download and locally query the parquet files
using the `arrow` package. A list of URLs of the parquet files created
for this project is available at *Articles \> Parquet files*.

## Another example

``` r
tmax <- fetch_data(
  code_muni = 3303401,
  product = "brdwgd",
  indicator = "tmax",
  statistics = "mean",
  date_start = as.Date("2010-01-01"),
  date_end = as.Date("2012-01-01")
)

tmin <- fetch_data(
  code_muni = 3303401,
  product = "brdwgd",
  indicator = "tmin",
  statistics = "mean",
  date_start = as.Date("2010-01-01"),
  date_end = as.Date("2012-01-01")
)

pr <- fetch_data(
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
