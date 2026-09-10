# AUD Genetics Syllabus

## Course goal

Develop a reproducible, ethically governed analysis that evaluates what different genetic representations can—and cannot—predict about Alcohol Use Disorder (AUD). The goal is methodological understanding and publication-quality practice, not clinical deployment.

## How to use this syllabus

The phase sections define the learning sequence, practical work, and evidence needed to demonstrate learning. They are the durable curriculum rather than a second task tracker. The [current lesson and next actions](#current-lesson-and-next-actions) section is the authoritative short-term plan.

Completed lessons and decisions belong in dated session notes linked from [notes/INDEX.md](notes/INDEX.md). Link evidence from this syllabus when a phase requirement is completed.

## Phase 0 — Foundations, governance, and reproducibility

**Core concepts:** Reproducible environments, data provenance, data classification, study design, and the distinction between predictive and causal questions.

**Practical work:**

* Establish the repository structure and protections against committing inappropriate data or generated files.
* Record the software environment and the commands needed to reproduce it.
* Classify prospective data and identify any governing access agreement and approved computing environment.
* Define the research question, target population, phenotype, predictors, comparison models, and intended interpretation.
* Identify foundational literature and public or synthetic teaching data.

**Evidence of learning:** An environment record, a data-classification decision, and a clearly scoped research question. The [project-governance note](notes/2026-09-06-project-governance.md) records the repository's initial data and teaching boundaries.

## Phase 1 — Genomic data and quality control

Lesson materials: [`lessons/01-genomics-data-and-qc`](lessons/01-genomics-data-and-qc)

**Core concepts:** PLINK and VCF genotype formats, variant and sample missingness, minor allele frequency, Hardy–Weinberg equilibrium, heterozygosity, and the purpose and limitations of QC thresholds.

**Practical work:**

* Obtain a suitable public or synthetic test dataset with documented provenance and permitted use.
* Inspect its format, metadata, genome build, variant identifiers, and allele conventions.
* Apply and justify variant-level filters such as `--geno`, `--maf`, and `--hwe`.
* Apply and justify sample-level filters such as `--mind` and heterozygosity checks.
* Record commands, thresholds, software versions, and sample and variant attrition.

**Evidence of learning:** A reproducible QC run on public or synthetic data, accompanied by an attrition table and an explanation of each filter's assumptions and consequences.

## Phase 2 — Population structure and ancestry

Lesson materials: [`lessons/02-population-structure-pca`](lessons/02-population-structure-pca)

**Core concepts:** Linkage disequilibrium, LD pruning, principal-component analysis, population structure as a source of confounding, and the limitations of discrete ancestry labels.

**Practical work:**

* Perform and justify LD pruning, for example with `--indep-pairwise`.
* Compute genotype principal components and inspect several dimensions.
* When scientifically justified, compare or project samples against an appropriate public reference panel.
* Diagnose potential confounding and document how population structure will enter later models.

**Evidence of learning:** A reproducible pruning and PCA analysis, interpretable visualizations, a confounding diagnosis, and a documented covariate or stratification plan.

## Phase 3 — Association evidence and polygenic scores

Lesson materials: [`lessons/03-gwas-and-prs`](lessons/03-gwas-and-prs)

**Core concepts:** Phenotype definition, additive association models, effect estimates and uncertainty, linkage disequilibrium, effect-size shrinkage, score transportability, clumping and thresholding, and Bayesian scoring methods.

**Practical work:**

* Read association and polygenic-score studies with attention to cohort ascertainment, phenotype, ancestry, genotyping, imputation, QC, and validation.
* Trace a published score to its paper, training GWAS, scoring file, genome build, effect allele, weights, and development and evaluation populations.
* Harmonize variants and alleles with explicit checks for build, strand, reference allele, and missingness.
* Use public or synthetic data to demonstrate an appropriately adjusted association model and published-score calculation.
* Compare prespecified candidate-locus, candidate-panel, and genome-wide representations as methodological baselines without treating association as causation or implying clinical utility.

**Evidence of learning:** A phenotype-aware literature review, reproducible score provenance and harmonization record, and an evaluation whose claims are limited to the population and data studied.

## Phase 4 — Predictive modeling

Lesson materials: [`lessons/04-machine-learning`](lessons/04-machine-learning)

**Core concepts:** High-dimensional regularization, baseline selection, data leakage, nested validation, class imbalance, model comparison, and the difference between discrimination and calibration.

**Practical work:**

* Define training, tuning, and evaluation splits before feature selection or model fitting.
* Keep feature selection, preprocessing, and hyperparameter tuning inside the training folds of a nested validation design.
* Fit a sparse linear baseline such as LASSO or elastic-net logistic regression.
* Fit a justified non-linear comparison such as a tree ensemble when the sample size and feature representation support it.
* Compare demographic or population-structure covariates, candidate loci or panels, genome-wide polygenic scores, and combined models.
* Report appropriate discrimination and calibration measures with uncertainty.

**Evidence of learning:** A leakage-safe nested-validation workflow, documented baseline and regularized models, and a comparison that separates apparent performance from credible generalization.

## Phase 5 — Interpretation, external validation, and synthesis

**Core concepts:** Calibration, subgroup performance, dataset shift, ancestry-specific performance, external validation, model interpretation, and limits on generalization and clinical relevance.

**Practical work:**

* Evaluate calibration and performance across scientifically justified subgroups while avoiding small-cell disclosure.
* Test the final analysis in a genuinely independent and appropriately governed dataset when one is available.
* Compare external performance with internal-validation estimates and investigate meaningful degradation.
* Synthesize what each genetic representation adds, if anything, beyond simpler baselines.
* Document limitations, alternative explanations, and the boundary between research findings and clinical use.

**Evidence of learning:** Calibration and subgroup analyses, an external-validation result or a defensible validation plan, and a synthesis whose conclusions match the available evidence.

## Current lesson and next actions

This section is the authoritative current plan. Keep it short. Update it when an action is selected or completed, and link completed work to its session note.

**Current lesson: Phase 1 — Reading a tiny synthetic genotype dataset.** Begin with a hand-inspectable VCF before applying QC commands or moving to a public 1000 Genomes subset. The repository remains limited to synthetic, public, aggregate, and other non-sensitive material.

Recent exploration: [PRS notes and article questions](notes/2026-09-08-prs-polygenic-risk-scores.md#article-questions). Exploring a later topic does not by itself establish completion of earlier phases.

* [x] Complete the [first VCF checkpoint](lessons/01-genomics-data-and-qc/README.md#first-checkpoint-read-the-file): interpret `REF`, `ALT`, and `GT`, identify missing calls, and calculate the alternate-allele frequency at `toy1` by hand. See the [session note](notes/2026-09-10-phase-1-learning-bridge.md#follow-up-first-checkpoint-reviewed).
* [x] Import the synthetic VCF with PLINK 2 and create the native `.pgen`, `.pvar`, and `.psam` files.
* [ ] Complete the [missingness checkpoint](lessons/01-genomics-data-and-qc/README.md#second-checkpoint-missingness): predict sample and variant missingness by hand, generate PLINK's reports, and reconcile the results.
