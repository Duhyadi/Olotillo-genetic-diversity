#!/bin/bash

# Define the path to the input file .bed
mixplates="../figure_4_admixture/data/mixplates.bed" 

# Define the output folder
out_dir="/home/duhyadi/Documents/paper1/admixture/file_plink/out_admixture2" #switch to your own work path


# Run admixture for K=2 10 times
for i in {1..10}; do
  echo "Ejecución $i para K=2"

# Run admixture for K=2
  admixture --cv $mixplates 2 | tee $out_dir/log_K2_run${i}.out
  
# Rename the .P and .Q files to prevent them from being overwritten.
  mv mixplates.2.P $out_dir/mixplates_run${i}.2.P
  mv mixplates.2.Q $out_dir/mixplates_run${i}.2.Q
done
