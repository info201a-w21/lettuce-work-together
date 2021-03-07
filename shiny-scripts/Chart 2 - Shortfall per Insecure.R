# MAYNARD MAYNARD-ZHANG
# Shiny Application Script
# Budget Shortfall Per Food-Insecure Person by State
# ------------------------------------------------------------------------------
# Load packages
library(tidyverse)
library(ggplot2)
library(readxl)
library(plotly)
library(RColorBrewer)

# Load data
fa_2009 <- read_excel(
  "DATA/Feeding America Data/MMG2011_2009Data_ToShare.xlsx",
  sheet = "State",
  .name_repair = "universal"
)
fa_2010 <- read_excel(
  "DATA/Feeding America Data/MMG2012_2010Data_ToShare.xlsx",
  sheet = "State",
  .name_repair = "universal"
)
fa_2011 <- read_excel(
  "DATA/Feeding America Data/MMG2013_2011Data_ToShare.xlsx",
  sheet = "2011 State ",
  .name_repair = "universal"
)
fa_2012 <- read_excel(
  "DATA/Feeding America Data/MMG2014_2012Data_ToShare.xlsx",
  sheet = "2012 State",
  .name_repair = "universal"
)
fa_2013 <- read_excel(
  "DATA/Feeding America Data/MMG2015_2013Data_ToShare.xlsx",
  sheet = "2013 State",
  .name_repair = "universal"
)
fa_2014 <- read_excel(
  "DATA/Feeding America Data/MMG2016_2014Data_ToShare.xlsx",
  sheet = "2014 State",
  .name_repair = "universal"
)
fa_2015 <- read_excel(
  "DATA/Feeding America Data/MMG2017_2015Data_ToShare.xlsx",
  sheet = "2015 State",
  .name_repair = "universal"
)
fa_2016 <- read_excel(
  "DATA/Feeding America Data/MMG2018_2016Data_ToShare.xlsx",
  sheet = "2016 State",
  .name_repair = "universal"
)
fa_2017 <- read_excel(
  "DATA/Feeding America Data/MMG2019_2017Data_ToShare.xlsx",
  sheet = "2017 State",
  .name_repair = "universal"
)
fa_2018 <- read_excel(
  "DATA/Feeding America Data/MMG2020_2018Data_ToShare.xlsx",
  skip = 1, sheet = "2018 State",
)

# Select the state and shortfall columns of each df

# Join all dfs by state

# Budget shortfall per food-insecure person
fa_2018 <- fa_2018 %>%
  select(
    `State Name`,
    `2018 Weighted Annual Food Budget Shortfall`,
    `# of Food Insecure Persons in 2018`
  ) %>%
  mutate(shortfall_per_insecure = ((`2018 Weighted Annual Food Budget Shortfall`
                                    / `# of Food Insecure Persons in 2018`) %>%
                                     round(digits = 2)))

# Top 5 shortfalls
shortfall_top_5 <- fa_2018 %>%
  select(`State Name`, shortfall_per_insecure) %>%
  arrange(desc(shortfall_per_insecure)) %>%
  top_n(5, shortfall_per_insecure)

# # Bottom 5 shortfalls (delete if we don't end up using this)
# shortfall_bottom_5 <- fa_2018 %>%
#   select(`State Name`, shortfall_per_insecure) %>%
#   arrange(desc(shortfall_per_insecure)) %>%
#   top_n(-5, shortfall_per_insecure)

# Create visualization - bar graph
# 1 categorical (state) and 1 continuous (shortfall) variable
plot2 <- plot_ly(
  data = shortfall_top_5,
  x = ~reorder(`State Name`, shortfall_per_insecure),
  y = ~shortfall_per_insecure,
  type = "bar",
  color = ~`State Name`,
  showlegend = F
) %>% 
  layout(
    title = "Top 5 State Shortfalls",
    xaxis = list(title = "State"),
    yaxis = list(title = "Shortfall", tickprefix = "$")
  )