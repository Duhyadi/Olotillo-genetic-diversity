# Genetic Diversity Analyses *Olotillo*

Project: Olotillo genetic diversity

Associated article: Diversity and genetic structure within a Mexican maize race reveal consistent biocultural processes across geographic scales
Language: R / Bash
Last update: October 2025

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

Input data

The `` data/`` directory contains the genomic or summary datasets used to calculate genetic diversity metrics.These files typically include population-level summaries derived from filtered SNP datasets and are consistent with the genomic data used in PCA and admixture analyses elsewhere in the repository.

Metadata

The ``meta/`` directory includes sample and population metadata used to group accessions and interpret diversity results.
Metadata variables describe geographic origin, population classification, and sampling scale, and are consistent with metadata files used throughout the project.

Detailed variable definitions are provided in the main repository documentation.

