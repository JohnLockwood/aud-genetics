# Project Roadmap & Curriculum

This roadmap outlines the progression from fundamental genotype QC through modern polygenic risk scoring and machine learning. Each phase pairs a foundational lesson with hands-on computational analysis.

---

## Phase 0: Foundations & Reproducibility
* [ ] Initialize project structure and baseline `.gitignore`.
* [ ] Define reproducible compute environment (`environment.yml` / Conda environment with PLINK 2.0, R, and Python packages).
* [ ] Aggregate key literature (e.g., Kinreich et al. 2021 multimodal ML; 2024 multi-ancestry AUD GWAS; PGS Catalog entries PGS005213 and PGS002739).

---

## Phase 1: Genomic Data Wrangling & Quality Control (`lessons/01-genomics-data-and-qc`)
* **Core Concepts:** File formats (`.bed`/`.bim`/`.fam`, `.pgen`, `.vcf.gz`), missingness thresholds, minor allele frequency (MAF), Hardy-Weinberg Equilibrium (HWE).
* **Hands-on Milestones:**
  * [ ] Obtain public test genotype data (e.g., 1000 Genomes high-coverage subset).
  * [ ] Implement PLINK 2.0 filtering pipelines:
    * Variant-level QC (`--geno`, `--maf`, `--hwe`).
    * Sample-level QC (`--mind`, heterozygosity outliers).
  * [ ] Document sample and variant attrition tables.

---

## Phase 2: Population Structure & Ancestry Stratification (`lessons/02-population-structure-pca`)
* **Core Concepts:** Linkage Disequilibrium (LD) pruning, Principal Component Analysis (PCA), confounding from ancestral allele frequency divergence.
* **Hands-on Milestones:**
  * [ ] Perform LD pruning (`--indep-pairwise`).
  * [ ] Compute genotype principal components via PLINK 2.0 (`--pca`).
  * [ ] Project samples against 1000 Genomes reference continental populations (EUR, AFR, EAS, SAS, AMR).
  * [ ] Visualize PC1–PC4 clusters to establish covariate adjustment vectors.

---

## Phase 3: Association Testing & Polygenic Risk Scoring (`lessons/03-gwas-and-prs`)
* **Core Concepts:** Additive logistic GWAS models, effect size shrinkage, LD reference panels, clumping and thresholding (C+T) vs. Bayesian modeling (`LDpred2`, `lassosum2`).
* **Hands-on Milestones:**
  * [ ] Run basic logistic association using PLINK 2 adjusting for top PCs and age/sex.
  * [ ] Benchmark Candidate Gene representation: Extract variants within *GABRA2*, *ADH1B*, and *ALDH2*.
  * [ ] Construct genome-wide PRS using published summary statistics (PGS Catalog weights) via `bigsnpr` or `PRSice-2`.
  * [ ] Evaluate candidate-gene PRS vs. genome-wide PRS baselines.

---

## Phase 4: Machine Learning & Non-Linear Classification (`lessons/04-machine-learning`)
* **Core Concepts:** High-dimensional small-$n$ regularization ($p \gg n$), data leakage risks during feature selection, sparse additive models vs. non-linear tree ensembles.
* **Hands-on Milestones:**
  * [ ] **Data Prep:** Build cross-validation folds ensuring ancestry stratification is balanced and feature selection occurs *inside* training folds.
  * [ ] **Model 1 (Sparse Linear Baseline):** LASSO / Elastic Net logistic regression (`glmnet`) directly on candidate variant sets.
  * [ ] **Model 2 (Ensemble/Tree-based):** Train Random Forest and XGBoost classifiers on pathway-aggregated gene scores and PRS deciles combined with covariates.
  * [ ] **Model Comparison:** Compare ROC-AUC, PR-AUC, calibration curves, and feature importance across:
    1. Demographic / PC covariates alone
    2. *GABRA2* locus alone
    3. Candidate gene panel
    4. Genome-wide PRS
    5. Multi-feature regularized ML models

---

## Phase 5: External Validation & Synthesis
* [ ] Evaluate final trained classifiers against an independent held-out dataset to test generalizability across populations/cohorts.
* [ ] Synthesize findings: Quantify what non-linear ML representations add (if anything) beyond standard additive genome-wide PRS for AUD prediction.
