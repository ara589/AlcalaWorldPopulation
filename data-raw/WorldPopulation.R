library(tidyverse)
library(readxl)

WorldPop <- read_excel(path =
                         "data-raw/WorldPopulation.xlsx",
                       sheet = "ESTIMATES", range = "C43:BZ306")

WorldPop <- WorldPop %>%
  rename(`Country Name` = `Eastern Africa`)

WorldPop.clean <- WorldPop %>%
  filter(!str_detect(Subregion, "region"))
WorldPopulation <- WorldPop.clean %>%
  select(-...2, -'910', -'Subregion', -'947')

years <- paste(1950:2020)
colnames(WorldPopulation)[2:ncol(WorldPopulation)] <- years

usethis::use_data(WorldPopulation)
