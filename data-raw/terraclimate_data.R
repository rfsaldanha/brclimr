## code to prepare `terraclimate_data` dataset goes here

terraclimate_data <- list(
  "tmax" = list(
    "name" = "Maximum temperature",
    "detail" = "Average for month",
    "unit" = "Degree Celsius",
    "date_range" = "Monthly, 1958-01 to 2021-12",
    "stats" = list(
      "min" = "tmax_min",
      "max" = "tmax_max",
      "mean" = "tmax_mean",
      "sd" = "tmax_sd"
    )
  ),
  "tmin" = list(
    "name" = "Minimum temperature",
    "detail" = "Average for month",
    "unit" = "Degree Celsius",
    "date_range" = "Monthly, 1958-01 to 2021-12",
    "stats" = list(
      "min" = "tmin_min",
      "max" = "tmin_max",
      "mean" = "tmin_mean",
      "sd" = "tmin_sd"
    )
  ),
  "ppt" = list(
    "name" = "Precipitation",
    "detail" = "Monthly total",
    "unit" = "mm",
    "date_range" = "Monthly, 1958-01 to 2021-12",
    "stats" = list(
      "min" = "ppt_min",
      "max" = "ppt_max",
      "mean" = "ppt_mean",
      "sd" = "ppt_sd",
      "sum" = "ppt_sum"
    )
  ),
  "aet" = list(
    "name" = "Actual Evapotranspiration",
    "detail" = "Monthly total",
    "unit" = "mm",
    "date_range" = "Monthly, 1958-01 to 2021-12",
    "stats" = list(
      "min" = "aet_min",
      "max" = "aet_max",
      "mean" = "aet_mean",
      "sd" = "aet_sd",
      "sum" = "aet_sum"
    )
  ),
  "def" = list(
    "name" = "Climate Water Deficit",
    "detail" = "Monthly total",
    "unit" = "mm",
    "date_range" = "Monthly, 1958-01 to 2021-12",
    "stats" = list(
      "min" = "def_min",
      "max" = "def_max",
      "mean" = "def_mean",
      "sd" = "def_sd",
      "sum" = "def_sum"
    )
  ),
  "pdsi" = list(
    "name" = "Palmer Drought Severity Index",
    "detail" = "At end of month",
    "unit" = "unitless",
    "date_range" = "Monthly, 1958-01 to 2021-12",
    "stats" = list(
      "min" = "PDSI_min",
      "max" = "PDSI_max",
      "mean" = "PDSI_mean",
      "sd" = "PDSI_sd"
    )
  ),
  "pet" = list(
    "name" = "Potential evapotranspiration",
    "detail" = "Monthly total",
    "unit" = "mm",
    "date_range" = "Monthly, 1958-01 to 2021-12",
    "stats" = list(
      "min" = "pet_min",
      "max" = "pet_max",
      "mean" = "pet_mean",
      "sd" = "pet_sd",
      "sum" = "pet_sum"
    )
  ),
  "q" = list(
    "name" = "Runoff",
    "detail" = "Monthly total",
    "unit" = "mm",
    "date_range" = "Monthly, 1958-01 to 2021-12",
    "stats" = list(
      "min" = "q_min",
      "max" = "q_max",
      "mean" = "q_mean",
      "sd" = "q_sd",
      "sum" = "q_sum"
    )
  ),
  "soil" = list(
    "name" = "Soil Moisture",
    "detail" = "Total column, at end of month",
    "unit" = "mm",
    "date_range" = "Monthly, 1958-01 to 2021-12",
    "stats" = list(
      "min" = "soil_min",
      "max" = "soil_max",
      "mean" = "soil_mean",
      "sd" = "soil_sd",
      "sum" = "soil_sum"
    )
  ),
  "srad" = list(
    "name" = "Downward surface shortwave radiation",
    "unit" = "W/m2",
    "date_range" = "Monthly, 1958-01 to 2021-12",
    "stats" = list(
      "min" = "srad_min",
      "max" = "srad_max",
      "mean" = "srad_mean",
      "sd" = "srad_sd",
      "sum" = "srad_sum"
    )
  ),
  "swe" = list(
    "name" = "Snow water equivalent",
    "detail" = "At end of month",
    "unit" = "mm",
    "date_range" = "Monthly, 1958-01 to 2021-12",
    "stats" = list(
      "min" = "swe_min",
      "max" = "swe_max",
      "mean" = "swe_mean",
      "sd" = "swe_sd",
      "sum" = "swe_sum"
    )
  ),
  "vap" = list(
    "name" = "Vapor pressure",
    "detail" = "Average for month",
    "unit" = "kPa",
    "date_range" = "Monthly, 1958-01 to 2021-12",
    "stats" = list(
      "min" = "vap_min",
      "max" = "vap_max",
      "mean" = "vap_mean",
      "sd" = "vap_sd"
    )
  ),
  "vpd" = list(
    "name" = "Vapor Pressure Deficit",
    "detail" = "Average for month",
    "unit" = "kPa",
    "date_range" = "Monthly, 1958-01 to 2021-12",
    "stats" = list(
      "min" = "vpd_min",
      "max" = "vpd_max",
      "mean" = "vpd_mean",
      "sd" = "vpd_sd"
    )
  ),
  "ws" = list(
    "name" = "Wind speed",
    "detail" = "Average for month",
    "unit" = "m/s",
    "date_range" = "Monthly, 1958-01 to 2021-12",
    "stats" = list(
      "min" = "ws_min",
      "max" = "ws_max",
      "mean" = "ws_mean",
      "sd" = "ws_sd"
    )
  )
)

usethis::use_data(terraclimate_data, overwrite = TRUE)
