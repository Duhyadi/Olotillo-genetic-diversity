# Data Dictionary

## 🗺️ ``meta_Olotillo.xlsx``

## Relationship and harmonization among metadata files

The file `meta_Olotillo.xlsx` serves as the master metadata table for the project Olotillo genetic diversity. It integrates sample identifiers, geographic information, population classification, and sampling scale, and provides the reference framework used across all genomic and statistical analyses.

All other metadata files included in the repository represent **subsets**, **reformatted versions**, or **analysis-specific derivatives** of this master table, created to support particular workflows (PCA, admixture, diversity analyses, and spatial analyses).

Geographic variables (state, municipality, locality, latitude, longitude, and altitude) and population identifiers are consistent across metadata files, enabling direct integration of genomic, environmental, and spatial information.

- **sample_ID:** unique identifier assigned to each biological sample.

- **population_ID:** identifier of the population to which the sample belongs.

- **accession_ID:** accession or collection code associated with the sample.

- **state:** Mexican state where the sample was collected.

- **municipality:** municipality corresponding to the sampling location.

- **locality:** locality or community name of the sampling site.

- **latitude:** latitude of the sampling location.

- **longitude:** longitude of the sampling location.

- **altitude:** elevation of the sampling location above sea level. Unit: meters (m.a.s.l.).

- **Race:** maize race classification of the sample (e.g., *Olotillo*).

- **type:** population type indicating the spatial scale of circulation. Typical values include Local, Regional, National, or Extra.

- **source:** origin of the sample or data provenance (e.g., field collection, germplasm bank, institutional source).

## Variable harmonization across metadata files

The table below summarizes the correspondence among variables shared across the main metadata files in the repository:

| Conceptual variable      | meta_Olotillo.xlsx | olotillo_points_meta_clean.csv | plate*_fullmeta.txt | pca_meta_mixplate.csv |
|--------------------------|--------------------|--------------------------------|---------------------|-----------------------|
| Sample identifier        | sample_ID          | population_ID                  | sample_name         | sample_name           |
| Population identifier   | population_ID      | population_ID                  | accession_ID        | accession_ID          |
| State                    | state              | state                          | state               | state                 |
| Municipality             | municipality       | municipality                   | municipality        | municipality          |
| Locality                 | locality           | locality                       | locality            | locality              |
| Latitude                 | latitude            | latitude                       | latitude            | latitude              |
| Longitude                | longitude           | longitude                      | longitude           | longitude             |
| Altitude                 | altitude            | altitude                       | altitude            | altitude              |
| Sampling scale           | type               | type                           | scale               | scale                 |
| Maize race               | Race               | Race                           | –                   | Race                  |


All metadata files can be linked using population- or accession-level identifiers, ensuring consistency across genomic, spatial, and environmental analyses.


## 📌 Notes

- This file acts as the **central metadata reference** for the entire repository.

- It is used to annotate results in **Figure 3 (PCA)**,**Figure 4 (Admixture)**, and **Supplementary Diversity Tables**.

Variable definitions are consistent with those used in other metadata files in the project.
