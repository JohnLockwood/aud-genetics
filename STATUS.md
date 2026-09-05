# Project Status & Work Log

**Project:** AUD Genetics (`aud-genetics`)  
**Current Milestone:** Phase 1 — Genomic Data Wrangling & QC  
**Last Updated:** September 5, 2026  

---

## Environment & Tooling Stack

* **OS / Platform:** macOS (Apple Silicon)
* **Genomics Workhorse:** PLINK 2.0 (installed via `brew install plink-ng`)
* **Python Environment:** Conda environment `aud-genetics` (Python 3.12, scikit-learn, xgboost, pandas, bcftools)
* **R Environment:** System R 4.6.0 sandboxed via `renv` (`renv.lock` active; `bigsnpr`, `glmnet`, `tidymodels`, `pROC`)
* **Version Control:** Git repository configured with leak protection for raw genomic arrays and `renv/library/`

---

## Milestone Progress

| Phase | Description | Status | Next Task |
|---|---|:---:|---|
| **Phase 0** | Foundations, Environment & Structure | **Completed** | Keep dependencies updated |
| **Phase 1** | Genomic Data Wrangling & QC | **Up Next** | Fetch 1000 Genomes test cohort & write PLINK QC pipeline |
| **Phase 2** | Population Structure & PCA | Queued | LD pruning and ancestry projection scripts |
| **Phase 3** | Association & Polygenic Risk Scoring | Queued | Candidate gene extraction (*GABRA2*) & PRS weighting |
| **Phase 4** | Machine Learning & Regularization | Queued | LASSO vs. non-linear tree baselines |
| **Phase 5** | External Validation & Synthesis | Queued | Independent cohort testing |

---

## Session Work Log

### 2026-09-05
* Initialized consolidated repository directory layout via `scripts/shell/setup_dirs.sh`.
* Created root `README.md` and detailed milestone `ROADMAP.md`.
* Isolated project R libraries using `renv` (`aud-genetics.Rproj` and `.Rprofile`).
* Installed native `plink2` via Homebrew and built `aud-genetics` Python conda environment.
* Configured robust `.gitignore` covering `.bed`, `.bim`, `.fam`, `.pgen`, `.vcf*`, `.bk`, and local environments.
* Pushed baseline infrastructure to GitHub (`origin/main`).
