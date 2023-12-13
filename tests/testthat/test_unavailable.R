#This test tests the ability of the CountryPopulation function to
#recognize if a Country is not in the data set. If a country is not
#in the data set the function will return an error.

test_that('test_unavailable',{
  expect_error(CountryPopulation(WorldPopulation, "Kansas"))
  expect_error(CountryPopulation(WorldPopulation, "Paris"))
  expect_error(CountryPopulation(WorldPopulation, "Johannesburg"))
})
