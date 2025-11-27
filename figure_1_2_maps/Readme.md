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

## ⚙️ System requirements

- **R** ≥ 4.2  
- **RStudio** ≥ 2023.06 (recommended)
- Operating system: Ubuntu 22.04 LTS or compatible (Windows/Mac also supported)

---

## 📦 R Dependencies

Install the necessary packages with:

```r
install.packages(c(
  "here", 
  "sf", 
  "dplyr", 
  "ggplot2", 
  "terra"
))

These packages allow you to handle spatial data, generate maps, and ensure reproducible routes.

🚀 How to run the analysis

Clone the repository or download the project package.

Open the file map_&_environmental_conditions.Rproj in RStudio.

Upon startup, the .Rprofile file will automatically configure paths using here::here().

Open and run the main script:

rmarkdown::render("bin/map_olotillo.Rmd")

This will generate the results and visualizations described in the article.


🧩 Use of reproducible routes

This project uses the here package to ensure that the paths to the data files are consistent in any environment.

Example of data reading:

library(sf)
library(here)

Mexico <- st_read(here("shape", "destdv1gw.shp"))
meta_points <- read.csv(here("meta", "olotillo_points_meta_clean.csv"))

📜 Recommended quote

If you use this code or data, please cite:

Duhyadi (2025). Map & Environmental Conditions.
Repository: [GitHub or Dryad URL aquí]
DOI: (add if applicable)


🧠 Final Notes

The .Rproj and .Rprofile files allow the project to be fully reproducible.

Routes are constructed relatively using here::here().

The scripts were tested under Ubuntu 22.04 with R 4.5.0.






