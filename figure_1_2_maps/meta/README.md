# **Data Dictionary**

## **olotillo_PGMN_siagro.csv**

**Variable Description (Short version)**

This dataset includes taxonomic, geographic, and collection metadata for Zea mays race Olotillo accessions. Variables include taxon identifiers (``taxon_id``, ``id``), taxonomic classification (``taxon``, ``genero``, ``especie``, ``subespecie``, ``raza``), project and collection metadata (``proyecto``, ``procedencia``, ``fecha_colecta_observacion``, ``colector_observador``, ``determinador``, ``fuente``), and geographic coordinates (``estado``, ``municipio``, ``localidad``, ``latitud``, ``longitud``, ``altitud``). Elevation is reported in meters, and coordinates in decimal degrees. Below is the complete description of all variables included in the file **olotillo_PGMN_siagro.csv.** Variable names are shown in Spanish (original), with English definitions.

- **taxon_id:** unique identifier assigned to the taxon record in the database.

- **taxon:** full taxonomic name of the sample, including genus, species, subspecies, and race.

- **genero:** genus of the specimen (*Zea*).

- **especie:** species of the specimen (*mays*).

- **subespecie:** ubspecies designation (*mays*).

- **raza:** maize race to which the specimen belongs (Example: *Olotillo*). 

- **fuente:** source of the record or material (e.g., herbarium, project, collection).
May contain “NaN” when not provided.

**proyecto:** project code or identifier under which the sample was collected or processed.

**procedencia:** origin of the sample, typically whether it was collected, observed, or another classification.

**fecha_colecta_observacion:** date of collection or observation. Format: YYYY-MM-DD/XXXX (second value may represent missing or updated date).

**colector_observador:** name(s) of the collector or observer responsible for obtaining the specimen.

**determinador:** name of the taxonomist or expert who identified/determined the specimen.

**id:** unique alphanumeric identifier assigned to the record (e.g., internal database UUID).

**estado:** mexican state where the specimen was collected.

**municipio:** municipality corresponding to the collection location.

**localidad:** locality name within the municipality where the sample was obtained.

**latitud:** latitude of the sampling location. Format: decimal degrees (°).

**longitud:** longitude of the sampling location. Format: decimal degrees (°).

**altitud:** elevation at the sampling location. Unit: meters above sea level (m a.s.l.).

