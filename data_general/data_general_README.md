**data_general — README**

This folder contains the main SNP dataset used in the genomic analyses of the study “Diversity and genetic structure within a Mexican maize race reveal consistent biocultural processes across geographic scales.”

**File included**

**mixplates_filtered_2x.vcf.gz**
Final filtered SNP dataset generated from GBS data after variant calling and quality control.

**Data generation summary**

Raw sequencing reads were quality-checked with **FastQC**, and demultiplexed using **GBSx v1.3**. Reads were aligned to the Zea mays reference genome (B73, Zm-B73-REFERENCE-NAM-5.0) using **Nextgenmap 0.5.3**, and converted to BAM format with **Samtools 1.5**. Variant calling was performed using **GATK v3.8** (HaplotypeCaller), followed by joint genotyping with **GenotypeGVCFs**.

SNPs were filtered based on the distribution of key variant calling metrics using **VCFtools v0.1.16**. The filtering parameters were:

`--maf 0.05
--max-alleles 2
--max-missing 0.80
--min-meanDP 0.5
--max-meanDP 4
--minDP 2
--maxDP 4
`

A total of **89,810** SNPs were retained from **4,959,703** called variants.

**Format:** gzipped VCF file.
