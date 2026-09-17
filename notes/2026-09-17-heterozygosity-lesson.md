# Per-sample heterozygosity lesson setup

**Date:** 2026-09-17  
**Author:** Project owner with Codex (GPT-6) assistance  
**Session type:** Tutorial design

## Prompts / scope

The project owner requested the next Phase 1 lesson on PLINK's `--het` command.

## Teaching notes / findings

The seventh checkpoint contrasts the orientation of the two calculations: HWE
summarizes each variant across samples, while `--het` summarizes each sample
across variants. It introduces observed and expected homozygous and heterozygous
counts and PLINK's method-of-moments estimate
`F = 1 - O(HET) / E(HET)`.

The lesson treats `F` as a QC diagnostic requiring context. Positive values mean
heterozygote deficiency and negative values mean heterozygote excess, but neither
sign identifies a biological or technical cause. Research use requires credible
allele-frequency estimates, suitable ancestry grouping, many well-called
autosomal variants, and approximate linkage equilibrium.

## Sources and provenance

* [PLINK 2.0 `--het` documentation](https://www.cog-genomics.org/plink/2.0/basic_stats#inbreeding), accessed 2026-09-17.
* PLINK `v2.0.0-a.7.4 M1 (18 Aug 2026)`, installed locally.
* `lessons/01-genomics-data-and-qc/tiny-genotypes.vcf`, entirely synthetic.

## Decisions and artifacts

Added the seventh checkpoint to the Phase 1 README. A plain `--het` verification
run stopped because the immediate fileset has fewer than 50 samples and no
external frequency file. The lesson preserves this warning as an important
methodological point.

For teaching only, the checkpoint uses
`--het small-sample cols=hom,het,nobs,f`. A disposable verification run completed,
skipped the two monomorphic variants, and produced the expected five sample rows.
No generated output was added to the repository.

## Assumptions, limitations, and open questions

The `small-sample` modifier makes the demonstration runnable; it cannot make
allele frequencies from five fictional samples scientifically reliable. The six
analyzed variants are also far too few for sample-level QC, and their linkage
relationships are fictional. No sample exclusion threshold is proposed.

## Next lesson

Complete the observed-count table, generate the `.het` report, verify one `F`
calculation, and explain why the extreme-looking values do not support sample
diagnoses or exclusions.
