# ddRAD-seq SNP Variant Analysis Workflow

## Overview

This workflow describes the computational processing and analysis of double-digest Restriction-site Associated DNA sequencing (ddRAD-seq) data for SNP discovery and population genetic analysis.

The workflow included sequence processing, variant calling, VCF/BCF processing, SNP filtering, and downstream population genetic analyses.

## Workflow

The general workflow consisted of:

1. Raw sequencing data quality assessment
2. Quality filtering of sequencing reads
3. Processing of ddRAD-seq reads
4. Reference-based sequence alignment
5. Variant/SNP identification
6. Generation of VCF files
7. VCF/BCF processing and filtering
8. Preparation of genotype datasets
9. Population structure analysis using ADMIXTURE

## 1. Raw Read Processing

Paired-end sequencing reads were assessed for sequence quality and processed to remove low-quality sequences and technical sequences where required.

Typical input files:

- `sample_R1.fastq.gz`
- `sample_R2.fastq.gz`

Large raw sequencing files are not included in this repository.

## 2. Sequence Alignment

Processed reads were aligned against the appropriate reference genome/reference sequence.

The resulting alignment files were used for downstream variant discovery.

## 3. SNP and Variant Calling

Variants were identified from the aligned sequencing data.

Variant information was stored in Variant Call Format (VCF).

The VCF files contained information including:

- Chromosome/contig
- Variant position
- Reference allele
- Alternate allele
- Genotype information
- Variant quality

## 4. VCF Processing

VCF files were processed using command-line bioinformatics tools.

Common operations included:

- Variant filtering
- SNP extraction
- Quality filtering
- Missing-data filtering
- VCF indexing
- Conversion between VCF and BCF formats
- Generation of variant statistics

## 5. BCF Processing

Binary Variant Call Format (BCF) files were generated for efficient storage and processing of variant datasets.

BCF files were indexed and used for downstream variant analysis.

## 6. SNP Filtering

SNP datasets were filtered according to quality and data completeness criteria.

Filtering criteria may include:

- Minimum variant quality
- Missing data threshold
- Biallelic SNP selection
- Removal of unwanted variant types

The final filtered SNP dataset was used for population genetic analyses.

## 7. Population Structure Analysis

Population structure was investigated using ADMIXTURE.

Analyses were performed using multiple values of K to evaluate the number of genetic clusters.

Cross-validation error was used to assess model performance and identify an appropriate value of K.

## 8. Data Formats

The workflow involved the following file formats:

| Format | Application |
|--------|-------------|
| FASTQ | Raw sequencing reads |
| SAM/BAM | Sequence alignments |
| VCF | Variant data |
| BCF | Binary variant data |
| BED/BIM/FAM | PLINK genotype data |

## Software and Tools

- Bash
- Python
- bcftools
- PLINK
- ADMIXTURE
- Sequence alignment and variant-calling tools
- Standard Unix command-line utilities

## Reproducibility

Scripts used for data processing and analysis are provided in the `bash/` directory.

Large sequencing datasets and intermediate files are not included in this repository.

## Research Application

This workflow was used for ddRAD-seq-based SNP discovery and population genetic analysis as part of molecular and genomic investigations in plant systematics.
