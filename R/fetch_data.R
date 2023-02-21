fetch_data <- function(code_muni, product, indicator, statistics, date_start, date_end){
  # Argument check
  checkmate::assert_number(x = code_muni)
  checkmate::assert_string(x = as.character(code_muni), n.chars = 7)
  checkmate::assert_choice(x = product, choices = "brdwgd")
  checkmate::assert_date(date_start)
  checkmate::assert_date(date_end)

  # Argument check and retrieve product info
  if(product == "brdwgd"){
    # Check indicator
    checkmate::assert_choice(
      x = indicator,
      choices = names(brdwgd_data)
    )

    # Retrive indicator info and link
    indi_info <- brdwgd_data[[indicator]]
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
