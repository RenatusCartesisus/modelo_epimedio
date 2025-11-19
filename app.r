# Librerías utilizadas para el desarrollo de la aplicación web en Shiny:

# Shiny
library("shiny")
# Bslib para los elementos de diseño de interfaz
library("bslib")
# Permite cambiar el diseño de los gráficos generados de forma rápida
library("thematic")
# Permite obtener los diversos paquetes conteidos dentro de tidyverse, como ggplot2 o dplyr
library("tidyverse")

library("shinyWidgets")

# Cambiar los temas por defecto de los gráficos en R
thematic_shiny(font = "auto")

# Importar los archivos de main.r y server.r, los cuales contienen la interfaz de usuario (UI) y la función server, respectivamente.
source('main.r', local = TRUE)
source('server.r')

shinyApp(ui = ui, server = myserver)
