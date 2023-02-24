test_that("fetch data from brdwgd works", {
  skip_on_cran()

  res <- fetch_data(
    code_muni = 3304557,
    product = "brdwgd",
    indicator = "rh",
    statistics = "mean",
    date_start = as.Date("2010-10-15"),
    date_end = as.Date("2010-10-20")
  )

  expect_equal(class(res), "data.frame")
})
