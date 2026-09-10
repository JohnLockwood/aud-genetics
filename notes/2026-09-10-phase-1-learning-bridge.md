# A smaller entry point into Phase 1

**Date:** 2026-09-10  
**Author:** Project owner with Codex (GPT-6) assistance  
**Session type:** Tutorial

## Prompts / scope

The project owner described the Deng PRS work as a detour, expressed willingness to set it aside, and asked for manageable next steps toward Phase 1 because much of the syllabus currently exceeds their understanding.

## Teaching notes / findings

The PRS notes record work with downloads, compressed files, sorting, and scoring-file metadata, followed by questions about genotyping, imputation, QC, and statistical prerequisites. These are useful indications of where to begin teaching, not a formal assessment of knowledge. The syllabus describes destination skills but needs smaller teaching steps to reach them.

Recommended progression:

1. Read a tiny synthetic genotype table: distinguish sample, variant, allele, genotype, and missing entry. Introduce the distinction between a genotype table and a score-weight file. Check understanding by asking the learner to explain one cell and one row.
2. Count missing entries by sample and by variant, then calculate the corresponding fractions by hand. Apply a deliberately illustrative filter and record which rows or columns are removed. Distinguish this exercise from selecting defensible research thresholds.
3. Count alleles at one synthetic autosomal, diploid, biallelic site. Calculate an allele frequency and connect allele counts to a 0/1/2 encoding relative to a named allele. Missing calls are not zero copies. Check understanding through a second hand-worked example.
4. Represent a small synthetic example in a real genotype format and use PLINK for one operation whose expected result is already understood. Compare software output with the manual calculation before expanding the dataset or pipeline.

Teach arithmetic and proportions now; introduce probability and Hardy–Weinberg ideas when needed for the next QC lesson, and regression and uncertainty before association work. The immediate lesson does not require understanding the statistics in the full Deng paper.

## Sources and provenance

Reviewed local [PRS notes](2026-09-08-prs-polygenic-risk-scores.md), [syllabus](../SYLLABUS.md), [reporting protocol](../docs/REPORTING_PROTOCOL.md), and [session template](templates/session-report.md) on 2026-09-10. This is a curriculum recommendation based on the learner's request; the Deng paper and score metadata were not independently reviewed or verified in this session.

## Decisions and artifacts

Recommended parking the PRS article questions, harmonization questions, and SNP ranking tasks for later, preserving the existing notes. Proposed next lesson: read a tiny synthetic genotype table. Created this report and indexed it; the syllabus and existing PRS note were not changed because the next action is a recommendation awaiting the learner's selection.

## Assumptions, limitations, and open questions

No phase was declared complete. Synthetic teaching work can begin while broader Phase 0 research-design questions remain open. A tiny dataset illustrates calculations but cannot justify research QC thresholds, estimate useful predictive performance, or support biological conclusions. Adjust lesson pace to demonstrated understanding rather than an assumed background.

## Next lesson

Suggested: “What exactly is in a genotype dataset?” Use four fictional samples and three fictional variants, with one missing entry, and begin with vocabulary and reading the table before introducing commands.

## Follow-up: lesson started

The project owner selected the small-table lesson and proposed starting in VCF because PLINK can create its native format from VCF. The exercise was implemented as `lessons/01-genomics-data-and-qc/tiny-genotypes.vcf`, with five fictional samples, eight fictional autosomal biallelic variants, and genotype calls only. The companion lesson README states the simplifying assumptions and begins with four hand-interpretation questions. The syllabus now identifies this checkpoint as the current action.

The tracked VCF is allowed through a narrow `.gitignore` exception applying only to that named synthetic file. PLINK-generated native files remain ignored. The installed PLINK version at lesson creation was PLINK v2.0.0-a.7.4 M1 (18 Aug 2026).

## Follow-up: first checkpoint reviewed

The learner correctly interpreted all genotypes at `toy1`, identified the missing calls at `toy4`, and calculated four alternate alleles among ten observed chromosome copies, for an alternate-allele frequency of 0.40. Feedback added to the lesson distinguishes a single-nucleotide variant from other records a VCF may contain and clarifies that `REF` is not necessarily the common allele and `ALT` is not necessarily a minor, effect, risk, or otherwise scientifically preferred allele.

## Follow-up: PLINK conversion completed

The learner used PLINK 2 to convert the synthetic VCF into native `.pgen`, `.pvar`, and `.psam` files. Inspection confirmed that PLINK loaded the expected five samples and eight variants. The log records PLINK v2.0.0-a.7.4 M1 (18 Aug 2026), the input VCF, output prefix, and successful conversion. Generated files remain ignored under `data/processed/`.

The next checkpoint is missingness. The learner will first predict variant and sample missingness from the VCF, then run `plink2 --missing` on the native files and reconcile the `.vmiss` and `.smiss` reports with those predictions. This isolates one QC concept before introducing thresholds or allele-frequency filtering.
