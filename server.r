source('soluciones.r', local = TRUE)

myserver <- function(input,output,session){

##########################################################################
#                                CASO 1
##########################################################################
  
  # Graficación del método de Euler
  output$plot_euler_c1 <- renderPlot({

    df_euler_c1 <- metodoEuler_c1(f1, input$h, input$cafe_inicial, input$n, input$k)

    ggplot(data = df_euler_c1, aes(x=t, y=y)) + geom_point() +
      labs(title = "Método de Euler (Caso 1)", 
            x="Instante de tiempo (h)", 
            y="Cantidad de cafeína en sangre (mg)"
    )
  })

  # Graficación del método de RK4
  output$plot_rk4_c1 <- renderPlot({

    df_rk4_c1 <- metodoRK4_c1(f1, input$h, input$cafe_inicial, input$n, input$k)

    ggplot(data = df_rk4_c1, aes(x=t, y=y)) + geom_point() +
      labs(title = "Método RK4 (Caso 1)", 
            x="Instante de tiempo (h)", 
            y="Cantidad de cafeína en sangre (mg)"
    )
  })

  # Graficación del método de RK4DP5
  output$plot_rk4dp5_c1 <- renderPlot({

    df_rk4dp_c1 <- metodoDP5_c1(f1, input$h, input$cafe_inicial, input$n, input$k)

    ggplot(data = df_rk4dp_c1, aes(x=t, y=y)) + geom_point() +
      labs(title = "Método RK4DP5 (Caso 1)", 
            x="Instante de tiempo (h)", 
            y="Cantidad de cafeína en sangre (mg)"
    )
  })

  # Graficación realizada con los datos obtenidos con ayuda de la función 
  # ode (del paquete deSolve )
  output$desolve_c1 <- renderPlot({
    t <- seq(from=0, by=input$h, length.out=input$n);
    s <- ode(y=c(y=input$cafe_inicial), 
            times=t, 
            func={function(t,state,parms) with(as.list(c(state, parms)),{list(-k*y)})}, parms=c(k=input$k))

    df_deSolve <- data.frame(t=s[,1], y=s[,2])

    ggplot(data = df_deSolve, aes(x=t, y=y)) + geom_point() +
      labs(title = "Método deSolve (Caso 1)", 
            x="Instante de tiempo (h)", 
            y="Cantidad de cafeína en sangre (mg)"
    )
  })

  # Graficación realizada con los datos obtenidos con ayuda de la función 
  # ode45
  output$ode45_c1 <- renderPlot({
    s <- pracma::ode45({function(t,y) -input$k*y}, 0, input$n*input$h, input$cafe_inicial)

    df_ode45 <- data.frame(t=s$t, y=s$y)

    ggplot(data = df_ode45, aes(x=t, y=y)) + geom_point() +
      labs(title = "Método ode45 (Caso 1)", 
            x="Instante de tiempo (h)", 
            y="Cantidad de cafeína en sangre (mg)"
    )
  })

  output$comparaciones_c1 <- renderPlot({
    
    #Método de Euler
     df_euler_c1 <- metodoEuler_c1(f1, input$h, input$cafe_inicial, input$n, input$k)
    
    # Método de RK4
     df_rk4_c1 <- metodoRK4_c1(f1, input$h, input$cafe_inicial, input$n, input$k)
    
    # Método de RK4DP5
    df_rk4dp_c1 <- metodoDP5_c1(f1, input$h, input$cafe_inicial, input$n, input$k)
    
    # Valores obtenidos para el caso de ode45
    
    s <- pracma::ode45({function(t,y) -input$k*y}, 0, input$n*input$h, input$cafe_inicial)
    df_ode45 <- data.frame(t=s$t, y=s$y)

    # Valores obtenidos al utilizar deSolve
    s <- ode(y=c(y=input$cafe_inicial), 
            times=df_rk4_c1$t, 
            func={function(t,state,parms) with(as.list(c(state, parms)),{list(-k*y)})}, parms=c(k=input$k))

    df_deSolve <- data.frame(t=s[,1], y=s[,2])

    df_completo <- data.frame(
        t=df_rk4_c1$t,
        euler=df_euler_c1$y,
        rk4=df_rk4_c1$y,
        deSolve=df_deSolve$y,
        rk4dp5=df_rk4dp_c1$y

      )   
    df_completo <- df_completo |> 
      pivot_longer(
        cols=c("euler", "rk4", "deSolve", "rk4dp5"), 
        names_to="metodos", 
        values_to="cafeina"
    )
    ggplot() + 
      geom_point(data = df_completo,
       aes(x=t, y=cafeina, col=metodos)) + 
      geom_point(data = df_ode45,
       aes(x=t, y=y, col="ode45")) +
      scale_color_manual(
        name="Métodos",
        values=c("#99EDF0",
                 "#8FF2B3",
                 "#49B6F2",
                 "#1a5d1fff",
                 "#f27649ff"),
        limits=c("euler", 
                 "rk4", 
                 "deSolve", 
                 "rk4dp5",
                 "ode45"),
        labels=c("Euler", 
                 "RK4", 
                 "deSolve", 
                 "RK4DP5",
                 "ODE45")
                ) +
      
      labs(title = "Comparación de métodos (Caso 1)", 
            x="Instante de tiempo (h)", 
            y="Cantidad de cafeína en sangre (mg)"
    ) 
    
  })

##########################################################################
#                                CASO 2
##########################################################################

  output$plot_euler_c2 <- renderPlot({

    df_euler_c2 <- metodoEuler_c2(f2, input$h, input$cafe_inicial, input$n, input$k, input$a)

    ggplot(data = df_euler_c2, aes(x=t, y=y)) + geom_point() +
      labs(title = "Método de Euler (Caso 1)", 
            x="Instante de tiempo (h)", 
            y="Cantidad de cafeína en sangre (mg)"
    )
  })

  output$plot_rk4_c2 <- renderPlot({

    df_rk4_c2 <- metodoRK4_c2(f2, input$h, input$cafe_inicial, input$n, input$k, input$a)

    ggplot(data = df_rk4_c2, aes(x=t, y=y)) + geom_point() +
      labs(title = "Método RK4 (Caso 1)", 
            x="Instante de tiempo (h)", 
            y="Cantidad de cafeína en sangre (mg)"
    )
  })

  output$plot_rk4dp5_c2 <- renderPlot({

    df_rk4dp_c2 <- metodoDP5_c2(f2, input$h, input$cafe_inicial, input$n, input$k, input$a)

    ggplot(data = df_rk4dp_c2, aes(x=t, y=y)) + geom_point() +
      labs(title = "Método RK4DP5 (Caso 1)", 
            x="Instante de tiempo (h)", 
            y="Cantidad de cafeína en sangre (mg)"
    )
  })

  output$deSolve_c2 <- renderPlot({
    t <- seq(from=0, by=input$h, length.out=input$n);
    s <- ode(y=c(y=input$cafe_inicial), 
            times=t, 
            func={function(t,state,parms) with(as.list(c(state, parms)),{list(-k*y+a)})}, parms=c(k=input$k,a=input$a))

    df_deSolve <- data.frame(t=s[,1], y=s[,2])

    ggplot(data = df_deSolve, aes(x=t, y=y)) + geom_point() +
      labs(title = "Método deSolve (Caso 1)", 
            x="Instante de tiempo (h)", 
            y="Cantidad de cafeína en sangre (mg)"
    )
  })

    output$ode45_c2 <- renderPlot({
    s <- pracma::ode45({function(t,y) -input$k*y+input$a}, 0, input$n*input$h, input$cafe_inicial)

    df_ode45 <- data.frame(t=s$t, y=s$y)

    ggplot(data = df_ode45, aes(x=t, y=y)) + geom_point() +
      labs(title = "Método ode45 (Caso 1)", 
            x="Instante de tiempo (h)", 
            y="Cantidad de cafeína en sangre (mg)"
    )
  })

  output$comparaciones_c2 <- renderPlot({
    
    #Método de Euler
     df_euler_c2 <- metodoEuler_c2(f2, input$h, input$cafe_inicial, input$n, input$k, input$a)
    
    # Método de RK4
     df_rk4_c2 <- metodoRK4_c2(f2, input$h, input$cafe_inicial, input$n, input$k, input$a)
    
    # Método de RK4DP5
    df_rk4dp_c2 <- metodoDP5_c2(f2, input$h, input$cafe_inicial, input$n, input$k, input$a)
    
    # Valores obtenidos para el caso de ode45
    s <- pracma::ode45({function(t,y) -input$k*y+input$a}, 0, input$n*input$h, input$cafe_inicial)
    df_ode45 <- data.frame(t=s$t, y=s$y)

    # Valores obtenidos al utilizar deSolve
    s <- ode(y=c(y=input$cafe_inicial), 
            times=df_rk4_c2$t, 
            func={function(t,state,parms) with(as.list(c(state, parms)),{list(-k*y+a)})}, parms=c(k=input$k, a=input$a))

    df_deSolve <- data.frame(t=s[,1], y=s[,2])

    df_completo <- data.frame(
        t=df_rk4_c2$t,
        euler=df_euler_c2$y,
        rk4=df_rk4_c2$y,
        deSolve=df_deSolve$y,
        rk4dp5=df_rk4dp_c2$y

      )   
    df_completo <- df_completo |> 
      pivot_longer(
        cols=c("euler", "rk4", "deSolve", "rk4dp5"), 
        names_to="metodos", 
        values_to="cafeina"
    )
    ggplot() + 
      geom_point(data = df_completo,
       aes(x=t, y=cafeina, col=metodos)) + 
      geom_point(data = df_ode45,
       aes(x=t, y=y, col="ode45")) +
      scale_color_manual(
        name="Métodos",
        values=c("#99EDF0",
                 "#8FF2B3",
                 "#49B6F2",
                 "#1a5d1fff",
                 "#f27649ff"),
        limits=c("euler", 
                 "rk4", 
                 "deSolve", 
                 "rk4dp5",
                 "ode45"),
        labels=c("Euler", 
                 "RK4", 
                 "deSolve", 
                 "RK4DP5",
                 "ODE45")
                ) +
      
      labs(title = "Comparación de métodos (Caso 1)", 
            x="Instante de tiempo (h)", 
            y="Cantidad de cafeína en sangre (mg)"
    ) 
    
  })
  
}
