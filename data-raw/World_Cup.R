library(tidyverse)
library(stringr)

page <- read_html('https://en.wikipedia.org/wiki/FIFA_World_Cup')
page %>%
  html_nodes('table')

Attendance <-
  page %>%
  html_nodes('table') %>%
  .[[4]] %>%
  html_table(header=FALSE, fill=TRUE) %>%
  slice(-1 * 1:2 )

World_Cup <- Attendance %>%
  select(1:2,4:6) %>%
  magrittr::set_colnames(c('Year', 'Hosts', 'Totalattendance',
                           'Matches', 'Averageattendance')) %>%
  slice(-1*23:26)

World_Cup$Totalattendance <- str_remove_all(World_Cup$Totalattendance,",")
World_Cup$Averageattendance <- str_remove_all(World_Cup$Averageattendance,",")

World_Cup <- World_Cup %>%
  mutate(Totalattendance = as.numeric(Totalattendance)) %>%
  mutate(Averageattendance = as.numeric(Averageattendance)) %>%
  relocate(Matches, .before = Totalattendance)

usethis::use_data(World_Cup)
