# Metadata and diversity tables

This folder contains metadata tables and genetic diversity output files used in the *Olotillo* genetic diversity project.

The files in this directory include sample-level metadata, genetic diversity summaries, PCA-associated metadata, and window-based nucleotide diversity estimates generated from genomic SNP data.

## Folder contents

```text
meta/
├── README.md
├── data_diversity_ago2025.csv
├── data_Olotillo_mayo_2025.csv
├── mixII_all_samples_10kb_regional.windowed.pi
├── mixII_all_samples_10kb_tuxpeño.windowed.pi
└── pca8_oct27_25_meta_mixplate.csv
```

## File descriptions

| File                                          | Description                                                                                                                   |
| --------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| `data_diversity_ago2025.csv`                  | Main metadata and genetic diversity table used for downstream analyses of individual-level diversity in *Olotillo*, *Dzit-bacal*, *Tuxpeño* and *Mix* dataset. |
| `data_Olotillo_mayo_2025.csv`                 | Main metadata and genetic diversity table used for downstream analyses of individual-level diversity only for *Olotillo* dataset.                            |
| `mixII_all_samples_10kb_regional.windowed.pi` | Window-based nucleotide diversity estimates calculated for the regional sample set.                                           |
| `mixII_all_samples_10kb_tuxpeño.windowed.pi`  | Window-based nucleotide diversity estimates calculated for the Tuxpeño-related sample set.                                    |
| `pca8_oct27_25_meta_mixplate.csv`             | Metadata table associated with PCA results for the `mixplate` dataset.                                                        |

## Metadata files

The `.csv` files contain sample-level and analysis-level metadata used to organize individuals, accessions, maize races, geographic information, and genetic diversity estimates.

These files can be used for:

* summarizing individual-level genetic diversity;
* comparing diversity metrics among maize races;
* comparing diversity metrics among states or sampling groups;
* linking sample metadata with heterozygosity and inbreeding estimates;
* preparing supplementary tables;
* generating figures and statistical analyses.

## `data_diversity_ago2025.csv`

The file `data_diversity_ago2025.csv` contains individual-level metadata and genetic diversity estimates for *Olotillo*, *Dzit-bacal*, *Tuxpeño* and *Mix* dataset.

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

## `data_Olotillo_mayo_2025.csv`

The file `data_Olotillo_mayo_2025.csv` contains individual-level metadata and genetic diversity estimates for *Olotillo* dataset.

This table combines information from sample metadata with homozygosity, heterozygosity, and inbreeding estimates derived from SNP genotype data. It can be used for downstream statistical analyses, summary tables, and figure generation. The description of the variables is the same as for `data_diversity_ago2025.csv`, so they did not describe them again.

## `pca8_oct27_25_meta_mixplate.csv`

The file `pca8_oct27_25_meta_mixplate.csv` contains metadata for the samples included in the sequencing plates used in the *Olotillo* genetic diversity project.

This table includes information about the sequencing plate layout, sample identifiers, DNA concentration and volume, estimated DNA yield, accession information, geographic origin, sampling scale, and maize race classification. The file can be used to link sequencing plate information with downstream genetic diversity and population structure analyses.

The dataset contains 190 samples and 17 variables.

### Variables

| Variable          | Description                                                                                                                                                          |
| ----------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `plate_name`      | Name or identifier of the sequencing plate in which the sample was included. In this file, samples are assigned to `olotillo_plate1` or `olotillo_plate2`.           |
| `well`            | Well position of the sample within the sequencing plate, for example `A1`, `B1`, or `C1`.                                                                            |
| `sample_name`     | Unique sample identifier used for the sequenced individual.                                                                                                          |
| `accession_ID`    | Accession identifier associated with the sample. Multiple individual samples may belong to the same accession.                                                       |
| `concentration`   | DNA concentration of the sample prior to sequencing. The unit should be verified from the laboratory protocol, commonly reported as ng/µL.                           |
| `volume`          | DNA volume included or available for the sequencing plate preparation. The unit should be verified from the laboratory protocol, commonly reported as µL.            |
| `DNA_yield`       | Estimated DNA yield for the sample, calculated from DNA concentration and volume. The unit should be verified from the laboratory protocol, commonly reported as ng. |
| `accession_label` | Numeric or short label associated with the accession.                                                                                                                |
| `country`         | Country of origin of the sample or accession.                                                                                                                        |
| `state`           | State of origin of the sample or accession.                                                                                                                          |
| `municipality`    | Municipality of origin of the sample or accession.                                                                                                                   |
| `locality`        | Locality or collection site associated with the sample or accession.                                                                                                 |
| `latitude`        | Latitude coordinate of the collection site.                                                                                                                          |
| `longitude`       | Longitude coordinate of the collection site.                                                                                                                         |
| `altitude`        | Altitude of the collection site. The unit should be verified from the metadata source, commonly reported in meters above sea level.                                  |
| `scale`           | Sampling or classification scale assigned to the accession or sample, such as local, regional, national, or extra categories.                                        |
| `Race`            | Maize race classification assigned to the sample or accession. In this file, the observed categories include `Olotillo`, `Dzit-bacal`, `Tuxpeño`, and `Mix`.         |

### Notes

* This file represents sequencing-plate metadata and should be used to track the relationship between sample identifiers, plate positions, DNA input information, and biological/geographic metadata.
* Some geographic fields may contain missing values, especially coordinates, altitude, municipality, or locality.
* Units for `concentration`, `volume`, `DNA_yield`, and `altitude` should be confirmed using the original laboratory or metadata records before publication.
* The variable `Race` uses an uppercase initial letter in this file. If other files use `race`, check column names carefully when joining tables in R, Python, or other analysis environments.


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

* describe the sample composition of the *Olotillo* dataset;
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

