# Missingness-filtering checkpoint review

**Date:** 2026-09-11  
**Author:** Project owner with Codex (GPT-6) assistance  
**Session type:** Tutorial

## Prompts / scope

The project owner completed the third Phase 1 checkpoint and requested review of predictions and PLINK 2 results for separate variant- and sample-missingness filters.

## Teaching notes / findings

The completed work correctly distinguished the two filtering directions. With a missingness ceiling of 0.20, `--geno` removed `toy4`, whose variant missingness was 0.40, while retaining `toy5` and `toy7` at exactly 0.20. Independently, `--mind` removed Chen, whose sample missingness was 0.25. The learner correctly predicted seven remaining variants in the first output and four remaining samples in the second.

The key rule demonstrated by the boundary cases is that these options remove missing-call frequencies greater than the threshold. A value equal to the threshold remains. The two filters were run independently from the original dataset so that each result retained the denominator used in the preceding missingness exercise.

## Sources and provenance

Reviewed the synthetic VCF, the lesson README, the original `.vmiss` and `.smiss` reports, the filtered `.pvar` and `.psam` files, and both PLINK logs on 2026-09-11. The logs record PLINK v2.0.0-a.7.4 M1 (18 Aug 2026). All inputs contain fictional teaching data.

## Decisions and artifacts

Added feedback under `AI Comments on missingness-filtering answers` in the Phase 1 README. The feedback preserves the learner's self-corrected `toy1`/`toy4` transcription error, confirms the final analysis, clarifies the dimensions of both output datasets, and states the difference between `--geno` and `--mind` explicitly. Marked the checkpoint complete in `SYLLABUS.md`.

## Assumptions, limitations, and open questions

The threshold of 0.20 is illustrative and does not establish a suitable research QC threshold. The independent runs do not demonstrate the consequences or order of applying both filters in one pipeline. The tiny dataset supports transparent verification but no population or biological inference.

## Next lesson

Calculate alternate-allele counts and frequencies across the synthetic variants and compare them with a PLINK `--freq counts` report.
