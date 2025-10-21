setwd("/home/duhyadi/Documents/paper1")  

## LOAD LIBRARIES
library(dplyr)
library(ggplot2)
library(cowplot)
library(gridExtra)
# processing output come from ADMIXTURE 
library(pophelper)
--------------------------------------------
## LOAD META FILES   
metaA <- read.csv("admixture/download_cluster/output/output2/admixture_meta.csv", header = T)
# convert meta file from csv to txt extension
write.table(metaA, "admixture_meta.txt", sep = "\t", row.names = FALSE)
metaB <- read.table("admixture_meta.txt", header = T)
# file fam
oloPlinksamples <- read.table("admixture/download_cluster/files_plink/mixplates_filtered_2x.fam")
# get order of V2 from oloPlinksamples and 
# apply that order to sample_name in metaB
order <- match(oloPlinksamples$V2, metaB$sample_name)
metaC <- metaB[order, ]
metaC <- metaC %>%
  mutate(scale = ifelse(grepl("^CAM_E", sample_name), "national", scale))  
metaC$scale[metaC$sample_name == 'CHIS_E9_1'  ]  <- 'regional'
metaC$scale[metaC$sample_name == 'CHIS_E10_1' ]  <- 'regional'
metaC$scale[metaC$sample_name == 'CHIS_E23_1' ]  <- 'regional'
metaC$scale[metaC$sample_name == 'CHIS_E24_1' ]  <- 'regional'  
metaC$scale[grepl("^(ROO|SLP|HGO|VER)_E", metaC$sample_name)] <- 'national'
metaC$scale <- gsub("_L", "local"   , metaC$scale)
metaC$scale <- gsub("_R", "regional", metaC$scale)
metaC$scale <- gsub("_N", "national", metaC$scale)
metaC$scale <- gsub("Local"   , "local"   , metaC$scale)
metaC$scale <- gsub("Regional", "regional", metaC$scale)
metaC$scale <- gsub("National", "national", metaC$scale)
--------------------------------------------
## LOAD ADMIXTURE Q   
# read Q files
olofiles <- list.files(path="admixture/download_cluster/output/output2", pattern = "*.Q", full.names=T)
# q list from Q files
readQ(files=olofiles, filetype = 'auto')
# object q list 
ololist <- readQ(files=olofiles)
# the rownames of ‘qlist’ can also be modified 
# by the user by,  
# adding custom individual labels. 
# add indlab to one run
rownames(ololist[[1]]) <- metaC$sample_name
# if all runs are equal length, add indlab to all runs
if(length(unique(sapply(ololist,nrow)))==1) 
ololist <- lapply(ololist,"rownames<-",metaC$sample_name)
# show row names of all runs and all samples
lapply(ololist, rownames)[1:5]
--------------------------------------------
## DELETE EVOLUTIONARY POPULATIONS
metaC[metaC$scale=="_F", ]  
to_remove<- metaC[metaC$scale=="_F", 1] # keep only 1st column, where the samples are
to_remove
to_remove_indexes<-match(to_remove, rownames(ololist[[1]]))
y <- (ololist[[2]])
nrow(y)
y2 <- y[-to_remove_indexes, ]
nrow(y2)
nrow(y) - length(to_remove_indexes)
ololist_filtered_evol <- lapply(ololist, function(x) {x<-x[-to_remove_indexes, ]})
metaC_filtered_evol<-metaC[-to_remove_indexes, ] 
metaC_filtered_evol$sample_name
--------------------------------------------
to_keep <- metaC[metaC_filtered_evol$race=="Olotillo", ]  # , means keep all columns
to_keep
to_keep <- to_keep[to_keep$scale!="_F", 1] # , 1 keep only 1st column, where the samples are
to_keep
length(to_keep)
to_keep_indexes<-match(to_keep, rownames(ololist[[1]]))
ololist_only_olotillo<-lapply(ololist, function(x) {x<-x[to_keep_indexes, ]}) # the difference with the other way we did it is that here we dont add a "-"
nrow(ololist_only_olotillo[[2]]) 
metaC_only_olotillo<-metaC[to_keep_indexes, ]
metaC_only_olotillo$sample_name

## Create groups for plotting 
group_by_race <- metaC_filtered_evol$race
group_by_race <- as.data.frame(group_by_race)
group_by_level_race <- metaC_filtered_evol[,c(4,3)]
group_by_race_state <- metaC_filtered_evol[,c(2,4)]
group_by_scale_state <- metaC_filtered_evol[,c(2,3)]

## SUGGESTED PLOTS FOR PAPER
## Create labels, again
race <-metaC_filtered_evol$race
race <- as.data.frame(race)

## PLOT A.1, BY RACE
## Plot for 2-3-4K + grplab + color palette + labels + grplab
pA.1 <- plotQ(ololist_filtered_evol[c(2,3,4)], #2,3,4 neans we want to se k 2 3 4
              imgoutput = "join", # means to join plots from the desired Ks in a single figure
              sharedindlab = F,  # needed for imgoutput to work, for some reason
              returnplot = T, 
              basesize = 20,
              grplab = race, # group label panel
              ordergrp = TRUE, # orders individual of the same group together in the x axis
              sortind = "all",
              clustercol = c("#70D6FF","#FF70A6","#FF9770",
                             "#FFD670","#E9FF70"),
              showlegend = T, legendtextsize=6,
              showyaxis = T, indlabsize = 3, # aquí estoy parada 
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


# other version 
# Load necessary libraries
library(dplyr)
library(pophelper)
library(ggplot2)
library(gridExtra)

# Load meta files
metaA <- read.csv("data/admixture_meta.csv", header = TRUE)
write.table(metaA, "admixture_meta.txt", sep = "\t", row.names = FALSE)
metaB <- read.table("admixture_meta.txt", header = TRUE)

# Load .fam file
oloPlinksamples <- read.table("data/mixplates_filtered_2x.fam")

# Get order of V2 from oloPlinksamples and apply that order to sample_name in metaB
order <- match(oloPlinksamples$V2, metaB$sample_name)
metaC <- metaB[order, ]

# Modify metaC
metaC <- metaC %>% mutate(scale = ifelse(grepl("^CAM_E", sample_name), "national", scale))
metaC$scale[metaC$sample_name == 'CHIS_E9_1'] <- 'regional'
metaC$scale[metaC$sample_name == 'CHIS_E10_1'] <- 'regional'
metaC$scale[metaC$sample_name == 'CHIS_E23_1'] <- 'regional'
metaC$scale[metaC$sample_name == 'CHIS_E24_1'] <- 'regional'
metaC$scale[grepl("^(ROO|SLP|HGO|VER)_E", metaC$sample_name)] <- 'national'
metaC$scale <- gsub("_L", "local", metaC$scale)
metaC$scale <- gsub("_R", "regional", metaC$scale)
metaC$scale <- gsub("_N", "national", metaC$scale)
metaC$scale <- gsub("Local", "local", metaC$scale)
metaC$scale <- gsub("Regional", "regional", metaC$scale)
metaC$scale <- gsub("National", "national", metaC$scale)

# Load ADMIXTURE Q files
olofiles <- list.files(path = "data", pattern = "*.Q", full.names = TRUE)
ololist <- readQ(files = olofiles)

# Add custom individual labels
rownames(ololist[[1]]) <- metaC$sample_name
if(length(unique(sapply(ololist, nrow))) == 1) {
  ololist <- lapply(ololist, "rownames<-", metaC$sample_name)
}

# Delete evolutionary populations
to_remove <- metaC[metaC$scale == "_F", 1]
to_remove_indexes <- match(to_remove, rownames(ololist[[1]]))
ololist_filtered_evol <- lapply(ololist, function(x) {x[-to_remove_indexes, ]})
metaC_filtered_evol <- metaC[-to_remove_indexes, ]

# Keep only specific samples
to_keep <- metaC_filtered_evol[metaC_filtered_evol$race == "Olotillo", 1]
to_keep_indexes <- match(to_keep, rownames(ololist[[1]]))
ololist_only_olotillo <- lapply(ololist, function(x) {x[to_keep_indexes, ]})
metaC_only_olotillo <- metaC[to_keep_indexes, ]

# Create groups for plotting
group_by_race <- metaC_filtered_evol$race
group_by_race_state <- metaC_filtered_evol[, c(2, 4)]
group_by_scale_state <- metaC_filtered_evol[, c(2, 3)]

# Plot A.1, by race
race <- metaC_filtered_evol$race

## PLOT A.1, BY RACE
## Generate plots for k=2, k=3, and k=4
pA.1 <- plotQ(ololist_filtered_evol[c(2,3,4)], # 2,3,4 means we want to see k=2, k=3, and k=4
              imgoutput = "join", # Join plots from the desired Ks in a single figure
              sharedindlab = FALSE, # Not sharing individual labels
              returnplot = TRUE, # Return the plot for further manipulation
              basesize = 20,
              grplab = race, # Group label panel
              ordergrp = TRUE, # Orders individual of the same group together on the x axis
              sortind = "all",
              clustercol = c("#70D6FF","#FF70A6","#FF9770", "#FFD670","#E9FF70"),
              showlegend = TRUE, legendtextsize=6,
              showyaxis = TRUE, indlabsize = 3,
              showticks = TRUE, ticksize = 0.1, ticklength = 0.03,
              indlabcol = "grey",
              showindlab = TRUE, useindlab = TRUE,
              indlabspacer = 2,
              indlabheight = 0.1, # Individual labels
              sppos="right", splabsize = 4, splabcol = "black", spbgcol = "white", splab=c("K=2","K=3", "K=4"), # Strip panel, changes the name file by k
              grplabsize = 1, # Group labels
              imgtype = "tiff",
              exportplot = TRUE, height = 2, 
              exportpath = getwd())

# Remove x-axis labels and ticks for the first two plots (k=2, k=3)
pA.1$plot[[1]] <- pA.1$plot[[1]] + theme(axis.text.x = element_blank(), axis.ticks.x = element_blank())
pA.1$plot[[2]] <- pA.1$plot[[2]] + theme(axis.text.x = element_blank(), axis.ticks.x = element_blank())

# Combine the modified plots into a single plot for display
final_plot <- cowplot::plot_grid(plotlist = pA.1$plot, ncol = 1, align = 'v')

# Save the final plot
ggsave("final_combined_plot.tiff", final_plot, width = 10, height = 15, units = "in", dpi = 300)

