#!/bin/bash

# Define the path to the input file .bed
mixplates="../figure_4_admixture/data/mixplates.bed" 


# Define the output folder
out_dir="../figure_4_admixture/data/out_admixture4"


# Run admixture for K=4 10 times
for i in {1..10}; do
  echo "Execution $i for K=4"

# Run admixture for K=4
  admixture --cv $mixplates 4 | tee $out_dir/log_K4_run${i}.out
  
# Rename the .P and .Q files to prevent them from being overwritten
  mv mixplates.4.P $out_dir/mixplates_run${i}.4.P
  mv mixplates.4.Q $out_dir/mixplates_run${i}.4.Q
done
