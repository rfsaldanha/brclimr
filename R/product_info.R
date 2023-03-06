#' Print product information, indicators acronyms and available statistics
#'
#' @param product Zonal indicator product. Options are: `brdwgd`, `terraclimate`.
#'
#' @return Printed list tree on the console.
#' @export
#'
#' @examples
#' product_info()
product_info <- function(product = "brdwgd"){
  if(product == "brdwgd"){
    lobstr::tree(brclimr::brdwgd_data)
  } else if(product == "terraclimate"){
    lobstr::tree(brclimr::terraclimate_data)
  }
}
