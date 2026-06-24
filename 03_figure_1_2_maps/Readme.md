
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
 
## Directory structure

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
## Directory structure

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

The `03_figure_1_2_maps/` directory contains the files used to generate maps and environmental-condition analyses for the Olotillo genetic diversity project.

The folder is organized into three main subdirectories. The `bin/` folder contains the R Markdown scripts used for map generation and environmental analyses. The `meta/` folder contains tabular metadata, including sample information, geographic coordinates, weather data, and sequencing plate metadata. The `shape/` folder contains the spatial vector layers used for mapping, including shapefile components, metadata files, and preview images.

The main directory also includes the RStudio project file (`map_&_environmental_conditions.Rproj`) and the main `Readme.md` file documenting the workflow and folder organization.
te equivicas estoy en otro link de git hub: https://github.com/Duhyadi/Olotillo-genetic-diversity/tree/main

Tienes razón, me fui al Readme.md de la subcarpeta 03_figure_1_2_maps/, pero ahora estás trabajando en el README principal del repositorio:

Olotillo-genetic-diversity/README.md

En ese README principal, la sección que está desactualizada es Repository Structure. Reemplázala por este bloque:

## Repository Structure

```text
Olotillo-genetic-diversity/
├── 01_data_general_SNPs/
│   ├── data_general_README.md
│   └── mixplates_filtered_2x.vcf.gz
│
├── 02_meta_general/
│   └── meta_Olotillo.xlsx
│
├── 03_figure_1_2_maps/
│   ├── Readme.md
│   ├── map_&_environmental_conditions.Rproj
│   ├── bin/
│   │   ├── .Rprofile
│   │   ├── map_olotillo.Rmd
│   │   └── olotillo_weather.Rmd
│   ├── meta/
│   │   ├── README.md
│   │   ├── olotillo_PGMN_siagro.csv
│   │   ├── olotillo_points_meta_clean.csv
│   │   ├── olotillo_weather.csv
│   │   ├── pca_meta_mixplate.csv
│   │   └── plate1_fullmeta.txt
│   └── shape/
│       ├── destdv1gw/
│       └── oloti_7cgw/
│
├── 04_figure_3_PCA/
│   ├── bin/
│   ├── data/
│   └── meta/
│
├── 05_figure_4_admixture/
│   ├── bin/
│   ├── data/
│   └── meta/
│
├── 06_tables_diversity_and_supple/
│   ├── bash/
│   ├── bin/
│   ├── data/
│   └── meta/
│
├── .gitignore
└── README.md
```

The repository is organized into six main numbered directories. `01_data_general_SNPs/` contains the filtered genomic SNP dataset. `02_meta_general/` contains the general metadata file for the Olotillo samples. `03_figure_1_2_maps/` includes scripts, metadata, and spatial layers used to generate geographic and environmental maps. `04_figure_3_PCA/` contains files associated with principal component analysis. `05_figure_4_admixture/` contains ADMIXTURE and ancestry-related analyses. `06_tables_diversity_and_supple/` contains scripts, metadata, and data tables used for genetic diversity and supplementary analyses.

En el README actual todavía aparecen nombres viejos como data_general/, meta_general/, figure_1_2_maps/, figure_3_PCA/, figure_4_admixture/ y tables_supplementary_diversity/, pero en GitHub los directorios actuales son 01_data_general_SNPs, 02_meta_general, 03_figure_1_2_maps, 04_figure_3_PCA, 05_figure_4_admixture y 06_tables_diversity_and_supple.

Repítelo pero comenta los archivos, adjunto captura de pantalla para que te des una idea.

Sí, aquí tienes la versión comentada para el README principal. Copia y pega este bloque completo para reemplazar la sección actual ## Repository Structure.

## Repository Structure

```text
Olotillo-genetic-diversity/
├── 01_data_general_SNPs/                     # General genomic SNP dataset
│   ├── data_general_README.md                # Description of the genomic data source and file format
│   └── mixplates_filtered_2x.vcf.gz          # Filtered VCF file containing SNP genotype data
│
├── 02_meta_general/                          # General project metadata
│   └── meta_Olotillo.xlsx                    # Metadata describing samples, accessions, localities, and traits
│
├── 03_figure_1_2_maps/                       # Scripts and input files for Figures 1 and 2
│   ├── Readme.md                             # Documentation for maps and environmental-condition analyses
│   ├── map_&_environmental_conditions.Rproj  # RStudio project file for map and environmental analyses
│   ├── bin/                                  # R Markdown scripts for spatial and environmental analyses
│   │   ├── .Rprofile                         # R project startup configuration file
│   │   ├── map_olotillo.Rmd                  # R Markdown script for generating Olotillo distribution maps
│   │   └── olotillo_weather.Rmd              # R Markdown script for environmental and weather analyses
│   ├── meta/                                 # Metadata used for mapping and environmental analyses
│   │   ├── README.md                         # Description of metadata files in this folder
│   │   ├── olotillo_PGMN_siagro.csv          # Occurrence and passport data from PGMN/SIAGRO sources
│   │   ├── olotillo_points_meta_clean.csv    # Cleaned geographic point metadata for mapping
│   │   ├── olotillo_weather.csv              # Weather and environmental metadata for Olotillo localities
│   │   ├── pca_meta_mixplate.csv             # Sequencing plate and sample metadata used across analyses
│   │   └── plate1_fullmeta.txt               # Full metadata table for sequencing plate 1
│   └── shape/                                # Spatial vector layers used for map generation
│       ├── destdv1gw/                        # Shapefile layer and auxiliary files for environmental/geographic mapping
│       └── oloti_7cgw/                       # Shapefile layer and auxiliary files for Olotillo geographic mapping
│
├── 04_figure_3_PCA/                          # Files associated with Principal Component Analysis (PCA)
│   ├── bin/                                  # R scripts for PCA computation and visualization
│   ├── data/                                 # PCA output files and related datasets
│   └── meta/                                 # Metadata used to annotate samples and groups in PCA plots
│
├── 05_figure_4_admixture/                    # Files associated with ADMIXTURE and ancestry analyses
│   ├── bin/                                  # R and bash scripts for ADMIXTURE runs and visualization
│   ├── data/                                 # ADMIXTURE output files, including Q matrices and related results
│   └── meta/                                 # Sample and population metadata used for ADMIXTURE plots
│
├── 06_tables_diversity_and_supple/           # Genetic diversity and supplementary table files
│   ├── bash/                                 # Bash scripts for diversity metrics calculated with VCFtools
│   ├── bin/                                  # R scripts for processing and summarizing diversity analyses
│   ├── data/                                 # Genetic diversity output tables and supplementary data
│   └── meta/                                 # Metadata and diversity-related tables used in downstream analyses
│
├── .gitignore                                # Git ignore rules for files that should not be tracked
└── README.md                                 # Main project overview and repository documentation
```

Esta versión mantiene el formato del README original, pero actualiza los nombres de carpetas al esquema numerado actual que aparece en el repositorio principal.

Actualiza el directorio para el siguiente link, incluye también los comentarios. A continuación el link: https://github.com/Duhyadi/Olotillo-genetic-diversity/tree/main/05_figure_4_admixture

Tienes razón. Para 05_figure_4_admixture/, la carpeta actual contiene bin/, data/, meta/ y readme.md; dentro de bin/ están los scripts de ADMIXTURE, dentro de data/ están los archivos PLINK/VCF y las salidas por K, y dentro de meta/ está admixture_meta.csv.

Copia y pega este bloque en Markdown para actualizar la sección del directorio:

## Directory structure

```text
05_figure_4_admixture/
├── readme.md                         # Main documentation for the ADMIXTURE analysis
├── bin/                              # Scripts used to run ADMIXTURE and generate Figure 4
│   ├── admixture.sh                  # Bash script for running ADMIXTURE
│   ├── admixture_k2for10.sh          # Bash script for running ADMIXTURE with K = 2 across 10 runs
│   ├── admixture_k3for10.sh          # Bash script for running ADMIXTURE with K = 3 across 10 runs
│   ├── admixture_k4for10.sh          # Bash script for running ADMIXTURE with K = 4 across 10 runs
│   └── admixture_olotillo.R          # R script for processing and visualizing ADMIXTURE results
├── data/                             # Genotype input files and ADMIXTURE output files
│   ├── mixplates_filtered_2x.vcf.gz  # Filtered VCF file containing SNP genotype data
│   ├── mixplates.bed                 # PLINK binary genotype file used as ADMIXTURE input
│   ├── mixplates.bim                 # PLINK variant information file
│   ├── mixplates.fam                 # PLINK sample information file
│   ├── out_admixture2/               # ADMIXTURE results for K = 2
│   │   ├── log_K2_run1.out           # ADMIXTURE log file for K = 2, run 1
│   │   ├── log_K2_run2.out           # ADMIXTURE log file for K = 2, run 2
│   │   ├── log_K2_run3.out           # ADMIXTURE log file for K = 2, run 3
│   │   ├── log_K2_run4.out           # ADMIXTURE log file for K = 2, run 4
│   │   ├── log_K2_run5.out           # ADMIXTURE log file for K = 2, run 5
│   │   ├── log_K2_run6.out           # ADMIXTURE log file for K = 2, run 6
│   │   ├── log_K2_run7.out           # ADMIXTURE log file for K = 2, run 7
│   │   ├── log_K2_run8.out           # ADMIXTURE log file for K = 2, run 8
│   │   ├── log_K2_run9.out           # ADMIXTURE log file for K = 2, run 9
│   │   ├── log_K2_run10.out          # ADMIXTURE log file for K = 2, run 10
│   │   ├── mixplates_run1.2.P        # Allele frequency estimates for K = 2, run 1
│   │   ├── mixplates_run1.2.Q        # Individual ancestry proportions for K = 2, run 1
│   │   ├── mixplates_run2.2.P        # Allele frequency estimates for K = 2, run 2
│   │   ├── mixplates_run2.2.Q        # Individual ancestry proportions for K = 2, run 2
│   │   ├── mixplates_run3.2.P        # Allele frequency estimates for K = 2, run 3
│   │   ├── mixplates_run3.2.Q        # Individual ancestry proportions for K = 2, run 3
│   │   ├── mixplates_run4.2.P        # Allele frequency estimates for K = 2, run 4
│   │   ├── mixplates_run4.2.Q        # Individual ancestry proportions for K = 2, run 4
│   │   ├── mixplates_run5.2.P        # Allele frequency estimates for K = 2, run 5
│   │   ├── mixplates_run5.2.Q        # Individual ancestry proportions for K = 2, run 5
│   │   ├── mixplates_run6.2.P        # Allele frequency estimates for K = 2, run 6
│   │   ├── mixplates_run6.2.Q        # Individual ancestry proportions for K = 2, run 6
│   │   ├── mixplates_run7.2.P        # Allele frequency estimates for K = 2, run 7
│   │   ├── mixplates_run7.2.Q        # Individual ancestry proportions for K = 2, run 7
│   │   ├── mixplates_run8.2.P        # Allele frequency estimates for K = 2, run 8
│   │   ├── mixplates_run8.2.Q        # Individual ancestry proportions for K = 2, run 8
│   │   ├── mixplates_run9.2.P        # Allele frequency estimates for K = 2, run 9
│   │   ├── mixplates_run9.2.Q        # Individual ancestry proportions for K = 2, run 9
│   │   ├── mixplates_run10.2.P       # Allele frequency estimates for K = 2, run 10
│   │   └── mixplates_run10.2.Q       # Individual ancestry proportions for K = 2, run 10
│   ├── out_admixture3/               # ADMIXTURE results for K = 3
│   │   ├── log_K3_run1.out           # ADMIXTURE log file for K = 3, run 1
│   │   ├── log_K3_run2.out           # ADMIXTURE log file for K = 3, run 2
│   │   ├── log_K3_run3.out           # ADMIXTURE log file for K = 3, run 3
│   │   ├── log_K3_run4.out           # ADMIXTURE log file for K = 3, run 4
│   │   ├── log_K3_run5.out           # ADMIXTURE log file for K = 3, run 5
│   │   ├── log_K3_run6.out           # ADMIXTURE log file for K = 3, run 6
│   │   ├── log_K3_run7.out           # ADMIXTURE log file for K = 3, run 7
│   │   ├── log_K3_run8.out           # ADMIXTURE log file for K = 3, run 8
│   │   ├── log_K3_run9.out           # ADMIXTURE log file for K = 3, run 9
│   │   ├── log_K3_run10.out          # ADMIXTURE log file for K = 3, run 10
│   │   ├── mixplates_run1.3.P        # Allele frequency estimates for K = 3, run 1
│   │   ├── mixplates_run1.3.Q        # Individual ancestry proportions for K = 3, run 1
│   │   ├── mixplates_run2.3.P        # Allele frequency estimates for K = 3, run 2
│   │   ├── mixplates_run2.3.Q        # Individual ancestry proportions for K = 3, run 2
│   │   ├── mixplates_run3.3.P        # Allele frequency estimates for K = 3, run 3
│   │   ├── mixplates_run3.3.Q        # Individual ancestry proportions for K = 3, run 3
│   │   ├── mixplates_run4.3.P        # Allele frequency estimates for K = 3, run 4
│   │   ├── mixplates_run4.3.Q        # Individual ancestry proportions for K = 3, run 4
│   │   ├── mixplates_run5.3.P        # Allele frequency estimates for K = 3, run 5
│   │   ├── mixplates_run5.3.Q        # Individual ancestry proportions for K = 3, run 5
│   │   ├── mixplates_run6.3.P        # Allele frequency estimates for K = 3, run 6
│   │   ├── mixplates_run6.3.Q        # Individual ancestry proportions for K = 3, run 6
│   │   ├── mixplates_run7.3.P        # Allele frequency estimates for K = 3, run 7
│   │   ├── mixplates_run7.3.Q        # Individual ancestry proportions for K = 3, run 7
│   │   ├── mixplates_run8.3.P        # Allele frequency estimates for K = 3, run 8
│   │   ├── mixplates_run8.3.Q        # Individual ancestry proportions for K = 3, run 8
│   │   ├── mixplates_run9.3.P        # Allele frequency estimates for K = 3, run 9
│   │   ├── mixplates_run9.3.Q        # Individual ancestry proportions for K = 3, run 9
│   │   ├── mixplates_run10.3.P       # Allele frequency estimates for K = 3, run 10
│   │   └── mixplates_run10.3.Q       # Individual ancestry proportions for K = 3, run 10
│   └── out_admixture4/               # ADMIXTURE results for K = 4
│       ├── log_K4_run1.out           # ADMIXTURE log file for K = 4, run 1
│       ├── log_K4_run2.out           # ADMIXTURE log file for K = 4, run 2
│       ├── log_K4_run3.out           # ADMIXTURE log file for K = 4, run 3
│       ├── log_K4_run4.out           # ADMIXTURE log file for K = 4, run 4
│       ├── log_K4_run5.out           # ADMIXTURE log file for K = 4, run 5
│       ├── log_K4_run6.out           # ADMIXTURE log file for K = 4, run 6
│       ├── log_K4_run7.out           # ADMIXTURE log file for K = 4, run 7
│       ├── log_K4_run8.out           # ADMIXTURE log file for K = 4, run 8
│       ├── log_K4_run9.out           # ADMIXTURE log file for K = 4, run 9
│       ├── log_K4_run10.out          # ADMIXTURE log file for K = 4, run 10
│       ├── mixplates_run1.4.P        # Allele frequency estimates for K = 4, run 1
│       ├── mixplates_run1.4.Q        # Individual ancestry proportions for K = 4, run 1
│       ├── mixplates_run2.4.P        # Allele frequency estimates for K = 4, run 2
│       ├── mixplates_run2.4.Q        # Individual ancestry proportions for K = 4, run 2
│       ├── mixplates_run3.4.P        # Allele frequency estimates for K = 4, run 3
│       ├── mixplates_run3.4.Q        # Individual ancestry proportions for K = 4, run 3
│       ├── mixplates_run4.4.P        # Allele frequency estimates for K = 4, run 4
│       ├── mixplates_run4.4.Q        # Individual ancestry proportions for K = 4, run 4
│       ├── mixplates_run5.4.P        # Allele frequency estimates for K = 4, run 5
│       ├── mixplates_run5.4.Q        # Individual ancestry proportions for K = 4, run 5
│       ├── mixplates_run6.4.P        # Allele frequency estimates for K = 4, run 6
│       ├── mixplates_run6.4.Q        # Individual ancestry proportions for K = 4, run 6
│       ├── mixplates_run7.4.P        # Allele frequency estimates for K = 4, run 7
│       ├── mixplates_run7.4.Q        # Individual ancestry proportions for K = 4, run 7
│       ├── mixplates_run8.4.P        # Allele frequency estimates for K = 4, run 8
│       ├── mixplates_run8.4.Q        # Individual ancestry proportions for K = 4, run 8
│       ├── mixplates_run9.4.P        # Allele frequency estimates for K = 4, run 9
│       ├── mixplates_run9.4.Q        # Individual ancestry proportions for K = 4, run 9
│       ├── mixplates_run10.4.P       # Allele frequency estimates for K = 4, run 10
│       └── mixplates_run10.4.Q       # Individual ancestry proportions for K = 4, run 10
└── meta/                             # Metadata used to annotate and interpret ADMIXTURE results
    └── admixture_meta.csv            # Sample metadata associated with ADMIXTURE analyses and plots
```
Sabes que no lo comentes, es mucha información, dámelo sin comentar 

Claro. Aquí está el directorio sin comentarios:

## Directory structure

## Directory structure

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






