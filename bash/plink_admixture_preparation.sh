#!/bin/bash

# ============================================================
# PLINK Data Preparation for ADMIXTURE
# ============================================================

# Convert VCF to PLINK binary format
plink \
    --vcf input.vcf.gz \
    --make-bed \
    --out dataset

# Perform basic SNP quality filtering
plink \
    --bfile dataset \
    --geno 0.20 \
    --make-bed \
    --out dataset_filtered

echo "PLINK preparation completed."
