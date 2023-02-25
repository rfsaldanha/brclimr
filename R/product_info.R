#' Print product indicators and statistics
#'
#' The information is printed in the following order: indicator name, indicator acronyms in brackets, unit in parenthesis, available statistics, date range in brackets.
#'
#' @param product Zonal indicator product. Currently, only `brdwgd`.
#'
#' @return Printed messages on the console.
#' @export
#'
#' @examples
#' product_info()
product_info <- function(product = "brdwgd"){
  if(product == "brdwgd"){
    message("Product: brdwgd")
    for(i in names(brclimr::brdwgd_data)){
      message(glue::glue("{brclimr::brdwgd_data[[i]][['name']]} [{i}] ({brclimr::brdwgd_data[[i]][['unit']]}) : {glue::glue_collapse(names(brclimr::brdwgd_data[[i]][['stats']]),  sep = ', ')} [{brclimr::brdwgd_data[[i]][['date_range']]}]"))
    }
  }
}
