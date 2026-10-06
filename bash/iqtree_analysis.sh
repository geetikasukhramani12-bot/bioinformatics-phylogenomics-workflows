#!/bin/bash

# ============================================================
# IQ-TREE Maximum Likelihood Phylogenetic Analysis
# ============================================================

# Input:
#   trimmed.fasta = trimmed multiple sequence alignment
#
# Output:
#   IQ-TREE phylogenetic tree and associated analysis files
# ============================================================

# Set input alignment
ALIGNMENT="trimmed.fasta"

# Set output prefix
PREFIX="Smilax_IQTree"

# Run IQ-TREE
iqtree2 \
    -s "$ALIGNMENT" \
    -m MFP \
    -B 1000 \
    -alrt 1000 \
    -nt AUTO \
    -pre "$PREFIX"

# Display completion message
echo "============================================"
echo "IQ-TREE Maximum Likelihood analysis completed."
echo "============================================"

echo "Input alignment: $ALIGNMENT"
echo "Output prefix: $PREFIX"
echo "Bootstrap replicates: 1000"
echo "SH-aLRT replicates: 1000"
