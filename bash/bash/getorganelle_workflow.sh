#!/bin/bash

# ============================================================
# GetOrganelle Plastome Assembly Workflow
# ============================================================

# Create output directory
mkdir -p getorganelle_results

# Plastome assembly from paired-end Illumina reads
get_organelle_from_reads.py \
    -1 sample_R1.fastq.gz \
    -2 sample_R2.fastq.gz \
    -o getorganelle_results \
    -F embplant_pt \
    -R 15

echo "GetOrganelle plastome assembly completed."
