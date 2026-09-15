# Minor-allele-frequency lesson setup

**Date:** 2026-09-15  
**Author:** Project owner with Codex (GPT-6) assistance  
**Session type:** Tutorial design

## Prompts / scope

The project owner asked whether the next lesson on minor-allele frequency was
ready and requested that it be added to the Phase 1 README if necessary.

## Teaching notes / findings

The syllabus named sample MAF and PLINK's `--maf` filter as the next action, but
the README did not yet contain that lesson. The new checkpoint builds directly
on the completed alternate-allele-frequency table. It asks the student to derive
reference frequencies, identify the less frequent allele, and calculate sample
MAF for all eight fictional biallelic variants.

The exercise distinguishes an exact descriptive frequency in this synthetic
sample from an estimate of population frequency. It also covers two edge cases:
a 0.50/0.50 tie has MAF 0.50 without a unique minor allele, and a record with
only one observed allele has sample MAF 0.

## Sources and provenance

* [PLINK 2.0 input filtering documentation](https://www.cog-genomics.org/plink/2.0/filter), accessed 2026-09-15.
* [PLINK 2.0 allele-frequency documentation](https://www.cog-genomics.org/plink/2.0/basic_stats), accessed 2026-09-15.
* PLINK `v2.0.0-a.7.4 M1 (18 Aug 2026)`, installed locally.
* `lessons/01-genomics-data-and-qc/tiny-genotypes.vcf`, entirely synthetic.

## Decisions and artifacts

Added the fifth checkpoint to the Phase 1 README. It uses an explicit
`--maf 0.40 minor` filter so that variants below the lower bound are removed and
variants exactly at 0.40 are retained. A disposable verification run against the
local synthetic PGEN dataset removed four variants and retained four; no generated
output was added to the repository.

The lesson notes that PLINK 2 currently defaults to `nonmajor` frequency for
`--maf`. This equals minor-allele frequency for the biallelic teaching records,
while the explicit `minor` mode makes the intended definition unambiguous and
prepares for later multiallelic examples.

## Assumptions, limitations, and open questions

The threshold is deliberately high and is useful only for making the boundary
behavior visible in eight variants. It is not a recommended QC threshold. These
sample frequencies are too unstable to stand in for population frequencies, and
frequency changes after sample filtering are deferred until a larger public
dataset is introduced.

## Next lesson

Complete the sample-MAF table, predict the result of `--maf 0.40 minor`, run the
filter, and compare the retained variant IDs and log counts with the prediction.
