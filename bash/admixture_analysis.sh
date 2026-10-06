#!/bin/bash

# ============================================================
# ADMIXTURE Population Structure Analysis
# ============================================================

# Run ADMIXTURE for different values of K

for K in 2 3 4 5 6
do
    echo "Running ADMIXTURE with K=$K"
    admixture --cv dataset.bed $K
done

echo "ADMIXTURE analysis completed."
