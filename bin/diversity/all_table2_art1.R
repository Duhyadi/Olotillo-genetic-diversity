
## mayo 22 del 25 Versoix 
## para verificar las medias de all de la tabla 2 

getwd()
setwd("/home/duhyadi/Documents/paper1/meta")
data.all.table2 <- read.csv("data_merged2.csv",header=T)
# F
# summary con st 
summary(data.all.table2$F)
sd(data.all.table2$F, na.rm = TRUE) 
# HETob 
# summary con st 
summary(data.all.table2$HETob)
sd(data.all.table2$HETob, na.rm = TRUE)
# HETex
summary(data.all.table2$HETex)
sd(data.all.table2$HETex, na.rm = TRUE)
# HOMex
summary(data.all.table2$HOMex)
sd(data.all.table2$HOMex, na.rm = TRUE)
# N_SITES
summary(data.all.table2$N_SITES)
sd(data.all.table2$N_SITES, na.rm = TRUE)


# AL final fue rápido, Versoix 22 de mayo del 25. Algunas cifras están 
# redondeadas, otras ño
