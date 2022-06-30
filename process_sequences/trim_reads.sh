#!/bin/bash

################### trim_reads.sh ###################
# This workflow will trim adapters off reads in a fastq file 

# INPUT:

# 1:    directory with fastq paired reads 

# OUTPUT:

# Two fastq files that have been validated, filtered, and adapters removed
###################################################

module load trimgalore/0.6.6

echo "Trimming adapters from reads"

arr=();
for files in ${1}/*.fastq; do                
        c=$(echo ${files} | cut -f 6 -d "/" | cut -f 1,2,3 -d "_"); 
        arr+=(${c}); 
done

uniqs_arr=($(for elem in ${arr[@]}; do echo ${elem}; done | sort -u))

for sample in ${uniqs_arr[@]}; do
    echo "trimming ${sample}";
    paired_1=$(echo "${1}/${sample}_1.fastq");
    paired_2=$(echo "${1}/${sample}_2.fastq");
    trim_galore -q 30 -paired -j 4 ${paired_1} ${paired_2} -o "${sample}_trim_galore";
done
