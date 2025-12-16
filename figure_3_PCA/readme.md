# PCA Olotillo

**Project:** Olotillo genetic diversity

**Associated article:** Diversity and genetic structure within a Mexican maize race reveal consistent biocultural processes across geographic scales.

**Language:** R (versión ≥ 4.2).

**Last update:** October 2025.


🧭 Overview

This directory contains the data, metadata, and scripts required to reproduce the Principal Component Analysis (PCA) presented in Figure 3 of the associated manuscript.
The analysis focuses on population genetic structure inferred from genome-wide SNP data obtained from genotyping-by-sequencing (GBS) of Zea mays race Olotillo.

The workflow integrates filtered SNP data in VCF format with laboratory and geographic metadata to generate PCA visualizations used for comparative population analyses.

📁 Directory structure

figure_3_PCA/
│
├── bin/
│   └── PCA.R                     # R script to run PCA and generate Figure 3
│
├── data/
│   └── mixplates_filtered_2x.vcf.gz
│                                # Filtered SNP dataset (VCF format)
│
├── meta/
│   ├── plate1_fullmeta.txt       # Sample metadata for genotyping plate 1
│   └── plate2_fullmeta.txt       # Sample metadata for genotyping plate 2
│
└── README.md                     # This file

🧬 Data description
Genomic data

mixplates_filtered_2x.vcf.gz
Final filtered SNP dataset derived from GBS data.
SNP calling and filtering were performed as described in the Methods section of the manuscript.
This file contains biallelic SNPs retained after quality filtering and is used as input for the PCA analysis.

Metadata

plate1_fullmeta.txt
Laboratory, geographic, and sampling metadata for samples processed in genotyping plate 1.
This file includes plate and well positions, sample identifiers, DNA concentration and yield measurements, geographic origin, data source, and sampling scale.
A full data dictionary and variable descriptions are provided in the main repository README.

plate2_fullmeta.txt
Metadata corresponding to samples processed in genotyping plate 2.
The structure and variables are identical to those in plate1_fullmeta.txt; only the plate assignment differs. Variable definitions are therefore not repeated.

📊 Script description

PCA.R
R script used to:

Load filtered SNP data from the VCF file

Integrate sample metadata from both genotyping plates

Perform Principal Component Analysis

Generate the PCA plot corresponding to Figure 3 in the manuscript

The script assumes relative paths and a fixed directory structure as provided in this repository.

⚙️ System requirements

R ≥ 4.2

RStudio ≥ 2023.06 (recommended)

Operating system: Linux (Ubuntu 22.04 LTS recommended), Windows or macOS also supported






