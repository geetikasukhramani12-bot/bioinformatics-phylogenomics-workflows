# Historical Biogeography Analysis using BioGeoBEARS

## Overview

Historical biogeographic analyses were conducted to investigate the ancestral geographic distribution and diversification history of Smilax L.

The analysis was performed using BioGeoBEARS in R.

## Input Data

The analysis used:

- A time-calibrated phylogenetic tree
- Species geographic distribution/range data
- Defined geographic regions for each taxon

## Biogeographic Models

The following likelihood-based models were evaluated:

- DEC
- DEC + J
- DIVALIKE
- DIVALIKE + J
- BAYAREALIKE
- BAYAREALIKE + J

## Workflow

### 1. Preparation of phylogenetic tree

A time-calibrated phylogenetic tree was prepared for use in BioGeoBEARS.

### 2. Preparation of geographic range data

Species occurrence/distribution information was compiled and assigned to predefined geographic areas.

### 3. BioGeoBEARS analysis

The phylogenetic tree and geographic range data were supplied to BioGeoBEARS.

The models were run under maximum likelihood to estimate ancestral geographic ranges.

### 4. Model comparison

Models were compared using:

- Log-likelihood
- Number of parameters
- AIC
- AICc

The model with the lowest AICc value was considered the best-supported model.

### 5. Ancestral range reconstruction

The best-supported model was used to reconstruct ancestral geographic distributions and infer historical biogeographic patterns.

## Software

- R
- BioGeoBEARS
- RASP-compatible ancestral range visualization approaches
- Phylogenetic tree visualization tools

## Reproducibility

The analysis was performed using scripted R workflows. Input phylogenetic trees and large datasets are not included in this repository.

## Research Application

This workflow was used as part of doctoral research investigating the diversification, historical biogeography, and evolutionary history of Smilax L. in the Indian subcontinent.
