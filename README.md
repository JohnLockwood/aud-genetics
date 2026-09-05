# AUD Genetics (`aud-genetics`)

An applied computational genetics and machine-learning project exploring the predictive architecture of Alcohol Use Disorder (AUD).

## Overview

AUD is a complex, polygenic trait influenced by widespread variants across the genome rather than single candidate loci. This project systematically investigates how different genetic feature representations—from single candidate genes (e.g., *GABRA2*) to polygenic risk scores (PRS) and regularized machine-learning models—perform in classifying and predicting AUD risk.

The repository functions simultaneously as an applied bioinformatics learning laboratory and a reproducible computational pipeline.

## Repository Architecture

```text
aud-genetics/
├── config/             # Reference coordinates, QC parameters, and pipeline configs
├── data/               # Local data layers (raw, processed, metadata; git-ignored)
├── lessons/            # Sequential, milestone-based tutorials and curriculum
├── literature/         # Key reference papers, study summaries, and notes
├── scripts/            # CLI utilities and processing scripts (PLINK, R, Python, Bash)
├── analyses/           # Exploratory work, GWAS pipelines, PRS, and ML experiments
└── results/            # Generated figures, summary tables, and final reports
```

## Tooling & Core Stack

* Genomics Workhorse: PLINK 2.0, bcftools
* Statistical Genetics (R): bigsnpr, glmnet, PRSice-2
* Machine Learning & Analysis (Python/R): tidymodels, scikit-learn, xgboost
* Workflow Automation: Bash shell scripts

## Data Governance Note
This project is designed to handle individual-level genomic data (such as cohorts from dbGaP/COGA). All individual-level genotype arrays, VCFs, and processed PLINK binary files are strictly excluded from version control via .gitignore to maintain data privacy and compliance.

## Setup

* Run conda env create -f environment.yml
That file contains a line:

```
# - plink2 Uncomment to include.  See note in README.
```
The note is, this:  you should uncomment this on Linux/Windows.  On Apple Silicon use ```brew install plink-ng``` instead.
