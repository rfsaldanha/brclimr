## code to prepare `brdwgd_data` dataset goes here

brdwgd_data <- list(
  "tmax" = list(
    "name" = "Maximum temperature",
    "unit" = "Degree Celsius",
    "date_range" = "Daily, 1961-01-01 to 2020-07-31",
    "stats" = list(
      "min" = "Tmax_min",
      "max" = "Tmax_max",
      "mean" = "Tmax_mean",
      "sd" = "Tmax_sd"
    )
  ),
  "tmin" = list(
    "name" = "Minimum temperature",
    "unit" = "Degree Celsius",
    "date_range" = "Daily, 1961-01-01 to 2020-07-31",
    "stats" = list(
      "min" = "Tmin_min",
      "max" = "Tmin_max",
      "mean" = "Tmin_mean",
      "sd" = "Tmin_sd"
    )
  ),
  "pr" = list(
    "name" = "Precipitation",
    "unit" = "mm",
    "date_range" = "Daily, 1961-01-01 to 2020-07-31",
    "stats" = list(
      "min" = "pr_min",
      "max" = "pr_max",
      "mean" = "pr_mean",
      "sd" = "pr_sd",
      "sum" = "pr_sum"
    )
  ),
  "eto" = list(
    "name" = "Evapotranspiration",
    "unit" = "mm",
    "date_range" = "Daily, 1961-01-01 to 2020-07-31",
    "stats" = list(
      "min" = "ETo_min",
      "max" = "ETo_max",
      "mean" = "ETo_mean",
      "sd" = "ETo_sd",
      "sum" = "ETo_sd"
    )
  ),
  "rh" = list(
    "name" = "Relative humidity",
    "unit" = "Percentage",
    "date_range" = "Daily, 1961-01-01 to 2020-07-31",
    "stats" = list(
      "min" = "RH_min",
      "max" = "RH_max",
      "mean" = "RH_mean",
      "sd" = "RH_sd"
    )
  ),
  "rs" = list(
    "name" = "Solar radiation",
    "unit" = "MJ/m2",
    "date_range" = "Daily, 1961-01-01 to 2020-07-31",
    "stats" = list(
      "min" = "Rs_min",
      "max" = "Rs_max",
      "mean" = "Rs_mean",
      "sd" = "Rs_sd"
    )
  ),
  "u2" = list(
    "name" = "Wind speed",
    "unit" = "m/2",
    "date_range" = "Daily, 1961-01-01 to 2020-07-31",
    "stats" = list(
      "min" = "u2_min",
      "max" = "u2_max",
      "mean" = "u2_mean",
      "sd" = "u2_sd"
    )
  )
)


usethis::use_data(brdwgd_data, overwrite = TRUE)
