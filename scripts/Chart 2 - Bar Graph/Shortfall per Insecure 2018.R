# MAYNARD MAYNARD-ZHANG
# Budget Shortfall Per Food-Insecure Person by State in 2018
# ------------------------------------------------------------------------------
# Load packages
library(tidyverse)
library(ggplot2)
library(readxl)
library(styler)
library(lintr)
library(RColorBrewer)

# Load data
fa_2018 <- read_excel("DATA/Feeding America Data/MMG2020_2018Data_ToShare.xlsx",
  skip = 1, sheet = "2018 State"
)

# Budget shortfall per food-insecure person
fa_2018 <- fa_2018 %>%
  select(
    `State Name`,
    `2018 Weighted Annual Food Budget Shortfall`,
    `# of Food Insecure Persons in 2018`
  ) %>%
  mutate(shortfall_per_insecure = ((`2018 Weighted Annual Food Budget Shortfall`
  / `# of Food Insecure Persons in 2018`) %>% round(digits = 2)))

# Top 10 shortfalls
fa_2018_top_10_shortfall <- fa_2018 %>%
  select(`State Name`, shortfall_per_insecure) %>%
  top_n(10, shortfall_per_insecure) %>%
  arrange(desc(shortfall_per_insecure))

# Create visualization - bar graph
# 1 categorical (state) and 1 continuous (shortfall) variable
ggplot(data = fa_2018_top_10_shortfall) +
  geom_col(mapping = aes(
    x = reorder(`State Name`, shortfall_per_insecure),
    y = shortfall_per_insecure,
    fill = `State Name`
  )) +
  labs(
    title = "Budget Shortfall per Food-Insecure Person",
    x = "State",
    y = "Shortfall ($)"
  ) +
  coord_flip() +
  scale_color_brewer(palette = "Set3") +
  theme(legend.position = "none")
