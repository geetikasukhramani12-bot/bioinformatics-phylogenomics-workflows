#!/bin/bash

# ============================================================
# VCF/BCF Processing Workflow
# ============================================================

# Convert VCF to compressed VCF
bcftools view input.vcf.gz -Oz -o filtered.vcf.gz

# Index compressed VCF
bcftools index filtered.vcf.gz

# Convert VCF to BCF
bcftools view filtered.vcf.gz -Ob -o variants.bcf

# Index BCF
bcftools index variants.bcf

# Generate variant statistics
bcftools stats variants.bcf > variant_statistics.txt

echo "VCF/BCF processing completed."
