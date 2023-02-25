#' Create a HTML report for a municipality
#'
#' @param code_muni IBGE municipality code number with 7 digits.
#' @param date_start A date.
#' @param date_end A date, >= than `date_start`.
#' @param temp_max_min_avg Logical, plot max and min average
#' @param temp_max_min_sd Logical, plot max and min standard deviation.
#' @param prec_sum Logical, plot precipitation sum.
#' @param prec_avg Logical, plot precipitation average.
#' @param prec_sd Logical, plot precipitation standard deviation.
#' @param eto_sum Logical, plot evapotranspiration sum.
#' @param eto_avg Logical, plot evapotranspiration average.
#' @param eto_sd Logical, plot evapotranspiration standard deviation.
#' @param rh_avg Logical, plot relative humidity average.
#' @param rh_sd Logical, plot relative humidity standard deviation.
#' @param rs_avg Logical, plot solar radiation average.
#' @param rs_sd Logical, plot solar radiation standard deviation.
#' @param u2_avg Logical, plot wind speed average.
#' @param u2_sd Logical, plot wind speed standard deviation.
#' @param set_title Report title. If `NULL`, the municipality code will be used.
#' @param output_format A `rmarkdown::html_document` object.
#' @param output_file Output file name.
#' @param output_dir Output file address. Defaults to current address from `getwd()`.
#'
#' @return A HTML file.
#' @export
#'
#' @import knitr
#' @import ggplot2
create_report <- function(
    code_muni,
    date_start, date_end,
    temp_max_min_avg = TRUE,
    temp_max_min_sd = FALSE,
    prec_sum = TRUE,
    prec_avg = FALSE,
    prec_sd = FALSE,
    eto_sum = TRUE,
    eto_avg = FALSE,
    eto_sd = FALSE,
    rh_avg = TRUE,
    rh_sd = FALSE,
    rs_avg = TRUE,
    rs_sd = FALSE,
    u2_avg = TRUE,
    u2_sd = FALSE,
    set_title = NULL,
    output_format = rmarkdown::html_document(theme = "yeti"),
    output_file = "report.html",
    output_dir = getwd()){

  # Argument check
  checkmate::assert_number(x = code_muni)
  checkmate::assert_date(date_start)
  checkmate::assert_date(date_end, lower = date_start)
  checkmate::assert_logical(x = temp_max_min_avg)
  checkmate::assert_logical(x = temp_max_min_sd)
  checkmate::assert_logical(x = prec_sum)
  checkmate::assert_logical(x = prec_avg)
  checkmate::assert_logical(x = prec_sd)
  checkmate::assert_logical(x = eto_sum)
  checkmate::assert_logical(x = eto_avg)
  checkmate::assert_logical(x = eto_sd)
  checkmate::assert_logical(x = rh_avg)
  checkmate::assert_logical(x = rh_sd)
  checkmate::assert_logical(x = rs_avg)
  checkmate::assert_logical(x = rs_sd)
  checkmate::assert_logical(x = u2_avg)
  checkmate::assert_logical(x = u2_sd)

  ## Get directory of report markdown template
  report_dir <- system.file("rmd_template/muni_report.rmd", package = "brclimr")

  ## Render report into html
  suppressWarnings(rmarkdown::render(
    input = report_dir,
    output_format = output_format,
    output_file = output_file,
    output_dir = output_dir,
    intermediates_dir = output_dir,
    params = list(
      code_muni = code_muni,
      date_start = date_start,
      date_end = date_end,
      set_title = ifelse(is.null(set_title), as.character(code_muni), set_title),
      temp_max_min_avg = temp_max_min_avg,
      temp_max_min_sd = temp_max_min_sd,
      prec_sum = prec_sum,
      prec_avg = prec_avg,
      prec_sd = prec_sd,
      eto_sum = eto_sum,
      eto_avg = eto_avg,
      eto_sd = eto_sd,
      rh_avg = rh_avg,
      rh_sd = rh_sd,
      rs_avg = rs_avg,
      rs_sd = rs_sd,
      u2_avg = u2_avg,
      u2_sd = u2_sd
    )
  ))

  ## Open report
  report_path <- path.expand(file.path(output_dir, output_file))
  utils::browseURL(report_path)
}
