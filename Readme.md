# scSNPdemux

Bioinformatically demultiplex samples from single cell sequencing using SNP information and genotype information\
John Wong

# Prerequisites
`scSNPdemux` requires bcftools(>1.9), cellsnp-lite, vireo, R (>= 4.0.0) and depends on the following R packages: Seurat, ggplot2, reshape2

Use this command to create the conda environment for running the pipeline:
```
conda create -n demuxEnvironment -c bioconda cellsnp-lite bcftools
conda activate demuxEnvironment
pip install -U vireoSNP
```

# Usage
To demultiplex 10X data with known genotype data, run:
`bash demux.sh <parameters>`

| Parameter | Description | Note |
| --------- | ----------- | ---- |
|-b|bam file path||
|-i|path to 10X matrix folder|where barcodes.tsv.gz, features.tsv.gz, matrix.mtx.gz are|
|-g|SNP array VCF file|In GRCh38 coordinate|
|-p|Population SNP VCF file||
|-n|number of samples to demultiplex||
|-o|output path||
|-t|threads|Default=1|
|-c|count cut-off to consider a barcode|Default=100|
|-h|display help||


## Test data

### Prerequisites
The data preparation script depends on:
R(tested on 4.1), samtools

### Preparation script
Test data from 10X can be prepared by the files in the "prep" folder. To initiate download process, please run this:
```console
bash ./prep/input_preparation.sh <output directory> <10X genomics download HTTP hostname>
```

The resulting merged bam file and merged matrix should be fould in `<output directory>/merged`
