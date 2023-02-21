#' Print product indicators and statistics
#'
#' The information is printed in the following order: indicator name, indicator acronyms in brackets, unit in parenthesis, available statistics, date range in brackets.
#'
#' @param product Zonal indicator procuct. Currently, only `brdwgd`.
#'
#' @return Printed messages on the console.
#' @export
#'
#' @examples
#' product_info()
product_info <- function(product = "brdwgd"){
  if(product == "brdwgd"){
    message("Product: brdwgd")
    for(i in names(brdwgd_data)){
      message(glue::glue("{brdwgd_data[[i]][['name']]} [{i}] ({brdwgd_data[[i]][['unit']]}) : {glue::glue_collapse(names(brdwgd_data[[i]][['stats']]),  sep = ', ')} [{brdwgd_data[[i]][['date_range']]}]"))
    }
  }
}