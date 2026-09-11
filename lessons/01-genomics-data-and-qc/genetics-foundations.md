# Genetics foundations for reading genotype data

This short bridge introduces only the genetics vocabulary needed to understand the synthetic VCF and its allele-count calculations. It is not intended to replace a full genetics course.

## From DNA to a genotype call

DNA is written as a sequence of four bases: `A`, `C`, `G`, and `T`. A human genome is organized into chromosomes, and a **locus** is a particular location on a chromosome. For example, `toy1` is our fictional identifier for a locus at position 100 on chromosome 1.

An **allele** is one version of the DNA sequence at a locus. At `toy1`, the VCF represents two alleles:

* `A`, labeled `REF` because it is the allele assigned to the reference sequence in this fictional record;
* `G`, labeled `ALT` because it differs from `REF`.

A **genotype** is the allele call for one sample at a locus. In our VCF, Chen's `1/1` at `toy1` means `G/G`: both called allele copies are the alternate allele.

The hierarchy is:

```text
genome
  → chromosome
    → locus (a genomic location)
      → possible alleles at that locus
        → one sample's genotype at that locus
```

## Decoding “autosomal, diploid, biallelic”

These three words state the assumptions that make our arithmetic simple:

**Autosomal** means located on one of the numbered chromosomes rather than a sex chromosome. All our fictional variants are on chromosome 1, one of the 22 human autosomes. Sex chromosomes require additional care because the number of chromosome copies can differ among samples and across their regions.

**Diploid** means that we model each sample as having two chromosome copies at the locus. Consequently, each nonmissing genotype contributes two observed allele copies. In the usual inheritance model, one homologous chromosome copy came from each biological parent.

**Biallelic** means that the VCF record represents two possible allele labels: one `REF` and one `ALT`. A real VCF record can instead list several alternate alleles separated by commas. A site might also have additional alleles in a broader population even when only two are represented in a particular dataset.

Put together, the phrase means:

> These fictional records are on a numbered chromosome, each sample contributes two allele copies when its genotype is observed, and each record represents one reference and one alternate allele.

That is why the genotypes in this exercise can be written as `0/0`, `0/1`, or `1/1`, and why five complete samples contribute ten observed allele copies.

## Closely related terms

| Term | Meaning in this lesson | Example |
|---|---|---|
| Homozygous | Both allele calls are the same | `0/0` or `1/1` |
| Heterozygous | The two allele calls differ | `0/1` |
| Variant | A genomic site or record where alternative sequence is represented | The `toy1` VCF row |
| Polymorphic in this sample | More than one allele is actually observed among these samples | `toy1` is polymorphic; `toy2` is not |
| Reference genome | A coordinate system and reference sequence used to describe loci and alleles | GRCh38 in real data; our toy coordinates are fictional |

“Variant” and “polymorphic in this sample” are not identical. A VCF can contain a variant record whose alternate allele has count zero in the particular samples being analyzed, as `toy2` illustrates. Likewise, `toy8` has no variation within this sample even though every observed allele is `ALT` relative to the fictional reference record.

## Checkpoint

Using the `toy1` row and the sample columns in [tiny-genotypes.vcf](tiny-genotypes.vcf), answer in your own words:

1. What are the chromosome, locus position, `REF` allele, and `ALT` allele?
2. Why does Ada's `0/0` genotype contribute two allele observations rather than one?
3. Which samples are homozygous at `toy1`, and which are heterozygous?
4. Which part of “autosomal, diploid, biallelic” tells us that there are only two allele labels in this record?
5. Why is the reference genome not a statement about what is most common, healthy, or ancestral?

## Student answers

<!-- Add answers here. -->

## AI comments on student answers

<!-- Add feedback after the checkpoint is completed. -->

## Short review resources

For a brief reference, use the [NHGRI Talking Glossary of Genetic Terms](https://www.genome.gov/genetics-glossary), especially the entries for DNA, chromosome, autosome, allele, genotype, variant, diploid, homozygous, and heterozygous. It is designed for approachable definitions rather than continuous textbook reading.

For a slightly longer review of chromosome pairs and diploidy, read [OpenStax Biology 2e, section 10.1: Cell Division](https://openstax.org/books/biology-2e/pages/10-1-cell-division). Mendelian dominance and inheritance patterns can wait until they become relevant; they are not needed to finish the current VCF arithmetic.

Sources accessed 2026-09-11.
