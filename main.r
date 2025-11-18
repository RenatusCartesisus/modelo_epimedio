source("caso1.r")
source("caso2.r")


ui <- page_navbar(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
    ),
    title = "Métodos numéricos",
    bg = "#3E4EE0",
    sidebar = sidebar("Esta es la barra de navegación",
    sliderInput("h", "Tamaño de paso",min = 0.01, max = 1, value = 0.5),
    numericInput(inputId = "n",
                   label = "Número de iteraciones",
                   value = 60,
                   min = 0, max = 100,
                   step = 1),
    numericInput(inputId = "a",
                   label = "Cantidad inicial de cafeína ",
                   value = 50,
                   min = 0, max = 100,
                   step = 1),
     numericInput(inputId = "cafe_inicial",
                   label = "Cantidad inicial de cafeína (mg)",
                   value = 70,
                   min = 1, max = 100,
                   step = 1),
     numericInput(inputId = "k",
                   label = "Tasa de eliminación (sangre, mg/h)",
                   value = 0.15,
                   min = 0, max = 10,
                   step = 0.01)               
  ),
    nav_panel(title = "Caso 1", 
    caso1[1:length(caso1)]
  ),
    nav_panel(title = "Caso 2", 
    caso2[1:length(caso2)]
  ),
)
