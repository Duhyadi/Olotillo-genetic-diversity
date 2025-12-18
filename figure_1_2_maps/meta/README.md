# **Data Dictionary**

## **olotillo_PGMN_siagro.csv**

This dataset includes taxonomic, geographic, and collection metadata for *Zea mays* race *Olotillo* accessions, belonging to [Proyecto Global de Maíces Nativos](https://www.biodiversidad.gob.mx/diversidad/proyectoMaices).  Variables include taxon identifiers (``taxon_id``, ``id``), taxonomic classification (``taxon``, ``genus``, ``species``, ``subspecies``, ``race``), project and collection metadata (``project``, ``origin``, ``collection_date_observation``, ``observer_collector``, ``determiner``, ``source``), and geographic coordinates (``state``, ``municipality``, ``locality``, ``latitude``, ``longitude``, ``altitude``). Elevation is reported in meters, and coordinates in decimal degrees. Below is the complete description of all variables included in the file **olotillo_PGMN_siagro.csv.** 

- **taxon_id:** unique identifier assigned to the taxon record in the database.

- **taxon:** full taxonomic name of the sample, including genus, species, subspecies, and race.

- **genus:** genus of the specimen (*Zea*).

- **species:** species of the specimen (*mays*).

- **subspecies:** ubspecies designation (*mays*).

- **race:** maize race to which the specimen belongs (Example: *Olotillo*). 

- **source:** source of the record or material (e.g., herbarium, project, collection).
May contain “NaN” when not provided.

- **project:** project code or identifier under which the sample was collected or processed.

- **origin:** origin of the sample, typically whether it was collected, observed, or another classification.

- **collection_date_observation:** date of collection or observation. Format: YYYY-MM-DD/XXXX (second value may represent missing or updated date).

- **observer_collector:** name(s) of the collector or observer responsible for obtaining the specimen.

- **determiner:** name of the taxonomist or expert who identified/determined the specimen.

- **id:** unique alphanumeric identifier assigned to the record (e.g., internal database UUID).

- **state:** mexican state where the specimen was collected.

- **municipality:** municipality corresponding to the collection location.

- **locality:** locality name within the municipality where the sample was obtained.

- **latitude:** latitude of the sampling location. Format: decimal degrees (°).

- **longitude:** longitude of the sampling location. Format: decimal degrees (°).

- **altitude:** elevation at the sampling location. Unit: meters above sea level (m a.s.l.).

## **olotillo_points_meta_clean.csv**

This dataset contains geographic, taxonomic, and field-collection metadata for *Zea mays* ssp. *mays*, for the race *Olotillo* populations sampled in Chiapas, Mexico. Variables include population identifiers (``population_ID``), collector information (``sampled_by``, ``source``), accession bank data (``accession_bank``), and ``collection year``. Geographic attributes include ``state``, ``municipality``,`` locality``, ``latitude``, ``longitude``, and ``altitude`` (meters above sea level). Additional descriptors include species identity, kernel ``colour``, maize race classification (``race``), and population type (``type``).

- **population_ID:** unique alphanumeric identifier for each sampled population.

- **sampled_by:** name of the person who collected the sample in the field.

- **source:** origin of the material.

- **accession_bank:** accession number or identifier in a germplasm bank, when available.
It may contain missing values when the material does not come from a bank.

- **collection_year:** year in which the sample was collected. Format: YYYY.

- **state:** mexican state where the population was sampled.

- **municipality:** the municipality where the sampling location is located.

- **locality:** locality or community name of the sampling site.

- **latitude:** latitude of the sampling location.Unit: decimal degrees (°).

- **longitude:** longitude of the sampling location. Unit: decimal degrees (°).

- **altitude:** elevation of the sampling site above sea level. Unit: meters (m a.s.l.).

- **species:** taxonomic species name of the material. Example: Zea mays ssp. mays.

- **colour:** kernel color category of the maize sample (e.g., white, various).

- **race:** Maize race classification based on morphological and ethnobotanical characteristics (e.g., *Olotillo*, *Mix*).

- **type:** classification describing the population's origin type. Typical values: "local" (restricted to a single locality, Ocozocuatla) and "regional" (municipalities surrounding Ocozocuatla).

## **olotillo_weather.csv**

This dataset contains environmental, climatic, and phenotypic descriptors associated with populations of the *Olotillo* maize race in Mexico. Variables include geographic location (``state``, ``municipality``, ``locality``, ``altitude``), mean annual climatic conditions (``precipitation`` and ``temperature``), kernel colour categories, and quantitative ear traits (``number of kernel`` rows``, and ``average ear length``). Environmental variables are also summarized into categorical classes of altitude, temperature, and precipitation. Variable names are shown in Spanish (original), with English definitions.

- **raza:** maize race associated with the observation. In this dataset, all records correspond to maíz raza *Olotillo*.

- **estado:** mexican state where the population or observation is located.

- **municipio:** municipality corresponding to the geographic location of the observation.

- **localidad:** locality or community name associated with the record.

- **altitud:** elevation of the locality above sea level. Unit: meters (m a.s.l.).

- **precipitación:** mean annual precipitation at the locality. Unit: millimeters per year (mm/year).

- **temperatura:** mean annual temperature of the locality.Unit: degrees Celsius (°C).

- **color_grano:** kernel color categories reported for the population. Values may include one or multiple color descriptors (e.g., white, blue, yellow) or may be unavailable.

- **hileras_mazorca:** average number of kernel rows per ear observed in the population.

- **longitud_promedio:** average ear length measured for the population. Unit: centimeters (cm).

- **cat_altitud:** categorical classification of altitude based on elevation ranges
(e.g., bajas, medias, altas).

- **cat_temperatura:** categorical classification of temperature regime (e.g., semi-caliente, templado, frío).

- **cat_precipitacion:** categorical classification of precipitation regime (e.g., muy abundantes, abundantes, moderadas).

## **pca_meta_mixplate.csv**

This dataset contains laboratory, geographic, and taxonomic metadata for maize samples included in the PCA and genotyping plate design. Variables describe plate and well positions, sample and accession identifiers, DNA concentration and yield measurements, and geographic origin (``country``, ``state``, ``municipality``, ``locality``, ``latitude``, ``longitude``, and ``altitude``). Additional descriptors include maize race classification and sampling scale information. Below is the complete description of all variables included in this CSV.

- **plate_name**: name or identifier of the genotyping or PCR plate in which the sample was processed.

- **well**: Well position of the sample within the plate (e.g., A1, B1, C1).

- **sample_name**: unique sample identifier used during laboratory processing.

- **accession_ID**: accession identifier corresponding to the biological sample.

- **concentration**: measured DNA concentration of the sample. Unit: nanograms per microliter (ng/µL).

- **volume**: volume of DNA solution used for downstream processing. Unit: microliters (µL).

- **DNA_yield**: total DNA yield obtained for the sample. Unit: nanograms (ng).

- **accession_label:** numeric or categorical label assigned to the accession for internal tracking or analysis.

- **country:** country of origin of the sample.

- **state:**: state or administrative region where the sample was collected.

- **municipality:** municipality corresponding to the sampling location.

- **locality:** locality or community name associated with the sample.

- **latitude:** latitude of the sampling location. Unit: decimal degrees (°).

- **longitude:** longitude of the sampling location.Unit: decimal degrees (°).

- **altitude:** elevation of the sampling location above sea level. Unit: meters (m a.s.l.).

- **source:** source of the biological material (e.g., field collection, germplasm bank). May contain missing values.

- **scale:** spatial or sampling scale associated with the accession (e.g., local, regional).

- **Race:** maize race classification of the accession (e.g., Olotillo).

## **plate1_fullmeta.txt**

This dataset contains the same laboratory, geographic, and taxonomic metadata described for pca_meta_mixplate.csv, corresponding to maize samples included in the genotyping plate olotillo_plate1. The file differs only in format (TXT instead of CSV) and contains identical variables describing plate and well positions, sample identifiers, DNA concentration and yield measurements, geographic origin, and sampling scale.






