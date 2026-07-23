# 🧬 Olotillo Genetic Diversity

This repository contains the data and scripts associated with the article:  
**“Diversity and genetic structure within a Mexican maize race reveal consistent biocultural processes across geographic scales.”**

Oliva-García D., Coutiño-Estrada B., Rojas-Barrera I., Perales H., Piñero D., Wegier A., Mastretta-Yanes A Diversity and genetic structure within a Mexican maize race reveal consistent biocultural processes across geographic scales. Genetic Resources and Crop Evolution. Genetic Resources and Crop Evolution, 73: 73 [link](https://doi.org/10.1007/s10722-025-02682-8)

## 🟢 Dryad 

Data dryad for Diversity and genetic structure within a Mexican maize race reveal consistent biocultural processes across geographic scales: [published jul 14, 2026 on Dryad,  https://doi.org/10.5061/dryad.44j0zpcv6](https://datadryad.org/dataset/doi:10.5061/dryad.44j0zpcv6)


## 📂 Repository Structure

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

## 🧠 Project Overview

This project explores the **genetic diversity and population structure** of the *Olotillo* maize race, a traditional landrace cultivated in southern Mexico.  
Analyses combine **genomic**, **environmental**, and **geographic** information to investigate how **biocultural processes** influence genetic variation at local and regional scales.

## 🧰 Contents

- **Genomic Data:** Filtered VCF datasets and associated metadata.  
- **Scripts:** R and bash scripts for data processing, analysis, and visualization.  
- **Figures:** Scripts and inputs for reproducing Figures 1–4 of the article.  
- **Supplementary Tables:** Diversity and population structure results supporting the main text.  

## ⚙️ Requirements

Main analyses were conducted using **R (≥ 4.3)** and the following key packages:

 `dplyr`, `ggplot2`, `sf`, `raster`, `cowplot`, `pophelper`, `adegenet`, `vcfR`

Some analyses require **bash** and **ADMIXTURE** to reproduce population structure results.


## 📧 Contact

For questions or collaboration inquiries, please contact:  
**Duhyadi Oliva-García**  
📩 duhyadi.oliva@st.ib.unam.mx
