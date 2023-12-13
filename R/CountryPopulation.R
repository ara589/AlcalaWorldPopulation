#' Population of Countries from 1950 to 2020
#'
#' This function will create a graph of a country's population over the
#' time period 1950 to 2020.Populations are estimates and are in thousands.
#'
#' If the name of the country is not present in the data set the function
#' will return "No data available".
#'
#' @param The name of a country as a string as in `Italy`
#' @return A graph of the country's population from 1950 to 2020
#' @examples
#' CountryPopulation(WorldPopulation, "Burundi")
#' CountryPopulation(WorldPopulation, "Kuwait")
#' @export
CountryPopulation <- function(data, CountryName) {
  WorldPopulation <- WorldPopulation %>%
    pivot_longer(2:72, names_to = 'Year', values_to = 'Population') %>%
    mutate(Year = as.numeric(Year))

  WorldPopulation <- WorldPopulation[WorldPopulation$`Country Name` ==
                                       CountryName, ]
  if (nrow(WorldPopulation) == 0) {
    stop(paste("No data available", CountryName))
  }
  ggplot(WorldPopulation, aes(x = Year, y = Population)) +
    geom_point() +
    geom_line() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
    scale_x_continuous(breaks = seq(1950,2020, by=5)) +
    labs(title = paste("Population 1950 to 2020 for", CountryName)) +
    labs(x = "Year",
         y = "Population (thousands)")
}
