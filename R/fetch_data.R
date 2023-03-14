#' Fetch zonal statistics
#'
#' Fetch zonal statistics from a product for given municipality code and dates.
#'
#' @param code_muni numeric. IBGE municipality code number with 7 digits.
#' @param product string. Zonal indicator product. Options are: `brdwgd`, `terraclimate`.
#' @param indicator string. Indicator name from the product. Check the available indicators with the \link{product_info} function.
#' @param statistics string. Statistics name from the indicator. Check the available statistics with the \link{product_info} function.
#' @param date_start date, included in the selection.
#' @param date_end date, included in the selection, must be equal or greater than `date_start`.
#'
#'
#' @details
#' For products with monthly data, like `terraclimate`, inform the start and end dates with the fist day of the month. Example: `as.Date("2008-06-01")` for June, 2008.
#'
#' @return A `data.frame` with date and value columns.
#' @export
#' @importFrom rlang .data
#'
#' @examples
#' \dontrun{
#' fetch_data(
#'     code_muni = 3304557,
#'     product = "brdwgd",
#'     indicator = "tmax",
#'     statistics = "mean",
#'     date_start = as.Date("2008-01-01"),
#'     date_end = as.Date("2008-01-10")
#'  )
#'  }
fetch_data <- function(code_muni, product, indicator, statistics, date_start, date_end){
  # Argument check
  checkmate::assert_number(x = code_muni)
  checkmate::assert_string(x = as.character(code_muni), n.chars = 7)
  checkmate::assert_choice(x = product, choices = c("brdwgd", "terraclimate"))
  checkmate::assert_date(date_start)
  checkmate::assert_date(date_end, lower = date_start)

  # Check Arrow capabilities
  if(!arrow::arrow_with_gcs()){
    stop("Your {arrow} package installation do not have GCS capabilities. Refer to https://arrow.apache.org/docs/r/articles/install.html")
  }

  # Argument check and retrieve product info
  if(product == "brdwgd"){
    # Check indicator
    checkmate::assert_choice(
      x = indicator,
      choices = names(brclimr::brdwgd_data)
    )

    # Retrieve indicator info
    indi_info <- brclimr::brdwgd_data[[indicator]]

    # Product bucket
    bucket <- arrow::gs_bucket("brclim-brdwgd", anonymous = TRUE)

  } else if(product == "terraclimate"){
    # Check indicator
    checkmate::assert_choice(
      x = indicator,
      choices = names(brclimr::terraclimate_data)
    )

    # Retrive indicator info
    indi_info <- brclimr::terraclimate_data[[indicator]]

    # Product bucket
    bucket <- arrow::gs_bucket("brclim-terraclimate", anonymous = TRUE)
  }

  # Check statistics
  checkmate::assert_choice(
    x = statistics,
    choices = names(indi_info[["stats"]])
  )

  # Retrive statistics name
  indi_statname <- indi_info[["stats"]][[statistics]]


  # Open dataset
  dataset <- arrow::open_dataset(sources = bucket, partitioning = indicator)

  # Query dataset
  cod <- code_muni
  res <- dataset %>%
    dplyr::filter(indicator == indicator) %>%
    dplyr::filter(.data$name == indi_statname) %>%
    dplyr::filter(.data$date >= date_start & .data$date <= date_end) %>%
    dplyr::filter(.data$code_muni == cod) %>%
    dplyr::select(.data$date, .data$value) %>%
    dplyr::collect()

  # Return values
  return(res)
}
