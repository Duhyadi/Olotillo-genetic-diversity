# **Data Dictionary**

## **plate1_fullmeta.txt**

This dataset contains laboratory, geographic, and sampling metadata for maize samples included in the genotyping plate olotillo_plate1. Variables describe plate and well positions, sample and accession identifiers, DNA concentration, volume, and yield measurements, and geographic origin (country, state, municipality, locality, latitude, longitude, and altitude). Additional variables indicate the data source and the spatial sampling scale, and the file includes blank control wells. Below is the complete description of all variables included in this TXT file. Variable names are kept as in the original file, with English definitions and units where applicable.

- **plate_name:** identifier of the laboratory plate used for DNA extraction, quantification, and genotyping.

- **well:** well position of the sample within the plate (e.g., A1–H12).

- **sample_name:** unique identifier assigned to each DNA sample during laboratory processing.
Includes biological samples and blank controls.

- **accession_ID:** accession or population identifier corresponding to the biological sample.

- **concentration:** DNA concentration measured for the sample. Unit: nanograms per microliter (ng/µL).

- **volume:** volume of DNA solution used for downstream laboratory procedures. Unit: microliters (µL).

- **DNA_yield:** total DNA yield obtained from the sample. Unit: nanograms (ng).

- **accession_label:** numeric label used for internal tracking or analytical grouping of accessions.

- **country:** country of origin of the sampled material.

- **state:** state or administrative region where the sample was collected.

- **municipality:** municipality corresponding to the sampling location.

- **locality:** locality or community name associated with the sample. May be empty for some accessions.

- **latitude:** latitude of the sampling location. Unit: decimal degrees (°).

- **longitude:** longitude of the sampling location. Unit: decimal degrees (°).

- **altitude:** elevation of the sampling location above sea level. Unit: meters (m a.s.l.).

- **source:** source or provenance of the sample or data (e.g., institutional code or collector name).
May contain missing values.

- **scale:** spatial or sampling scale associated with each accession. Typical values include Local, Regional, National, and Extra.

## **plate2_fullmeta.txt**

This dataset contains the same laboratory, geographic, and sampling metadata described for plate1_fullmeta.txt, but corresponds to samples processed in genotyping plate 2. The file includes identical variables and structure, differing only in the plate assignment. For this reason, variable definitions are not repeated here; please refer to the Data Dictionary provided for plate1_fullmeta.txt for detailed descriptions, units, and interpretation keys.




