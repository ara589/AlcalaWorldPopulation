library(tidyverse)

#This is a test to determine that the CountryPopulation
#function will recognize that a country name is in the WorldPopulation
#data set.

test_that("test_CountryName",{
  expect_named(CountryPopulation(WorldPopulation, "Italy"))
  expect_named(CountryPopulation(WorldPopulation, "Japan"))
  expect_named(CountryPopulation(WorldPopulation, "Argentina"))
})


