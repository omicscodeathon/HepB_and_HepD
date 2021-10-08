#!/usr/bin/env bash


# Contributers all members of
  ## HepB_and_HepD
  ## In silico Analysis of Single Nucleotide Polymorphisms (SNPs) of Human Hepatitis **B** and **D**
  ## Virus in Sudan
# This script can be used to convert seq files into fasta

study_folders=('genotype D sequence'  'genotype E sequence'  'P1 S1 sequence');
for ((i = 0; i < ${#study_folders[@]}; i++));
do
    echo "preparing seq folders"
    folder=${study_folders[$i]}
    ## Remove white spaces on folder name
    ## It is challenging when a folder contains a white space on its name
    new_folder=$(echo ${study_folders[$i]} | sed 's/ /_/g')
    mv "$folder"  "${folder// /_}"
    fasta_folder=${new_folder}_fata
    multi_fasta_folder=${new_folder}_multifata
    echo ${fasta_folder}
    mkdir ${fasta_folder};
    mkdir ${multi_fasta_folder};


    ## Get seq files from each folder
    echo "Creating fasta files"
    touch ./${multi_fasta_folder}/${new_folder}.fasta
    ### For multi_fasta files
    seq_files=$(ls ${new_folder}/*seq);
    for seq in ${seq_files[*]};do
      seq_file=$(basename $seq)
      fasta_output=($(echo $seq_file| sed -e 's/seq/fasta/'));
      echo $fasta_output
      touch ./${fasta_folder}/${fasta_output}
      fasta_header=$(echo $seq_file| sed -e 's/.seq//');
      fasta_header='>'${fasta_header};
      echo ${fasta_header}> ./${fasta_folder}/${fasta_output}
      echo ${fasta_header} >>  ./${multi_fasta_folder}/${new_folder}.fasta
      cat ${seq}  >>  ./${fasta_folder}/${fasta_output}
      cat ${seq} >>  ./${multi_fasta_folder}/${new_folder}.fasta
      echo "\n" >>  ./${multi_fasta_folder}/${new_folder}.fasta

    done

    echo "Well done !"
done
