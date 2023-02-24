#' Fetch data from given parameters
#'
#' @param code_muni IBGE municipality code number with 7 digits.
#' @param product Zonal indicator product. Currently, only `brdwgd`.
#' @param indicator Indicator name from the product. Check the available indicators with the \link{product_info} function.
#' @param statistics Statistics name from the indicator.
#' @param date_start A date.
#' @param date_end A date, >= than `date_start`.
#'
#' @return A `data.frame` with date and value columns.
#' @export
#'
#' @examples
#' fetch_data(
#'     code_muni = 3304557,
#'     product = "brdwgd",
#'     indicator = "tmax",
#'     statistics = "mean",
#'     date_start = as.Date("2008-01-01"),
#'     date_end = as.Date("2008-01-10")
#'  )
fetch_data <- function(code_muni, product, indicator, statistics, date_start, date_end){
  # Argument check
  checkmate::assert_number(x = code_muni)
  checkmate::assert_string(x = as.character(code_muni), n.chars = 7)
  checkmate::assert_choice(x = product, choices = "brdwgd")
  checkmate::assert_date(date_start)
  checkmate::assert_date(date_end, lower = date_start)

  # Argument check and retrieve product info
  if(product == "brdwgd"){
    # Check indicator
    checkmate::assert_choice(
      x = indicator,
      choices = names(brclimr::brdwgd_data)
    )

    # Retrive indicator info and link
    indi_info <- brclimr::brdwgd_data[[indicator]]
    indi_link <- indi_info[["link"]]

    # Check statistics
    checkmate::assert_choice(
      x = statistics,
      choices = names(indi_info[["stats"]])
    )

    # Retrive statistics name
    indi_statname <- indi_info[["stats"]][[statistics]]
  }

  # Create duckdb connection
  conn <- DBI::dbConnect(duckdb::duckdb())

  # Install and load httpfs
  DBI::dbExecute(conn, "INSTALL httpfs;")
  DBI::dbExecute(conn, "LOAD httpfs;")

  # Fetch and return data
  res <- DBI::dbGetQuery(
    conn,
    glue::glue("SELECT date, value
               FROM '{indi_link}'
               WHERE (code_muni = {code_muni} AND
               date >= '{date_start}' AND
               date <= '{date_end}' AND
               name = '{indi_statname}')")
  )

  # Disconnect database
  DBI::dbDisconnect(conn, shutdown=TRUE)

  # Return falues
  return(res)
}
