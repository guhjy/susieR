context("test_single_effect_regression.R")

test_that("single_effect_regression agrees with version 0.3",{
  original.res = readRDS('singleReg_original_res.rds')
  simulate(sparse=T)
  V = 0.2
  
  scaledX = safe_colScale(X)
  scaledX.sparse = safe_colScale(X.sparse)
  
  dense.res = single_effect_regression(y,scaledX,V)
  sparse.res = single_effect_regression(y,scaledX.sparse,V)
  
  expect_equal_SER(sparse.res, original.res)
  expect_equal_SER(dense.res, original.res)
})
