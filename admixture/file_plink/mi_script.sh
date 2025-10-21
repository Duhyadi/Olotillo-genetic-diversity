#!/bin/bash

# Definir la ruta al archivo de entrada .bed
mixplates="/home/duhyadi/Documents/paper1/admixture/file_plink/mixplates.bed"


# Definir la carpeta de salida
out_dir="/home/duhyadi/Documents/paper1/admixture/file_plink/out_admixture"

# Correr admixture para K=2
  admixture --cv $mixplates 2 
  
