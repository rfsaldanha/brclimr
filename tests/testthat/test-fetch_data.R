test_that("fetch data from brdwgd works", {

  res <- fetch_data(
    code_muni = 3304557,
    product = "brdwgd",
    indicator = "u2",
    statistics = "max",
    date_start = as.Date("2008-01-01"),
    date_end = as.Date("2008-02-01")
  )

  expect_equal(class(res), "data.frame")
})
