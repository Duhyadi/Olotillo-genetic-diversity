# Individual heterozygosity and inbreeding estimates

This folder contains the Bash workflow and output file used to estimate individual-level genetic diversity metrics for the Olotillo genetic diversity project.

The analysis was performed using `VCFtools` with the `--het` option, which calculates observed homozygosity, expected homozygosity, the number of evaluated sites, and the individual inbreeding coefficient.

## Folder contents

```text
bash/
├── README.md
├── mixII.het
└── mixplate1_heter_inbre_per_individual.sh
```

## Script description

The file `mixplate1_heter_inbre_per_individual.sh` is a Bash script prepared for execution in a SLURM-managed computing cluster.

The script defines the input VCF file, output directory, and project name, and then runs `VCFtools` to calculate individual heterozygosity and inbreeding-related metrics.

The main command is:

```bash
vcftools --gzvcf $mixplates --het --out $out/${project}
```

where:

| Variable    | Description                                                  |
| ----------- | ------------------------------------------------------------ |
| `mixplates` | Path to the filtered compressed VCF file used as input.      |
| `out`       | Output directory where the resulting files are written.      |
| `project`   | Prefix used to name the output files. In this case, `mixII`. |

## Input file

The input file used by the script is a filtered compressed VCF file:

```text
mixplates_filtered_2x.vcf.gz
```

This file contains the SNP genotype data used to estimate individual-level homozygosity and inbreeding statistics.

## Output file

The command generates an output file with the `.het` extension. For this project, the output file is:

```text
mixII.het
```

This file contains individual-level estimates of observed and expected homozygosity, the number of analyzed sites, and the inbreeding coefficient.

## Output columns

The `mixII.het` file contains the following columns:

| Column    | Description                                                |
| --------- | ---------------------------------------------------------- |
| `INDV`    | Individual identifier.                                     |
| `O(HOM)`  | Observed number of homozygous sites.                       |
| `E(HOM)`  | Expected number of homozygous sites.                       |
| `N_SITES` | Number of sites included in the analysis.                  |
| `F`       | Individual inbreeding coefficient estimated by `VCFtools`. |

## Requirements

This workflow requires:

* Bash
* SLURM workload manager, if running the script in a high-performance computing cluster
* `VCFtools`

## How to run

To run the script in a SLURM-based cluster:

```bash
sbatch mixplate1_heter_inbre_per_individual.sh
```

Alternatively, the `VCFtools` command can be run directly from the command line after adjusting the paths to the input VCF file and output directory:

```bash
vcftools --gzvcf path/to/mixplates_filtered_2x.vcf.gz --het --out path/to/output/mixII
```

## Notes

* The paths in `mixplate1_heter_inbre_per_individual.sh` are absolute paths from the original computing environment.
* To reproduce the analysis in another system, update the paths for the input VCF file and output directory.
* The output file `mixII.het` can be used for downstream analyses of individual homozygosity, heterozygosity, and inbreeding patterns in the Olotillo maize dataset.

