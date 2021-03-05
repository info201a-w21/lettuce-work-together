# Load libraries
library("shiny")

# Introduction page
intro_panel <- tabPanel(
  "Introduction"
)

# Chart 1 page

# Chart 2 page
# Visualization
bar_main_content <- mainPanel(
  plotlyOutput("bar")
)

# Entire page
bar_panel <- tabPanel(
  "Budget Shortfall",
  bar_main_content
)

# Chart 3 page

# Define UI for application that draws ....
ui <- navbarPage(
  "Food Insecurity in the U.S.",
  intro_panel,
  bar_panel
)