# Genetic Diversity Analyses *Olotillo*

**Project:** Olotillo genetic diversity

**Associated article:** Diversity and genetic structure within a Mexican maize race reveal consistent biocultural processes across geographic scales

**Language:** R / Bash

**Last update:** October 2025

## 🧭 Overview

This directory contains the data, metadata, scripts, and command-line workflows used to generate the supplementary tables related to genetic diversity analyses reported in the associated manuscript.
These analyses focus on population-level diversity statistics and nonparametric comparisons among sampling groups.

The outputs generated from this directory correspond to Supplementary Tables referenced in the article and support the interpretation of genomic diversity patterns across geographic and biocultural scales.

## 📁 Directory structure

```markdown
📂 Directory structure
tables_supplementary_diversity/
│
├── bash/
│   └── (bash scripts for nonparametric tests and data preprocessing)
│
├── bin/
│   └── (R scripts for diversity calculations and table generation)
│
├── data/
│   └── (input data files used in diversity analyses)
│
├── meta/
│   └── (metadata files associated with samples and populations)
│
└── README.md                     # This file
```

## Data description

### Input data

The `` data/`` directory contains the genomic or summary datasets used to calculate genetic diversity metrics.These files typically include population-level summaries derived from filtered SNP datasets and are consistent with the genomic data used in PCA and admixture analyses elsewhere in the repository.

### 🗺️Metadata

The ``meta/`` directory includes sample and population metadata used to group accessions and interpret diversity results.
Metadata variables describe geographic origin, population classification, and sampling scale, and are consistent with metadata files used throughout the project.

## 📊 Script description

**Bash script** **(``bash/``)**

The ``bash/`` directory contains command-line script used for:

- Calculate genetic diversity statistics (e.g., heterozygosity, or related metrics).

**R scripts** **(``bin/``)**

Scripts in the ``bin/`` directory are used to:

- Summarize diversity measures at the population or group level.

- Generate formatted tables used as supplementary material in the manuscript.

- Execution of **nonparametric statistical tests**.

## ⚙️ System requirements

- **R ≥ 4.2**

- **RStudio ≥ 2023.06** (recommended)

- Bash shell (Linux/macOS)

- Operating system: Linux (Ubuntu 22.04 LTS recommended); Windows supported via compatible environments

## 📦 R dependencies

Typical R packages required for diversity analyses and table generation include:

```r
install.packages(c(
  "dplyr",
  "tidyr",
  "ggplot2",
  "readr"
))
```

Additional packages may be loaded within individual scripts as required.

## 🚀 How to run the analysis

- **1.** Clone the repository or download the project files.
- **2.** Set the working directory to ``tables_supplementary_diversity/``.
    





