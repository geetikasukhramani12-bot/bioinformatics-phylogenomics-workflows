#!/bin/bash

# ============================================================
# RAxML-NG Maximum Likelihood Phylogenetic Analysis
# ============================================================

# Input:
#   trimmed.fasta = trimmed multiple sequence alignment
#
# Output:
#   RAxML-NG phylogenetic tree and bootstrap files
# ============================================================

# Input alignment
ALIGNMENT="trimmed.fasta"

# Output prefix
PREFIX="Smilax_RAxML-NG"

# Run RAxML-NG maximum likelihood analysis
raxml-ng \
    --msa "$ALIGNMENT" \
    --model GTR+G \
    --prefix "$PREFIX" \
    --threads auto \
    --seed 12345

# Perform bootstrap analysis
raxml-ng \
    --bootstrap \
    --msa "$ALIGNMENT" \
    --model GTR+G \
    --prefix "${PREFIX}_BS" \
    --bs-trees 1000 \
    --threads auto \
    --seed 12345

# Generate the final bootstrap-supported tree
raxml-ng \
    --support \
    --tree "${PREFIX}.raxml.bestTree" \
    --bs-trees "${PREFIX}_BS.raxml.bootstraps" \
    --prefix "${PREFIX}_supported"

echo "============================================"
echo "RAxML-NG analysis completed."
echo "============================================"

echo "Input alignment: $ALIGNMENT"
echo "Model: GTR+G"
echo "Bootstrap replicates: 1000"
