# HWE checkpoint review

**Date:** 2026-09-16  
**Author:** Project owner with Codex (GPT-6) assistance  
**Session type:** Tutorial

## Prompts / scope

The project owner completed the observed-genotype-frequency and
Hardy–Weinberg-equilibrium checkpoint and requested review of the hand
calculations, PLINK reports, and interpretation.

## Teaching notes / findings

The final `toy7` table correctly gives observed genotype counts `0, 4, 0`, HWE
expected frequencies `0.25, 0.50, 0.25`, and expected counts `1, 2, 1`. The
review corrected a denominator mix-up: `N` is four nonmissing diploid genotypes,
while eight is the number of observed allele copies. The four reference and four
alternate copies therefore give allele frequencies `p = q = 0.5`, rather than
`p = q = 4`.

The generated genotype-count report agrees with the source VCF: `toy1` has counts
`2, 2, 1`, and `toy7` has counts `0, 4, 0` with one missing call. The HWE report
also confirms observed and expected heterozygote frequencies of 1.0 and 0.5 at
`toy7`.

PLINK's exact-test p-value for `toy7` is 0.314286. This is not conventionally
small and does not support rejecting HWE. The result illustrates why a large
descriptive difference can remain unsurprising with only four observed genotypes.
An HWE p-value cannot identify the biological or technical cause of a departure.

## Sources and provenance

* `lessons/01-genomics-data-and-qc/tiny-genotypes.vcf`, entirely synthetic.
* `data/processed/tiny-genotypes-counts.gcount` and `data/processed/tiny-hwe.hardy`, generated locally and ignored by Git.
* PLINK `v2.0.0-a.7.4 M1 (18 Aug 2026)`.
* [PLINK 2.0 `--hardy` documentation](https://www.cog-genomics.org/plink/2.0/basic_stats#hardy), accessed 2026-09-16.

## Decisions and artifacts

Added item-by-item feedback and a corrected reference table to the Phase 1
README. Marked the HWE checkpoint complete in the syllabus.

## Assumptions, limitations, and open questions

The synthetic samples do not constitute a population sample, and the exact-test
p-values are too discrete and underpowered to support a scientific HWE filter.
No `--hwe` threshold was selected or applied.

## Next lesson

Introduce per-sample observed and expected heterozygosity using PLINK's `--het`,
and distinguish sample-level heterozygosity checks from per-variant HWE testing.
