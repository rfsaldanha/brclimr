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

  expect_true("data.frame" %in% class(res))
})

test_that("fetch data from terraclimate works", {
  skip_on_cran()

  res <- fetch_data(
    code_muni = 3304557,
    product = "terraclimate",
    indicator = "tmax",
    statistics = "mean",
    date_start = as.Date("2010-01-15"),
    date_end = as.Date("2010-03-01")
  )

  expect_true("data.frame" %in% class(res))
})
