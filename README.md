# In silico Analysis of the Single Nucleotide Polymorphisms (SNPs) of Human Hepatitis **B** and **D** Viruses in Sudan


## Data sources:
* HBVdb - hepatitis B - https://hbvdb.lyon.inserm.fr/HBVdb/HBVdbDataset
* NCBI genotyping tool: https://www.ncbi.nlm.nih.gov/projects/genotyping/formpage.cgi
* HDVdb - hepatitis D - https://hdvdb.bio.wzw.tum.de/hdvdb/
## Workflow
1. Download the relevant genes for the different genotypes from the HBVdb
2. Combine (concatenate) the reference sequences with the sequenced gene sequences
3. Run multiple sequence alignment (mafft)
4. Compute SNP distances (snpdists) and phylogeny (iqtree)

![Overview diagram](workflow.jpg)
## Pipeline 
1. Data preprocessing
* Converting **seq** files into **fasta** files.
* Quality control check (if needed).
2. Alignment
* minimap
* bwa-mem
* mafft
3. Compute SNPs distance
* snpdists
4. Phylogeny analysis
* Maximum likelihood 
* Neighbor joining. 
* IQ-tree

## Team members:
1. Osama Mohammed
2. Sabah Ibrahim
3. Sumaya Kambal
4. Esra A. Abdalwhab
5. Arwa Ibrahim
6. Sowole Adekunle Damilola
7. Yagoub Adam
8. Situma Victor Wekesa
9. Sofia B. Mohamed
