caso1 <-list(
  # Contenedor del gráfico de comparaciones para el caso 1.
  card(min_height =450,
            full_screen = TRUE,
            card_header("Comparaciones"), 
            card_body(min_height = 400,
            plotOutput("comparaciones_c1", height = 350),
          )
  ),
  # Contenedor del gráfico del método de Euler para el caso 1.
  card(min_height = 450,
            full_screen = TRUE,
            card_header("Euler"), 
            card_body(min_height = 400,
              plotOutput("plot_euler_c1", height = 350))
            
  ),
  # Contenedor del gráfico del método de RK4 para el caso 1.
          card(min_height = 450,
            full_screen = TRUE,
            card_header("RK4"), 
            card_body(min_height = 400,
              plotOutput("plot_rk4_c1", height = 350))
  ),
  # Contenedor del gráfico del método de RK4DP5 para el caso 1.
  card(min_height = 450,
            full_screen = TRUE,
            card_header("RK4DP5"), 
            card_body(min_height = 400,
              plotOutput("plot_rk4dp5_c1", height = 350))
  ),
  # Contenedor del gráfico obtenido con ode45 para el caso 1.
          card(min_height = 450,
            full_screen = TRUE,
            card_header("ode45"), 
            card_body(min_height = 400,
              plotOutput("ode45_c1", height = 350))
  ),
  # Contenedor del gráfico obtenido con la función ode de deSolve para el caso 1.
          card(min_height = 450,
            full_screen = TRUE,
            card_header("deSolve"), 
            card_body(min_height = 400,
              plotOutput("desolve_c1", height = 350))
  )
)

