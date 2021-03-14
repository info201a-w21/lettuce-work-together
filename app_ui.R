# Load libraries
library(shiny)
library(shinythemes)

# Introduction page
intro_panel <- tabPanel(
  "Introduction",
  titlePanel("Introduction"), 
  p(style = "font-size:18px;", "By: Gabriella Alonso, Brielle Bush, Sang-Won Yu, Maynard Maynard-Zhang"),
  p(style = "font-size:16px;","Food insecurity,",
  em("or the lack of regular access to nutritious foods,"),
  "is not an issue solely afflicting developing countries. As a developed
  country with a robust economy and advanced infrastructure, the United States
  continues to struggle with food insecurity. By examining data from
  2009 - 2018, our team created visualizations to study some contributing
  factors to the persistence of food insecurity in the U.S.
  We highlight potential determinants such as social inequalities, 
  state-level financial 
  needs, and food deserts.",
  p(style = "font-size:16px;","Our team analyzed data from Feeding America, a nonprofit organization with
  a network of over 200 food banks, to understand how food insecurity in the US 
  has changed over time. Feeding America drew local food insecurity and 
  expenditure estimates from the Current Population Survey (CPS), 
  American Community Survey (ACS), and Bureau of Labor Statistics (BLS). This 
  enabled us to explore food insecurity at the county, congressional district, 
  and state levels. With this data, our team created visualizations that allow 
  users to explore questions about the scale of American food insecurity and the
  budget shortfalls of food assistance programs."),  
  p(style = "font-size:16px;","In addition, we utilized data calculated by USDA's Economic Research
  Service (ERS) to gain insights concerning the relationship between access to 
  healthy food and demographics. ERS sourced its statistics from Current
  Population Survey Food Security Supplement (CPS-FSS) from the U.S. Census
  Bureau.The data from ERS helped us understand any demographic factors 
  influencing inequal access to nutritious foods in the United States."),
  p(style = "font-size:16px;", strong("Ultimately, our project explores questions regarding the trends of 
  food insecurity over time, food gaps between different races, and 
  the success of food assistance programs, as well as the existence of potential 
  food deserts.")),
  img(src ="market.jpg"),
  )) 
# Chart 1 page
line_panel <- tabPanel(
  "Food Insecurity Line Graph",
  titlePanel("Annual Food Insecurity Rates, 2009 - 2018"),
  # Drop down menu
  selectInput(
    inputId = "line_selection",
    label = "Choose the line",
    choices = c(
      "National",
      "Black",
      "Hispanic",
      "White"
    ),
    selected = "National"
  ),
  # Output the line plot
  plotlyOutput("line_plot")
)
# Chart 2 page
# # Widget 1: year dropdown menu
# bar_year <- selectInput(
#   inputId = "bar_year",
#   label = "Choose year",
#   choices = c(
#     "2018",
#     "2017",
#     "2016",
#     "2015",
#     "2014",
#     "2013",
#     "2012"
#   )
# )
# Widget 1: year slider
bar_year <- sliderInput(
  inputId = "bar_year",
  label = "Select a year:",
  min = 2012,
  max = 2018,
  value = 2018,
  # ticks = F,
  sep = ""
)

# Widget 2: top N numeric input
bar_top_n <- numericInput(
  inputId = "bar_top_n",
  label = "Choose how many states to display",
  value = 5,
  min = 1,
  max = 51,
  step = 1
)

# Sidebar
bar_sidebar <- sidebarPanel(
  bar_year,
  bar_top_n
)

# Main content
# Visualization
bar_main_content <- mainPanel(
  plotlyOutput("bar")
)

# Entire page
bar_panel <- tabPanel(
  "Budget Shortfall",
  bar_sidebar,
  bar_main_content
)

# Chart 3 page
map_panel <- tabPanel(
  "Food Insecurity Map",
  sliderInput("slider1", label = h3("Year"), min = 2009,  
              max = 2018, value = 2009, sep = ""),
plotlyOutput("map"))

# Conclusion page 
concl_panel <-tabPanel(
  "Conclusion",
  titlePanel("Insights")
)

# Define UI for application that draws ....
ui <- navbarPage(
  "Food Insecurity in the U.S.",
  theme = shinytheme("united"),
  # intro_panel,
  # line_panel,
  # bar_panel,
  map_panel#,
  # concl_panel
)
