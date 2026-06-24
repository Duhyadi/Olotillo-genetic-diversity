# Admixture *Olotillo*

**Project:** *Olotillo* genetic diversity

**Associated article:** Diversity and genetic structure within a Mexican maize race reveal consistent biocultural processes across geographic scales.

**Language:** R (version ≥ 4.2).

**Last update:** October 2025.

## 🧭 Overview

This directory contains the data, metadata, and scripts required to reproduce the admixture analysis presented in **Figure 4** of the associated manuscript. The analysis evaluates population genetic structure and ancestry proportions among *Zea mays* race *Olotillo* samples using genome-wide SNP data derived from genotyping-by-sequencing (GBS).

Filtered SNP data were converted into formats suitable for admixture inference, and ancestry proportions were estimated across predefined values of K. Results are visualized and interpreted in the context of geographic and biocultural structure.

## 📁 Directory structure

```markdown
📂 Directory structure

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

## Data description
### 🧬Genomic data

The ``data/`` directory contains the filtered SNP datasets used as input for the admixture analysis. These include:

- Filtered **VCF files** derived from GBS data.

- **PLINK-formatted files** (``.bed``, ``.bim``,``.fam``) generated from the VCFs for compatibility with admixture software.

- Output files generated by the admixture analysis, such as **Q matrices** and log files corresponding to different values of K.

## 🗺️Metadata

The ``meta/`` directory contains sample-level metadata used to annotate and interpret admixture results. Metadata files describe sample identifiers, geographic origin, and population attributes, and are consistent with those used in other analyses within this repository (e.g., PCA).

## 📊Script description

The ``bin/`` directory contains scripts used to:

- Prepare SNP data for admixture analysis.

- Run admixture inference across multiple values of K.

- Post-process and visualize ancestry proportions.

- Generate the admixture plot corresponding to **Figure 4** in the manuscript.

Scripts assume relative paths and the directory structure provided in this repository.

## ⚙️ System requirements

- **R ≥ 4.2**

- **RStudio ≥ 2023.06** (recommended)

- PLINK (v1.9 or later)

- ADMIXTURE (or equivalent software)

- Operating system: Linux (Ubuntu 22.04 LTS recommended); Windows/macOS supported where compatible

## 📦 R and software dependencies

Typical R packages used for post-processing and visualization include:

```r
install.packages(c(
  "ggplot2",
  "dplyr",
  "tidyr",
  "readr"
))
```
Additional external tools such as **PLINK** and **ADMIXTURE** are required for genotype processing and ancestry estimation.

## 🚀 How to run the analysis

**1.** Clone the repository or download the project files.

**2.** Set the working directory to ``figure_4_admixture/``.

**3.** Ensure PLINK and ADMIXTURE are available in your system path.

**4.** Run the scripts in the ``bin/`` directory following their internal instructions (order and parameters are specified within each script).

This workflow will reproduce the admixture results and visualizations presented in **Figure 4** of the manuscript.

## 📌 Notes on reproducibility

- All paths are defined relative to the figure_4_admixture directory.

- The analysis was tested under **Ubuntu 22.04**.

- Results depend on the filtered SNP dataset and the choice of K values evaluated.



