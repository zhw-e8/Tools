#!/bin/bash

# Cluster RNA sequences with MMseqs2
# Note to activate the environment containing MMseqs2

mkdir -p ../tmp_mmseqs
time mmseqs createdb ${sequence_path} DB --dbtype 2
time mmseqs cluster DB DB_clu ../tmp_mmseqs --min-seq-id ${identity} --cov-mode 2 -c ${coverage} --threads 1 --cluster-mode 2
time mmseqs createsubdb DB_clu DB DB_clu_rep 
time mmseqs convert2fasta DB_clu_rep DB_clu_rep.fasta 
time mmseqs createtsv DB DB DB_clu DB_clu.tsv