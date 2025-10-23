#!/bin/bash

# Definir la ruta al archivo de entrada .bed
mixplates="/home/duhyadi/Documents/paper1/admixture/file_plink/mixplates.bed"


# Definir la carpeta de salida
out_dir="/home/duhyadi/Documents/paper1/admixture/file_plink/out_admixture2"


# Ejecutar admixture para K=2 10 veces
for i in {1..10}; do
  echo "Ejecución $i para K=2"

# Correr admixture para K=2
  admixture --cv $mixplates 2 | tee $out_dir/log_K2_run${i}.out
  
# Renombrar los archivos .P y .Q para evitar que se sobrescriban
  mv mixplates.2.P $out_dir/mixplates_run${i}.2.P
  mv mixplates.2.Q $out_dir/mixplates_run${i}.2.Q
done
