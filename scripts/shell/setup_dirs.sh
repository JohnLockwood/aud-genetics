#!/usr/bin/env bash
set -euo pipefail

# Ensure script is run from the project root
if [ ! -d "scripts/shell" ]; then
  echo "Error: Please run this script from the repository root:"
  echo "  ./scripts/shell/setup_dirs.sh"
  exit 1
fi

echo "Setting up aud-genetics project structure..."

# 1. Clear old lesson structure if present and scaffold consolidated layout
rm -rf lessons/*
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
         analyses/ml

# Results
mkdir -p results/figures \
         results/tables \
         results/reports

# 2. Write root .gitignore to block large/binary genomics files
cat << 'EOF' > .gitignore
# Environments & IDEs
.venv/
env/
.Rproj.user/
.Rhistory
.RData
__pycache__/
*.pyc

# Genomic binary files & large data artifacts
data/raw/*
data/processed/*
!data/raw/.gitkeep
!data/processed/.gitkeep
*.bed
*.bim
*.fam
*.pgen
*.pvar
*.psam
*.vcf*
*.bgen
*.tar.gz
*.zip
*.log
EOF

# 3. Add .gitkeep markers to preserve empty directories in git
find config lessons literature data scripts analyses results -type d -exec touch {}/.gitkeep \;

echo "Repository structure and .gitignore successfully updated."
