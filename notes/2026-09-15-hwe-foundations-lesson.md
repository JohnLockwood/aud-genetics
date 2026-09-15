# Hardy–Weinberg-equilibrium foundations lesson

**Date:** 2026-09-15  
**Author:** Project owner with Codex (GPT-6) assistance  
**Session type:** Tutorial design

## Prompts / scope

The project owner chose to continue to observed genotype frequencies and
Hardy–Weinberg equilibrium and requested that the README include background
information on HWE.

## Teaching notes / findings

The sixth Phase 1 checkpoint now separates allele frequencies, observed genotype
frequencies, and HWE-expected genotype frequencies. It derives the biallelic HWE
proportions `p²`, `2pq`, and `q²` from random union of allele copies and uses
`toy1` as a complete worked example. The student will calculate the more visibly
discordant `toy7` example by hand.

The background presents HWE as a population-genetic null model rather than a
property guaranteed by a VCF. It summarizes the model assumptions and several
causes of departure, including chance, technical error, population substructure,
relatedness or nonrandom mating, selection or ascertainment, and incorrect ploidy.
The lesson emphasizes that an HWE p-value neither diagnoses the cause nor gives
the probability that HWE is true.

## Sources and provenance

* [PLINK 2.0 `--hardy` documentation](https://www.cog-genomics.org/plink/2.0/basic_stats#hardy), accessed 2026-09-15.
* Wigginton JE, Cutler DJ, Abecasis GR. [A Note on Exact Tests of Hardy-Weinberg Equilibrium](https://doi.org/10.1086/429864). *American Journal of Human Genetics*. 2005;76:887–893. DOI: 10.1086/429864.
* PLINK `v2.0.0-a.7.4 M1 (18 Aug 2026)`, installed locally.
* `lessons/01-genomics-data-and-qc/tiny-genotypes.vcf`, entirely synthetic.

## Decisions and artifacts

Added the sixth checkpoint to the Phase 1 README. It uses the original PGEN
fileset and generates separate `--geno-counts` and `--hardy` reports. A disposable
verification run confirmed the expected report schemas and all eight synthetic
rows. No generated output was added to the repository.

The lesson reports HWE statistics without applying an `--hwe` filter. Five
fictional samples provide useful arithmetic but cannot justify a scientific
threshold. Filtering will follow only after the student can interpret the report
and its limitations.

## Assumptions, limitations, and open questions

All teaching variants are fictional, autosomal, diploid, and biallelic. The
samples are represented as unrelated founders solely for PLINK's calculation;
they do not constitute a population sample. The exact-test p-values are highly
discrete at this sample size and have no inferential or QC value beyond showing
the report format.

## Next lesson

Complete the `toy7` hand calculation, generate the genotype-count and HWE reports,
and explain the observed/expected comparison and the limits of the exact-test
p-value.
