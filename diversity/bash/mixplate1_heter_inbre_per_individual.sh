#!/bin/bash
#SBATCH -p cluster
#SBATCH -n 5
#SBATCH --mem=10000
#SBATCH --job-name=stats #Give your job a name.
#SBATCH --error=job.%J.err #Std Error write standard error to this file
#SBATCH --output=job.%J.out #Std Out write standard output to this file
#SBATCH --mail-type=FAIL #Notify user by email when certain event types occur (BEGIN, END, FAIL, REQUEUE)
#SBATCH --mail-user=duhyadi.oliva@st.ib.unam.mx #Email for notifications from previous line


bin="/LUSTRE/Genetica/common/olotillo/olotilloGBS/bin"
meta="/LUSTRE/Genetica/common/olotillo/olotilloGBS/meta"
data="/LUSTRE/Genetica/common/olotillo/olotilloGBS/genetic/"
out="/LUSTRE/Genetica/common/olotillo/olotilloGBS/out60g7" #Just for the VCF and PLINK file
mixplates="/LUSTRE/Genetica/common/olotillo/olotilloGBS/out60g7/mixplates_filtered_2x.vcf.gz"
project="mixII"


#The following code is used to calculate observed and expected homozygosity, number of sites and F
vcftools --gzvcf $mixplates --het --out $out/${project}





