# brclimr

R package to fetch zonal weather indicators for Brazilian municipalities.

To install development version:

``` r
remotes::install_gitlab(repo = "rdefreit/brclimr", host = "https://gitlab.inria.fr")
```

Currently, this package uses zonal weather indicators created for each Brazilian municipality with data from the BR-DWGD project (Xavier et al. 2022). For each municipality and weather indicator, a series of statistics was calculated considering the data cells that intersects the municipality.

For the BR-DWGD project, the following data can be retrieved with this package

``` r
brclimr::product_info(product = "brdwgd")
```

    Product: brdwgd
    Maximum temperature [tmax] (°C) : min, max, mean, sd [1963-01-01 to 2020-07-31]
    Minimum temperature [tmin] (°C) : min, max, mean, sd [1963-01-01 to 2020-07-31]
    Precipitation [pr] (mm) : min, max, mean, sd, sum [1963-01-01 to 2020-07-31]
    Evapotranspiration [eto] (mm) : min, max, mean, sd, sum [1963-01-01 to 2020-07-31]
    Relative humidity [rh] (%) : min, max, mean, sd [1963-01-01 to 2020-07-31]
    Solar radiation [rs] (MJ/m2) : min, max, mean, sd [1963-01-01 to 2020-07-31]
    Wind speed [u2] (m/2) : min, max, mean, sd [1963-01-01 to 2020-07-31]

To fetch data for a specific product, indicator and statistic, use the `fetch_data` function. For example, lets consider the Rio de Janeiro, RJ municipality (IBGE code number 3304557), data product "brdwgd", average relative humidity, from 2010-10-15 to 2010-10-20.

``` r
brclimr::fetch_data(
    code_muni = 3304557,
    product = "brdwgd",
    indicator = "rh",
    statistics = "mean",
    date_start = as.Date("2010-10-15"),
    date_end = as.Date("2010-10-20")
  )
```

            date    value
    1 2010-10-15 74.48010
    2 2010-10-16 73.53403
    3 2010-10-17 77.84841
    4 2010-10-18 90.10590
    5 2010-10-19 74.33522
    6 2010-10-20 71.50061
