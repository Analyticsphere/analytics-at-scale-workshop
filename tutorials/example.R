# load libraries
library(testthat)
library(usethis)

# this creates the correct testing file
## replace "example" with your file name
usethis::use_test("example") 

# simple addition function
func1=function(num1, num2, num3){
  x = num1 + num2 + num3
  return(x)
}

# division function, slightly more complicated
func2 = function(num1, num2){
  x = num1/num2
  return(x)
}

# text concatenation
func3 = function(str1, str2){
  x = paste(str1, str2, sep = "") # putting no separation, which isn't what I want so that the test will fail
  return(x)
}

# creating a vector
func4 = function(num){
  x = rep(4, num)
  return(x)
}


# creating a df
func5 = function(num1, num2){
  x = c(num1, num1+1, num1+2)
  y = c(num2, num2+1, num2+2)
  df = data.frame(x = x, y = y)
  return(df)
}

# Resources
## https://r-pkgs.org/testing-basics.html See Section 13.5.4 for specific expectations you can test
## https://rstudio.github.io/cheatsheets/html/package-development.html
## https://testthat.r-lib.org/reference/index.html
## https://matthieu-bruneaux.gitlab.io/guide-r-rstudio-git-gitlab/060-testing.html, more on expectations