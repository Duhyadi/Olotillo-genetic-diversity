#!/bin/bash

# Definir la ruta al archivo de entrada .bed
mixplates="/home/duhyadi/Documents/paper1/admixture/file_plink/mixplates.bed"


# Definir la carpeta de salida
out_dir="/home/duhyadi/Documents/paper1/admixture/file_plink/out_admixture4"


# Ejecutar admixture para K=4 10 veces
for i in {1..10}; do
  echo "Ejecución $i para K=4"

  # Correr admixture para K=4
  admixture --cv $mixplates 4 | tee $out_dir/log_K4_run${i}.out
  
  # Renombrar los archivos .P y .Q para evitar que se sobrescriban
  mv mixplates.4.P $out_dir/mixplates_run${i}.4.P
  mv mixplates.4.Q $out_dir/mixplates_run${i}.4.Q
done
