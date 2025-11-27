# Map & Environmental Conditions

**Author:** Duhyadi  
**Project:** paper1_final_tipodryad  
**Language:** R (versión ≥ 4.2)  
**Latest update:** Octubre 2025  

---

## 🧭 Overview

This repository contains the code, data, and scripts necessary to reproduce the spatial and environmental analyses used in the project **_Map & Environmental Conditions_**.

The analyses focus on the processing, visualization, and analysis of spatial and climatic data using R, with a reproducible approach based on relative paths and version control.

---

## 📂 Project structure

map_&environmental_conditions/
├── map&_environmental_conditions.Rproj # Archivo de proyecto R
├── .Rprofile # Configuración automática del entorno (here)
├── bin/ # Scripts y RMarkdowns
│ └── map_olotillo.Rmd # Script principal de análisis
├── meta/ # Datos tabulares asociados
│ ├── olotillo_PGMN_siagro.csv
│ ├── olotillo_points_meta_clean.csv
│ └── pca_meta_mixplate.csv
└── shape/ # Capas vectoriales (shapefiles)
├── destdv1gw.shp
└── oloti_7cgw.prj

---

## ⚙️ Requisitos del sistema

- **R** ≥ 4.2  
- **RStudio** ≥ 2023.06 (recomendado)
- Sistema operativo: Ubuntu 22.04 LTS o compatible (Windows/Mac también soportado)

---

## 📦 Dependencias R

Instalar los paquetes necesarios con:

```r
install.packages(c(
  "here", 
  "sf", 
  "dplyr", 
  "ggplot2", 
  "terra"
))

Estos paquetes permiten manejar datos espaciales, generar mapas y asegurar rutas reproducibles.

🚀 Cómo ejecutar el análisis

Clonar el repositorio o descargar el paquete del proyecto.

Abrir el archivo map_&_environmental_conditions.Rproj en RStudio.

Al iniciar, el archivo .Rprofile configurará automáticamente las rutas con here::here().

Abrir y ejecutar el script principal:

rmarkdown::render("bin/map_olotillo.Rmd")

Esto generará los resultados y visualizaciones descritas en el artículo.


🧩 Uso de rutas reproducibles

Este proyecto utiliza el paquete here
 para asegurar que las rutas a los archivos de datos sean consistentes en cualquier entorno.

Ejemplo de lectura de datos:

library(sf)
library(here)

Mexico <- st_read(here("shape", "destdv1gw.shp"))
meta_points <- read.csv(here("meta", "olotillo_points_meta_clean.csv"))

📜 Cita recomendada

Si utilizas este código o datos, por favor cita:

Duhyadi (2025). Map & Environmental Conditions.
Repositorio: [GitHub o Dryad URL aquí]
DOI: (añadir si aplica)


🧠 Notas finales

Los archivos .Rproj y .Rprofile permiten que el proyecto sea completamente reproducible.

Las rutas se construyen de manera relativa usando here::here().

Los scripts fueron probados bajo Ubuntu 22.04 con R 4.5.0.






