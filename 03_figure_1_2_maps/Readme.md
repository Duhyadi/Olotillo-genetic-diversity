
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

## 📂 Directory structure

```text
03_figure_1_2_maps/                       # Scripts, metadata, and spatial layers for Figures 1 and 2
├── Readme.md                             # Documentation for this directory
├── map_&_environmental_conditions.Rproj  # RStudio project file for map and environmental analyses
├── bin/                                  # R scripts and project configuration files
│   ├── .Rprofile                         # R startup configuration file
│   ├── map_olotillo.Rmd                  # R Markdown script for generating Olotillo maps
│   └── olotillo_weather.Rmd              # R Markdown script for environmental/weather analyses
├── meta/                                 # Metadata used for mapping and environmental analyses
│   ├── README.md                         # Documentation for metadata files
│   ├── olotillo_PGMN_siagro.csv          # Occurrence and passport data from PGMN/SIAGRO sources
│   ├── olotillo_points_meta_clean.csv    # Cleaned geographic point metadata
│   ├── olotillo_weather.csv              # Weather and environmental metadata
│   ├── pca_meta_mixplate.csv             # Sample and sequencing plate metadata
│   └── plate1_fullmeta.txt               # Full metadata table for sequencing plate 1
└── shape/                                # Spatial vector layers used for mapping
    ├── destdv1gw/                        # Shapefile layer for environmental/geographic mapping
    │   ├── README.md                     # Documentation for this shapefile layer
    │   ├── destdv1gw.dbf                 # Attribute table for the shapefile
    │   ├── destdv1gw.html                # HTML metadata file
    │   ├── destdv1gw.png                 # Preview image
    │   ├── destdv1gw.prj                 # Coordinate reference system file
    │   ├── destdv1gw.shp                 # Main shapefile geometry file
    │   ├── destdv1gw.shx                 # Shapefile index file
    │   ├── destdv1gw.xml                 # XML metadata file
    │   └── destdv1gw_s.png               # Supplementary preview image
    └── oloti_7cgw/                       # Shapefile layer for Olotillo geographic mapping
        ├── README.md                     # Documentation for this shapefile layer
        ├── oloti_7cgw.dbf                # Attribute table for the shapefile
        ├── oloti_7cgw.html               # HTML metadata file
        ├── oloti_7cgw.png                # Preview image
        ├── oloti_7cgw.prj                # Coordinate reference system file
        ├── oloti_7cgw.shp                # Main shapefile geometry file
        ├── oloti_7cgw.shx                # Shapefile index file
        ├── oloti_7cgw.xml                # XML metadata file
        └── oloti_7cgw_s.png              # Supplementary preview image
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
```
---

## 🚀 How to run the analysis

Clone the repository or download the project package.

Open the file map_&_environmental_conditions.Rproj in RStudio.

Upon startup, the .Rprofile file will automatically configure paths using here::here().

Open and run the main script:

rmarkdown::render("bin/map_olotillo.Rmd")

This will generate the results and visualizations described in the article.

---

## 🧩 Use of reproducible routes

This project uses the here package to ensure that the paths to the data files are consistent in any environment.

Example of data reading:

library(sf)
library(here)

Mexico <- st_read(here("shape", "destdv1gw.shp"))
meta_points <- read.csv(here("meta", "olotillo_points_meta_clean.csv"))


## 🧠 Final Notes

The .Rproj and .Rprofile files allow the project to be fully reproducible.

Routes are constructed relatively using here::here().

The scripts were tested under Ubuntu 22.04 with R 4.5.0.






