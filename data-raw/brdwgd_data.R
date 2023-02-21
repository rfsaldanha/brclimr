## code to prepare `brdwgd_data` dataset goes here

brdwgd_data <- list(
  "tmax" = list(
    "link" = "https://brdwgd.nyc3.cdn.digitaloceanspaces.com/parquet%2Ftmax.parquet",
    "name" = "Maximum temperature",
    "unit" = "\u00B0C",
    "date_range" = "1963-01-01 to 2020-07-31",
    "stats" = list(
      "min" = "Tmax_min",
      "max" = "Tmax_max",
      "mean" = "Tmax_mean",
      "sd" = "Tmax_sd"
    )
  ),
  "tmin" = list(
    "link" = "https://brdwgd.nyc3.cdn.digitaloceanspaces.com/parquet%2Ftmin.parquet",
    "name" = "Minimum temperature",
    "unit" = "\u00B0C",
    "date_range" = "1963-01-01 to 2020-07-31",
    "stats" = list(
      "min" = "Tmin_min",
      "max" = "Tmin_max",
      "mean" = "Tmin_mean",
      "sd" = "Tmin_sd"
    )
  ),
  "pr" = list(
    "link" = "https://brdwgd.nyc3.cdn.digitaloceanspaces.com/parquet%2Fpr.parquet",
    "name" = "Precipitation",
    "unit" = "mm",
    "date_range" = "1963-01-01 to 2020-07-31",
    "stats" = list(
      "min" = "pr_min",
      "max" = "pr_max",
      "mean" = "pr_mean",
      "sd" = "pr_sd",
      "sum" = "pr_sum"
    )
  ),
  "eto" = list(
    "link" = "https://brdwgd.nyc3.cdn.digitaloceanspaces.com/parquet%2Feto.parquet",
    "name" = "Evapotranspiration",
    "unit" = "mm",
    "date_range" = "1963-01-01 to 2020-07-31",
    "stats" = list(
      "min" = "ETo_min",
      "max" = "ETo_max",
      "mean" = "ETo_mean",
      "sd" = "ETo_sd",
      "sum" = "ETo_sd"
    )
  ),
  "rh" = list(
    "link" = "https://brdwgd.nyc3.cdn.digitaloceanspaces.com/parquet%2Frh.parquet",
    "name" = "Relative humidity",
    "unit" = "%",
    "date_range" = "1963-01-01 to 2020-07-31",
    "stats" = list(
      "min" = "RH_min",
      "max" = "RH_max",
      "mean" = "RH_mean",
      "sd" = "RH_sd"
    )
  ),
  "rs" = list(
    "link" = "https://brdwgd.nyc3.cdn.digitaloceanspaces.com/parquet%2Frs.parquet",
    "name" = "Solar radiation",
    "unit" = "MJ/m2",
    "date_range" = "1963-01-01 to 2020-07-31",
    "stats" = list(
      "min" = "Rs_min",
      "max" = "Rs_max",
      "mean" = "Rs_mean",
      "sd" = "Rs_sd"
    )
  ),
  "u2" = list(
    "link" = "https://brdwgd.nyc3.cdn.digitaloceanspaces.com/parquet%2Fu2.parquet",
    "name" = "Wind speed",
    "unit" = "m/2",
    "date_range" = "1963-01-01 to 2020-07-31",
    "stats" = list(
      "min" = "u2_min",
      "max" = "u2_max",
      "mean" = "u2_mean",
      "sd" = "u2_sd"
    )
  )
)


usethis::use_data(brdwgd_data, overwrite = TRUE)
