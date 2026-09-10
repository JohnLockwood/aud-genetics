# Phase 1: reading a tiny genotype dataset

This first exercise uses [tiny-genotypes.vcf](tiny-genotypes.vcf), a deliberately small, entirely synthetic VCF containing five fictional samples and eight fictional variants. It is designed for hand calculation before using PLINK 2.

## Scope and assumptions

For this exercise, every variant is autosomal, diploid, and biallelic. Only the `GT` genotype field is present. Coordinates, identifiers, alleles, and samples are fictional; they must not be interpreted biologically or joined to a reference genome.

Within a row, `REF` names allele `0` and `ALT` names allele `1`:

| `GT` | Meaning |
|---|---|
| `0/0` | Two copies of the reference allele |
| `0/1` | One reference and one alternate allele |
| `1/1` | Two copies of the alternate allele |
| `./.` | Missing diploid genotype call |

These encodings do not mean that the reference allele is normal, protective, common, or ancestral. Missing calls also do not mean zero alternate alleles.

## First checkpoint: read the file

Before running PLINK, inspect the header and the eight data rows. Answer these questions:

1. What do the `REF` and `ALT` alleles mean for `toy1`?
2. In words, what is Chen's genotype at `toy1`?
3. Which genotype calls are missing at `toy4`?
4. How many alternate alleles are observed at `toy1`? What is the alternate-allele frequency?

The denominator for the last question is the number of observed chromosome copies. With five non-missing diploid samples at `toy1`, there are ten observed copies.

## Checkpoint -- Student Answers
1. REF (allele 0) gives A and ALT (allele 1) gives G.  So are all of these SNPs.  It seems like we're dealing with Nucleotide abbreviations.  For various people, Ada and Dia have two copies of reference, Ben and Eli have 1 ref and one alt (I'm assuming ref is generally the more common, and alt always signifies some variant we're interested in?).  Chen has two alts.  
2. Chen has two copies of the alternate allele, G.
3. Ada and Chen.
4. Overall in toy1 we have four alternate alleles, out of ten possible position (c.f. "ten observed copies"), so the frequency is 40%.

## AI Comments on student answers

All four answers are correct. The interpretation of each person's genotype at `toy1` is also correct: Ada and Dia are `A/A`, Ben and Eli are `A/G`, and Chen is `G/G`.

There are two important refinements to the terminology in answer 1:

* All eight rows in this particular teaching file are SNPs because each `REF` and `ALT` value is a single DNA base: `A`, `C`, `G`, or `T`. A real VCF can also contain insertions, deletions, multiallelic sites, and structural variants, so a VCF row is not necessarily a SNP.
* `REF` means the allele recorded in the reference genome assembly. It is not necessarily the more common allele in the study sample or a population. `ALT` means an allele represented in the VCF that differs from `REF`; it is not necessarily the allele of scientific interest, the minor allele, an effect allele, or a risk allele.

Answer 2 correctly reads `1/1` as two copies of the `ALT` allele, so Chen's genotype at `toy1` is `G/G`. Answer 3 correctly identifies Ada's and Chen's `./.` calls as missing at `toy4`.

The calculation in answer 4 is correct: the alternate-allele counts at `toy1` are 0 + 1 + 2 + 0 + 1 = 4, and 4 / 10 = 0.40. “Ten observed chromosome copies” or “ten called alleles” is more precise than “ten possible positions.” This 40% describes the five fictional samples in this exercise; such a tiny synthetic sample cannot provide a meaningful population-frequency estimate.

## Importing the VCF with PLINK 2

Once the hand interpretation is clear, use PLINK 2 to import the VCF and create its native files in a disposable or ignored output directory:

```sh
plink2 \
  --vcf lessons/01-genomics-data-and-qc/tiny-genotypes.vcf \
  --make-pgen \
  --out data/processed/tiny-genotypes
```

The generated `.pgen`, `.pvar`, `.psam`, and `.log` files remain ignored. Later exercises will ask PLINK to calculate missingness and allele frequencies, then compare its results with hand calculations.

The conversion was completed successfully on 2026-09-10. PLINK loaded five samples and eight variants. The resulting files have different roles:

* `.psam` is the sample table. It contains one row for each fictional person.
* `.pvar` is the variant table. It contains positions, identifiers, and alleles.
* `.pgen` is the binary genotype matrix connecting those samples and variants.
* `.log` records the command, software version, inputs, and messages from the run.

The `SEX` values in this example are `NA`, and there is no phenotype. That is expected because the teaching VCF supplied neither field, and neither is needed for this exercise.

## Second checkpoint: missingness

Missingness can be measured in two directions:

* **Variant missingness:** For one variant, what fraction of samples lack a genotype call?
* **Sample missingness:** For one sample, what fraction of variants lack a genotype call?

Before running PLINK, inspect the VCF and predict:

1. Which variant has the most missing genotype calls? What fraction of its five sample calls is missing?
2. Which sample has the most missing genotype calls? What fraction of its eight variant calls is missing?
3. Which variants and samples have no missing calls?

Then generate both reports:

```sh
plink2 \
  --pfile data/processed/tiny-genotypes \
  --missing \
  --out data/processed/tiny-missingness
```

PLINK writes two tabular reports:

* `tiny-missingness.vmiss` reports missingness by variant.
* `tiny-missingness.smiss` reports missingness by sample.

In each report, `MISSING_CT` is the count of missing genotype calls, `OBS_CT` is the number of calls considered, and `F_MISS` is `MISSING_CT / OBS_CT`. Compare the reports with the three predictions before proceeding to filtering.

## Checkpoint -- Student Answers on missingness

<!-- Record predictions, PLINK results, and interpretation here. -->

## AI Comments on missingness answers

<!-- Add feedback after the student completes the checkpoint. -->
