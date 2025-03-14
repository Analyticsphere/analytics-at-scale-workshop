library(testthat)

# Source the function file
source("/Users/orszagl2/Documents/AdHoc/unit_testing/example.R")

# function 1 tests
test_that("Function adds numbers properly", {expect_equal(func1(3, 5, 7), 15)})
test_that("Function outputs error with non-numerical entry", {expect_error(func1(3, 5, "a"))})

# function 2 tests
test_that("Function divides properly", {expect_equal(func2(3, 2), 1.5)})
test_that("Function outputs error with non-numerical entry", {expect_error(func2(3, "a"))})
test_that("Function divides properly", {expect_equal(func2(3, 0), Inf)})
test_that("Class is correct", {expect_type(func2(3, 2), 'double')})

# function 3 test, purposefully one that fails!
test_that("Concatenation works", {expect_equal(func3("Hi", "Jake"), "Hi Jake")})
test_that("Class is correct", {expect_type(func3("Hi", "Jake"), 'character')})

# function 4 test
test_that("Length is correct", {expect_length(func4(2), 2)})
test_that("Length is correct", {expect_true(length(func4(2))==2)}) # above rewritten
test_that("Class is correct", {expect_type(func4(2), 'double')})

## s3 class test (function 5)
### common s3 classes include data.frame, lm, glm, ggplot, factor
test_that("Class type works", {expect_s3_class(func5(3, 7), "data.frame")})
## note exact = false is the default, so it could be a tibble and this test would still pass!
