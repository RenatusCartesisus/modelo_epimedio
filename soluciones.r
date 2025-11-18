library("deSolve")

##########################################################################
#                                CASO 1
##########################################################################

f1 <- function(t, k, X){
  -k*X
}

metodoEuler_c1 <- function(f, h, y0, n, k){
    stopifnot(is.function(f), h > 0, n >= 1)

     t <- numeric(n);
     y <- numeric(n);
    
     t[1] <- 0;
     y[1] <- y0;
     for (i in 1:(n-1)) {
          y[i + 1] <- y[i] + f(t[i], k, y[i]);
          t[i + 1] <- t[i] + h;
     }
     data.frame(step = 0:(n-1), t = t, y = y);
}

metodoRK4_c1 <- function(f, h, y0, n, a){
    stopifnot(is.function(f), h > 0, n >= 1)

     t <- seq(from=0, by=h, length.out=n);
     y <- numeric(n);
    
     t[1] <- 0;
     y[1] <- y0;
     for (i in 1:(n-1)) {
        k1 = h*f(t[i], a, y[i])
        k2 = h*f(t[i]+0.5*h, a, y[i]+0.5*k1)
        k3 = h*f(t[i]+0.5*h, a, y[i]+0.5*k2)
        k4 = h*f(t[i]+h, a, y[i]+k3)
       
        y[i + 1] = y[i] + (k1 + 2*k2 + 2*k3 + k4)/6
     }
     data.frame(step = 0:(n-1), t = t, y = y);
}

metodoRK4_c1 <- function(f, h, y0, n, a){
    stopifnot(is.function(f), h > 0, n >= 1)

     t <- seq(from=0, by=h, length.out=n);
     y <- numeric(n);
    
     t[1] <- 0;
     y[1] <- y0;
     for (i in 1:(n-1)) {
        k1 = h*f(t[i], a, y[i])
        k2 = h*f(t[i]+0.5*h, a, y[i]+0.5*k1)
        k3 = h*f(t[i]+0.5*h, a, y[i]+0.5*k2)
        k4 = h*f(t[i]+h, a, y[i]+k3)
       
        y[i + 1] = y[i] + (k1 + 2*k2 + 2*k3 + k4)/6
     }
     data.frame(step = 0:(n-1), t = t, y = y);
}

metodoDP5_c1 <- function(f, h, y0, n, a){
    stopifnot(is.function(f), h > 0, n >= 1)

     t <- seq(from=0, by=h, length.out=n);
     y <- numeric(n);
    
     t[1] <- 0;
     y[1] <- y0;
     for (i in 1:(n-1)) {
       s0 <- f(t[i], a, y[i])
       s1 <- f(t[i]+0.2*h, a, y[i]+0.2*h*s0)
       s2 <- f(t[i]+0.3*h, a, y[i]+0.3*h*(s0+3*s1)*0.25)
       s3 <- f(t[i]+0.8*h, a, y[i]+0.8*h*(11*s0-42*s1+40*s2)/9)
       s4 <- f(t[i]+8/9*h, a, y[i]+8/9*h*(4843*s0-19020*s1+16112*s2-477*s3)/1458) 
       s5 <- f(t[i]+h, a, y[i]+h*(477901*s0-1806240*s1+1495424*s2+46746*s3-45927*s4)/167904)
       z <- y[i]+h*(12985*s0+64000*s2+92750*s3-45927*s4+18656*s5)/142464
       s6 <- f(t[i]+h, a, z)

        y[i + 1] = y[i] + h*(1921409*s0+9690880*s2+13122270*s3-5802111*s4+1902912*s5+534240*s6)/21369600
     }
     data.frame(step = 0:(n-1), t = t, y = y);
}

##########################################################################
#                                CASO 2
##########################################################################

f2 <- function(t, k, a, X){
  -k*X + a
}

metodoEuler_c2 <- function(f, h, y0, n, k, a){
    stopifnot(is.function(f), h > 0, n >= 1)

     t <- numeric(n);
     y <- numeric(n);
    
     t[1] <- 0;
     y[1] <- y0;
     for (i in 1:(n-1)) {
          y[i + 1] <- y[i] + f(t[i], k, a, y[i]);
          t[i + 1] <- t[i] + h;
     }
     data.frame(step = 0:(n-1), t = t, y = y);
}

metodoRK4_c2 <- function(f, h, y0, n, k, a){
    stopifnot(is.function(f), h > 0, n >= 1)

     t <- seq(from=0, by=h, length.out=n);
     y <- numeric(n);
    
     t[1] <- 0;
     y[1] <- y0;
     for (i in 1:(n-1)) {
        k1 = h*f(t[i], k, a, y[i])
        k2 = h*f(t[i]+0.5*h, k, a, y[i]+0.5*k1)
        k3 = h*f(t[i]+0.5*h, k, a, y[i]+0.5*k2)
        k4 = h*f(t[i]+h, k, a, y[i]+k3)
       
        y[i + 1] = y[i] + (k1 + 2*k2 + 2*k3 + k4)/6
     }
     data.frame(step = 0:(n-1), t = t, y = y);
}

metodoDP5_c2 <- function(f, h, y0, n, k, a){
    stopifnot(is.function(f), h > 0, n >= 1)

     t <- seq(from=0, by=h, length.out=n);
     y <- numeric(n);
    
     t[1] <- 0;
     y[1] <- y0;
     for (i in 1:(n-1)) {
       s0 <- f(t[i], k, a, y[i])
       s1 <- f(t[i]+0.2*h, k, a, y[i]+0.2*h*s0)
       s2 <- f(t[i]+0.3*h, k, a, y[i]+0.3*h*(s0+3*s1)*0.25)
       s3 <- f(t[i]+0.8*h, k, a, y[i]+0.8*h*(11*s0-42*s1+40*s2)/9)
       s4 <- f(t[i]+8/9*h, k, a, y[i]+8/9*h*(4843*s0-19020*s1+16112*s2-477*s3)/1458) 
       s5 <- f(t[i]+h, k, a, y[i]+h*(477901*s0-1806240*s1+1495424*s2+46746*s3-45927*s4)/167904)
       z <- y[i]+h*(12985*s0+64000*s2+92750*s3-45927*s4+18656*s5)/142464
       s6 <- f(t[i]+h, k, a, z)

        y[i + 1] = y[i] + h*(1921409*s0+9690880*s2+13122270*s3-5802111*s4+1902912*s5+534240*s6)/21369600
     }
     data.frame(step = 0:(n-1), t = t, y = y);
}