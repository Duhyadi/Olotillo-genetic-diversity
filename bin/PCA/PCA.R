##############################

# SÁBADO 28 DE JUNIO EN CASA DE SHARON COMPASS.BRENFORD, LondON. 

----------------

#📁 CHECK AND CHANGE WORKING DIRECTORY 

getwd()
setwd("/home/duhyadi/Documents/paper1_final_tipodryad")
getwd()

----------------

# LOAD LIBRARIES

library(tidyverse)
library(gdsfmt) # useful tool for reading, writing and manipulating genetic data stored in GDS format
library(SNPRelate) # a library in R that is used for the analysis and visualization of genetic data
library(dplyr)
library(ggplot2)

----------------

# LOAD AND CONVERT VCF TO GDS FORMAT 

snpgdsVCF2GDS("data/mixplates_cleaned.vcf.gz", # the SNPRelate function snpgdsVCF2GDS is used to convert VCF (Variant Call Format) files into the GDS (Genomic Data Structure) format
              "data/mixplates_cleaned.gds",
              method = "biallelic.only")
## Summary of GDS
snpgdsSummary("data/mixplates_cleaned.gds")
## Open a GDS file with function snpgds and assign it to an object
genofileMix <- snpgdsOpen("data/mixplates_cleaned.gds")
## What are the sample names? Explore the file a bit more
read.gdsn(index.gdsn(genofileMix, "sample.id")) # check sample.ids
## Save sample names to an object: obtain the name of the samples from the gdsn
sample.id <- read.gdsn(index.gdsn(genofileMix, "sample.id"))
sample.id

----------------

# METADATA
# GET METADATA #1
## 1.1. Join meta of the plate 1 and 2. 
## 1.2. Add column race. 
## 1.3. Delete blank for plate 1 and 2.

## 1.1. Join fullmeta for plate 1 and plate2 
placa1 <- read.csv("meta/plate1_fullmeta.txt", sep='\t')
placa2 <- read.csv("meta/plate2_fullmeta.txt", sep='\t')
mixplate <- rbind(placa1, placa2)

## ** Note**: the previous txt files (plate1_fulllmeta.txt and plate2_fullmeta.txt),
## lost the race column, we believe they should have it, when creating them. 

## 1.2. Add the race column and name all rows as Olotillo.
mixplate <- mixplate %>%
  add_column(Race = "Olotillo")
## 1.3. Delete blanks for plate 1 and 2.
mixplate <- mixplate %>%
  filter(sample_name != "BLANK")

## GET METADATA #2: 
## The accession name is changed to the extra samples, 
## these are those with the letter E (Extra). 
## These samples should not include the letter E, as the label of 
## the accessions was constructed according to the number of field collections. 
## Field collections being #47. The additional accessions were named as extras when 
## they were sent for sequencing. 
## **Note**: this change allows the unique function to be used 
## to account for different accessions. In addition, 
## this change allows the corresponding race name to be added: 
## for not everything is Olotillo. There is Mix, Dzit-bacal and Tuxpeño.  

##        sample_name        change accession_ID       origin
## CAM_E13_1  + CAM_E14_1  = CAM_E54                  Hugo Perales Rivera
## CAM_E15_1  + CAM_E16    = CAM_E55                  Hugo Perales Rivera
## CAM_E21_1  + CAM_E22_1  = CAM_E58                  Hugo Perales Rivera
## CAM_E25_1  + CAM_E26_1  = CAM_E60                  Hugo Perales Rivera
## CHIS_E9_1  + CHIS_E10_1 = CHIS_E52                 Hugo Perales Rivera 
## CHIS_E23_1 + CHIS_E24_1 = CHIS_E59                 Hugo Perales Rivera
## ROO_E11_1  + ROO_E12_1  = ROO_E53                  Hugo Perales Rivera
## SLP_E3_1   + SLP_E4_1   = SLP_E49                  CIMMYTMA29498
## SLP_E7_1   + SLP_E8_1   = SLP_E51                  CIMMYTMA29464
## HGO_E5_1   + HGO_E6_1   = HGO_E50                  CIMMYTMA29343
## VER_E1_1   + VER_E2_1   = VER_E48                  CIMMYTMA29569
## VER_E17_1  + VER_E18_1  = VER_E56                  CIMMYTMA29586
## VER_E19_1  + VER_E20_1  = VER_E57                  CIMMYTMA29535

## CAMPECHE
## CAM_E13_1 + CAM_E14_1 = CAM_E54
mixplate$accession_ID[mixplate$sample_name == 'CAM_E13_1'] <- 'CAM_E54'
mixplate$accession_ID[mixplate$sample_name == 'CAM_E14_1'] <- 'CAM_E54'
## CAM_E15_1 + CAM_E16   = CAM_E55
mixplate$accession_ID[mixplate$sample_name == 'CAM_E15_1'] <- 'CAM_E55'
mixplate$accession_ID[mixplate$sample_name == 'CAM_E16'  ]   <-'CAM_E55'
## CAM_E21_1 + CAM_E22_1 = CAM_E58
mixplate$accession_ID[mixplate$sample_name == 'CAM_E21_1'] <- 'CAM_E58'
mixplate$accession_ID[mixplate$sample_name == 'CAM_E22_1'] <- 'CAM_E58'
## CAM_E25_1 + CAM_E26_1 = CAM_E60
mixplate$accession_ID[mixplate$sample_name == 'CAM_E25_1'] <- 'CAM_E60'
mixplate$accession_ID[mixplate$sample_name == 'CAM_E26_1'] <- 'CAM_E60'

## CHIAPAS
## CHIS_E9_1  + CHIS_E10_1 = CHIS_E52
mixplate$accession_ID[mixplate$sample_name == 'CHIS_E9_1' ]  <- 'CHIS_E52'
mixplate$accession_ID[mixplate$sample_name == 'CHIS_E10_1']  <- 'CHIS_E52'
## CHIS_E23_1 + CHIS_E24_1 = CHIS_E59
mixplate$accession_ID[mixplate$sample_name == 'CHIS_E23_1' ]  <- 'CHIS_E59'
mixplate$accession_ID[mixplate$sample_name == 'CHIS_E24_1' ]  <- 'CHIS_E59'

## QINTANA ROO
## ROO_E11_1 + ROO_E12_1 = ROO_E53
mixplate$accession_ID[mixplate$sample_name == 'ROO_E11_1'] <- 'ROO_E53'
mixplate$accession_ID[mixplate$sample_name == 'ROO_E12_1'] <- 'ROO_E53'

## SAN LUIS POTOSÍ
## SLP_E3_1   + SLP_E4_1   = SLP_E49  #origin, CIMMYTMA29498.
mixplate$accession_ID[mixplate$sample_name == 'SLP_E3_1'] <- 'SLP_E49'
mixplate$accession_ID[mixplate$sample_name == 'SLP_E4_1'] <- 'SLP_E49'
## SLP_E7_1   + SLP_E8_1   = SLP_E51  #origin, CIMMYTMA29464.
mixplate$accession_ID[mixplate$sample_name == 'SLP_E7_1'] <- 'SLP_E51'
mixplate$accession_ID[mixplate$sample_name == 'SLP_E8_1'] <- 'SLP_E51'

## HIDALGO
## HGO_E5 + HGO_E6 = HGO_E50
mixplate$accession_ID[mixplate$sample_name == 'HGO_E5_1'] <- 'HGO_E50'
mixplate$accession_ID[mixplate$sample_name == 'HGO_E6_1'] <- 'HGO_E50'

## VERACRUZ
## VER_E1_1 + VER_E2_1 = VER_E48
mixplate$accession_ID[mixplate$sample_name == 'VER_E1_1'] <- 'VER_E48'
mixplate$accession_ID[mixplate$sample_name == 'VER_E2_1'] <- 'VER_E48'
## VER_E17_1 + VER_E18_1 = VER_E56
mixplate$accession_ID[mixplate$sample_name == 'VER_E17_1'] <- 'VER_E56'
mixplate$accession_ID[mixplate$sample_name == 'VER_E18_1'] <- 'VER_E56'
## VER_E19_1 + VER_E20_1 = VER_E57
mixplate$accession_ID[mixplate$sample_name == 'VER_E19_1'] <- 'VER_E57'
mixplate$accession_ID[mixplate$sample_name == 'VER_E20_1'] <- 'VER_E57'

## GET METADATA #3:
## Change race in some samples
mixplate$Race[mixplate$accession_ID == 'CHIS_L38'] <- 'Mix'
mixplate$Race[mixplate$accession_ID == "ROO_E53" ] <- 'Dzit-bacal'
mixplate$Race[mixplate$accession_ID == "CAM_E54" ] <- 'Dzit-bacal'
mixplate$Race[mixplate$accession_ID == "CAM_E55" ] <- 'Dzit-bacal'
mixplate$Race[mixplate$accession_ID == "CAM_E58" ] <- 'Tuxpeño'
mixplate$Race[mixplate$accession_ID == "CAM_E60" ] <- 'Tuxpeño'

## GET METADATA #4: 
## Add the state
## CAMPECHE
mixplate$state[mixplate$sample_name == "CAM_E25_1"] <- 'Campeche'
mixplate$state[mixplate$sample_name == "CAM_E22_1"] <- 'Campeche'
mixplate$state[mixplate$sample_name == "CAM_E26_1"] <- 'Campeche'
mixplate$state[mixplate$sample_name == "CAM_E21_1"] <- 'Campeche'
mixplate$state[mixplate$sample_name == "CAM_E25_1"] <- 'Campeche'
mixplate$state[mixplate$sample_name == "CAM_E26_1"] <- 'Campeche'

## CHIAPAS 
## Fill in the missing spaces in the 'state' column
chis_rows <- grep("CHIS", mixplate$accession_ID)
mixplate$state[chis_rows] <- "Chiapas"

## VERACRUZ 
## Fill in the missing spaces in the 'state' column
vera_rows <- grep("VER", mixplate$accession_ID)
mixplate$state[vera_rows] <- "Veracruz"

## GET METADATA #5: 
## Add Mexico for all rows in country variable
mixplate$country <- "México"

----------------

# CONVERT METADATA TO CSV 
write.csv(mixplate, "pca8ene24_meta_mixplate", row.names = FALSE)

----------------

## ORDER, SAMPLES NAMES

## Sample names follow are the same in metada and genofile, 
## but they are in different order:
## Genofile
sample.id
## Metadata
mixplate$sample_name
## **Note**:The metadata will be used later to color-code the PCA plot, 
## so the labels must be the same in both the genofile and metadata.

----------------

# PCA
## Run PCA
pcaMix<- snpgdsPCA(genofileMix, num.thread=2)
## Estimate the % of variation explained by the first commponents:
pc.percent <- pcaMix$varprop*100
head(round(pc.percent, 2))
x<-round(pc.percent, 2)
sum(x[1:4])
sum(x[1:10])
sum(x[1:30])
## Now taking the results of the first 2 componets of the PCA 
## into a data frame, and we can add to that dataframe other useful columns from our metadata.
## Get PCA results of first 2 componets into a df
tab <- data.frame(sample.id = pcaMix$sample.id,
                  PC1 = pcaMix$eigenvect[,3],    # the first eigenvector
                  PC2 = pcaMix$eigenvect[,4],    # the second eigenvector
                  stringsAsFactors = FALSE)
head(tab)
## Add metadata and PCA results in a same happy object
pcametaMix <- tab %>%
  left_join(mixplate, by=c("sample.id" = "sample_name"))
head(pcametaMix) # see how it looks
## Plot raw PCA
p <- ggplot(data = pcametaMix, aes(x=PC1, y=PC2)) + geom_point(size = 1) +
  ylab(paste0("eigenvector 2 explaining ", round(pc.percent, 2)[1], "%")) +
  xlab(paste0("eigenvector 1 explaining ", round(pc.percent, 2)[2], "%"))
p
## Without the samples CHIS_L43, sequencing error in this sample  
## PCA by Race and scale
p.PCA.A <-pcametaMix %>% 
  filter(accession_ID != "CHIS_L43") %>%
  filter(state!= "")%>%
  ggplot(aes(x=PC1, y=PC2)) + geom_point(size = 2, aes(colour=state, shape=Race)) +
  scale_colour_manual(values=c("grey60", # 9 color-blind friendly colors
                               "#75a842",
                               "#36dee6",
                               "#52bd85",
                               "#b94656",
                               "#6780d8",
                               "#c69c39",
                               "#b6b638",
                               "#89863c",
                               "#FFEA00")) + 
  scale_shape_manual(values = c(15,17,1,6)) + # better points shapes
  labs(colour = "Mexican State") +
  theme(text = element_text(size = 15)) +
  ylab(paste0("eigenvector 2 explaining ", round(pc.percent, 2)[1], "%")) +
  xlab(paste0("eigenvector 1 explaining ", round(pc.percent, 2)[2], "%")) +
  theme_bw()
p.PCA.A
## Replace all instances of "_" and "Extra" with "Local", Regional 
## and National in the column 'scale'.
pcametaMix$scale <- gsub("_L", "Local"       , pcametaMix$scale)
pcametaMix$scale <- gsub("_R", "Regional"    , pcametaMix$scale)
pcametaMix$scale <- gsub("_N", "National"    , pcametaMix$scale)
pcametaMix$scale <- gsub("Extra", "National" , pcametaMix$scale)
pcametaMix$scale <- gsub("_E", "National"    , pcametaMix$scale)
## Filter pcametaMix
df_filtrada <- pcametaMix %>%
  filter(!scale %in% c("_F", "_X"))
## PCA by Race and scale 
p.PCA.B = df_filtrada %>% 
  filter(accession_ID != "CHIS_L43") %>%
  filter(scale!= "")%>%
  ggplot(aes(x=PC1, y=PC2)) + geom_point(size = 2, aes(colour=scale, shape=Race)) +
  scale_colour_manual(values=c("#CC33CC",     # 3 color-blind friendly colors
                               "#0033FF",
                               "#00FF00")) + 
  scale_shape_manual(values = c(15,17,1,6)) + # better points shapes
  labs(colour = "Scale") +
  theme(text = element_text(size = 15)) +
  ylab(paste0("eigenvector 2 explaining ", round(pc.percent, 2)[1], "%")) +
  xlab(paste0("eigenvector 1 explaining ", round(pc.percent, 2)[2], "%")) +
  theme_bw()
p.PCA.B








