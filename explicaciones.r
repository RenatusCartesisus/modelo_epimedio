explicaciones <-list(
  # Texto acerca del gráfico de comparaciones.
  card(min_height =600,
            full_screen = TRUE,
            card_header("Comparaciones"), 
            card_body(min_height = 100,
            "Note que en ambos gráficos realizados sucede un fenómeno muy similar, y es que el método de Euler se aleja de todos los demás métodos; de esta manera, es así como se puede observar que el resto mantienen una precisión muy alta entre sí, sin embargo, es notable que ode45 utiliza muchas menos iteraciones que el resto de métodos numéricos. Existen diferencias entre métodos numéricos, como se puede apreciar en esta simulación, pero depende del número de iteraciones utilizadas y el número de paso seleccionado, ya que el instante de tiempo final se determina por estos dos factores, lo cual puede provocar, por ejemplo, que se abarque un intervalo de tiempo muy corto, y que métodos como RK4 o RKDP5 parezcan ecuaciones casi lineales." ,
            br(),
            img(src="img/numerical_methods.png", class="img-exp")
            )
  ),
  # Explicación del método de Euler.
  card(min_height = 600,
            full_screen = TRUE,
            card_header("Euler"), 
            card_body(min_height = 200,
            "El método de Euler explícito es el más simple para hallar numéricamente una ecuación diferencial de primer orden. En el, la condición inicial se usa para calcular la pendiente de una función en ese mismo punto. Partiendo de ahí, y suponiendo que la pendiente de la función permanece constante una pequeña distancia, se estima el valor de la función en ese punto.Después, este nuevo punto se usa para calcular la pendiente la función en ese punto.",
            br(),
            "Esta relación de recursión también puede ser deducida del desarrollo de las series de Taylor, y se tendría un error de truncamiento de h cuadrada, correspondiente a la omisión de términos de orden 2 o superior.",
            img(src="img/euler.png", class="img-exp"),
            br(),
            "Debido al problema de exactitud que suele tener este metodo si el tamaño de paso h no es muy grande, y que si este valor se hace más pequeño, el número de operaciones computacionales que se debe hacer, crece, es que se han planteado otros métodos numéricos, los cuales, se explican a continuación (algunos de ellos son funciones propias de lenguajes como Python, Matlab, o R que evitan que se tenga que escribir todo el algoritmo)"
          )
            
  ),
  # Explicación del método de RK4.
          card(min_height = 450,
            full_screen = TRUE,
            card_header("RK4"), 
            card_body(min_height = 200,
          "Los métodos Runge-Kutta sonn una familia importante de métodos iterativos para la aproximación de soluciones de Ecuaciones Diferenciales Ordinarias (EDO) que fueron desarrollados a inicios del siglo pasado, por los matemáticos alemanes C. Runge (1865-1927) y M.W. Kutta (1867-1944). Al igual que en el método de Euler, se considera un tamaño de paso h, y el orden de Runge-Kutta que se usa en este caso (abreviado  como RK4), el cual, al obtener los coeficientes correspondientes con ayuda de la expresión general de este método con sus coeficientes de la expansión en series de Taylor y las tablas de Butcher, se obtienen los términos que se observan a continuación: ",
          img(src="img/rk4.png", class="img-exp"),
          br(),
          "Y en general, se obtiene un método razonablemente simple y robusto, y que es un buen candidato general para la solución de EDO cuando se combina con un tamaño de paso adaptativo e inteligente o un método embebido (como el método Runge-Kutta-Fehlberg o RKF45).",
          br(),
          "Note que en este caso, se tienen cuatro términos: k1, k2, k3 y k4, los cuales aproximan la pendiente para un tiempo t, asumiendo que solamente se tiene una aproximación al valor original de la función. Dichos valores representan pendientes en los valores inicial, medios (el segundo y el tercero) y al final del intervalo."
        )
  ),
  # Contenedor del gráfico del método de RK4DP5 para el caso 1.
  card(min_height = 450,
            full_screen = TRUE,
            card_header("RK4DP5"), 
            card_body(min_height = 200,
              "Como el anteriormente mencionado método de Ringe-Kutta adaptativo de Fehlberg, el método de Dormand y Prince (1980) puede ser resumido en las tablas de Butcher. Su tabla correspondiente se muestra a continuación:",
              br(),
              img(src="img/butcher_dp5.png"),
              br(),
              "Aunque ambos métodos usan RK4 y RK5, el método de Fehlberg usa el cuarto orden para obtener la solución y el de quinto orden para estimar el error, mientras que el método de Dormand Prince hace lo contrario. El método expandido se ve a continuación:",
              img(src="img/dp5.png"),
              br(),
              "Este algoritmo, finalmente, utiliza series de Taylor e iteraciones, así como también un tamaño de paso h mayor que cero, y considera valores de paso máximo y mínimo."

            )
  ),
  # Explicación de ode45.
          card(min_height = 450,
            full_screen = TRUE,
            card_header("ode45"), 
            card_body(min_height = 200,
              "Una función que viene dentro del paquete pracma, en el caso del lenguaje R es ode45, con la fual, se implementa el método de Runge-Kutta antes discutido para la solución de ecuaciones diferenciales que tegan como forma general: ",
              br(),
              img(src="img/ode45.png"),
              br(),
              "Donde t es la variable independiente y X es un vector de variablesdependientes para ser encontradas, así como f es la función de t y X."
            )
  ),
  # Explicación de ode de deSolve.
          card(min_height = 450,
            full_screen = TRUE,
            card_header("deSolve"), 
            card_body(min_height = 200,
              "Con ayuda de este paquete, se resuelve un sistema de ecuaciones diferenciales ordinarias, que recibe un vector con las condiciones iniciales para las funciones proporcionadas; el intervalo de tiempo para el que va a computar puntos de la gráfica de la solución; una función en R que se refiera a los valores de las tasas de cambio presentes en el sistema de EDO y finalmente, los parámetros de esta función.",
              br(),
              "Algo particular de esta función es que se puede seleccionar el método con que se desea computar la solución, como lsoda, lsode, lsodar, daspk, Euler o el propio RK4."
          )
  ),
  # Referencias
  card(
    min_height = 450,
    full_screen = TRUE,
    card_header("Referencias"), 
    card_body(min_height = 200,
      tags$ul(
        tags$li("Universidad de Alicante. (s. f). Ecuaciones diferenciales ordinarias e integración numérica. ", tags$a(href="https://rua.ua.es/server/api/core/bitstreams/be9e180b-6349-4970-bbf9-42c4424e932b/content", "https://rua.ua.es/server/api/core/bitstreams/be9e180b-6349-4970-bbf9-42c4424e932b/content")),
        tags$li("The University of Queensland. (s. f). Euler's method.", tags$a(href="https://teaching.smp.uq.edu.au/scims/Appl_analysis/Eulers_method.html", "https://teaching.smp.uq.edu.au/scims/Appl_analysis/Eulers_method.html")),
        tags$li("Universität Münster. (s. f). Runge-Kutta Methods.", tags$a(href="https://www.uni-muenster.de/imperia/md/content/physik_tp/lectures/ss2016/num_methods_ii/rkm.pdf", "https://www.uni-muenster.de/imperia/md/content/physik_tp/lectures/ss2016/num_methods_ii/rkm.pdf")),
        tags$li("Swathmore College. (s. f). Fourth Order Runge-Kutta.", tags$a(href="https://lpsa.swarthmore.edu/NumInt/NumIntFourth.html", "https://lpsa.swarthmore.edu/NumInt/NumIntFourth.html")),
        tags$li("Cook, J.D. (2020). A better adaptive Runge-Kutta method.", tags$a(href="https://www.johndcook.com/blog/2020/02/19/dormand-prince", "https://www.johndcook.com/blog/2020/02/19/dormand-prince")),
        tags$li("University of Waterloo. (s. f). In a nutshell: The adaptive Dormand-Prince method
        .", tags$a(href="https://ece.uwaterloo.ca/~dwharder/nm/Lecture_materials/pdfs/7.1.1.2.2%20The%20adaptive%20Dormand-Prince%20method%20in%20a%20nutshell.pdf", "https://ece.uwaterloo.ca/~dwharder/nm/Lecture_materials/pdfs/7.1.1.2.2%20The%20adaptive%20Dormand-Prince%20method%20in%20a%20nutshell.pdf")),
        tags$li("University of California at Berkley (s. f). A brief introduction to using ode45 in MATLAB.", tags$a(href="https://www.eng.auburn.edu/~tplacek/courses/3600/ode45berkley.pdf", "https://www.eng.auburn.edu/~tplacek/courses/3600/ode45berkley.pdf")),
        
        
      )        
    )
  )
)

