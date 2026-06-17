# Metadata and diversity tables

This folder contains metadata tables and genetic diversity output files used in the *Olotilo* genetic diversity project.

The files in this directory include sample-level metadata, genetic diversity summaries, PCA-associated metadata, and window-based nucleotide diversity estimates generated from genomic SNP data.

## Folder contents

```text
meta/
├── README.md
├── data_diversity_ago2025.csv
├── data_*Olotilo*_mayo_2025.csv
├── mixII_all_samples_10kb_regional.windowed.pi
├── mixII_all_samples_10kb_tuxpeño.windowed.pi
└── pca8_oct27_25_meta_mixplate.csv
```

## File descriptions

| File                                          | Description                                                                                                                   |
| --------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| `data_diversity_ago2025.csv`                  | Main metadata and genetic diversity table used for downstream analyses of individual-level diversity in the *Olotilo* dataset. |
| `data_*Olotilo*_mayo_2025.csv`                 | Sample metadata table for the *Olotilo* dataset.                                                                               |
| `mixII_all_samples_10kb_regional.windowed.pi` | Window-based nucleotide diversity estimates calculated for the regional sample set.                                           |
| `mixII_all_samples_10kb_tuxpeño.windowed.pi`  | Window-based nucleotide diversity estimates calculated for the Tuxpeño-related sample set.                                    |
| `pca8_oct27_25_meta_mixplate.csv`             | Metadata table associated with PCA results for the `mixplate` dataset.                                                        |

## `data_diversity_ago2025.csv`

The file `data_diversity_ago2025.csv` contains individual-level metadata and genetic diversity estimates for the *Olotilo* genetic diversity project.

This table combines information from sample metadata with homozygosity, heterozygosity, and inbreeding estimates derived from SNP genotype data. It can be used for downstream statistical analyses, summary tables, and figure generation.

## Variables in `data_diversity_ago2025.csv`

| Variable       | Description                                                                                                                 |
| -------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `sample_name`  | Unique sample or individual identifier.                                                                                     |
| `O.HOM.`       | Observed number of homozygous sites for each individual.                                                                    |
| `E.HOM.`       | Expected number of homozygous sites for each individual.                                                                    |
| `N_SITES`      | Number of sites included in the individual-level diversity calculation.                                                     |
| `F`            | Individual inbreeding coefficient estimated from observed and expected homozygosity.                                        |
| `state`        | Mexican state associated with the sample.                                                                                   |
| `accession_ID` | Accession identifier assigned to the sample or landrace accession.                                                          |
| `scale`        | Sampling or classification scale associated with the accession.                                                             |
| `race`         | Maize race assigned to the sample or accession.                                                                             |
| `O.HET.`       | Observed number of heterozygous sites. This value corresponds to the difference between `N_SITES` and `O.HOM.`.             |
| `E.HET.`       | Expected number of heterozygous sites. This value corresponds to the difference between `N_SITES` and `E.HOM.`.             |
| `HETob`        | Observed heterozygosity, calculated as the proportion of observed heterozygous sites relative to the total number of sites. |
| `HETex`        | Expected heterozygosity, calculated as the proportion of expected heterozygous sites relative to the total number of sites. |
| `HOMex`        | Expected homozygosity, calculated as the proportion of expected homozygous sites relative to the total number of sites.     |

## Relationship among diversity variables

The table includes both raw counts and proportional estimates of homozygosity and heterozygosity.

The following relationships are used:

```text
O.HET. = N_SITES - O.HOM.
```

```text
E.HET. = N_SITES - E.HOM.
```

```text
HETob = O.HET. / N_SITES
```

```text
HETex = E.HET. / N_SITES
```

```text
HOMex = E.HOM. / N_SITES
```

The `F` column represents the individual inbreeding coefficient estimated from homozygosity patterns.

## Metadata files

The `.csv` files contain sample-level and analysis-level metadata used to organize individuals, accessions, maize races, geographic information, and genetic diversity estimates.

These files can be used for:

* summarizing individual-level genetic diversity;
* comparing diversity metrics among maize races;
* comparing diversity metrics among states or sampling groups;
* linking sample metadata with heterozygosity and inbreeding estimates;
* preparing supplementary tables;
* generating figures and statistical analyses.

## Nucleotide diversity files

The files with the `.windowed.pi` extension contain nucleotide diversity estimates calculated in genomic windows.

These files were generated using `VCFtools` with the `--window-pi` option. This option estimates nucleotide diversity, commonly represented as π, across windows of a specified size. The resulting output file has the suffix `.windowed.pi`.

In this project, nucleotide diversity was estimated using 10 kb genomic windows.

## Expected columns in `.windowed.pi` files

The `.windowed.pi` files generated by `VCFtools` typically contain the following columns:

| Column       | Description                                   |
| ------------ | --------------------------------------------- |
| `CHROM`      | Chromosome or scaffold identifier.            |
| `BIN_START`  | Start position of the genomic window.         |
| `BIN_END`    | End position of the genomic window.           |
| `N_VARIANTS` | Number of variants included in the window.    |
| `PI`         | Nucleotide diversity estimate for the window. |

## Suggested use

These files can be used to:

* describe the sample composition of the *Olotilo* dataset;
* link individual metadata with genetic diversity estimates;
* compare heterozygosity, homozygosity, and inbreeding among groups;
* compare nucleotide diversity across genomic regions;
* generate supplementary tables;
* reproduce figures and statistical analyses related to genetic diversity and population structure.

## Notes

* The `.csv` files should be treated as metadata and analysis tables.
* The `.windowed.pi` files are direct outputs from nucleotide diversity analyses.
* File names include dates or analysis descriptors that indicate the version or purpose of each table.
* When reusing these files, keep the original file names to preserve consistency with scripts and downstream analyses in the repository.
* If the files are reused in another environment, check that column names match the scripts used for downstream analyses.

## Citation

If you use these metadata tables or nucleotide diversity files, please cite the associated project, manuscript, GitHub repository, and Dryad dataset when available.

