#!/bin/bash

# ============================================================
# SNP Filtering Workflow
# ============================================================

# Filter variants based on quality and missing data
bcftools view \
    -i 'QUAL>=30' \
    input.vcf.gz \
    -Oz \
    -o quality_filtered.vcf.gz

# Index filtered VCF
bcftools index quality_filtered.vcf.gz

echo "SNP quality filtering completed."
