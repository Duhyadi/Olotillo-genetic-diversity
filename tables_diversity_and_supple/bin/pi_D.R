
# Title: pi & D with vcftools. R was used to display the results of vcftools.
# Star date: Thu 11/Mars/2025. Verxoix, Switzerland (11:16 AM) by Duhyadi. 
# Previous modification: Thu 03/Apr/2025. Verxoix, Switzerland (11:16 AM) by Duhyadi.
# Last modification: Thu 18/Dec/2025. Granada, Spain (15:58 PM) by Duhyadi.   
# Authors: Duhyadi Oliva-García and Alicia Mastretta-Yanes 
# Used file: "mixplates_filtered_2x.vcf.gz"

getwd()
setwd("/set_workingdirectory/")

## LIBRARIES 
library(ggplot2)
library(dplyr)
library(tidyr)
library(ggplot2)
library(car)
library(ggstatsplot)


#*********************************************************#
            #**pi mean and median by race**#
#*********************************************************#

# Calculate the medians of pi x race for Table 2

# Dzitbacal
# median Dzitbacal pi 
pi.dzi <- read.table("../mixII_all_samples_10kb_dzitbacal.windowed.pi",header=T)
# summary with st without scientific notation
summary(pi.dzi$PI)
sd(pi.dzi$PI, na.rm = TRUE) 
# summary with st in scientific notation
summary_stats <- c(
  summary(pi.dzi$PI),
  DesviacionEstandar = format(sd(pi.dzi$PI, na.rm = TRUE), scientific = TRUE)
)
print(summary_stats)

# Mix
# median Mix pi 
pi.mix <- read.table("../mixII_all_samples_10kb_mix.windowed.pi",header=T)
# summary with st without scientific notation
summary(pi.mix$PI)
sd(pi.mix$PI, na.rm = TRUE) 
# summary with st in scientific notation
summary_stats <- c(
  summary(pi.mix$PI),
  DesviacionEstandar = format(sd(pi.mix$PI, na.rm = TRUE), scientific = TRUE)
)
print(summary_stats)

# Olotillo
# median Olotillo pi
pi.olo <- read.table("../mixII_all_samples_10kb_olotillo.windowed.pi",header=T)
# summary with, without scientific notation 
summary(pi.olo$PI)
sd(pi.olo$PI, na.rm = TRUE) 

# Tuxpeño
# median Tuxpeño pi
pi.tux <- read.table("../meta/mixII_all_samples_10kb_tuxpeño.windowed.pi",header=T)
# summary with st, without scientific notation 
summary(pi.tux$PI)
sd(pi.tux$PI, na.rm = TRUE) 


#*********************************************************#
         #**pi mean and median by scale**#
#*********************************************************#

# Calculate the medians of pi x race for Table 2

# Local
# local pi 
local <- read.table("../mixII_all_samples_10kb_local.windowed.pi",header=T)
# summary with st, without scientific notation 
summary(local$PI)
sd(local$PI, na.rm = TRUE) 

# Regional
# regional pi 
regional <- read.table("../meta/mixII_all_samples_10kb_regional.windowed.pi",header=T)
# summary with st, without scientific notation 
summary(regional$PI)
sd(regional$PI, na.rm = TRUE) 

# National 
# regional pi 
national <- read.table("../mixII_all_samples_10kb_national.windowed.pi",header=T)
# summary with st, without scientific notation 
summary(national$PI)
sd(national$PI, na.rm = TRUE) 


#########################################################
#*********************************************************#
            #**D mean and median by race**#
#*********************************************************#
# Dzitbacal
# median Dzitbacal Tajima, D. 
d.dzi <- read.table("../mixII_all_samples_10kb_dzitbacal.Tajima.D",header=T)
# summary with st, without scientific notation 
summary(d.dzi$TajimaD)
sd(d.dzi$TajimaD, na.rm = TRUE) 

# summary with st, in scientific notation
summary_stats <- c(
  summary(d.dzi$TajimaD),
  DesviacionEstandar = format(sd(d.dzi$TajimaD, na.rm = TRUE), scientific = TRUE)
)
print(summary_stats)

# Mix
# Median Mix Tajima, D. 
d.mix <- read.table("cluster_conabio_2024/out60g7/mixII_all_samples_10kb_mix.Tajima.D",header=T)
# summary with st, without scientific notation
summary(d.mix$TajimaD)
sd(d.mix$TajimaD, na.rm = TRUE)
# summary with st, in scientific notation
summary_stats <- c(
  summary(d.mix$TajimaD),
  DesviacionEstandar = format(sd(d.mix$TajimaD, na.rm = TRUE), scientific = TRUE)
)
print(summary_stats)

# Olotillo
# median Olotillo Tajima, D. 
d.olo <- read.table("cluster_conabio_2024/out60g7/mixII_all_samples_10kb_olotillo.Tajima.D",header=T)
# summary with st, without scientific notation 
summary(d.olo$TajimaD)
sd(d.olo$TajimaD, na.rm = TRUE)
# summary with st, in scientific notation
summary_stats <- c(
  summary(d.olo$TajimaD),
  DesviacionEstandar = format(sd(d.olo$TajimaD, na.rm = TRUE), scientific = TRUE)
)
print(summary_stats)

# Tuxpeño
# median Tuxpeño Tajima, D. 
d.tux <- read.table("../mixII_all_samples_10kb_tuxpeño.Tajima.D",header=T)
# summary with st, without scientific notation
 summary(d.tux$TajimaD)
sd(d.tux$TajimaD, na.rm = TRUE)
# summary with st, in scientific notation
summary_stats <- c(
  summary(d.tux$TajimaD),
  DesviacionEstandar = format(sd(d.tux$TajimaD, na.rm = TRUE), scientific = TRUE)
)
print(summary_stats)
# Global average pi
# pi
all.pi <- read.table("../mixII_all_samples_10kb.windowed.pi",header=T)
# summary with st, without scientific notation
summary(all.pi$PI)
sd(all.pi$PI, na.rm = TRUE)
# D
all.D <- read.table("cluster_conabio_2024/out60g7/mixII_all_samples_10kb.Tajima.D",header=T)
# summary with st, without scientific notation 
summary(all.D$TajimaD)
sd(all.D$TajimaD, na.rm = TRUE)
# summary with st, in scientific notation
summary_stats <- c(
  summary(all.D$TajimaD),
  DesviacionEstandar = format(sd(all.D$TajimaD, na.rm = TRUE), scientific = TRUE)
)
print(summary_stats)


#*********************************************************#
             #**D mean and median by scale**#
#*********************************************************#
# Local
# median local Tajima, D. 
local <- read.table("cluster_conabio_2024/out60g7/mixII_all_samples_10kb_local.Tajima.D",header=T)
# summary with st, without scientific notation
summary(local$TajimaD)
sd(local$TajimaD, na.rm = TRUE) 
# summary with st, in scientific notation
summary_stats <- c(
  summary(local$TajimaD),
  DesviacionEstandar = format(sd(local$TajimaD, na.rm = TRUE), scientific = TRUE)
)
print(summary_stats)

# Regional
# mediana regional Tajima, D. 
regional <- read.table("../mixII_all_samples_10kb_regional.Tajima.D",header=T)
# summary with st, without scientific notation
summary(regional$TajimaD)
sd(regional$TajimaD, na.rm = TRUE) 

# summary with st, in scientific notation
summary_stats <- c(
  summary(regional$TajimaD),
  DesviacionEstandar = format(sd(regional$TajimaD, na.rm = TRUE), scientific = TRUE)
)
print(summary_stats)

# National
# median Regional Tajima, D. 
national <- read.table("../mixII_all_samples_10kb_national.Tajima.D",header=T)
# summary with st, without scientific notation
summary(national$TajimaD)
sd(national$TajimaD, na.rm = TRUE)
# summary with st, in scientific notation
summary_stats <- c(
  summary(national$TajimaD),
  DesviacionEstandar = format(sd(national$TajimaD, na.rm = TRUE), scientific = TRUE)
)
print(summary_stats)

# pi.all
pi.all <- read.table("cluster_conabio_2024/out60g7/mixII_all_samples_10kb.windowed.pi",header=T)

#The file mixxII_all_samples_10kb.windowed.pi was obtained 
#by vcftools with the following code: 
#vcftools --gzvcf $mixplates --window-pi 10000 --out $out/${project}_all_samples_10kb

## pi by races
# pi Olotillo
pi.olotillo <- read.table("../mixII_all_samples_10kb_olotillo.windowed.pi",header=T)
# pi Tuxpeño
pi.tuxpeño <- read.table("../mixII_all_samples_10kb_tuxpeño.windowed.pi",header=T)
# pi Dzit-bacal
pi.dzitbacal <- read.table("../mixII_all_samples_10kb_dzitbacal.windowed.pi",header=T)
# pi Mix
pi.mix <- read.table("../mixII_all_samples_10kb_mix.windowed.pi",header=T)

### Plot density distribution for pi.all
pi <-ggplot(pi.all, aes(PI)) + geom_density(fill = "cyan", colour= "black", alpha = 0.3)
pi + theme_light()

### Hist, pi.all
png("piH_all.png", width = 800, height = 600)  # Ajusta el tamaño
hist(pi.all$PI,br=20)
dev.off()

### Boxplot, pi.all
png("piB_all.png", width = 800, height = 600)  # Ajusta el tamaño
boxplot(pi.all$PI,ylab="diversity")
dev.off()

### Chr10, pi.all
pi.chr10 <- subset(pi.all, CHROM == "chr10")

### Chr1, pi.all
pi.chr1 <- subset(pi.all, CHROM == "chr1") 

### Chr02, pi.all
pi.chr2 <- subset(pi.all, CHROM == "chr2")

### Summary, pi chr10
summary(pi.chr10)
summary(pi.all)

### Summary, pi.all and chr10
# pi.all
summary(pi.all$PI)
mean(pi.all$PI)
sd(pi.all$PI)
# pi.chr10
summary(pi.chr10$PI)
mean(pi.chr10$PI)
sd(pi.chr10$PI)

### Plot chr10
png("chr10.png", width = 800, height = 600)  # Ajusta el tamaño
plot(pi.chr10$BIN_START,pi.chr10$PI,xlab="position",ylab="diversity")
dev.off()

### Plot chr1
png("chr1.png", width = 800, height = 600)  # Ajusta el tamaño
plot(pi.chr1$BIN_START,pi.chr1$PI,xlab="position",ylab="diversity")
dev.off()

### Plot chr2
png("chr2.png", width = 800, height = 600)  # Ajusta el tamaño
plot(pi.chr2$BIN_START,pi.chr2$PI,xlab="position",ylab="diversity")
dev.off()

## pi by scales 
## changes head scales 
# pi local
pi.local <- read.table("../mixII_all_samples_10kb_local.windowed.pi",header=T)
colnames(pi.local) <- c("chromL", "binstarL", "binendL", "nvariantsL", "piL")
# pi regional
pi.regional <- read.table("../mixII_all_samples_10kb_regional.windowed.pi",header=T)
colnames(pi.regional) <- c("chromR", "binstarR", "binendR", "nvariantsR", "piR")
# pi national 
pi.national <- read.table("../mixII_all_samples_10kb_national.windowed.pi",header=T)
colnames(pi.national) <- c("chromN", "binstarN", "binendN", "nvariantsN", "piN")

# Local 
pi.local$chromL <- as.character(pi.local$chromL)  # CHROM as a character
pi.local$binstarL <- as.numeric(pi.local$binstarL)  # BIN_START as a number
pi.local$binendL <- as.numeric(pi.local$binendL)  # BIN_END as a number 
pi.local$nvariantsL <- as.numeric(pi.local$nvariantsL)  # N_VARIANTS as a number 
pi.local$piL <- as.numeric(pi.local$piL)  # PI as a number (with decimals and exponents if any)
  

# Regional  
pi.regional$chromR <- as.character(pi.regional$chromR) # CHROM as a character
pi.regional$binstarR <- as.numeric(pi.regional$binstarR) # BIN_START as a number
pi.regional$binendR <- as.numeric(pi.regional$binendR)   # BIN_END as a number
pi.regional$nvariantsR <- as.numeric(pi.regional$nvariantsR) # N_VARIANTS as a number
pi.regional$piR <- as.numeric(pi.regional$piR) # PI as a number (with decimals and exponents if any) 
 
# National 
pi.national$chromN <- as.character(pi.national$chromN)  # CHROM as a character
pi.national$binstarN <- as.numeric(as.character(pi.national$binstarN)) # BIN_START as a number 
pi.national$binendN <- as.numeric(as.character(pi.national$binendN))  # BIN_END as a number
pi.national$nvariantsN <- as.numeric(as.character(pi.national$nvariantsN)) # N_VARIANTS as a number 
pi.national$piN <- as.numeric(as.character(pi.national$piN)) # PI as a number (with decimals and exponents if any) 

# Join pi.local y pi.regional
pi.merged <- full_join(pi.local, pi.regional, 
                       by = c("chromL" = "chromR", "binstarL" = "binstarR", "binendL" = "binendR"))

# Join with pi.national
pi.total <- full_join(pi.merged, pi.national, 
                      by = c("chromL" = "chromN", "binstarL" = "binstarN", "binendL" = "binendN"))

# Verify the final structure
str(pi.total)

# Show first rows
head(pi.total)


#----------- 
# Convert from wide format to long format
pi.long <- pi.total %>%
pivot_longer(cols = c(piL, piR, piN),    # select the columns to convert
               names_to = "scale",       # new column indicating the scale
               values_to = "pi")         # new column with the pi values
# Replace the names in the scale column
pi.long <- pi.long %>%
  mutate(scale = dplyr::recode(as.character(scale), 
                               "piL" = "Local",
                               "piR" = "Regional",
                               "piN" = "National"))
# Verify the final structure
str(pi.long)
# Show first rows
head(pi.long)


#--------------------------
# NORMALITY TEST, PI
#--------------------------
  
ggplot(pi.long, aes(x = pi, fill = scale)) +
  geom_histogram(bins = 30, alpha = 0.7, position = "identity") +
  labs(title = "Histogram of pi", x = "value of pi", y = "frequency") +
  scale_fill_manual(values = c("local" = "purple", "regional" = "green", "national" = "blue")) +
  theme_minimal()  

#  
ggplot(pi.long, aes(sample = pi, color = scale)) +
  stat_qq() +
  stat_qq_line() +
  labs(title = "Q-Q graph of pi", x = "theoretical quantiles", y = "quantiles of pi") +
  theme_minimal()  

#
ggplot(pi.long, aes(sample = pi, color = scale)) +
  stat_qq() +
  stat_qq_line() +
  scale_color_manual(values = c("local" = "purple", "regional" = "green", "national" = "blue")) + 
  labs(title = "Q-Q graph of pi", 
       x = "theoretical quantiles", 
       y = "quantiles of pi", 
       color = "scale") +  # Etiqueta para la leyenda
  theme_minimal()

#
ggplot(pi.long, aes(x = pi, fill = scale)) +
  geom_histogram(bins = 30, alpha = 0.7, color = "black") +
  scale_fill_manual(values = c("local" = "purple", "regional" = "green", "national" = "blue")) +
  facet_wrap(~scale, scales = "free") +  # divide the image into sub-graphs by 'scale'
  labs(title = "Histogram pi by scale", 
       x = "value of pi", 
       y = "frequency") +
  theme_minimal()

#
ggplot(pi.long, aes(x = pi, fill = scale, color = scale)) +
  geom_density(alpha = 0.4, linewidth = 1.2) +  # density with transparency and thick lines
  scale_fill_manual(values = c("local" = "purple", "regional" = "green", "national" = "blue")) +
  scale_color_manual(values = c("local" = "purple", "regional" = "green", "national" = "blue")) +
  labs(title = "Pi Density Distribution by Scale", 
       x = "value of pi", 
       y = "density",
       fill = "scale", 
       color = "scale") +
  theme_minimal()
#-----------

# Code for the Kolmogorov-Smirnov normality test
ks_test <- ks.test(pi.long$pi, "pnorm", mean(pi.long$pi, na.rm = TRUE), sd(pi.long$pi, na.rm = TRUE))
# Show result
ks_test
# Apply Levene's test
levene_test <- leveneTest(pi ~ scale, data = pi.long)
# Show result 
levene_test

#-----------

ggsave(# save as PNG
  filename = "pi_Npar.png", 
  ggbetweenstats(
    data = pi.long,
    x    = scale,
    y    = pi,
    outlier.tagging = T,
    type = "nonparametric",
      p.adjust.method = "hom",
      pairwise.display = "all",
      var.equal = FALSE
    ),
    width  =   6,  # image width
    height =   6,  # high image
    dpi    = 300   # pixel image
  )

#-----------

# Ensure the order of the groups
pi.long$scale <- factor(pi.long$scale, levels = c("local", "regional", "national"))

# Create and save the chart
  ggsave(
    filename = "pi_Npar_custom.png",   
    plot = ggbetweenstats(
      data = pi.long,
      x = scale,
      y = pi,
      outlier.tagging = TRUE,
      type = "nonparametric",
      p.adjust.method = "holm",
      pairwise.display = "all",
      var.equal = FALSE,
      
# Customize dot colors
ggplot.component = ggplot2::scale_color_manual(
        values = c("local" = "purple", "regional" = "green", "national" = "dodgerblue")
      ),

# Custom labels (without expression(), because there are no mathematical symbols)
      xlab = "Scale",
      ylab = expression(pi),
      title = expression("Comparison of " * pi* " between scales" ),
      caption = expression("Note: " * pi * " represents the nucleotide diversity.")
    ),
    width = 10,
    height = 7,
    dpi = 300
  )  
  
#*********************************************************#
                    #**D**#
#*********************************************************#

# Plotting Tajima’s D
taj.all <- read.table("../mixII_all_samples_10kb.Tajima.D",header=T)    
taj <-ggplot(taj.all, aes(TajimaD)) + geom_density(fill = "purple", colour= "black", alpha = 0.3)
taj + theme_light()  
  
# D by races 

# D Dzit-bacal
taj.dzitbacal <- read.table("../mixII_all_samples_10kb_dzitbacal.Tajima.D",header=T)

# D Mix
taj.mix <- read.table("../mixII_all_samples_10kb_mix.Tajima.D",header=T)

# D olotillo 
taj.olotillo <- read.table("../mixII_all_samples_10kb_olotillo.Tajima.D",header=T)

# D Tuxpeño
taj.tuxpeño <- read.table("../mixII_all_samples_10kb_tuxpeño.Tajima.D",header=T)

# Summary all
summary(taj.all$TajimaD)

# D Dzit-bacal
summary(taj.dzitbacal$TajimaD)

# Mix 
summary(taj.mix$TajimaD)

# Olotillo
summary(taj.olotillo$TajimaD)

# Tuxpeño
summary(taj.tuxpeño$TajimaD)

# D by scale

# D local
taj.local <- read.table("../mixII_all_samples_10kb_local.Tajima.D",header=T)

# D regional
taj.regional <- read.table("../mixII_all_samples_10kb_regional.Tajima.D",header=T)

# D national
taj.national <- read.table("../mixII_all_samples_10kb_national.Tajima.D",header=T)

# local
summary(taj.local$TajimaD)
# regional
summary(taj.regional$TajimaD)
# national
summary(taj.national$TajimaD)

hist(taj.all$TajimaD,br=20)
taj.chr10 <- subset(taj.all, CHROM == "chr10")
taj.chr2 <- subset(taj.all, CHROM == "chr2")
png("chr10T.png", width = 800, height = 600) 
plot(taj.chr10$BIN_START,taj.chr10$TajimaD,xlab="position",ylab="Tajima's D")
dev.off()
png("chr2T.png", width = 800, height = 600) 
plot(taj.chr2$BIN_START,taj.chr2$TajimaD,xlab="position",ylab="Tajima's D")
dev.off()

########################
########JOIN############

# Changes head scales 

# D local
taj.local <- read.table("../mixII_all_samples_10kb_local.Tajima.D",header=T)
colnames(taj.local) <- c("chromL", "binstarL", "nSNPSL", "tajimaDL")

# Reload
# D regional
taj.regional <- read.table("../mixII_all_samples_10kb_regional.Tajima.D",header=T)
colnames(taj.regional) <- c("chromR", "binstarR", "nSNPSR", "tajimaDR")

# D national
taj.national <- read.table("../mixII_all_samples_10kb_national.Tajima.D",header=T)
colnames(taj.national) <- c("chromN", "binstarN", "nSNPSN", "tajimaDN")

# Local 
taj.local$chromL <- as.character(taj.local$chromL)  # CHROM as a character
taj.local$binstarL <- as.numeric(taj.local$binstarL)  # BIN_START as a number
taj.local$nSNPSL <- as.numeric(taj.local$nSNPSL)  # as a number
taj.local$tajimaDL <- as.numeric(taj.local$tajimaDL)  # Tajima D as a number (with decimals and exponents if any)


# Regional 
taj.regional$chromR <- as.character(taj.regional$chromR)    # CHROM as a character 
taj.regional$binstarR <- as.numeric(taj.regional$binstarR)  # BIN_START as a number
taj.regional$nSNPSR <- as.numeric(taj.regional$nSNPSR)      # as a number
taj.regional$tajimaDR <- as.numeric(taj.regional$tajimaDR)  # Tajima D as a number (with decimals and exponents if any)

# National 
taj.national$chromN <- as.character(taj.national$chromN)    # CHROM as a character
taj.national$binstarN <- as.numeric(taj.national$binstarN)  # BIN_START as a number
taj.national$nSNPSN <- as.numeric(taj.national$nSNPSN)      # as a number  
taj.national$tajimaDN <- as.numeric(taj.national$tajimaDN)  # Tajima D as a number (with decimals and exponents if any)

# Join taj.local and taj.regional
taj.merged <- full_join(taj.local, taj.regional, 
                       by = c("chromL" = "chromR", "binstarL" = "binstarR", "nSNPSL" = "nSNPSR"))

# Join with taj.national
taj.total <- full_join(taj.merged, taj.national, 
                      by = c("chromL" = "chromN", "binstarL" = "binstarN", "nSNPSL" = "nSNPSN"))

# Convert from wide format to long format
taj.long <- taj.total %>%
  pivot_longer(cols = c(tajimaDL, tajimaDR, tajimaDN),  # select the columns to convert
               names_to = "scale",                      # new column indicating the scale
               values_to = "tajimaD")                   # new column with the values of tajimaD

# Replace the names in the scale column
taj.long <- taj.long %>%
  mutate(scale = dplyr::recode(as.character(scale), 
                               "tajimaDL" = "Local",
                               "tajimaDR" = "Regional",
                               "tajimaDN" = "National"))

#----------------------------------
  # NORMALITY TEST, TAJIMA D
#----------- ---------------------- 
  
ggplot(taj.long, aes(x = tajimaD, fill = scale)) +
  geom_histogram(bins = 30, alpha = 0.7, position = "identity") +
  labs(title = "Histogram D", x = "value D", y = "frequency") +
  scale_fill_manual(values = c("Local" = "purple", "Regional" = "green", "National" = "blue")) +
  theme_minimal()  

# Tajima Q-Q graph 
ggplot(taj.long, aes(sample = tajimaD, color = scale)) +
  stat_qq() +
  stat_qq_line() +
  labs(title = "Tajima Q-Q graph", x = "theoretical quantiles", y = "quantiles of pi") +
  theme_minimal()  

# Tajima's Q-Q graph in color
ggplot(taj.long, aes(sample = tajimaD, color = scale)) +
  stat_qq() +
  stat_qq_line() +
  scale_color_manual(values = c("Local" = "purple", "Regional" = "green", "National" = "blue")) + 
  labs(title = "Tajima's Q-Q graph, D", 
       x = "theoretical quantiles", 
       y = "Tajima quantiles, D", 
       color = "scale") +  # label for legend
  theme_minimal()

#
ggplot(taj.long, aes(x = tajimaD, fill = scale)) +
  geom_histogram(bins = 30, alpha = 0.7, color = "black") +
  scale_fill_manual(values = c("Local" = "purple", "Regional" = "green", "National" = "blue")) +
  facet_wrap(~scale, scales = "free") +  # Divide the image into sub-graphs by 'scale'
  labs(title = "Tajima Histogram by Scale", 
       x = "tajima Value", 
       y = "frequency") +
  theme_minimal()


#
ggplot(taj.long, aes(x = tajimaD, fill = scale, color = scale)) +
  geom_density(alpha = 0.4, linewidth = 1.2) +  # density with transparency and thick lines
  scale_fill_manual(values = c("Local" = "purple", "Regional" = "green", "National" = "blue")) +
  scale_color_manual(values = c("Local" = "purple", "Regional" = "green", "National" = "blue")) +
  labs(title = "Tajima Density Distribution by Scale", 
       x = "tajima value", 
       y = "density",
       fill = "scale", 
       color = "scale") +
  theme_minimal()

# Code for the Kolmogorov-Smirnov normality test
ks_test <- ks.test(taj.long$tajimaD, "pnorm", mean(taj.long$tajimaD, na.rm = TRUE), sd(taj.long$tajimaD, na.rm = TRUE))
# Show result
ks_test
# Apply Levene's test
levene_test <- leveneTest(tajimaD ~ scale, data = taj.long)
# Show result
levene_test









