# Genetics foundations for reading genotype data

This short bridge introduces only the genetics vocabulary needed to understand the synthetic VCF and its allele-count calculations. It is not intended to replace a full genetics course.

## From DNA to a genotype call

DNA is written as a sequence of four bases: `A`, `C`, `G`, and `T`. A human genome is organized into chromosomes, and a **locus** is a particular location on a chromosome. For example, `toy1` is our fictional identifier for a locus at position 100 on chromosome 1.

An **allele** is one version of the DNA sequence at a locus. At `toy1`, the VCF represents two alleles:

* `A`, labeled `REF` because it is the allele assigned to the reference sequence in this fictional record;
* `G`, labeled `ALT` because it differs from `REF`.

The `toy1` **site or record** is a single-nucleotide variant; `A` and `G` are the **alleles** at that site. The variant is the place where sequence can differ, while the alleles are the sequence values represented there. Thus, an SNP or SNV is not itself an allele.

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

These terms describe separate properties:

| Term | Question answered |
|---|---|
| Autosomal | Where is the locus? |
| Single-nucleotide variant | How much sequence differs at the locus? |
| Biallelic | How many allele forms does this record represent? |
| Diploid | How many chromosome copies does each modeled sample contribute? |

None of the first three implies either of the others. An autosomal site can be biallelic or multiallelic. A single-nucleotide site can have more than two alleles, such as `A`, `C`, and `G`. A biallelic variant can be a single-base substitution or an insertion or deletion.

In careful terminology, **SNV** is the general term for a single-base variant. **SNP** traditionally means an SNV found in at least 1% of a population, although SNP is also used loosely for single-base variant records. Our fictional data establish that the rows represent SNVs; they do not establish population frequencies needed to classify them as SNPs.

## Closely related terms

| Term | Meaning in this lesson | Example |
|---|---|---|
| Homozygous | Both allele calls are the same | `0/0` or `1/1` |
| Heterozygous | The two allele calls differ | `0/1` |
| Variant | A genomic site or record where alternative sequence is represented | The `toy1` VCF row, with `A` and `G` as its alleles |
| SNV | A variant involving a single nucleotide position | The `toy1` record |
| SNP | An SNV common enough in a population to be called a polymorphism | Not established by this fictional dataset |
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

1) The chromosome is 1, the locus position is 100, the REF allele is A and the alt allele is G.
2) Since this is an autosomal chromosome, it means it is diploid.  Therefore, it's not just one reference allele, there are two.
3) At toy1, Ada, Chen, and Dia are homozygous, while Ben and Eli are heterozygous.
4) Biallelic means there are two possible alleles (for this data set at least) at this location.  Autosomal doesn't speak to the number of possible alleles, but rather to the number of copies we're dealing with (i.e. haploid vs diploid).
5. My understanding is that a reference genome simply represents locations and alleles in real data (as you mention above), but that it represents a single whole genome (albeit perhaps one constructed from multiple individuals?).  Therefore, it does not contain population data per se, and one can draw no conclusions from it as far as I know other than where to start looking for an individual gene (assuming it was sequenced to that reference, presumably).


## AI comments on student answers

You read the VCF record correctly, and you correctly classified every sample's
genotype. The main point to revisit is that **autosomal** and **diploid** answer
different questions.

1. **Correct.** `toy1` is at chromosome 1, position 100; `A` is `REF` and `G`
   is `ALT`.

2. **The count is correct, but the reason needs one correction.** Ada contributes
   two allele observations because this exercise models the samples as
   **diploid** at this locus. Her `0/0` therefore decodes to `A/A`: two observed
   reference-allele copies. “Autosomal” tells us that the locus is on a numbered
   chromosome; it does not itself imply diploidy. Human somatic cells ordinarily
   have two copies of each autosome, which is why the ideas often appear together,
   but they remain separate concepts. For example, a human gamete is haploid even
   though it contains autosomes.

3. **Correct.** Ada (`0/0`), Chen (`1/1`), and Dia (`0/0`) are homozygous. Ben
   and Eli (`0/1`) are heterozygous. Notice that *homozygous* does not mean
   “homozygous reference”: Chen is homozygous alternate.

4. **Your first sentence is correct; the second swaps two definitions.**
   **Biallelic** tells us that this record represents two allele labels, `REF`
   and `ALT`. **Autosomal** tells us where the locus is. **Diploid** tells us
   that each complete genotype contains two allele observations. A useful check
   is:

   ```text
   autosomal → where?
   diploid   → how many chromosome copies per genotype?
   biallelic → how many allele forms represented in the record?
   ```

5. **Broadly correct, with a useful refinement.** A linear reference genome is a
   standard reference sequence and coordinate framework, not a survey of allele
   frequencies and not a definition of the healthy, normal, or ancestral allele.
   Your parenthetical intuition is right: GRCh38 is a composite assembled from
   DNA contributed by multiple people, rather than one person's intact diploid
   genome. It represents one assigned sequence along its primary coordinate path,
   so the base labeled `REF` is simply the base in that reference at that
   coordinate.

   We can infer more from a reference than where to begin looking for a gene. It
   lets researchers align sequence reads, locate gene annotations, state variant
   coordinates, and compare results across datasets. Data do need to name the
   same assembly—or be translated between assemblies—for coordinates to match.
   However, a dataset can use GRCh38 coordinates without every sample having been
   whole-genome sequenced; arrays and imputation results can also be reported on
   that assembly. What the reference alone cannot tell us is whether its allele
   is common, beneficial, harmful, or ancestral.

The conceptual correction to carry into allele-frequency work is: a complete
diploid genotype contributes two allele observations. Whether the locus is
autosomal helps us decide whether that diploid model is appropriate, but it is
not the definition of diploidy.

## Short review resources

For a brief reference, use the [NHGRI Talking Glossary of Genetic Terms](https://www.genome.gov/genetics-glossary), especially the entries for DNA, chromosome, autosome, allele, genotype, variant, diploid, homozygous, and heterozygous. It is designed for approachable definitions rather than continuous textbook reading.

NHGRI's [Human Genomic Variation fact sheet](https://www.genome.gov/about-genomics/educational-resources/fact-sheets/human-genomic-variation) distinguishes the general term SNV from the population-frequency term SNP.

NHGRI's [Human Genome Reference Program](https://www.genome.gov/Funded-Programs-Projects/Human-Genome-Reference-Program) explains the reference's roles in sequence alignment and as a shared coordinate system.

For a slightly longer review of chromosome pairs and diploidy, read [OpenStax Biology 2e, section 10.1: Cell Division](https://openstax.org/books/biology-2e/pages/10-1-cell-division). Mendelian dominance and inheritance patterns can wait until they become relevant; they are not needed to finish the current VCF arithmetic.

Sources accessed 2026-09-11 and 2026-09-15.
