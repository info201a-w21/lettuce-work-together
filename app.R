library("shiny")

# Source server and UI
source("app_server.R")
source("app_ui.R")

shinyApp(ui = ui, server = server)