# Load libraries
library("shiny")

# Introduction page
intro_panel <- tabPanel(
  "Introduction",
  titlePanel("Introduction"),
  p("Food insecurity,",
  em("or the lack of regular access to nutritious foods,"),
  "is not an issue solely afflicting developing countries. As a developed
  country with a robust economy and advanced infrastructure, the United States
  continues to struggle with food insecurity.By examining data from
  2009 - 2018, our team created visualizations to study some contributing
  factors to the persistence of food insecurity in the U.S.
  We highlight potential determinants such as social inequalities, 
  state-level financial 
  needs, and food deserts.",
  p("Our team analyzed data from Feeding America, a nonprofit organization with
  a network of over 200 food banks, to understand how food insecurity in the US 
  has changed over time. Feeding America drew local food insecurity and 
  expenditure estimates from the Current Population Survey (CPS), 
  American Community Survey (ACS), and Bureau of Labor Statistics (BLS). This 
  enabled us to explore food insecurity at the county, congressional district, 
  and state levels. With this data, our team created visualizations that allow 
  users to explore questions about the scale of American food insecurity and the
  budget shortfalls of food assistance programs."),  
  p("In addition, we utilized data calculated by USDA's Economic Research
  Service (ERS) to gain insights concerning the relationship between access to 
  healthy food and demographics. ERS sourced its statistics from Current
  Population Survey Food Security Supplement (CPS-FSS) from the U.S. Census
  Bureau.The data from ERS helped us understand any demographic factors 
  influencing inequal access to nutritious foods in the United States."),
  p(strong("Ultimately, our project explores questions regarding the trends of 
  food insecurity over time, food gaps between different races, and 
  the success of food assistance programs, as well as the existence of potential 
  food deserts.")),
  img(src ="market.jpg"),
  p("By: Gabriella Alonso, Brielle Bush, Sang-Won Yu, Maynard Maynard-Zhang")
  ))
# Chart 1 page

# Chart 2 page
# Sidebar
# Year dropdown menu
bar_year <- selectInput(
  inputId = "bar_year",
  label = "Choose year",
  choices = c(
    "2018",
    "2017",
    "2016",
    "2015",
    "2014",
    "2013",
    "2012"
  ),

  plotlyOutput("bar")
  
)

bar_top_n <- numericInput(
  inputId = "bar_top_n",
  label = "Choose how many states to display",
  value = 5,
  min = 1,
  max = 51,
  step = 1
)

# Main page
# Visualization
bar_main_content <- mainPanel(
  plotlyOutput("bar")
)

# Entire page
bar_panel <- tabPanel(
  "Budget Shortfall",
  bar_year,
  bar_top_n,
  bar_main_content
)

# Chart 3 page
map_panel <- tabPanel(
  "Food Insecurity Map",
plotlyOutput("map"))

# Conclusion page 
concl_panel <-tabPanel(
  "Conclusion",
  titlePanel("Insights")
)

# Define UI for application that draws ....
ui <- navbarPage(
  "Food Insecurity in the U.S.",
  intro_panel,
  bar_panel,
  concl_panel
)