#!/usr/bin/env bash
set -euo pipefail

# Ensure script is run from the project root
if [ ! -d "scripts/shell" ]; then
  echo "Error: Please run this script from the repository root:"
  echo "  ./scripts/shell/setup_dirs.sh"
  exit 1
fi

echo "Setting up aud-genetics project structure..."

# 1. Scaffold the consolidated layout without removing existing work.
mkdir -p lessons/01-genomics-data-and-qc \
         lessons/02-population-structure-pca \
         lessons/03-gwas-and-prs \
         lessons/04-machine-learning

# Config & Reference Data
mkdir -p config

# Literature
mkdir -p literature/papers \
         literature/notes

# Data Directories
mkdir -p data/raw \
         data/processed \
         data/metadata

# Scripts
mkdir -p scripts/plink \
         scripts/python \
         scripts/r \
         scripts/shell

# Analyses
mkdir -p analyses/exploratory \
         analyses/gwas \
         analyses/prs \
         analyses/machine-learning

# Project-level teaching and reporting records
mkdir -p docs \
         notes/templates

# Results
mkdir -p results/figures \
         results/tables \
         results/reports

# 2. Add .gitkeep markers to preserve empty directories in git. Existing files
# (including .gitignore) are deliberately left untouched.
find config lessons literature data scripts analyses results docs notes -type d -exec touch {}/.gitkeep \;

echo "Repository structure and .gitignore successfully updated."
