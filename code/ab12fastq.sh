#!/usr/bin/env bash

## tracy  can be used to convert ab1 files into fastq

# You can down tracy  via two options
# 1. Using conda ---> conda install -c bioconda tracy
# 2. From source code by following the instructions at the link below
#### https://www.gear-genomics.com/docs/tracy/installation/
### conda install -c bioconda tracy
### How to run tracy  ---> racy basecall -f fastq -o out.fastq input.ab1



mkdir P1_S1_fastqc
ab1SeqFolder=P1_S1_sequence
ab1Files=$(ls ${ab1SeqFolder}/*.ab1)
for file in ${ab1Files[*]}; do
  baseName=$(basename ${file})
  fasta=$(echo ${baseName} | sed -e 's/.ab1/.fastq/')
  tracy basecall -f fastq -o P1_S1_fastqc/${fasta} $file
  sed -i "s/@primary/@${baseName}/g"  P1_S1_fastqc/${fasta}
done

## Concatenate all fastq files
cat P1_S1_fastqc/* >P1_S1.fastq
