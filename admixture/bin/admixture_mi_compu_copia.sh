#!/bin/bash

# entry and exit routes
mixplates="/home/duhyadi/Documents/paper1/admixture/download_cluster/file_plink/mixplates.bed"
out="/home/duhyadi/Documents/paper1/admixture/download_cluster/file_plink/"

# run admixture for K=2 to k=4 10x 
for K in {2..4}; do
 for i in {1..10}; do
 admixture --cv $mixplates $K | tee log_K${K}_run${i}.out;
 done
done



