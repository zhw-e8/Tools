#!/bin/bash

# Perform MSA for specific cluster of RNA sequences.
# Need to activate the environment containing ClustalOmega and seqkit.

cluster_id=${1}
sequence_path=${2}

mkdir -p cluster/${cluster_id}
grep "${cluster_id}" DB_clu.tsv | awk -F "\t" '{print $2}' > cluster/${cluster_id}/member.txt
seqkit grep -f cluster/${cluster_id}/member.txt ${sequence_path} > cluster/${cluster_id}/member.fasta
wc -l cluster/${cluster_id}/member.txt

clustalo \
--infile cluster/${cluster_id}/member.fasta \
--verbose \
--threads 1 \
--full \
--outfmt fa \
--outfile cluster/${cluster_id}/member.msa.fasta \
--output-order tree-order \
--seqtype rna