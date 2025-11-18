library("shiny")
library("bslib")
library("thematic")
library("tidyverse")

thematic_shiny(font = "auto")

source('main.r', local = TRUE)
source('server.r')


shinyApp(ui = ui, server = myserver)
