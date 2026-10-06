#!/bin/bash

# ============================================================
# Principal Component Analysis of SNP Genotype Data
# ============================================================

plink \
    --bfile dataset_filtered \
    --pca 20 \
    --out Smilax_PCA

echo "PCA analysis completed."
