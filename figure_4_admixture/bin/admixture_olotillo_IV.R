
# Title: Plot admixture with Pophelper 2.3.1.
# Star date: Fri 8/February/2024. Coacalco, Mexico.
# Previous modification: Wed 22/Oct/2025. Versoix, Switzerland (17:13 PM) by Duhyadi.   
# Last modification: Thu 23/Oct/2025. Versoix, Switzerland (13:54 PM) by Duhyadi.   
# Authors: Duhyadi Oliva García & Alicia Mastretta Yanes.

#--------
# Tutorial for pophelper: https://www.royfrancis.com/pophelper/articles/
# Argument details: https://www.royfrancis.com/pophelper/reference/plotQ.html
# Additional information: https://www.biostars.org/p/9481527/
#--------

#--------
# LOAD LIBRARIES
library(dplyr)
library(ggplot2)
library(cowplot)
library(gridExtra)
library(pophelper) # processing output come from ADMIXTURE 
## Note: the following form was used to installl pophelper,
## with the new version of R, January 3, 2025:
## remotes::install_github('royfrancis/pophelper')
#--------

#--------
# --- Load the package here (for reproducible routes) ----------------------
if (requireNamespace("here", quietly = TRUE)) {
  setwd(here::here())
  message("📂  Working directory set to: ", getwd())
} else {
  stop("⚠️ The 'here' package is not installed. Execute install.packages('here')")
}
#--------

#--------
# LOAD DATA
# --- Load txt and fam data -----------------------------------------
meta <- read.table("figure_4_admixture/meta/admixture_meta.txt", 
                   header = TRUE, sep = "\t", stringsAsFactors = FALSE)
class(meta)
oloPlinksamples <- read.table("figure_4_admixture/file_plink/mixplates.fam") # file fam
# --- Load admixture Q -----------------------------------------
olofiles <- list.files(path="figure_4_admixture/file_plink/out_admixture2", 
                       pattern = "*.Q", full.names=T) # read Q files
readQ(files=olofiles, filetype = 'auto') # q list from Q files
ololist <- readQ(files=olofiles) # object q list 
#--------

#--------
# CV, ESTIMATE OPTIMAL K
# Read K error
k.error <- read.delim ("figure_4_admixture/file_plink/olotillo_Kerror.txt", header = F, sep = ":")
rownames(k.error)<- c("k=1", "k=2", "k=3", "k=4", "k=5")
# Plot K error, from 1 to 5
e.plot <- ggplot(data=k.error, aes(x=1:5, y=V2)) + geom_point() + geom_line()
e.plot + xlab("k") + ylab("Error")
#--------

#--------
# SORT SAMPLE NAME ACCORDING TO V2, IN METAC
# Get order of V2 from oloPlinksamples and, 
# apply that order to sample_name in meta
order <- match(oloPlinksamples$V2, meta$sample_name)
meta <- meta[order, ]
class(meta)
#--------

#--------
# ADD SCALE CATEGORY DEPENDING ON THE STATE OF ORIGIN TO METADATA
meta <- meta %>%
  mutate(scale = ifelse(grepl("^CAM_E", sample_name), "national", scale))
# The following from Chiapas by hand, one by one 
# CHIS_E9_1  + CHIS_E10_1 = regional      # origin, Hugo Perales. R. 
# CHIS_E23_1 + CHIS_E24_1 = regional      # origin, Hugo Perales. R.
meta$scale[meta$sample_name == 'CHIS_E9_1'  ]  <- 'regional'
meta$scale[meta$sample_name == 'CHIS_E10_1' ]  <- 'regional'
meta$scale[meta$sample_name == 'CHIS_E23_1' ]  <- 'regional'
meta$scale[meta$sample_name == 'CHIS_E24_1' ]  <- 'regional'
# Update the "scale" variable for inputs starting, 
# with "ROO_E", "SLP_E", "HGO_E" y "VER_E"
meta$scale[grepl("^(ROO|SLP|HGO|VER)_E", meta$sample_name)] <- 'national'
# Replace all instances of "_" with local, regional and national 
# in the column scale.
meta$scale <- gsub("_L", "local"   , meta$scale)
meta$scale <- gsub("_R", "regional", meta$scale)
meta$scale <- gsub("_N", "national", meta$scale)
# Change the capital letter at the beginning
meta$scale <- gsub("Local"   , "local"   , meta$scale)
meta$scale <- gsub("Regional", "regional", meta$scale)
meta$scale <- gsub("National", "national", meta$scale)
#--------

#--------
# ADD BETTER SAMPLE NAMES TO QLIST ADMIXTURE DATA
# The rownames of ‘qlist’ can also be modified 
# by the user by, adding custom individual labels,  
# add indlab to one run
rownames(ololist[[1]]) <- metaC$sample_name
# if all runs are equal length, add indlab to all runs
if(length(unique(sapply(ololist,nrow)))==1) 
  ololist <- lapply(ololist,"rownames<-",metaC$sample_name)
# show row names of all runs and all samples
lapply(ololist, rownames)[1:5]

##### DELETE XXXXX SAMPLE DUE TO INCOMPLETE METADATA
# sample to remove
metaC[metaC$sample_name=="XXX_XXX_14", ]

# id to remove
to_remove<- metaC[metaC$sample_name=="XXX_XXX_14", 1] # keep only 1st column, where the sample is
to_remove
# since in the df from the list of admixture results the sample names are 
# in the rownames (hence not a df variable), 
# get the index (which number of row is it)
to_remove_indexes<-match(to_remove, rownames(ololist[[1]]))

# delete rows with sample to_remove in all dfs within the list of results
ololist<- lapply(ololist, function(x) {x<-x[-to_remove_indexes, ]})

# how many samples remained? (most be -1 than original nrow)
nrow((ololist[[2]]))

## We also need to create a new dataframe with the metadata excluding the "XXX_XXX_14" sample
metaC<-metaC[-to_remove_indexes, ] # we can use the same indexes since samples are in the same order
# check sample names
metaC

# add row names again
ololist[[1]]<-as.data.frame(ololist[[1]]) #this is needed because the 1st matrix is converted to numeric in the previous step for some reason, thus not having rownames
rownames(ololist[[1]]) <- metaC$sample_name
if(length(unique(sapply(ololist,nrow)))==1) 
  ololist <- lapply(ololist,"rownames<-",metaC$sample_name)
# check 
rownames(ololist[[1]])

###### DELETE EVOLUTIONARY POPULATIONS

## These are the samples representing the F1 of the evolutionary 
## populations.
## We are deleting them because the objective of this paper is 
## describing the distribution of genetic diversity within Olotillo.
## The F samples would be analyses at a different stage in another paper.

## Which are the evolutionary pops samples? The ones labelled with _F 
## in scale:
metaC[metaC$scale=="_F", ]
# we can see they also all start with GAV. Lets create an object 
# whit those samples
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
y <- (ololist[[1]]) # save the list 2 into an object as a single df
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


###### DELETE OTHER RACES, KEEP ONLY OLOTILLO
## Here we filter similarly than above, but instead of removing 
## what we dont want, we will keep what we want (Olotillo)

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

# add row names again
ololist_only_olotillo[[1]]<-as.data.frame(ololist_only_olotillo[[1]]) #this is needed because the 1st matrix is converted to numeric in the previous step for some reason, thus not having rownames
rownames(ololist_only_olotillo[[1]]) <- metaC_only_olotillo$sample_name
if(length(unique(sapply(ololist_only_olotillo,nrow)))==1) 
  ololist_only_olotillo <- lapply(ololist_only_olotillo,"rownames<-",metaC_only_olotillo$sample_name)
# check 
rownames(ololist_only_olotillo[[1]])



##### PLOTS for paper


#### A sortind = "all" (nicer order of the colors), but remove ALL individual labels. 
# This will show the differences in gen cluster structure within each race.

## Create groups for plotting 
race <- metaC_filtered_evol$race
race <- as.data.frame(race)

# Plot 
pA <- plotQ(ololist_filtered_evol[c(2,3,4)], # 2,3,4 means we want to see k 2,3,4
            imgoutput = "join", # join plots from the desired Ks in a single figure
            sharedindlab = F,  # needed for imgoutput to work, for some reason
            showindlab=F,
            useindlab=F, # use sample name (row names) instead of numbers
            returnplot = T, 
            grplab = race, # group label panel
            ordergrp = T, 
            subsetgrp=c("Olotillo","Dzit-bacal","Mix","Tuxpeño"),   # orders individuals of the same group together on the x-axis
            sortind = "all",
            clustercol = c("#70D6FF","#FF70A6","#FF9770",
                           "#FFD670","#E9FF70"),
            showlegend = F, # Alicia: I don't think this is needed, it takes too much space
           # legendlab =c("group1","group2","group3","group4"), # group labels name
           # legendtextsize = 25, legendkeysize = 25, # group labels size 
           # legendmargin = c(10,10,10,0), legendrow = 4, # group labels margin and row
            showticks = T, ticksize = 0.3, ticklength = 0.3, #marcas de posición 
            indlabspacer = 21, # space between figures (between ks) 
            showyaxis = F, # Alicia: I think it looks better w/o the y numbers, hence commenting ind* arguments below
          # indlabcol = "grey50", # color group and y-x axis
          # indlabsize = 40, # y-axis
            divsize = 3, # divider line, groups (white dotted line)
            splabsize = 45, splabcol = "black", # strip panel  
            splab = c("K=2", "K=3", "K=4"), # strip panel, changes the name file by k
            panelspacer = 1 , # panel spacer, space between panels 
            linesize = 4, # label line
            pointsize = 20,  # label points
            grplabsize = 15, grplabjust = .5, grplabangle=-90, #race size and position
            grplabheight = 6, # size of the grp label area
            grplabpos= 0.3,
            imgtype = "jpeg",
            exportplot = T, height = 8, width = 54, units = "in", dpi = 300,
            outputfilename ="A_keep_sortind_all",
            basesize = 11,
            panelratio = c(4, 2),
            exportpath = getwd())



##### Plot C Make another plot only for Olotillo (excluding the other races)
# showing the states as grouping variable and showing the labels. 
# This looks better since there would be less samples and the group variable will be states.

# we will use the *_only_olotillo we created before

## Create groups for plotting 
# state
state <- metaC_only_olotillo$state
state <- as.data.frame(state)
# shorter name for San Luis Potosí
state[state$state=="San Luis Potosí", ] <-"SLP"

# plot
pC_state <- plotQ(ololist_only_olotillo[c(2,3,4)], # 2,3,4 means we want to see k 2,3,4
            imgoutput = "join", # join plots from the desired Ks in a single figure
            returnplot = T, 
            showindlab=F,
            grplab = state, # group label panel
            subsetgrp=c("Chiapas", "Oaxaca", "Guerrero", "Nayarit", "Hidalgo" ,"SLP", "Veracruz"), # preferrer order
            clustercol = c("#70D6FF","#FF70A6","#FF9770",
                           "#FFD670","#E9FF70"),
            showlegend = F, # Alicia: I don't think this is needed, it takes too much space
            # legendlab =c("group1","group2","group3","group4"), # group labels name
            # legendtextsize = 25, legendkeysize = 25, # group labels size 
            # legendmargin = c(10,10,10,0), legendrow = 4, # group labels margin and row
            showticks = T, ticksize = 0.3, ticklength = 0.3, #marcas de posición 
            indlabspacer = 21, # space between figures (between ks) 
            showyaxis = F, 
            indlabsize = 40, # y-axis
            divsize = 3, # divider line, groups (white dotted line)
            splabsize = 45, splabcol = "black", # strip panel  
            splab = c("K=2", "K=3", "K=4"), # strip panel, changes the name file by k
            panelspacer = 1 , # panel spacer, space between panels 
            linesize = 4, # label line
            pointsize = 20,  # label points
            grplabsize = 15, grplabjust = .5, grplabangle=-90, #lab size and position
            grplabheight = 3, # size of the grp label area
            grplabpos= 0.3,
            imgtype = "jpeg",
            exportplot = T, height = 8, width = 54, units = "in", dpi = 300,
            outputfilename ="C_only_olotillo_states",
            basesize = 11,
            panelratio = c(4, 2),
            exportpath = getwd())


### Option C with state + subdivided by scale

## re-order everything by states
# This is needed as explained here https://github.com/royfrancis/pophelper/issues/5

## meta
# make a copy
metaC_orderedstate<-metaC_only_olotillo
# change state levels to desired order
metaC_orderedstate$state <- factor(metaC_orderedstate$state, levels = c("Chiapas", "Oaxaca", "Guerrero", "Nayarit", "Hidalgo" ,"San Luis Potosí", "Veracruz"))
# change scale levels to desired order
metaC_orderedstate$scale <- factor(metaC_orderedstate$scale, levels = c("local", "regional", "national"))
# order first by state then by scale within it
metaC_orderedstate <- metaC_orderedstate[order(metaC_orderedstate$state, metaC_orderedstate$scale), ]


#qfile
to_keep<-metaC_orderedstate$sample_name
# get indexes in new order
to_keep_indexes<-match(to_keep, rownames(ololist_only_olotillo[[2]]))
# Keep samples of olotillo in all df
ololist_orderedstate<-lapply(ololist_only_olotillo, function(x) {x<-x[to_keep_indexes, ]}) 


## for grouping
#scale and state
scale_state <- metaC_orderedstate[,c(2,3)]
scale_state$scale<-as.character(scale_state$scale) # must be char for grplab to work
scale_state$state<-as.character(scale_state$state)

# shorter name for San Luis Potosí
scale_state[scale_state$state=="San Luis Potosí", 1] <-"SLP"


# plot
pC_state_scale <- plotQ(ololist_only_olotillo[c(2,3,4)], # 2,3,4 means we want to see k 2,3,4
                  imgoutput = "join", # join plots from the desired Ks in a single figure
                  returnplot = T, 
                  showindlab=F,
                  useindlab=T, # use sample name (row names) instead of numbers
                  grplab = scale_state, # group label panel
                  selgrp = "state", # we want to order by this group
             #     subsetgrp=c("local", "regional", "national"), # prefered order
                  clustercol = c("#70D6FF","#FF70A6","#FF9770",
                                 "#FFD670","#E9FF70"),
                  showlegend = F, # Alicia: I don't think this is needed, it takes too much space
                  # legendlab =c("group1","group2","group3","group4"), # group labels name
                  # legendtextsize = 25, legendkeysize = 25, # group labels size 
                  # legendmargin = c(10,10,10,0), legendrow = 4, # group labels margin and row
                  showticks = T, ticksize = 0.3, ticklength = 0.3, #marcas de posición 
                  indlabspacer = 21, # space between figures (between ks) 
                  showyaxis = F, 
                  indlabsize = 40, # y-axis
                  divsize = 3, # divider line, groups (white dotted line)
                  splabsize = 45, splabcol = "black", # strip panel  
                  splab = c("K=2", "K=3", "K=4"), # strip panel, changes the name file by k
                  panelspacer = 1 , # panel spacer, space between panels 
                  linesize = 4, # label line
                  pointsize = 20,  # label points
                  grplabsize = 15, grplabjust = .5, grplabangle=-90, #lab size and position
                  grplabheight = 4, # size of the grp label area
                  grplabpos= 0.3,
                  imgtype = "jpeg",
                  exportplot = T, height = 8, width = 54, units = "in", dpi = 300,
                  outputfilename ="C_only_olotillo_states_scale",
                  basesize = 11,
                  panelratio = c(4, 2),
                  exportpath = getwd())



