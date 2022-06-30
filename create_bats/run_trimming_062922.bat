#!/bin/bash
#BSUB -W 5:00
#BSUB -M 32000
#BSUB -n 1
#BSUB -J kessi_first_batch 
#BSUB -o /data/miraldiLab/team/kessi/out_files/trim_reads.out #specify output directory
#BSUB -e /data/miraldiLab/team/kessi/err_files/trim_reads.err #specify output directory

# Trim galore trimming of miraldi er et al Th0 and Th48
# Architecture:
#	sh 1 \
#	2 > 3 
#	1) location of trim_reads script
# 	2) location of fastq paired reads data
#	3) pipe out to log file 

sh /data/miraldiLab/team/kessi/sequence_processing/trim_reads.sh \
/data/miraldiLab/team/kessi/mouse_data/miraldi_er > /data/miraldiLab/team/kessi/sequence_processing/trim_reads.log



