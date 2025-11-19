#Importar las tarjetas (cards) que contienen cada una de las gráficas realizadas en el programa;
# Se almacena cada gráfica individual, y finalmente se grafica la comparación de todos los 
# métodos numéricos
source("caso1.r")
source("caso2.r")
source("explicaciones.r")

# Se crea una interfaz que contiene una barra de navegación lateral y una superior
# En la barra lateral, se encuentran todos los elementos que permiten cambiar los parámetros
# que componen los elementos de las ecuaciones mostradas: En este caso, fueron los primeros 
# ejemplos vistos para el caso de la dinámica de la cafeína en el cuerpo humano.

ui <- page_navbar(

  # Establecer los colores por defecto que tendrá la interfaz del programa
  theme = bslib::bs_theme(
    bg = "#002B36", fg = "#EEE8D5", primary = "#2AA198",
),
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
    ),
    title = "Métodos numéricos",
    bg = "#3E4EE0",

# Elementos de control para la creación de los gráficos
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
# En esta sección se muestran los elementos gráficos importados desde "caso1.r" y "caso2.r", donde 
# se almacenaron como elementos de una lista, y se despliega cada elemento en su apartado de panel de 
# navegación correspondiente
    nav_panel(title = "Caso 1", 
    caso1[1:length(caso1)]
  ),
    nav_panel(title = "Caso 2", 
    caso2[1:length(caso2)]
  ),
  nav_panel(title = "Explicaciones", 
    explicaciones[1:length(explicaciones)]
  ),

)
