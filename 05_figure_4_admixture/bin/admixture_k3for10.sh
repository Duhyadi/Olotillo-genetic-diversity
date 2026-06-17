#!/bin/bash

# Define the path to the input file .bed
mixplates="../figure_4_admixture/data/mixplates.bed" 


# Define the output folder
out_dir="../figure_4_admixture/data/out_admixture3"


# Run admixture for K=2 10 times
for i in {1..10}; do
  echo "Execution $i for K=3"

# Run admixture for K=3
  admixture --cv $mixplates 3 | tee $out_dir/log_K3_run${i}.out
  
# Rename the .P and .Q files to prevent them from being overwritten
  mv mixplates.3.P $out_dir/mixplates_run${i}.3.P
  mv mixplates.3.Q $out_dir/mixplates_run${i}.3.Q
done
