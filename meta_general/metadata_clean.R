# La metadata que ha estado mal toda la vida, 
# y que flojera arreglarla, pero debo 
# Londres 30 de junio del 2025 12: 55 AM 
# Para construir esto, me baso en lo que copie del 
# script de SNPRelate_2x y que copie en repitiendo PCA,
# el cual debe quedar limpio y no tener el rollito este 
# de la data
# ───────────────────────────────────────────────────────────────────────────────
setwd("/home/duhyadi/Documents/paper1_final_tipodryad")
# ───────────────────────────────────────────────────────────────────────────────

# GET METADATA ##1:
## 1.1) join full meta plate 1 and 2 
## 1.2) add column race 
## 1.3) delete blank for plate 1 and 2

# 1) join fullmeta for plate 1 and plate2 
placa1 <- read.csv("meta/plate1_fullmeta.txt", sep='\t')
placa2 <- read.csv("meta/plate2_fullmeta.txt", sep='\t')
mixplate <- rbind(placa1, placa2)

## note: the previous txt files (plate1_fulllmeta.txt and,
## plate2_fullmeta.txt),lost the race column, 
## I believe they should have it, when creating them. 
## To solve this, 
## we would have to review the script used for it (in bash), created by Alicia. 
## The file for plate 1 was made by Alicia and the one for plate 2 by Duhyadi.

## GET METADATA ##2: 
## The accession name is changed to the extra samples, 
## these are those with the letter E (Extra). 
## These samples should not include the letter E, 
## as the label of the accessions was constructed 
## according to the number of field collections. 
## Field collections being #47. The additional accessions,
## were named as extras when they were sent for sequencing. 
## **Note**: this change allows the unique function 
## to be used to account for different accessions. 
## In addition, this change allows the corresponding 
## race name to be added: for not everything is Olotillo. 
## There is Mix, Dzit-bacal and Tuxpeño.  


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


