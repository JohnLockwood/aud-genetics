# Alternate-allele-frequency checkpoint review

**Date:** 2026-09-11  
**Author:** Project owner with Codex (GPT-6) assistance  
**Session type:** Tutorial

## Prompts / scope

The project owner completed the fourth Phase 1 checkpoint and requested review of hand-calculated alternate-allele counts and frequencies, PLINK `.acount` and `.afreq` reports, and questions about sample size, biallelic status, minor-allele frequency, and numerical precision.

## Teaching notes / findings

All eight hand-calculated alternate-allele counts, observation counts, and frequencies were correct and matched both PLINK reports. The learner also correctly explained that missing genotypes do not contribute to either the allele-count numerator or denominator.

The review distinguished a descriptive sample frequency from an estimate of population frequency. A MAF is defined and exactly calculable in this synthetic sample, although five samples provide a coarse and unstable estimate of any population frequency. Hypothesis-test significance is not required to calculate that descriptive proportion. Nonrandom missingness could bias an observed frequency.

The variants are biallelic by the stated exercise assumptions and because each VCF row has a single `ALT` allele. The examples show that `ALT` need not be minor: `toy8` has alternate frequency 1 and sample MAF 0, while `toy6` has alternate frequency 0.60 and reference frequency 0.40, making the reference allele minor in this sample.

## Sources and provenance

Reviewed the synthetic VCF, the completed lesson table and answers, the generated `.acount` and `.afreq` files, and their PLINK logs on 2026-09-11. The logs record PLINK v2.0.0-a.7.4 M1 (18 Aug 2026). All genotype data are fictional teaching data.

## Decisions and artifacts

Added feedback under `AI Comments on alternate-allele-frequency answers` in the Phase 1 README and marked the checkpoint complete in `SYLLABUS.md`. The feedback also explains that consistent decimal formatting is optional and should not be confused with greater inferential precision.

## Assumptions, limitations, and open questions

The exercise covers autosomal, diploid, biallelic hard calls in unrelated fictional founders. It does not yet address multiallelic frequency terminology, genotype dosages, sex chromosomes, related samples, uncertainty intervals, or frequency differences among populations.

## Next lesson

Derive the sample minor-allele frequency for each synthetic variant, then use illustrative boundary cases to understand PLINK's `--maf` filter.

## Follow-up: genetics-foundations gap identified

The learner reported that the phrase “autosomal, diploid, biallelic variants” assumed unfamiliar genetics vocabulary. A short foundations bridge was added before the MAF lesson. It connects DNA bases, chromosomes, loci, alleles, and sample genotypes; explains how the three assumptions determine the allele-count arithmetic; and distinguishes a VCF variant record from a site that is polymorphic within the analyzed sample.

The bridge includes a small checkpoint using `toy1` and points to the NHGRI Talking Glossary for concise definitions and OpenStax Biology 2e section 10.1 for a longer explanation of chromosome pairs and diploidy. The syllabus now places this bridge before the MAF exercise.
