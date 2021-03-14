# server.R
library(dplyr)
library(shiny)
library(plotly)

# Read in data
source("scripts/Chart 1 - Insecurity over Time.r")
source("shiny-scripts/Chart 2 - Shortfall per Insecure.R")
source("shiny-scripts/Chart 3 - Food insecurity map.R")

# Start shinyServer
server <- function(input, output) { 
  # Plot 2 - Shortfall per Person
  output$bar <- renderPlotly({
    # Gather top 5
    shortfall_top_n <- shortfall_per_person %>%
      filter(year == input$bar_year) %>%
      slice_max(order_by = shortfall, n = input$bar_top_n)
    
    # Create plot
    plot2 <- plot_ly(
      data = shortfall_top_n,
      x = ~reorder(State.Name, -shortfall),
      y = ~shortfall,
      type = "bar",
      color = ~State.Name,
      showlegend = F
    ) %>% 
      layout(
        title = paste0("Top ", input$bar_top_n, " State Shortfalls in ", input$bar_year),
        xaxis = list(title = "State"),
        yaxis = list(title = "Shortfall", tickprefix = "$")
      )
    
    # Return plot
    return(plot2)
  })
  
  # Plot 3 - map
  output$map <- renderPlotly({
    title <- paste0("Percentage of Food Insecure Population Above High Poverty Threshold")
    us_map
  })
  
  # Sang-Won's part
  # Line graphs of annual average food insecurity rate 2009 - 2018
  # Rename the name of the column to match with the drop down menu
  us_avg_insec <- rename(us_avg_insec, National = mean_food_insec)
  
  # Read the Excel file from USDA's Economic Research Service (ERS)
  usda_ers <- read_excel(
    "DATA/foodsecurity_datafile.xlsx",
    sheet = "Food security, all households"
  )
  
  # Filter the data to those from 2009 - 2018, food insecurity rate by race
  usda_filtered <- usda_ers %>%
    filter(Year == "2009" | Year == "2010" | Year == "2011" |
             Year == "2012" | Year == "2013" | Year == "2014" |
             Year == "2015" | Year == "2016" | Year == "2017" |
             Year == "2018") %>%
    filter(Subcategory == "White non-Hispanic" |
             Subcategory == "Black non-Hispanic" |
             Subcategory == "Hispanic") %>%
    select(year = Year, Subcategory, `Food insecure-Percent`)
  
  # Divide the food insecurity rate by 100 so it matches the format
  # on the `us_avg_insec` dataframe
  usda_filtered$`Food insecure-Percent` <-
    usda_filtered$`Food insecure-Percent` / 100
  
  # Convert the year from numeric to character for left join
  usda_filtered$year <- as.character(usda_filtered$year)
  
  # Transpose the dataframe with tidyr
  usda_filtered <- spread(
    usda_filtered,
    key = Subcategory,
    value = `Food insecure-Percent`
  )
  
  # Rename the name of the columns to match with the drop down menu
  usda_filtered <- rename(
    usda_filtered,
    Black = `Black non-Hispanic`,
    White = `White non-Hispanic`
  )
  
  # Join the dataframes into one
  us_avg_insec <- left_join(us_avg_insec, usda_filtered)
  
  # Render a line plot
  output$line_plot <- renderPlotly({
    plot_ly(
      data = us_avg_insec,
      x = ~year,
      y = ~us_avg_insec[[input$line_selection]],
      type = "scatter",
      mode = "lines"
    ) %>%
      layout(
        title = "Food Insecurity Rate 2009 - 2018",
        xaxis = list(title = "Year"),
        yaxis = list(title = paste(
          input$line_selection, "Average Food Insecurity Rate"))
      )
  })
}