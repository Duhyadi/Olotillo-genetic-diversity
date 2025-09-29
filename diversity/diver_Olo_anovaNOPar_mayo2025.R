# LIBRERÍAS

library(ggstatsplot)
library(dplyr)
library(ggplot2)

-----------
# DIRECTORIO DE TRABAJO 
getwd()
setwd("/home/duhyadi/Documents/paper1_mayo2025/diversity")

-----------
# DATA 
  
# Cargar CSV desde una ruta local
data <- read.csv("data_olotillo_mayo_2025.csv") # path
# Verificar los primeros registros, data
head(data)
# Asegurar el orden de los grupos
data$scale <- factor(data$scale, levels = c("Local", "Regional", "National"))
-----------
# VIOLIN PLOT   
# Box/Violin plots for between-subjects comparisons

---------------------------
#### NO PARAMÉTRICA ####
---------------------------  
# F, ENDOGAMIA

ggsave(# guardar en PNG
    filename = "F_Npar.png", 
    ggbetweenstats(
      data = data,
      x    = scale,
      y    = F,
      outlier.tagging = T,
      type = "nonparametric",
      p.adjust.method = "holm",
      pairwise.display = "all",
      var.equal = FALSE
    ),
    width = 6, # ancho imagen
    height = 6,# alto  imagen
    dpi = 300  # pixel imagen
  )
----------- 
# Asegurar el orden de los grupos
# data$scale <- factor(data$scale, levels = c("Local", "Regional", "National"))

# Crear y guardar el gráfico
ggsave(
  filename = "FIS_Npar_custom.png",
  plot = ggbetweenstats(
    data = data,
    x = scale,
    y = F,
    outlier.tagging = TRUE,
    type = "nonparametric",
    p.adjust.method = "holm",
    pairwise.display = "all",
    var.equal = FALSE,
    
    # Solo personalizar colores de los puntos
    ggplot.component = ggplot2::scale_color_manual(
      values = c("Local" = "purple", "Regional" = "green", "National" = "dodgerblue")
    ),
  
  # Etiquetas personalizadas
    xlab = "Scale",
    ylab = expression(bold(F)[bold(italic(IS))]),  # F con subíndices "IS"
    title = expression(bold("Comparison of ") * bold(F)[bold(italic(IS))] * bold(" between scales")),
    caption = expression("Note: " * F[italic(IS)] * " represents the inbreeding coefficient.")
  ),
  width = 6,
  height = 6,
  dpi = 300
)  
 
----------- 
# HETob, HETEROCIGOSIS OBSERVADA 
  
ggsave(# guardar en PNG
    filename = "HETob_Npar.png", 
    ggbetweenstats(
      data = data_limpia,
      x    = scale,
      y    = HETob,
      outlier.tagging = T,
      type = "nonparametric",
      p.adjust.method = "holm",
      pairwise.display = "all",
      var.equal = FALSE
    ),
    width = 6, # ancho imagen
    height = 6,# alto  imagen
    dpi = 300  # pixel imagen
  )
-----------
# Asegurar el orden de los grupos
#data$scale <- factor(data$scale, levels = c("Local", "Regional", "National"))

# Crear y guardar el gráfico
ggsave(
  filename = "HETob_Npar_custom.png",
  plot = ggbetweenstats(
    data = data,
    x = scale,
    y = HETob,
    outlier.tagging = TRUE,
    type = "nonparametric",
    p.adjust.method = "holm",
    pairwise.display = "all",
    var.equal = FALSE,
    
    # Solo personalizar colores de los puntos
    ggplot.component = ggplot2::scale_color_manual(
      values = c("Local" = "purple", "Regional" = "green", "National" = "dodgerblue")
    ),
    
    # Etiquetas personalizadas
    xlab = "Scale",
    ylab = expression(italic(H)[italic(e)] * "OB"),
    title = expression("Comparison of " * italic(H)[italic(e)] * "OB between scales"),
    caption = expression("Note:" * italic(H)[italic(e)] * "OB represents the observed heterozygosity.")
  ),
  width = 6,
  height = 6,
  dpi = 300
)  

-----------
# HETex, HETEROCIGOSIS ESPERADA 
  
ggsave(# guardar en PNG
    filename = "HETex_Npar.png", 
    ggbetweenstats(
      data = data_limpia,
      x    = scale,
      y    = HETex,
      outlier.tagging = T,
      type = "nonparametric",
      p.adjust.method = "hom",
      pairwise.display = "all",
      var.equal = FALSE
    ),
    width = 6, # ancho imagen
    height = 6,# alto  imagen
    dpi = 300  # pixel imagen
  )

-----------

  # Crear y guardar el gráfico
  ggsave(
    filename = "HETex_Npar_custom.png",
    plot = ggbetweenstats(
      data = data,
      x = scale,
      y = HETex,
      outlier.tagging = TRUE,
      type = "nonparametric",
      p.adjust.method = "holm",
      pairwise.display = "all",
      var.equal = FALSE,
      
      # Solo personalizar colores de los puntos
      ggplot.component = ggplot2::scale_color_manual(
        values = c("Local" = "purple", "Regional" = "green", "National" = "dodgerblue")
      ),
      
      # Etiquetas personalizadas
      xlab = "Scale",
      ylab = expression(italic(H)[italic(e)] * "EX"),
      title = expression("Comparison of " * italic(H)[italic(e)] * "EX between scales"),
      caption = expression("Note:" * italic(H)[italic(e)] * "EX represents the expected heterozygosity.")
    ),
    width = 6,
    height = 6,
    dpi = 300
  )  
-----------

# HOMex, HOMOCIGOSIS ESPERADA
  
ggsave(# guardar en PNG
    filename = "HOMex_Npar.png", 
    ggbetweenstats(
      data = data_limpia,
      x    = scale,
      y    = HOMex,
      outlier.tagging = T,
      type = "nonparametric",
      p.adjust.method = "hom",
      pairwise.display = "all",
      var.equal = FALSE
    ),
    width = 6, # ancho imagen
    height = 6,# alto  imagen
    dpi = 300  # pixel imagen
  )

----------- 

  # Crear y guardar el gráfico
  ggsave(
    filename = "HOMex_Npar_custom.png",
    plot = ggbetweenstats(
      data = data,
      x = scale,
      y = HOMex,
      outlier.tagging = TRUE,
      type = "nonparametric",
      p.adjust.method = "holm",
      pairwise.display = "all",
      var.equal = FALSE,
      
      # Solo personalizar colores de los puntos
      ggplot.component = ggplot2::scale_color_manual(
        values = c("Local" = "purple", "Regional" = "green", "National" = "dodgerblue")
      ),
      
      # Etiquetas personalizadas
      xlab = "Scale",
      ylab = expression(italic(H)[italic(o)] * "EX"),
      title = expression("Comparison of " * italic(H)[italic(o)] * "EX between scales"),
      caption = expression("Note:" * italic(H)[italic(o)] * "EX represents the expected homozygosity.")
    ),
    width = 6,
    height = 6,
    dpi = 300
  )  
  
-----------   
  
  # N_SITES, NÚMERO DE SITIOS 
  
ggsave(# guardar en PNG
    filename = "N_sit_Npar.png", 
    ggbetweenstats(
      data = data_limpia,
      x    = scale,
      y    = N_SITES,
      outlier.tagging = T,
      type = "nonparametric",
      p.adjust.method = "hom",
      pairwise.display = "all",
      var.equal = FALSE
    ),
    width = 6, # ancho imagen
    height = 6,# alto  imagen
    dpi = 300  # pixel imagen
  )

-----------
  
  # Crear y guardar el gráfico
  ggsave(
    filename = "N_sit_Npar_custom.png",   
    plot = ggbetweenstats(
      data = data,
      x = scale,
      y = N_SITES,
      outlier.tagging = TRUE,
      type = "nonparametric",
      p.adjust.method = "holm",
      pairwise.display = "all",
      var.equal = FALSE,
      
      # Solo personalizar colores de los puntos
      ggplot.component = ggplot2::scale_color_manual(
        values = c("Local" = "purple", "Regional" = "green", "National" = "dodgerblue")
      ),
      
      # Etiquetas personalizadas
      xlab = "Scale",
      ylab = expression(italic(N)[italic(s)]),
      title = expression("Comparison of " * italic(N)[italic(s)] * "between scales"),
      caption = expression("Note:" * italic(N)[italic(s)] * "represents the number of sites.")
    ),
    width = 6,
    height = 6,
    dpi = 300
  )  

  


  
  

