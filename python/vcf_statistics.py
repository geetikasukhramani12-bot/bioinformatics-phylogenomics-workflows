#!/usr/bin/env python3

"""
Basic VCF statistics.

Counts:
- Total variant records
- SNPs
- Indels
"""

vcf_file = "input.vcf"

total_variants = 0
snps = 0
indels = 0

with open(vcf_file, "r") as file:

    for line in file:

        if line.startswith("#"):
            continue

        fields = line.strip().split("\t")

        if len(fields) < 5:
            continue

        reference = fields[3]
        alternate = fields[4].split(",")[0]

        total_variants += 1

        if len(reference) == 1 and len(alternate) == 1:
            snps += 1
        else:
            indels += 1


print("VCF Statistics")
print("====================")
print(f"Total variants: {total_variants}")
print(f"SNPs: {snps}")
print(f"Indels: {indels}")
