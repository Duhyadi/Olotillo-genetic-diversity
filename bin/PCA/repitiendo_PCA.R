
# SÁBADO 28 DE JUNIO EN CASA DE SHARON COMPASS.BRENFORD, LondON. 

# CHECK AND CHANGE WORK ROUTE 
getwd()
setwd("/home/duhyadi/Documents/paper1_final_tipodryad")

# LOAD LIBRARIES
library(tidyverse)
library(gdsfmt) # useful tool for reading, writing and manipulating genetic data stored in GDS format
library(SNPRelate) # a library in R that is used for the analysis and visualization of genetic data
library(dplyr)
library(ggplot2)


# ───────────────────────────────────────────────────────────────────────────
# NOTA RECORDATORIA - ARCHIVO VCF ORIGINAL Y VERSION LIMPIA
#
# ⚠️ El archivo original bueno es: mixplates_filtered_2x_descomprimir.vcf
# 📁 Ubicado en: /home/duhyadi/Documents/paper1_mayo2025/cluster_conabio_2024/out60g7
#
# Ese archivo es el VCF sin comprimir que está íntegro y funcional.
# 
# ✅ El archivo de trabajo actual es:
#    data/mixplates_cleaned.vcf.gz
# Este fue generado al comprimir correctamente el archivo anterior usando `bgzip`
# y es el que se usó exitosamente con `snpgdsVCF2GDS()`.
#
# 🔁 Si por cualquier razón se necesita regenerar el archivo limpio,
# simplemente volver a copiar el original desde "out60g7" y comprimir con:
#    bgzip mixplates_filtered_2x_descomprimir.vcf
#    mv mixplates_filtered_2x_descomprimir.vcf.gz mixplates_cleaned.vcf.gz
#
# Esto asegura que el archivo esté bien formado y sin corrupción.
# ────────────────────────────────────────────────────────────────────────────────

# LOAD AND CONVERT VCF TO GDS FORMAT 
snpgdsVCF2GDS("data/mixplates_cleaned.vcf.gz", # the SNPRelate function snpgdsVCF2GDS is used to convert VCF (Variant Call Format) files into the GDS (Genomic Data Structure) format
              "data/mixplates_cleaned.gds",
              method = "biallelic.only")

## Summary of GDS
snpgdsSummary("data/mixplates_cleaned.gds")

# open a GDS file with function snpgds and assign it to an object
genofileMix <- snpgdsOpen("data/mixplates_cleaned.gds")

## What are the sample names? Explore the file a bit more
# check sample.ids
read.gdsn(index.gdsn(genofileMix, "sample.id"))

# Save sample names to an object:
# obtain the name of the samples from the gdsn
sample.id <- read.gdsn(index.gdsn(genofileMix, "sample.id"))
sample.id

### Get metadata #1:
# 1.1) join meta of the plate 1 and 2 
# 1.2) add column race 
# 1.3) delete blank for plate 1 and 2

# 1.1) join fullmeta for plate 1 and plate2 
placa1 <- read.csv("meta/plate1_fullmeta.txt", sep='\t')
placa2 <- read.csv("meta/plate2_fullmeta.txt", sep='\t')
mixplate <- rbind(placa1, placa2)

## note: the previous txt files (plate1_fulllmeta.txt and plate2_fullmeta.txt),
##lost the race column, we believe they should have it, when creating them. To solve this, 
## we would have to review the script used for it (in bash), created by Alicia. 
## The file for plate 1 was made by Alicia and the one for plate 2 by Duhyadi.

# 1.2) add the race column and name all rows as Olotillo
mixplate <- mixplate %>%
  add_column(Race = "Olotillo")
# 1.3) delete blanks for plate 1 and 2
mixplate <- mixplate %>%
  filter(sample_name != "BLANK")


## Get metadata #2: the accession name is changed to the extra samples, these are those with the letter E (Extra). These samples should not include the letter E, as the label of the accessions was constructed according to the number of field collections. Field collections being #47. The additional accessions were named as extras when they were sent for sequencing. 
## **Note**: this change allows the unique function to be used to account for different accessions. In addition, this change allows the corresponding race name to be added: for not everything is Olotillo. There is Mix, Dzit-bacal and Tuxpeño.  

# sample_name           change accession_ID
# CAM_E13_1  + CAM_E14_1  = CAM_E54  #origin, Hugo Perales. R.
# CAM_E15_1  + CAM_E16    = CAM_E55  #origin, Hugo Perales. R.
# CAM_E21_1  + CAM_E22_1  = CAM_E58  #origin, Hugo Perales. R.
# CAM_E25_1  + CAM_E26_1  = CAM_E60  #origin, Hugo Perales. R.
# CHIS_E9_1  + CHIS_E10_1 = CHIS_E52 #origin, Hugo Perales. R. 
# CHIS_E23_1 + CHIS_E24_1 = CHIS_E59 #origin, Hugo Perales. R.
# ROO_E11_1  + ROO_E12_1  = ROO_E53  #origin, Hugo Perales. R.
# SLP_E3_1   + SLP_E4_1   = SLP_E49  #origin, CIMMYTMA29498.
# SLP_E7_1   + SLP_E8_1   = SLP_E51  #origin, CIMMYTMA29464.
# HGO_E5_1   + HGO_E6_1   = HGO_E50  #origin, CIMMYTMA29343.
# VER_E1_1   + VER_E2_1   = VER_E48  #origin, CIMMYTMA29569.
# VER_E17_1  + VER_E18_1  = VER_E56  #origin, CIMMYTMA29586.
# VER_E19_1  + VER_E20_1  = VER_E57  #origin, CIMMYTMA29535.

#CAMPECHE
# CAM_E13_1 + CAM_E14_1 = CAM_E54
mixplate$accession_ID[mixplate$sample_name == 'CAM_E13_1'] <- 'CAM_E54'
mixplate$accession_ID[mixplate$sample_name == 'CAM_E14_1'] <- 'CAM_E54'
# CAM_E15_1 + CAM_E16   = CAM_E55
mixplate$accession_ID[mixplate$sample_name == 'CAM_E15_1'] <- 'CAM_E55'
mixplate$accession_ID[mixplate$sample_name == 'CAM_E16'  ]   <-'CAM_E55'
# CAM_E21_1 + CAM_E22_1 = CAM_E58
mixplate$accession_ID[mixplate$sample_name == 'CAM_E21_1'] <- 'CAM_E58'
mixplate$accession_ID[mixplate$sample_name == 'CAM_E22_1'] <- 'CAM_E58'
# CAM_E25_1 + CAM_E26_1 = CAM_E60
mixplate$accession_ID[mixplate$sample_name == 'CAM_E25_1'] <- 'CAM_E60'
mixplate$accession_ID[mixplate$sample_name == 'CAM_E26_1'] <- 'CAM_E60'

# CHIAPAS
# CHIS_E9_1  + CHIS_E10_1 = CHIS_E52
mixplate$accession_ID[mixplate$sample_name == 'CHIS_E9_1' ]  <- 'CHIS_E52'
mixplate$accession_ID[mixplate$sample_name == 'CHIS_E10_1']  <- 'CHIS_E52'
# CHIS_E23_1 + CHIS_E24_1 = CHIS_E59
mixplate$accession_ID[mixplate$sample_name == 'CHIS_E23_1' ]  <- 'CHIS_E59'
mixplate$accession_ID[mixplate$sample_name == 'CHIS_E24_1' ]  <- 'CHIS_E59'

#QINTANA ROO
# ROO_E11_1 + ROO_E12_1 = ROO_E53
mixplate$accession_ID[mixplate$sample_name == 'ROO_E11_1'] <- 'ROO_E53'
mixplate$accession_ID[mixplate$sample_name == 'ROO_E12_1'] <- 'ROO_E53'

#SAN LUIS POTOSÍ
# SLP_E3_1   + SLP_E4_1   = SLP_E49  #origin, CIMMYTMA29498.
mixplate$accession_ID[mixplate$sample_name == 'SLP_E3_1'] <- 'SLP_E49'
mixplate$accession_ID[mixplate$sample_name == 'SLP_E4_1'] <- 'SLP_E49'
# SLP_E7_1   + SLP_E8_1   = SLP_E51  #origin, CIMMYTMA29464.
mixplate$accession_ID[mixplate$sample_name == 'SLP_E7_1'] <- 'SLP_E51'
mixplate$accession_ID[mixplate$sample_name == 'SLP_E8_1'] <- 'SLP_E51'

#HIDALGO
# HGO_E5 + HGO_E6 = HGO_E50
mixplate$accession_ID[mixplate$sample_name == 'HGO_E5_1'] <- 'HGO_E50'
mixplate$accession_ID[mixplate$sample_name == 'HGO_E6_1'] <- 'HGO_E50'

#VERACRUZ
# VER_E1_1 + VER_E2_1 = VER_E48
mixplate$accession_ID[mixplate$sample_name == 'VER_E1_1'] <- 'VER_E48'
mixplate$accession_ID[mixplate$sample_name == 'VER_E2_1'] <- 'VER_E48'
# VER_E17_1 + VER_E18_1 = VER_E56
mixplate$accession_ID[mixplate$sample_name == 'VER_E17_1'] <- 'VER_E56'
mixplate$accession_ID[mixplate$sample_name == 'VER_E18_1'] <- 'VER_E56'
# VER_E19_1 + VER_E20_1 = VER_E57
mixplate$accession_ID[mixplate$sample_name == 'VER_E19_1'] <- 'VER_E57'
mixplate$accession_ID[mixplate$sample_name == 'VER_E20_1'] <- 'VER_E57'


## Get metadata 3:
# change race in some samples
mixplate$Race[mixplate$accession_ID == 'CHIS_L38'] <- 'Mix'
mixplate$Race[mixplate$accession_ID == "ROO_E53" ] <- 'Dzit-bacal'
mixplate$Race[mixplate$accession_ID == "CAM_E54" ] <- 'Dzit-bacal'
mixplate$Race[mixplate$accession_ID == "CAM_E55" ] <- 'Dzit-bacal'
mixplate$Race[mixplate$accession_ID == "CAM_E58" ] <- 'Tuxpeño'
mixplate$Race[mixplate$accession_ID == "CAM_E60" ] <- 'Tuxpeño'

## Get metadata 4: add the state of Campeche for all samples
mixplate$state[mixplate$sample_name == "CAM_E25_1"] <- 'Campeche'
mixplate$state[mixplate$sample_name == "CAM_E22_1"] <- 'Campeche'
mixplate$state[mixplate$sample_name == "CAM_E26_1"] <- 'Campeche'
mixplate$state[mixplate$sample_name == "CAM_E21_1"] <- 'Campeche'
mixplate$state[mixplate$sample_name == "CAM_E25_1"] <- 'Campeche'
mixplate$state[mixplate$sample_name == "CAM_E26_1"] <- 'Campeche'

## Get metadata 5: add the state Chiapas 
# fill in the missing spaces in the 'state' column
chis_rows <- grep("CHIS", mixplate$accession_ID)
mixplate$state[chis_rows] <- "Chiapas"

## Get metadata 6: add the state Veracruz 
# fill in the missing spaces in the 'state' column
vera_rows <- grep("VER", mixplate$accession_ID)
mixplate$state[vera_rows] <- "Veracruz"

## Get metadata 7: add Mexico for all rows in country variable
mixplate$country <- "México"

## Convert the data frame to csv
write.csv(mixplate, "pca8ene24_meta_mixplate", row.names = FALSE)

## Sample names follow are the same in our metada and genofile, but they are in different order:
#in our genofile
sample.id
#in the metadata
mixplate$sample_name

#Usaremos estos metadatos más adelante para colorear nuestro PCA, así que saber que los nombres de las muestras son los mismos nos alegra. ¡Mira todas esas variables tan útiles!

## Run PCA
# PCA
pcaMix<- snpgdsPCA(genofileMix, num.thread=2)

## Estimate the % of variation explained by the first commponents:
pc.percent <- pcaMix$varprop*100
head(round(pc.percent, 2))

x<-round(pc.percent, 2)
sum(x[1:4])
sum(x[1:10])
sum(x[1:30])

# Now we are taking the results of the first 2 componets of the PCA into a data frame, and we can add to that dataframe other useful columns from our metadata.

# get PCA results of first 2 componets into a df
tab <- data.frame(sample.id = pcaMix$sample.id,
                  PC1 = pcaMix$eigenvect[,3],    # the first eigenvector
                  PC2 = pcaMix$eigenvect[,4],    # the second eigenvector
                  stringsAsFactors = FALSE)
head(tab)

## Add our metadata and pca results in a same happy object
# add metadata to pca
pcametaMix <- tab %>%
  left_join(mixplate, by=c("sample.id" = "sample_name"))

# see how it looks
head(pcametaMix)

## Plot raw PCA
p <- ggplot(data = pcametaMix, aes(x=PC1, y=PC2)) + geom_point(size = 1) +
  ylab(paste0("eigenvector 2 explaining ", round(pc.percent, 2)[1], "%")) +
  xlab(paste0("eigenvector 1 explaining ", round(pc.percent, 2)[2], "%"))
p

## Without the samples CHIS_L43, sequencing error in this sample  
p.PCA.A <-pcametaMix %>% 
  filter(accession_ID != "CHIS_L43") %>%
  filter(state!= "")%>%
  ggplot(aes(x=PC1, y=PC2)) + geom_point(size = 2, aes(colour=state, shape=Race)) +
  # 9 color-blind friendly colors
  scale_colour_manual(values=c("grey60", 
                               "#75a842",
                               "#36dee6",
                               "#52bd85",
                               "#b94656",
                               "#6780d8",
                               "#c69c39",
                               "#b6b638",
                               "#89863c",
                               "#FFEA00")) + 
  # better points shapes
  scale_shape_manual(values = c(15,17,1,6)) +
  labs(colour = "Mexican State") +
  theme(text = element_text(size = 15)) +
  ylab(paste0("eigenvector 2 explaining ", round(pc.percent, 2)[1], "%")) +
  xlab(paste0("eigenvector 1 explaining ", round(pc.percent, 2)[2], "%")) +
  theme_bw()
p.PCA.A







# replace all instances of "_" and "Extra" with "Local", Regional and National in the column 'scale'.
pcametaMix$scale <- gsub("_L", "Local", pcametaMix$scale)
pcametaMix$scale <- gsub("_R", "Regional", pcametaMix$scale)
pcametaMix$scale <- gsub("_N", "National", pcametaMix$scale)
pcametaMix$scale <- gsub("Extra", "National", pcametaMix$scale)
pcametaMix$scale <- gsub("_E", "National", pcametaMix$scale)

# filtrar pcametaMix
df_filtrada <- pcametaMix %>%
  filter(!scale %in% c("_F", "_X"))


#PCA by Race and scale 
p.PCA.B = df_filtrada %>% 
  filter(accession_ID != "CHIS_L43") %>%
  filter(scale!= "")%>%
  ggplot(aes(x=PC1, y=PC2)) + geom_point(size = 2, aes(colour=scale, shape=Race)) +
  # 3 color-blind friendly colors
  scale_colour_manual(values=c("#CC33CC", 
                               "#0033FF",
                               "#00FF00")) + 
  # better points shapes
  scale_shape_manual(values = c(15,17,1,6)) +
  labs(colour = "Scale") +
  theme(text = element_text(size = 15)) +
  ylab(paste0("eigenvector 2 explaining ", round(pc.percent, 2)[1], "%")) +
  xlab(paste0("eigenvector 1 explaining ", round(pc.percent, 2)[2], "%")) +
  theme_bw()
p.PCA.B








