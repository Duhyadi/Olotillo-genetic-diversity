# Title: Plot admixture with Pophelper 2.3.1.
# Star date: Fri 8/February/2024. Coacalco, Mexico.
# Previous modification: Thu 23/May/2024. Versoix, Switzerland (14:19 PM) by Duhyadi. 
# Last modification: Mon 27/May/2024. Versoix, Switzerland (12:42 PM) by Duhyadi.   
# Authors: Duhyadi Oliva García & Alicia Mastretta Yanes.
--------
# Tutorial for pophelper: https://www.royfrancis.com/pophelper/articles/
# Argument details: https://www.royfrancis.com/pophelper/reference/plotQ.html
# Additional information: https://www.biostars.org/p/9481527/
--------
setwd("/home/duhyadi/Documents/paper1")  
--------
## HOW TO IDENTIFY DIFFERENT CHUNKS
--------
# Why is it neccessary to identify different chunks?
# Because this script was not generated 
# in R Markdown format. The reason: running each of 
# the chunks was slower and it was 
# more difficult to view the q list... 
--------  
# chunk for run complete
--------------------------------------------
--------------------------------------------

# dont run, only comentary
############################################
############################################

# do not need to run
############################################
--------------------------------------------


--------------------------------------------  
--------------------------------------------

## LOAD LIBRARIES

library(dplyr)
library(ggplot2)
library(cowplot)
library(gridExtra)
# processing output come from ADMIXTURE 
library(pophelper)
# for install pophelper: 
# remotes::install_github('royfrancis/pophelper')
# This installation instruction worked 
# for the version R version 4.1.2 (2021-11-01),
# bird hippie ;)
# remotes::install_github('royfrancis/pophelper')
# note: the latest version of R is 4.4.0, released on April 24, 2024.

--------------------------------------------
--------------------------------------------

## CV, ESTIMATE OPTIMAL K

# read K error
k.error <- read.delim ("admixture/download_cluster/output/olotillo_Kerror.txt",
                       header = F, sep = ":")
rownames(k.error)<- c("k=1", "k=2", "k=3", "k=4", "k=5")
# plot K error, from 1 to 5
e.plot <- ggplot(data=k.error, aes(x=1:5, y=V2)) + geom_point() 
+ geom_line()
e.plot + xlab("k") + ylab("Error")

--------------------------------------------
--------------------------------------------

## LOAD META FILES 

metaA <- read.csv("admixture/download_cluster/output/output2/admixture_meta.csv",
                  header = T)
# convert meta file from csv to txt extension
write.table(metaA, "admixture_meta.txt", sep = "\t", row.names = FALSE)
metaB <- read.table("admixture_meta.txt", header = T)
# file fam
oloPlinksamples <- read.table("admixture/download_cluster/files_plink/mixplates_filtered_2x.fam")

--------------------------------------------
--------------------------------------------

## SORT SAMPLE NAME ACCORDING TO V2, IN METAC
  
# get order of V2 from oloPlinksamples and 
# apply that order to sample_name in metaB
order <- match(oloPlinksamples$V2, metaB$sample_name)
metaC <- metaB[order, ]

--------------------------------------------
--------------------------------------------

#############################################
#############################################

# correct labels in scale, I have already done it a thousand times 
# to PCA, I could have done it faster but Chiapas...
# i am reviewing one by one
# sample_name              change scale
# CAM_E13_1  + CAM_E14_1  = national      # origin, Hugo Perales. R.
# CAM_E15_1  + CAM_E16    = national      # origin, Hugo Perales. R.
# CAM_E21_1  + CAM_E22_1  = national      # origin, Hugo Perales. R.
# CAM_E25_1  + CAM_E26_1  = national      # origin, Hugo Perales. R.
# the reason for doing this one by one,
# are the following samples
# CHIS_E9_1  + CHIS_E10_1 = CHIS_E52      # origin, Hugo Perales. R. 
# to know the scale I am going to review the data frame in
# my virtual laboratory
# CHIS_E9_1  + CHIS_E10_1 = regional      # origin, Hugo Perales. R. 
# CHIS_E23_1 + CHIS_E24_1 = regional      #origin, Hugo Perales. R.
# from here on review randomly 
# it is obvious that the following individuals are national
# i actually only reviewed the first one.
# ROO_E11_1  + ROO_E12_1  = national       #origin, Hugo Perales. R.
# SLP_E3_1   + SLP_E4_1   = national       #origin, CIMMYTMA29498.
# SLP_E7_1   + SLP_E8_1   = national       #origin, CIMMYTMA29464.
# HGO_E5_1   + HGO_E6_1   = national       #origin, CIMMYTMA29343.
# VER_E1_1   + VER_E2_1   = national       #origin, CIMMYTMA29569.
# VER_E17_1  + VER_E18_1  = national       #origin, CIMMYTMA29586.
# VER_E19_1  + VER_E20_1  = national       #origin, CIMMYTMA29535.
# CAMPECHE is national, therefore all that is 
# CAM es national 
# CAM_E13_1 + CAM_E14_1 = CAM_E54

## THERE'S NO NEED CHANGES IN SAMPLE_NAME WITH _E
## Note added by Duhyadi (may/24): we are interested in the state 
## and the scale, not like in the PCA that required 
## homogenizing the name of all the samples and 
## in addition, short labels are required 
## for a graph of the admixture.
#############################################
#############################################

--------------------------------------------
--------------------------------------------

## SAMPLE NAME SHORT FOR sample_name

## CAMPECHE, CAM
metaC$samname_short <- paste0("cam", seq_along(metaC$sample_name))
## CHIAPAS, CHIS
# filter rows containing "CHIS" in sample_name
chis_rows <- grepl("CHIS", metaC$sample_name)
# assign the values chis1, chis2, chis3, etc... to the corresponding rows
metaC$samname_short[chis_rows] <- paste0("chis", seq_along(metaC$sample_name[chis_rows]))
## GUERRERO, GRO
gro_rows <- grepl("GRO", metaC$sample_name)
# gro1, gro2, gro3...
metaC$samname_short[gro_rows] <- paste0("gro", seq_along(metaC$sample_name[gro_rows]))
## HIDALGO, HGO
hgo_rows <- grepl("HGO", metaC$sample_name)
# hgo1, hgo2... 
metaC$samname_short[hgo_rows] <- paste0("hgo", seq_along(metaC$sample_name[hgo_rows]))
## NAYARIT, NAY
nay_rows <- grepl("NAY", metaC$sample_name)
# nay1, nay2, nay3...
metaC$samname_short[nay_rows] <- paste0("nay", seq_along(metaC$sample_name[nay_rows]))
## OAXACA, OAX
oax_rows <- grepl("OAX", metaC$sample_name)
# oax1, oax2, oax3...
metaC$samname_short[oax_rows] <- paste0("oax", seq_along(metaC$sample_name[oax_rows]))
## QUINTANA ROO, ROO
roo_rows <- grepl("ROO", metaC$sample_name)
# roo1, roo2
metaC$samname_short[roo_rows] <- paste0("roo", seq_along(metaC$sample_name[roo_rows]))
## SAN LUIS POTOSÍ, SLP
slp_rows <- grepl("SLP", metaC$sample_name)
# slp1, slp2, slp3... 
metaC$samname_short[slp_rows] <- paste0("slp", seq_along(metaC$sample_name[slp_rows]))
## VERACRUZ, VER
ver_rows <- grepl("VER", metaC$sample_name)
# ver1, ver2, ver3...
metaC$samname_short[ver_rows] <- paste0("ver", seq_along(metaC$sample_name[ver_rows]))
## GAVILAN, GAV
gav_rows <- grepl("GAV", metaC$sample_name)
# gav1, gav2, gav3...
metaC$samname_short[gav_rows] <- paste0("gav", seq_along(metaC$sample_name[gav_rows]))
## XXX
xxx_rows <- grepl("XXX", metaC$sample_name)
# gav1, gav2, gav3...
metaC$samname_short[xxx_rows] <- paste0("xxx", seq_along(metaC$sample_name[xxx_rows]))

## DUHYADI NOTE: may/27/2024 
# In what state is the triple X grouped?, for now delete...
# The triple X is counted in the total number of samples, for the paper..
# Maybe the triple X should be removed...

--------------------------------------------
--------------------------------------------

metaC <- metaC %>%
  mutate(scale = ifelse(grepl("^CAM_E", sample_name), "national", scale))
# the following from Chiapas by hand, one by one 
# CHIS_E9_1  + CHIS_E10_1 = regional      # origin, Hugo Perales. R. 
# CHIS_E23_1 + CHIS_E24_1 = regional      #origin, Hugo Perales. R.
metaC$scale[metaC$sample_name == 'CHIS_E9_1'  ]  <- 'regional'
metaC$scale[metaC$sample_name == 'CHIS_E10_1' ]  <- 'regional'
metaC$scale[metaC$sample_name == 'CHIS_E23_1' ]  <- 'regional'
metaC$scale[metaC$sample_name == 'CHIS_E24_1' ]  <- 'regional'
# update the "scale" variable for inputs starting 
# with "ROO_E", "SLP_E", "HGO_E" y "VER_E"
metaC$scale[grepl("^(ROO|SLP|HGO|VER)_E", metaC$sample_name)] <- 'national'
# replace all instances of "_" with local, regional and national 
# in the column scale.
metaC$scale <- gsub("_L", "local"   , metaC$scale)
metaC$scale <- gsub("_R", "regional", metaC$scale)
metaC$scale <- gsub("_N", "national", metaC$scale)
# change the capital letter at the beginning
metaC$scale <- gsub("Local"   , "local"   , metaC$scale)
metaC$scale <- gsub("Regional", "regional", metaC$scale)
metaC$scale <- gsub("National", "national", metaC$scale)

--------------------------------------------
--------------------------------------------

## LOAD ADMIXTURE Q  

# read Q files
olofiles <- list.files(path="admixture/download_cluster/output/output2", 
                       pattern = "*.Q", full.names=T)
# q list from Q files
readQ(files=olofiles, filetype = 'auto')
# object q list 
ololist <- readQ(files=olofiles)
##"""""""""""""""""""""""""""""""""""""""""""""""""""##
                #METAC$SAMPLE_NAME
##""""""""""""""""""""""""""""""""""""""""""""""""""##

# the rownames of ‘qlist’ can also be modified 
# by the user by, adding custom individual labels,  
# add indlab to one run
rownames(ololist[[1]]) <- metaC$sample_name
# if all runs are equal length, add indlab to all runs
if(length(unique(sapply(ololist,nrow)))==1) 
ololist <- lapply(ololist,"rownames<-",metaC$sample_name)
# show row names of all runs and all samples
lapply(ololist, rownames)[1:5]

##"""""""""""""""""""""""""""""""""""""""""""""""""""##
               # METAC$SAMNAME_short
#add the short name to the q list: cam1,cam2, chis1...
##""""""""""""""""""""""""""""""""""""""""""""""""""##

## SHORT NAME IN Q LIST
## new labels, only with the state name an a 
## consecutive number maybe (chis1, chis2...oax1,oax2...).

# the rownames of ‘qlist’ can also be modified 
# by the user by, adding custom individual labels,  
# add indlab to one run
rownames(ololist[[1]]) <- metaC$samname_short
# if all runs are equal length, add indlab to all runs
if(length(unique(sapply(ololist,nrow)))==1) 
ololist <- lapply(ololist,"rownames<-",metaC$samname_short)
# show row names of all runs and all samples
lapply(ololist, rownames)[1:5]

--------------------------------------------
--------------------------------------------

#############################################
#############################################
## DELETE EVOLUTIONARY POPULATIONS

## These are the samples representing the F1 of the evolutionary 
## populations.
## We are deleting them because the objective of this paper is 
## describing the distribution of genetic diversity within Olotillo.
## The F samples would be analyses at a different stage in another paper.

#############################################
#############################################

--------------------------------------------
--------------------------------------------

## Which are the evolutionary pops samples? The ones labelled with _F 
## in scale:
metaC[metaC$scale=="_F", ]
# we can see they also all start with GAV. Lets create an object 
# whith those samples
to_remove<- metaC[metaC$scale=="_F", 1] # keep only 1st column, where the samples are
to_remove
# how many?
length(to_remove)
# since in the df from the list of admixture results the sample names are 
# in the rownames (hence not a df variable), 
# get the indexes (which number of row are they)
to_remove_indexes<-match(to_remove, rownames(ololist[[1]]))
# delete samples based on index
# example with one of the df to show how it works in a single df
y <- (ololist[[2]]) # save the list 2 into an object as a single df
nrow(y) # count how many rows we had originally
y2 <- y[-to_remove_indexes, ] # this keeps all the rows, EXCEPT (hence the "-") the row numbers in the object to_remove_indexes
nrow(y2) # how how many rows we had now. It should be the orignal number - the number of elements of to_remove_indexes
nrow(y) - length(to_remove_indexes) # this number should be the same than nrow(y2)
# delete rows with samples to_remove in all dfs within the list of results
ololist_filtered_evol <- lapply(ololist, function(x) {x<-x[-to_remove_indexes, ]})

## Check sample names, are GAV* samples removed?
rownames(ololist_filtered_evol[[2]])
# how many samples remained? 
nrow((ololist_filtered_evol[[2]]))

## We also need to create a new dataframe with the metadata excluding the _F samples
metaC_filtered_evol<-metaC[-to_remove_indexes, ] # we can use the same indexes since samples are in the same order
# check sample names
metaC_filtered_evol$sample_name

--------------------------------------------
--------------------------------------------

#############################################
#############################################
## DELETE OTHER RACES, KEEP ONLY OLOTILLO
## Here we filter similarly than above, but instead of removing 
## what we dont want, we will keep what we want (Olotillo)

#############################################
#############################################

--------------------------------------------
--------------------------------------------

# df of only olotillo samples
to_keep <- metaC[metaC_filtered_evol$race=="Olotillo", ]  # , means keep all columns
to_keep

# we need to also exlude _F and keep only the list of samples
to_keep <- to_keep[to_keep$scale!="_F", 1] # , 1 keep only 1st column, where the samples are
to_keep
length(to_keep) # number of samples
# indexes of olotillo samples
to_keep_indexes<-match(to_keep, rownames(ololist[[1]]))
# Keep samples of olotillo in all df
ololist_only_olotillo<-lapply(ololist, function(x) {x<-x[to_keep_indexes, ]}) # the difference with the other way we did it is that here we dont add a "-"
nrow(ololist_only_olotillo[[2]]) # n rows should be equal to number of esamples in to_keep
# We also need meta of olotillo only
metaC_only_olotillo<-metaC[to_keep_indexes, ] # we can use the same indexes since samples are in the same order
# check sample names
metaC_only_olotillo$sample_name

--------------------------------------------
--------------------------------------------  

############################################
--------------------------------------------
############################################
--------------------------------------------
############################################
--------------------------------------------
############################################
--------------------------------------------
############################################
--------------------------------------------
## PLOTS KEEPING ALL RACES BUT REMOVING EVOL POPS

## Alice's code: code provided by Alice from, plot_admixture_PGD_teocintles
## Duhya's code: voy a mover pierna 
   
## PLOT 1, BASIC: with Alice's code 
## Plot basic for 3K 
p1 <- plotQ(ololist_filtered_evol[3], # plot Q, generate barplots from qlists.
          returnplot = T, 
          exportplot = F, height=4,
          sortind="all", basesize=11,
          # showindlab =TRUE, useindlab=TRUE, indlabangle=90, indlabsize=0.1,
          exportpath = getwd())  
plot(p1$plot[[1]])



## PLOT 1.1, BASIC: with the code of Alicia and Duhyadi.
## Plot for 3K + color palette + labels 
p1.1 <- plotQ(ololist_filtered_evol[3], # alice code
          returnplot=T, splab="", # alice code
          exportplot=F, height=6 , # alice code 
          width=12, # duhya add  
          sortind= "all", basesize=3, # alice add 
          clustercol=c("#70D6FF","#FF70A6","#FF9770",
                       "#FFD670","#E9FF70"), # duhya code
          showlegend =T, legendtextsize=6, # duhya code
          showyaxis=T, indlabsize=4, # duhya code 
          showticks=T, ticksize=0.1,ticklength=0.03, # duhya code
          indlabcol="grey", # duhya code
          showindlab=T, useindlab=T, # duhya code
          indlabspacer=2, # space between the individual label and the plot area
          indlabheight=0.1, # space between the bottom of the graph and the labels 
          # indlabsize=5, # i don't know what it does, but if it is on it collapses and does not graph, many arguments and according to the trick in basesize...  
          imgtype = "tiff",
          exportpath = getwd())
grid.arrange(p1.1$plot[[1]])


## Create groups for plotting 
group_by_race <- metaC_filtered_evol$race
group_by_race <- as.data.frame(group_by_race)
group_by_level_race <- metaC_filtered_evol[,c(4,3)]
group_by_race_state <- metaC_filtered_evol[,c(2,4)]
group_by_scale_state <- metaC_filtered_evol[,c(2,3)]



## PLOT 2, BY RACE: with Alice's code.
## Plot basic for 3K + grplab
p2 <- plotQ(ololist_filtered_evol[3],
          returnplot=T, 
          exportplot=F, height=4,
          basesize =11,
          ordergrp = TRUE, # orders individual of the same group together in the x axis
          grplab = group_by_race,
          sortind = "all",
          exportpath = getwd())  
plot(p2$plot[[1]])



## PLOT 2.1, BY RACE: with the code of Alicia and Duhyadi.
## Plot for 3K + grplab + color palette + labels + grplab
p2.1 <- plotQ(ololist_filtered_evol[3],
            returnplot=T, 
            exportplot=F, height=4,
            width=12,
            basesize =11,
            ordergrp = TRUE, 
            grplab = group_by_race,
            sortind = "all",
            clustercol=c("#70D6FF","#FF70A6","#FF9770",
                         "#FFD670","#E9FF70"),
            showlegend =T, legendtextsize=6,
            showyaxis=T, indlabsize=4, 
            showticks=T, ticksize=0.1,ticklength=0.03, 
            indlabcol="grey",
            showindlab=T, useindlab=T, 
            indlabspacer=2, 
            indlabheight=0.1, 
            imgtype = "tiff",
            exportpath = getwd())
plot(p2.1$plot[[1]])



## PLOT 3, BY SCALE AND RACE: with Alice's code.
## Plot basic for 3K + grplab
p3 <- plotQ(ololist_filtered_evol[3],
          returnplot=T, 
          exportplot=F, height=4,
          basesize =11,
          grplab = group_by_level_race,
          ordergrp = TRUE, # orders individual of the same group together in the x axis
          sortind = "all",
          exportpath = getwd())  
plot(p3$plot[[1]])



## PLOT 3.1, BY LEVEL AND RACE: with the code of Alicia and Duhyadi.
## Plot for 3K + grplab + color palette + labels + grplab
p3.1 <- plotQ(ololist_filtered_evol[3],
            returnplot=T, 
            exportplot=F, height=4,
            basesize =11,
            grplab = group_by_level_race,
            ordergrp = TRUE, # orders individual of the same group together in the x axis
            sortind = "all",
            clustercol=c("#70D6FF","#FF70A6","#FF9770",
                         "#FFD670","#E9FF70"),
            showlegend =T, legendtextsize=6,
            showyaxis=T, indlabsize=4, 
            showticks=T, ticksize=0.1,ticklength=0.03, 
            indlabcol="grey",
            showindlab=T, useindlab=T, 
            indlabspacer=2, 
            indlabheight=0.1, 
            imgtype = "tiff",
            exportpath = getwd())
plot(p3.1$plot[[1]])



## PLOT 4, BY STATE: with Alice's code.
## Plot basic for 3K + grplab
group_by_state<-metaC_filtered_evol$state
group_by_state<-as.data.frame(group_by_state)
p4<-plotQ(ololist_filtered_evol[3],
          returnplot=T, 
          exportplot=F, height=4,
          basesize =11,
          ordergrp = TRUE, # orders individual of the same group together in the x axis
          grplab = group_by_state,
          sortind = "all",
          exportpath = getwd())  
plot(p4$plot[[1]])



## PLOT 4.1, BY STATE: with the code of Alicia and Duhyadi.
## Plot for 3K + grplab + color palette + labels + grplab
p4.1 <- plotQ(ololist_filtered_evol[3],
          returnplot=T, 
          exportplot=F, height=4,
          basesize =11,
          ordergrp = TRUE, # orders individual of the same group together in the x axis
          grplab = group_by_state,
          sortind = "all",
          clustercol=c("#70D6FF","#FF70A6","#FF9770",
                       "#FFD670","#E9FF70"),
          showlegend =T, legendtextsize=6,
          showyaxis=T, indlabsize=4, 
          showticks=T, ticksize=0.1,ticklength=0.03, 
          indlabcol="grey",
          showindlab=T, useindlab=T, 
          indlabspacer=2, 
          indlabheight=0.1, 
          imgtype = "tiff",
          exportpath = getwd())
plot(p4.1$plot[[1]])

          
          
## PLOT 5, BY RACE AND STATE: with Alice's code.
## Plot basic for 3K + grplab
p5 <- plotQ(ololist_filtered_evol[3],
          returnplot=T, 
          exportplot=F, height=4,
          basesize =11,
          grplab = group_by_race_state,
          ordergrp = TRUE, # orders individual of the same group together in the x axis
          sortind = "all",
          exportpath = getwd())  
plot(p5$plot[[1]])



## PLOT 5.1, BY RACE AND STATE: with the code of Alicia and Duhyadi.
## Plot for 3K + grplab + color palette + labels + grplab
p5.1 <- plotQ(ololist_filtered_evol[3],
            returnplot=T, 
            exportplot=F, height=4,
            basesize =11,
            grplab = group_by_race_state,
            ordergrp = TRUE, # orders individual of the same group together in the x axis
            sortind = "all",
            clustercol=c("#70D6FF","#FF70A6","#FF9770",
                         "#FFD670","#E9FF70"),
            showlegend =T, legendtextsize=6,
            showyaxis=T, indlabsize=4, 
            showticks=T, ticksize=0.1,ticklength=0.03, 
            indlabcol="grey",
            showindlab=T, useindlab=T, 
            indlabspacer=2, 
            indlabheight=0.1, 
            imgtype = "tiff",
            exportpath = getwd())
plot(p5.1$plot[[1]])

--------------------------------------------
############################################
--------------------------------------------
############################################
--------------------------------------------
############################################
--------------------------------------------
############################################
--------------------------------------------
############################################
--------------------------------------------

############################################  
############################################
## SUGGESTED PLOTS FOR PAPER

## PLOT BY RACE: including all races. 
# This plot shows that Olotillo and the other races 
# are not really differentiated at the genomic level. 
# This is congruent with Caldu's paper: considering all the genome
# genetic drift dominates, what differentiates Olotillo from other races 
# are few loci related
# mostly to morphological features under artificial selection

############################################  
############################################

--------------------------------------------
--------------------------------------------

## Label by race 
race <-metaC_filtered_evol$race
race <- as.data.frame(race)

--------------------------------------------
--------------------------------------------

## PLOT A, BY RACE
## Plot for 2-3-4K + grplab 
pA <- plotQ(ololist_filtered_evol[c(2,3,4)], # 2,3,4 neans we want to se k 2 3 4
          imgoutput="join", # means to join plots from the desired Ks in a single figure
          sharedindlab =FALSE,  # needed for imgoutput to work, for some reason
          returnplot=T, 
          exportplot=F, height=4,
          basesize =11,
          grplab = race,
          ordergrp = TRUE, # orders individual of the same group together in the x axis
          sortind = "all",
          exportpath = getwd())  
plot(pA$plot[[1]])


## PLOT A.1, BY RACE
## Plot for 2-3-4K + grplab + color palette + labels + grplab
pA.1 <- plotQ(ololist_filtered_evol[c(2,3,4)], #2,3,4 neans we want to se k 2 3 4
          imgoutput = "join", # means to join plots from the desired Ks in a single figure
          sharedindlab = T,  # needed for imgoutput to work, for some reason
          returnplot = T, 
          basesize = 20,
          divsize = 0.5,
          grplab = race, # group label panel
          ordergrp = TRUE, # orders individual of the same group together in the x axis
          # sortind = "all",
          clustercol = c("#70D6FF","#FF70A6","#FF9770",
                       "#FFD670","#E9FF70"),
          showlegend = T, legendtextsize=6,
          showyaxis = T, indlabsize = 3,  
          showticks = T, ticksize = 0.1, ticklength = 0.03, 
          indlabcol = "grey",
          showindlab = T, useindlab = T, 
          indlabspacer = 2, 
          indlabheight = 0.1,   # individual labels
          sppos="right", splabsize = 4, splabcol = "black", spbgcol = "white", splab=c("K=2","k=3", "k=4"), # strip panel, changes the name file by k
          grplabsize = 1, # group labels
          imgtype = "tiff",
          exportplot = T, height = 2, 
          exportpath = getwd())
plot(pA.1$plot[[1]])

--------------------------------------------
--------------------------------------------

## VERSIONS ACCORDING TO THE ISSUE RESOLVED BY ALICIA (sun 19/may/24),
## https://github.com/Duhyadi/Paper1/issues/2

## A) Keep sortind = "all" (nicer order of the colors). 
## But remove ALL individual labels. 
## This will show the differences 
## in gen cluster structure within each race.
pA <- plotQ(ololist_filtered_evol[c(2,3,4)], # 2,3,4 means we want to see k 2,3,4
              imgoutput = "join", # join plots from the desired Ks in a single figure
              sharedindlab = F,  # needed for imgoutput to work, for some reason
              returnplot = T, 
              grplab = race, # group label panel
              ordergrp = T, subset=c("Olotillo","Dzit-bacal","Mix","Tuxpeño"),   # orders individuals of the same group together on the x-axis
              sortind = "all",
              clustercol = c("#70D6FF","#FF70A6","#FF9770",
                             "#FFD670","#E9FF70"),
              indlabcol = "grey", # color group and y-x axis
              showlegend = T, # group labels  
              legendlab =c("group1","group2","group3","group4"), # group labels name
              legendtextsize = 25, legendkeysize = 25, # group labels size 
              legendmargin = c(10,10,10,0), legendrow = 4, # group labels margin and row
              showyaxis = T, indlabsize = 20, # y-axis
              showticks = T, ticksize = 0.3, ticklength = 0.3, # garrapatas
              indlabspacer = 21, # space between figures (between ks) 
              divsize = 1, # divider line, groups (white dotted line)
              splabsize = 36, splabcol = "black", # strip panel  
              splab = c("K=2", "K=3", "K=4"), # strip panel, changes the name file by k
              panelspacer = 1.5 , # panel spacer, space between panels 
              linesize = 2, # label line
              pointsize = 14,  # label points
              grplabsize = 11, grplabjust = 0.6, #race size
              imgtype = "jpeg",
              exportplot = T, height = 8, width = 54, units = "in", dpi = 300,
              outputfilename ="A_keep_sortind_all",
              basesize = 11,
              panelratio = c(4, 2),
              exportpath = getwd())
--------------------------------------------

## B) Remove sortind = "all".
## Keep individual labels at the bottom 
## (but colores a bit more changed). 
## This keeps the labels and it is possible to 
## see that the clusters make some sense geographically. 
## However the sample ids are to small to 
## read because they are too long, you would need 
## to create new labels, only with the state name 
## an a consecutive number maybe (chis1, chis2... oax1, oax2...).
pB <- plotQ(ololist_filtered_evol[c(2,3,4)], # 2,3,4 means we want to see k 2,3,4
              imgoutput = "join", # join plots from the desired Ks in a single figure
              sharedindlab = T,  
              returnplot = T, 
              clustercol = c("#70D6FF","#FF70A6","#FF9770",
                             "#FFD670","#E9FF70"),
              indlabcol = "grey", # color group and y and x axis
              showlegend = T, # group labels  
              legendlab =c("group1","group2","group3","group4"), # group labels name
              legendtextsize = 25, legendkeysize = 25, # group labels size 
              legendmargin = c(10,10,10,0), legendrow = 4, # group labels margin and row
              showyaxis = T, indlabsize = 20, # y-axis
              showticks = T, ticksize = 0.3, ticklength = 0.3, # garrapatas
              indlabspacer = 21, # space between figures 
              divsize = 1, # divider line, groups
              splabsize = 36, splabcol = "black", # strip panel
              splab = c("K=2", "K=3", "K=4"), # strip panel, changes the name file by k
              panelspacer = 1.5 , # panel spacer, space between panels 
              linesize = 2, # label line
              pointsize = 14,  # label points
              grplabsize = 10, grplabjust = 0.6,  # group labels
              imgtype = "jpeg",
              sortind="label",
              showindlab=T, # shows individuals whit zero, ie, 001, 002, etc 
              useindlab= T,  # labels are taken from the qlist 
              exportplot = T, height = 8, width = 40, units = "in", dpi = 300,
              outputfilename ="B_remove_sortind_all",
              basesize = 11,
              panelratio = c(30, 15), #****
              exportpath = getwd())
--------------------------------------------

## C) Keep option A for the races and then make another plot 
## only for Olotillo (excluding the other races) 
## showing the states as grouping variable and showing 
## the labels. This may look better since there 
## would be less samples and the group variable will be states.
group_by_state<-metaC_filtered_evol$state
group_by_state<-as.data.frame(group_by_state)
pC <- plotQ(ololist_filtered_evol[c(2,3,4)], # 2,3,4 means we want to see k 2,3,4
              imgoutput = "join", # join plots from the desired Ks in a single figure
              sharedindlab = F,  # needed for imgoutput to work, for some reason
              returnplot = T, 
              grplab = race, # group label panel
              ordergrp = T, subset=c("Olotillo"),   # orders individuals of the same group together on the x-axis
              sortind = "all",
              clustercol = c("#70D6FF","#FF70A6","#FF9770",
                             "#FFD670","#E9FF70"),
              indlabcol = "grey", # color group and y-x axis
              showlegend = T, # group labels  
              legendlab =c("group1","group2","group3","group4"), # group labels name
              legendtextsize = 25, legendkeysize = 25, # group labels size 
              legendmargin = c(10,10,10,0), legendrow = 4, # group labels margin and row
              showyaxis = T, indlabsize = 20, # y-axis
              showticks = T, ticksize = 0.3, ticklength = 0.3, # garrapatas
              indlabspacer = 21, # space between figures (between ks) 
              divsize = 1, # divider line, groups (white dotted line)
              splabsize = 36, splabcol = "black", # strip panel  
              splab = c("K=2", "K=3", "K=4"), # strip panel, changes the name file by k
              panelspacer = 1.5 , # panel spacer, space between panels 
              linesize = 2, # label line
              pointsize = 14,  # label points
              grplabsize = 11, grplabjust = 0.6, #race size
              imgtype = "jpeg",
              exportplot = T, height = 8, width = 54, units = "in", dpi = 300,
              outputfilename ="C_only_olotillo_sortind_all",
              basesize = 11,
              panelratio = c(4, 2),
              exportpath = getwd())



########################################################
        # FOR JOIN GRAPHICS,ALICIA (19/may/24)
#######################################################
# Extract individual plots and modify them
library(ggplot2)

p1 <- pA.1$plot[[1]] + 
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank(), 
        plot.margin = margin(t = 0, r = 0, b = 0, l = 0))

p2 <- pA.1$plot[[2]] + 
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank(), 
        plot.margin = margin(t = 0, r = 0, b = 0, l = 0))

p3 <- pA.1$plot[[3]] + 
  theme(plot.margin = margin(t = 0, r = 0, b = 0, l = 0))

# Combine the modified plots into a single figure
library(gridExtra)

final_plot <- grid.arrange(p1, p2, p3, ncol = 1, heights = c(1, 1, 1.2))

# Save the final plot
ggsave("final_plot.tiff", final_plot, width = 16, height = 8, units = "in", dpi = 300)

########################################################
   #TRASH OF DUHYADI, ignore the following (may/28/24)
########################################################
## PLOT ONLY FOR OLOTILLO: divided by state and scale
# The idea of this plot is to show that geography matters 
# within olotillo

## Create labels
group_by_scale_state <- metaC_only_olotillo[,c(2,3)]



## PLOT B
## Plot for 2-3-4K + grplab 
pB <- plotQ(ololist_only_olotillo[c(2,3,4)], #2,3,4 neans we want to se k 2 3 4
          imgoutput="join", # means to join plots from the desired Ks in a single figure
          sharedindlab =FALSE,  # needed for imgoutput to work, for some reason
          returnplot=T, 
          exportplot=F, height=4,
          basesize =11,
          grplab = group_by_scale_state,
          ordergrp = TRUE, # orders individual of the same group together in the x axis
          sortind = "all",
          exportpath = getwd())
plot(pB$plot[[1]])

      

## PLOT B.1
## Plot for 2-3-4K + grplab 
pB.1 <- plotQ(ololist_only_olotillo[c(2,3,4)], #2,3,4 neans we want to se k 2 3 4
            imgoutput="join", # means to join plots from the desired Ks in a single figure
            sharedindlab =FALSE,  # needed for imgoutput to work, for some reason
            returnplot=T, 
            exportplot=F, height=4,
            basesize =11,
            grplab = group_by_scale_state,
            ordergrp = TRUE, # orders individual of the same group together in the x axis
            sortind = "all",
            clustercol=c("#70D6FF","#FF70A6","#FF9770",
                         "#FFD670","#E9FF70"),
            showlegend =T, legendtextsize=6,
            showyaxis=T, indlabsize=4, 
            showticks=T, ticksize=0.1,ticklength=0.03, 
            indlabcol="grey",
            showindlab=T, useindlab=T, 
            indlabspacer=2, 
            indlabheight=0.1, 
            imgtype = "tiff",
            exportpath = getwd())
plot(pB.1$plot[[1]])

            
#      
group_by_race<-metaC_filtered_evol$race
group_by_race<-as.data.frame(group_by_race)
group_by_level_race<-metaC_filtered_evol[,c(4,3)]



## Comment Alicia April 18/24: I think the plots below can be deleted?



# PLOT TYPE DUHYADI 
# k= 1,2, and 3
# Explanation of the arguments
# For now, it doesn't run
p1 <- plotQ(alignK(ololist_filtered_evol[c(1,2,3)]),imgoutput="join",
            returnplot=T,exportplot=F,basesize=8,
            clustercol=c("#70D6FF","#FF70A6","#FF9770",
                         "#FFD670","#E9FF70"), 
            showlegend=T,legendtextsize=15, # cluster labels
            showyaxis=T,indlabsize=6,      # y axis
            showticks=T,ticksize=0.2,ticklength=0.1, # "garrapatas in y and x axis"    
            indlabcol="grey", # color letter cluster and, y-x axis
            panelspacer=0.3,                        # panel spacer
            showindlab=T, # shows individuals whit zero, ie, 001, 002, etc 
            useindlab= F,  # shows individuals without zero,ie,1,2,etc 
            sortind="all",
            sharedindlab=F, # label in bottom (T) and label in alls (F), necesary FALSE for cluster an all 
            exportpath=getwd())
grid.arrange(p1$plot[[1]])



