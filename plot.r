f1 <- function(t, k, X){
  -k*X
}

metodoRK4_c1 <- function(f, h, y0, n, k){
    stopifnot(is.function(f), h > 0)
    
    # Calcular n basado en h y tf
    
    t <- seq(from=0, by=h, length.out=n)  # Usar 'by=h' en lugar de 'to=tf'
    y <- numeric(n)
    
    t[1] <- 0
    y[1] <- y0
    
    for (i in 1:(n-1)) {
        k1 = h * f(t[i], k, y[i])
        k2 = h * f(t[i] + 0.5*h, k, y[i] + 0.5*k1)
        k3 = h * f(t[i] + 0.5*h, k, y[i] + 0.5*k2)
        k4 = h * f(t[i] + h, k, y[i] + k3)
       
        y[i + 1] = y[i] + (k1 + 2*k2 + 2*k3 + k4) / 6
    }
    
    data.frame(step = 0:(n-1), t = t, y = y)
}

# Ahora llama sin especificar n
df_euler_c1 <- metodoRK4_c1(f1, h=0.5, y0=70, n=60, k=0.15)

p <- ggplot(data = df_euler_c1, aes(x=t, y=y)) + 
     geom_point() +
     labs(title = "Método RK4 (Caso 1)", 
          x="Instante de tiempo (h)", 
          y="Cantidad de cafeína en sangre (mg)")
p
