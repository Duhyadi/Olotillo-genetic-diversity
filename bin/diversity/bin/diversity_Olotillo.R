# LIBRERÍAS

library(ggstatsplot)
library(dplyr)
library(ggplot2)

-----------
# DIRECTORIO DE TRABAJO 

getwd()
setwd("/home/duhyadi/Documents/paper1/diversity")

-----------
# DATA 

# Cargar CSV desde una ruta local
data <- read.csv("download_cluster/data_merged2.csv") # path
# Verificar los primeros registros, data
head(data)

-----------
# FILTRAR DATA 
  
# Filtrar data para que solo incluya registros con 'Olotillo'
data_filtrada <- data %>%
  filter(Race == "Olotillo")
# Verificar los primeros registros filtrados
head(data_filtrada)
# Eliminar registros que tengan "_F" o "_X" en la columna scale 
data_limpia <-data_filtrada  %>%
  filter(!scale %in% c("_F", "_X"))
# Verificar los primeros registros, data_limpia
head(data_limpia)

-----------
# GUARDAR NUEVO DATA SET 

# Guardar el nuevo dataset en un archivo:
write.csv(data_limpia, "data_olotillo.csv", row.names = FALSE) 

-----------
# VIOLIN PLOT   
# Box/Violin plots for between-subjects comparisons

---------------------------
#### PARAMÉTRICA ####
---------------------------
# F, ENDOGAMIA 

ggsave(# guardar en PNG
    filename = "F_par.png", 
  ggbetweenstats(
    data = data_limpia,
    x    = scale,
    y    = F,
    outlier.tagging = T,
    type = "parametric",
    p.adjust.method = "bonferroni",
    pairwise.display = "all",
    var.equal = FALSE
  ),
  width = 6, # ancho imagen
  height = 6,# alto  imagen
  dpi = 300  # pixel imagen
  )

-----------
# HETob, HETEROCIGOSIS OBSERVADA 

ggsave(# guardar en PNG
  filename = "HETob_par.png", 
  ggbetweenstats(
    data = data_limpia,
    x    = scale,
    y    = HETob,
    outlier.tagging = T,
    type = "parametric",
    p.adjust.method = "bonferroni",
    pairwise.display = "all",
    var.equal = FALSE
  ),
  width = 6, # ancho imagen
  height = 6,# alto  imagen
  dpi = 300  # pixel imagen
)

-----------
# HETex, HETEROCIGOSIS ESPERADA 

ggsave(# guardar en PNG
    filename = "HETex_par.png", 
    ggbetweenstats(
      data = data_limpia,
      x    = scale,
      y    = HETex,
      outlier.tagging = T,
      type = "parametric",
      p.adjust.method = "bonferroni",
      pairwise.display = "all",
      var.equal = FALSE
    ),
    width = 6, # ancho imagen
    height = 6,# alto  imagen
    dpi = 300  # pixel imagen
  )

-----------
# HOMex, HOMOCIGOSIS ESPERADA

ggsave(# guardar en PNG
    filename = "HOMex_par.png", 
    ggbetweenstats(
      data = data_limpia,
      x    = scale,
      y    = HOMex,
      outlier.tagging = T,
      type = "parametric",
      p.adjust.method = "bonferroni",
      pairwise.display = "all",
      var.equal = FALSE
    ),
    width = 6, # ancho imagen
    height = 6,# alto  imagen
    dpi = 300  # pixel imagen
  )

-----------
# N_SITES, NÚMERO DE SITIOS 

ggsave(# guardar en PNG
    filename = "N_sit_par.png", 
    ggbetweenstats(
      data = data_limpia,
      x    = scale,
      y    = N_SITES,
      outlier.tagging = T,
      type = "parametric",
      p.adjust.method = "bonferroni",
      pairwise.display = "all",
      var.equal = FALSE
    ),
    width = 6, # ancho imagen
    height = 6,# alto  imagen
    dpi = 300  # pixel imagen
  )

-----------
---------------------------
#### NO PARAMÉTRICA ####
---------------------------  
# F, ENDOGAMIA

ggsave(# guardar en PNG
    filename = "F_Npar.png", 
    ggbetweenstats(
      data = data_limpia,
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

  

  


  
  

