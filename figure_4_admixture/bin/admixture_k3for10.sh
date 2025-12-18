#!/bin/bash

# Define the path to the input file .bed
mixplates="../figure_4_admixture/data/mixplates.bed" 


# Definir la carpeta de salida
out_dir="/home/duhyadi/Documents/paper1/admixture/file_plink/out_admixture3"


# Ejecutar admixture para K=3 10 veces
for i in {1..10}; do
  echo "Ejecución $i para K=3"

  # Correr admixture para K=3
  admixture --cv $mixplates 3 | tee $out_dir/log_K3_run${i}.out
  
  # Renombrar los archivos .P y .Q para evitar que se sobrescriban
  mv mixplates.3.P $out_dir/mixplates_run${i}.3.P
  mv mixplates.3.Q $out_dir/mixplates_run${i}.3.Q
done
