
# Map & Environmental Conditions

**Project:** *Olotillo* genetic diversity.

**Associated article:** Diversity and genetic structure within a Mexican maize race reveal consistent biocultural processes across geographic scales.

**Language:** R (version ≥ 4.2).  

**Latest update:** October 2025. 

---

## 🧭 Overview

This repository contains the data and scripts necessary to reproduce the spatial and environmental analyses used in the project **_Map & Environmental Conditions_**.

The analyses focus on the processing, visualization, and analysis of spatial and climatic data using R, with a reproducible approach based on relative paths and version control.

---

## 📂 Directory structure

The 03_figure_1_2_maps/ directory contains the files used to generate maps and environmental-condition analyses for the Olotillo genetic diversity project.

The folder is organized into three main subdirectories. The bin/ folder contains the R Markdown scripts used for map generation and environmental analyses. The meta/ folder contains tabular metadata, including sample information, geographic coordinates, weather data, and sequencing plate metadata. The shape/ folder contains the spatial vector layers used for mapping, including shapefile components, metadata files, and preview images.

The main directory also includes the RStudio project file (map_&_environmental_conditions.Rproj) and the main Readme.md file documenting the workflow and folder organization.
 
```text
03_figure_1_2_maps/
├── Readme.md
├── map_&_environmental_conditions.Rproj
├── bin/
│   ├── .Rprofile
│   ├── map_olotillo.Rmd
│   └── olotillo_weather.Rmd
├── meta/
│   ├── README.md
│   ├── olotillo_PGMN_siagro.csv
│   ├── olotillo_points_meta_clean.csv
│   ├── olotillo_weather.csv
│   ├── pca_meta_mixplate.csv
│   └── plate1_fullmeta.txt
└── shape/
    ├── destdv1gw/
    │   ├── README.md
    │   ├── destdv1gw.dbf
    │   ├── destdv1gw.html
    │   ├── destdv1gw.png
    │   ├── destdv1gw.prj
    │   ├── destdv1gw.shp
    │   ├── destdv1gw.shx
    │   ├── destdv1gw.xml
    │   └── destdv1gw_s.png
    └── oloti_7cgw/
        ├── README.md
        ├── oloti_7cgw.dbf
        ├── oloti_7cgw.html
        ├── oloti_7cgw.png
        ├── oloti_7cgw.prj
        ├── oloti_7cgw.shp
        ├── oloti_7cgw.shx
        ├── oloti_7cgw.xml
        └── oloti_7cgw_s.png
```

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






