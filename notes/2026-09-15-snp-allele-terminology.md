# Distinguishing sites, variants, and alleles

**Date:** 2026-09-15  
**Author:** Project owner with Codex (GPT-6) assistance  
**Session type:** Tutorial

## Prompts / scope

The project owner asked whether all autosomal SNPs are alleles, whether all alleles are SNPs, and whether autosomal variants must also be described as biallelic.

## Teaching notes / findings

An SNP or SNV and an allele are different kinds of entities. The SNP or SNV is the genomic site or variant record; alleles are the alternative sequence values represented at that site. At the fictional `toy1` record, the single-base site is the SNV and `A` and `G` are its alleles.

“Autosomal,” “single-nucleotide,” and “biallelic” describe independent properties: genomic location, size of the sequence difference, and number of represented allele forms. An autosomal variant can be biallelic or multiallelic; a single-nucleotide site can have more than two alleles; and a biallelic variant can be a substitution or an insertion/deletion.

Careful terminology distinguishes SNV, the general single-base category, from SNP, traditionally an SNV present in at least 1% of a population. The fictional dataset establishes single-base REF/ALT records but cannot establish population prevalence, so the lesson now calls them SNV records rather than asserting that all are SNPs.

## Sources and provenance

* [NHGRI: Human Genomic Variation](https://www.genome.gov/about-genomics/educational-resources/fact-sheets/human-genomic-variation), accessed 2026-09-15.
* [NHGRI: Single Nucleotide Polymorphisms](https://www.genome.gov/genetics-glossary/Single-Nucleotide-Polymorphisms-SNPs), accessed 2026-09-15.
* Local Phase 1 README, genetics-foundations bridge, and synthetic VCF, reviewed 2026-09-15.

## Decisions and artifacts

Corrected the Phase 1 README's earlier loose statement that all eight fictional records are SNPs. Expanded the genetics-foundations bridge with a site-versus-allele distinction, a table separating the independent descriptors, examples of multiallelic SNVs and biallelic indels, and the SNV/SNP frequency distinction.

## Assumptions, limitations, and open questions

The 1% SNP convention is useful for careful teaching, but terminology is not perfectly uniform across tools and publications; some use SNP loosely for any single-base variant. Multiallelic frequency terminology and representation will be deferred until the biallelic foundation is secure.

## Next lesson

Return to sample minor-allele frequency and PLINK's `--maf` filter.

## Follow-up: foundations checkpoint reviewed

The project owner completed the five questions in the genetics-foundations
bridge. The VCF fields and homozygous/heterozygous classifications were correct.
The review identified one conceptual swap: autosomal describes the locus's
location, diploid describes the number of chromosome copies represented in a
complete genotype, and biallelic describes the number of allele forms represented
by the record. The lesson now gives item-by-item feedback and explicitly separates
these three ideas.

The reference-genome answer was substantially correct. The feedback adds that a
linear reference is a shared sequence and coordinate framework assembled from
multiple contributors, rather than population-frequency evidence or one person's
intact diploid genome. It supports alignment, annotation, variant coordinates,
and cross-dataset comparison, while the reference allele alone says nothing about
frequency, health effect, or ancestry.

Additional source consulted: [NHGRI Human Genome Reference Program](https://www.genome.gov/Funded-Programs-Projects/Human-Genome-Reference-Program), accessed 2026-09-15.
