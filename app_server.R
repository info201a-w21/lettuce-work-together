# server.R
library(dplyr)
library(shiny)
library(plotly)

# Read in data
source("shiny-scripts/Chart 2 - Shortfall per Insecure.R")

# Start shinyServer
server <- function(input, output) { 
  output$bar <- renderPlotly({
    # Plot 2 - Shortfall per Person
    # Gather top 5
    shortfall_top_n <- shortfall_per_person %>%
      filter(year == input$bar_year) %>%
      slice_max(order_by = shortfall, n = input$bar_top_n)
    
    # Create plot
    plot2 <- plot_ly(
      data = shortfall_top_n,
      x = ~reorder(State, shortfall),
      y = ~shortfall,
      type = "bar",
      color = ~State,
      showlegend = F
    ) %>% 
      layout(
        title = paste0("Top ", input$bar_top_n, " State Shortfalls"),
        xaxis = list(title = "State"),
        yaxis = list(title = "Shortfall", tickprefix = "$")
      )
    
    # Return plot
    return(plot2)
  })
}