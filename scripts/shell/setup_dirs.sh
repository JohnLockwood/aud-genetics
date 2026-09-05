#!/bin/bash
set -euo pipefail

# Run this script from the aud-genetics project root:
#   ./scripts/shell/setup_dirs.sh

mkdir -p \
  lessons/genomics-data \
  lessons/command-line-and-unix \
  lessons/plink \
  lessons/statistical-genetics \
  lessons/gwas \
  lessons/population-genetics \
  lessons/polygenic-scores \
  lessons/machine-learning \
  lessons/advanced-topics \
  literature/papers \
  literature/literature-notes \
  literature/references \
  data/raw \
  data/processed \
  data/metadata \
  scripts/r \
  scripts/python \
  scripts/plink \
  analyses/exploratory \
  analyses/gwas \
  analyses/prs \
  analyses/machine-learning \
  results/figures \
  results/tables \
  results/reports

echo "AUD genetics project directories created."
