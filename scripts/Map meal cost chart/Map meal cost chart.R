# Brielle's Chart

# Load packages
library(tidyverse)
library(ggplot2)
library(readxl)
library(maps)
library(mapdata)
library(snakecase)
library(mapproj)

fa_2018 <- read_excel("DATA/Feeding America Data/MMG2020_2018Data_ToShare.xlsx", 
                      skip =1, sheet = "2018 State"
)

shapefile = fa_2018 

ggplot(shapefile) +
  geom_polygon(
    mapping = aes(x = long, y = lat, group = group),
    color = "white",
    size =.1
  ) +
  coord_map()

# join states and meal cost
state <- map_data("state") 
meal_cost <- select(fa_2018, "State Name", "2018 Cost Per Meal")

data = meal_cost
ggplot() + geom_polygon(
      data = meal_cost, aes(x = long, y = lat, group = group, fill = meal_cost),
      color = "blue",
      size =.1
      ) +
    coord_map() +
    scale_fill_continuous(low = "white", high = "blue") +
    labs(fill = "meal_cost") 

blank_theme <- theme_bw() +
  theme(
    axis.line = element_blank(),        # remove axis lines
    axis.text = element_blank(),        # remove axis labels
    axis.ticks = element_blank(),       # remove axis ticks
    axis.title = element_blank(),       # remove axis titles
    plot.background = element_blank(),  # remove gray background
    panel.grid.major = element_blank(), # remove major grid lines
    panel.grid.minor = element_blank(), # remove minor grid lines
    panel.border = element_blank()      # remove border around plot
  )
library(styler)
library(lintr)
style_file("Map_meal_cost_chart.R")
lintr("Map_meal_cost_chart.R")
