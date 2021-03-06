context("test_get_objective.R")

test_that("get_objective agrees with version 0.3",{
  original.res = readRDS('objective_original_res.rds')
  simulate(sparse = TRUE)
  
  scaledX = safe_colScale(X)
  scaledX.sparse = safe_colScale(X.sparse)
  
  dense.res = get_objective(scaledX, y, s)
  sparse.res = get_objective(scaledX.sparse, y, s)
  
  expect_equal(dense.res, original.res)
  expect_equal(sparse.res, original.res)
 
})
