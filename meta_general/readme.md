# Data Dictionary

## 🗺️ ``meta_Olotillo.xlsx``

## Relationship among metadata files

The file `meta_Olotillo.xlsx` serves as the master metadata table for the project.
All other metadata files represent subsets or transformations of this file,
created for specific analyses.

- Geographic variables (state, municipality, locality, latitude, longitude, altitude)
  are consistent across all metadata files.
- Population identifiers are shared across PCA, admixture, and diversity analyses.
- Sampling scale (`type` / `scale`) is preserved across datasets.

This spreadsheet provides consolidated metadata for *Olotillo* maize samples. Variable names are kept as in the original file, with English definitions and units where applicable.

- **sample_ID:** unique identifier assigned to each biological sample.

- **population_ID:** identifier of the population to which the sample belongs.

- **accession_ID:** accession or collection code associated with the sample.

- **state:** Mexican state where the sample was collected.

- **municipality:** municipality corresponding to the sampling location.

- **locality:** locality or community name of the sampling site.

- **latitude:** latitude of the sampling location.

- **longitude:** longitude of the sampling location.

- **altitude:** elevation of the sampling location above sea level. Unit: meters (m a.s.l.).

- **Race:** maize race classification of the sample (e.g., *Olotillo*).

- **type:** population type indicating the spatial scale of circulation. Typical values include Local, Regional, National, or Extra.

- **source:** origin of the sample or data provenance (e.g., field collection, germplasm bank, institutional source).

## 📌 Notes

- This file acts as the ***central metadata reference** for the entire repository.

- It is used to annotate results in **Figure 3 (PCA)**,** Figure 4 (Admixture)**, and **supplementary diversity tables**.

Variable definitions are consistent with those used in other metadata files in the project.
