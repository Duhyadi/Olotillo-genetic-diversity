# 🧬 Olotillo Genetic Diversity

This repository contains the data and scripts associated with the article:  
**“Diversity and genetic structure within a Mexican maize race reveal consistent biocultural processes across geographic scales.”**

Oliva-García D., Coutiño-Estrada B., Rojas-Barrera I., Perales H., Piñero D., Wegier A., Mastretta-Yanes A Diversity and genetic structure within a Mexican maize race reveal consistent biocultural processes across geographic scales. Genetic Resources and Crop Evolution. Genetic Resources and Crop Evolution, 73: 73. [LInk] (https://doi.org/10.1007/s10722-025-02682-8)


## 📂 Repository Structure

```
├── data_general/                       # General genomic dataset
│   ├── data_general_README.md          # Description of data sources and formats
│   └── mixplates_filtered_2x.vcf.gz    # Filtered VCF file containing genotype data
│
├── figure_1_2_maps/                    # Scripts and data for geographic and environmental maps
│   ├── bin/                            # R scripts for spatial analysis and visualization
│   ├── map_&_environmental_conditions.Rproj
│   ├── meta/                           # Metadata associated with geographic information
│   ├── shape/                          # Shapefiles used for map creation
│   └── Readme.md                       # Detailed documentation for Figure 1 and 2
│
├── figure_3_PCA/                       # Principal Component Analysis (PCA) results and scripts
│   ├── bin/                            # R scripts for PCA computation and plotting
│   ├── data/                           # PCA-related datasets
│   └── meta/                           # Metadata for sample groups and populations
│
├── figure_4_admixture/                 # Admixture and ancestry analyses
│   ├── bin/                            # R and bash scripts for ADMIXTURE runs and plots
│   ├── data/                           # Q files and outputs
│   └── meta/                           # Sample and population metadata
│
├── meta_general/                       # General metadata
│   └── meta_Olotillo.xlsx              # Metadata describing samples, localities, and traits
│
├── tables_supplementary_diversity/     # Supplementary diversity tables and supporting scripts
│   ├── bash/                           # Bash scripts for processing summary statistics
│   ├── bin/                            # R scripts for diversity analyses
│   ├── data/                           # Resulting data tables
│   └── meta/                           # Metadata for supplementary tables
│
└── README.md                           # Main project overview (this file)
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
- `dplyr`, `ggplot2`, `sf`, `raster`, `cowplot`, `pophelper`, `adegenet`, `vcfR`

Some analyses require **bash** and **ADMIXTURE** to reproduce population structure results.

## 📜 Citation

If you use this repository or its contents, please cite the following publication:

> **Oliva-García, D., Coutiño-Estrada, B., Rojas-Barrera, I.C., Perales, H., Piñero, D., Wegier, A., & Mastretta-Yanes, A.** (2025).  
> *Diversity and genetic structure within a Mexican maize race reveal consistent biocultural processes across geographic scales.*  
> **Genetic Resources and Crop Evolution.**  
> [Accepted version]


## 📧 Contact

For questions or collaboration inquiries, please contact:  
**Duhyadi Oliva-García**  
📩 duhyadi.oliva@st.ib.unam.mx
