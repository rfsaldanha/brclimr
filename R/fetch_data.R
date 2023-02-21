fetch_data <- function(code_muni, product, indicator, statistics, date_start, date_end){

  # Determine link from product list
  if(product == "brdwgd"){
    indi_info <- brdwgd_data[[indicator]]
    indi_link <- indi_info[["link"]]
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
