# Title: Plot admixture with  Pophelper 2.3.1
# Author: Duhyadi Oliva García & Alicia Mastretta Yanes. 
# Date: Fri 8/Febrary/2024 in México
# Modification:  Wed 11/March/2024 08:40 AM, in México
library(dplyr)
library(ggplot2)
library(cowplot)
library(ggpubr) #obvio puedeo omitir pues no están cargadas y funciona, creo..
library(pophelper)
library(SNPRelate) #obvio puedeo omitir pues no están cargadas y funciona, creo..
library(gridExtra)

# Script obtenido de la clase de Alicia, solo para visualizar rápidamente, más no para obtener la figura del paper, creo...

# Estimate optimal K

# read K error
k.error<- read.delim("../descargas_cluster/output/olotillo_Kerror.txt", header = F, sep = ":")
rownames(k.error)<- c("k=1", "k=2", "k=3", "k=4", "k=5")

# plot K error
e.plot<- ggplot(data=k.error, aes(x=1:5, y=V2)) + geom_point() + geom_line()
e.plot + xlab("k") + ylab("Error")

### Plot Q for K 5.

## Get meta data
samples_meta<-read.csv("../descargas_cluster/output/pca8ene24_meta_mixplate.csv",
                         header=TRUE, sep="\t")

samples_names<-read.delim("../descargas_cluster/mixplates_filtered_2x.fam",
                          header=FALSE, sep=" ") %>% 
  select(., V2) %>%
  rename(., INDIV=V2)

# read Q file
Qval<-read.table(paste0("../descargas_cluster/output/mixplates_filtered_2x.3.Q"))
names(Qval)<-paste0("K", 1:ncol(Qval))

# Format Q file for plotting
# add  sample names  to Qtable
Qval<-cbind(INDIV=samples_names$INDIV, Qval)

# transform to long format  
Qval_long<- gather(Qval, key=Kgroup, value=Qadmixture, 2:ncol(Qval))

## Plot
# standar
plt<-ggplot(Qval_long, aes(x=INDIV, y=Qadmixture, fill=Kgroup)) + geom_col() +
  theme(axis.text.x= element_blank())
plt


### Same plot but ordering by altitude, recuerdo que lo siguente no corrió y hoy 22/feb/2024 decido no batallar con ello

# add altitude data
Qval<-cbind(Altitude=samples_meta$Altitud, Qval)

# transform to long format  
Qval_long<- gather(Qval, key=Kgroup, value=Qadmixture, 3:ncol(Qval))

# Order levels of the column that ggplot2 uses in x so
# that they are in the desired order
Qval_long$INDIV<-factor(Qval_long$INDIV, 
                        levels = Qval_long$INDIV[order(Qval$Altitud)])


## Plot
# standar
plt<-ggplot(Qval_long, aes(x=INDIV, y=Qadmixture, fill=Kgroup)) + geom_col() +
  theme(axis.text.x= element_blank())
plt

########pophelper#######################################
# install devtools package from CRAN
# tutorial:https://www.royfrancis.com/pophelper/articles/
# diferencias de instalación descubiertas por revisar el codigo de Nigenda
# instrucción nigenda, la chida, el remotes hace algo 
#remotes::install_github('royfrancis/pophelper')
# instrucción de cualquier lugar y que no funciona
#install_github('royfrancis/pophelper')

# devtools logro instalarse, no me acuerdo 22/feb/2024  
#library(devtools), sigue sin poderse instalar 22/feb/2024. Solicitar ayuda a Isidro
# check version
library(pophelper)
packageDescription("pophelper", fields="Version")

current_directory <- getwd()
print(current_directory)
setwd("/home/duhyadi/Documents/articulo_1/descargas_cluster/output/output2")



#https://www.biostars.org/p/9481527/
# 
afiles <- list.files(path=".", pattern = "*.Q", full.names=T)

#
readQ(files=afiles, filetype = 'auto',indlabfromfile=TRUE)

#
alist <- readQ(files=afiles, indlabfromfile=TRUE)
# indlabfromfile does not serve to display the name 
#of the samples,serves only for structure, lo dejo no más, jeje

# cargar archivo meta 
popmapA <- read.csv("admixture_meta.csv", header = T)

# convertir el archivo meta de extensión csv a txt 
write.table(popmapA, "admixture_meta.txt", sep = "\t", row.names = FALSE)

popmapB <- read.table("admixture_meta.txt", header = T)

##The rownames of ‘qlist’ can also be modified by the user by adding custom individual labels. 
# add indlab to one run
rownames(alist[[1]]) <- popmapB$sample_name
# if all runs are equal length, add indlab to all runs
if(length(unique(sapply(alist,nrow)))==1) alist <- lapply(alist,"rownames<-",popmapB$sample_name)
# show row names of all runs and all samples
lapply(alist, rownames)[1:5]


#popmapC <- popmapB[,3,drop=FALSE]
#head(popmapC)





# check class of ouput
class(alist)
# view head of first converted file
head(alist[[1]])
# qlist attributes
attributes(alist)
# dataframe attributes
attributes(alist[[1]])
# attributes of all runs
lapply(alist,attributes) #i didn´t get loci, burnin, etc..quizá se deba a que es admixture y no sturcuture...
# check names of attributes of the first file
names(attributes(alist[[1]]))
# include individual names from STRUCTURE file as row names
alist <- readQ(files=afiles, indlabfromfile=T)
head(alist[[1]])
lapply(alist,attributes)
#
tr1 <- tabulateQ(qlist=alist)
head(tabulateQ(alist))
sr1 <- summariseQ(tr1)

# plot 
alist1 <- alignK(alist[c(3,4,5)])
p1 <- plotQ(alist[c(3,4,5)],imgoutput="join",returnplot=T,exportplot=F,basesize=11)
grid.arrange(p1$plot[[1]])

##
#onelabset1 <- threelabset1[,2,drop=FALSE]
# other form of include alingnk 

# intentando que se anexe el sample_name 
p1 <- plotQ(alignK(alist[c(3,4,5)]),imgoutput="join",
            returnplot=T,exportplot=F,basesize=8,
            clustercol=c("#70D6FF","#FF70A6","#FF9770",
                         "#FFD670","#E9FF70"), 
            showlegend=T,legendtextsize=15, # cluster labels
            showyaxis=T,indlabsize=6,      # y axis
            showticks=T,ticksize=0.2,ticklength=0.1, # garrapatas in y and x axis    
            indlabcol="grey", # color cluster, and y-x axis
            panelspacer=0.3,                        # panel spacer
            showindlab=T, # shows individuals whit zero, ie, 001, 002, etc 
            useindlab=T,  # shows individuals without zero,ie,1,2,etc 
            sortind="",
            sharedindlab=F, # label in bottom T and label in alls F, necesary false for cluster an all 
            exportpath=getwd())

grid.arrange(p1$plot[[1]])


# intentando que funcione bien 
p1 <- plotQ(alignK(alist[c(3,4,5)]),imgoutput="join",
            returnplot=T,exportplot=F,basesize=8,
            clustercol=c("#70D6FF","#FF70A6","#FF9770",
                         "#FFD670","#E9FF70"), 
            showlegend=T,legendtextsize=15, # cluster labels
            showyaxis=T,indlabsize=6,      # y axis
            showticks=T,ticksize=0.2,ticklength=0.1, # garrapatas in y and x axis    
            indlabcol="grey", # color cluster, and y-x axis
            panelspacer=0.3,                        # panel spacer
            showindlab=T, # shows individuals whit zero, ie, 001, 002, etc 
            useindlab=T,  # shows individuals without zero,ie,1,2,etc 
            sortind="Cluster 1",
            sharedindlab=F, # label in bottom T and label in alls F, necesary false for cluster an all 
            exportpath=getwd())
grid.arrange(p1$plot[[1]])





  










# funcionando a medias, todo amontonado
p1 <- plotQ(alignK(alist[c(3,4,5)]),imgoutput="join",
            returnplot=T,exportplot=F,basesize=11,
            clustercol=c("#70D6FF","#FF70A6","#FF9770",
                         "#FFD670","#E9FF70"),showlegend=T,
            legendtextsize=15,showyaxis=T,indlabsize=6,
            showticks=T,ticksize=0.3,ticklength=0.2, 
            panelspacer=0.4,showindlab=T,useindlab=T,
            sharedindlab=F,indlabcol="grey", sortind="all",
            #grplab=popmapC,
            exportpath=getwd())
grid.arrange(p1$plot[[1]])








