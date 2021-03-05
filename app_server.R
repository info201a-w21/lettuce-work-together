# server.R
library(dplyr)

# Read in data
source("shiny-scripts/Chart 2 - Shortfall per Insecure.R")

# Start shinyServer
server <- function(input, output) { 
  output$bar <- renderPlotly({
    return(plot2)
  })
}