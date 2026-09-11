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

## Checkpoint -- Student Answers



## AI Comments on student answers



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

My predictions were:

1. Variant toy4 has the most missing genotype calls, with 2/5 (40%) missing. (Ada and chen)
2. Chen has the most missing genotype calls, with 2/8 (1/4, 25%) of its variant calls missing?  (toy4 and toy7)
3. The following variants have no missing samples:  toy1, toy2, toy3, toy6, toy8.  For samples, the ones with no missing variants are Ben and Dia.

Note:  Using `cat data/processed/tiny-missingness.smiss` and `cat data/processed/tiny-missingness.vmiss`, I compared the files and they seem to line up with the predictions correctly.  Can you confirm, oh AI professor?

## AI Comments on missingness answers

The predictions and their interpretation are correct, and both PLINK reports confirm them.

* In `.vmiss`, `toy4` has `MISSING_CT = 2`, `OBS_CT = 5`, and `F_MISS = 0.4`. The other incomplete variants are `toy5` and `toy7`, each with one missing call and `F_MISS = 0.2`. The remaining five variants have `F_MISS = 0`.
* In `.smiss`, Chen has `MISSING_CT = 2`, `OBS_CT = 8`, and `F_MISS = 0.25`. Ada and Eli each have one missing call and `F_MISS = 0.125`; Ben and Dia have none.

The denominator changes with the direction of the report. A row in `.vmiss` asks how many of the five samples are missing at that variant, whereas a row in `.smiss` asks how many of the eight variants are missing for that sample. This distinction becomes important when the numbers of samples and variants are much larger and less memorable.

There is one transcription error in the note about inspecting the reports: it gives `cat data/processed/tiny-missingness.smiss` twice. The second command should be:

```sh
cat data/processed/tiny-missingness.vmiss
```

OK, fixed, thanks.

The underlying comparison was nevertheless correct. This checkpoint demonstrates how to calculate and verify missingness; it does not yet establish scientifically defensible filtering thresholds.

## Third checkpoint: filtering on missingness

PLINK uses two similarly named filters in opposite directions:

* `--geno` removes **variants** whose missing-call frequency is greater than the specified threshold.
* `--mind` removes **samples** whose missing-call frequency is greater than the specified threshold.

The threshold is a ceiling. With a threshold of `0.20`, an item with exactly 20% missingness is retained; an item with more than 20% is removed. PLINK 2 uses a default threshold of `0.1` if either option is supplied without a number, but this exercise supplies the number explicitly.

We will apply each filter separately to the original dataset. This lets us see what each option does without allowing one filter to change the data considered by the other.

Before running PLINK, use the `.vmiss` and `.smiss` reports to predict:

1. Which variants will `--geno 0.20` remove? Which variants sit exactly on the threshold and should remain?
2. Which samples will `--mind 0.20` remove?
3. How many variants and samples should remain in each output dataset?

Run the variant filter:

```sh
plink2 \
  --pfile data/processed/tiny-genotypes \
  --geno 0.20 \
  --make-pgen \
  --out data/processed/tiny-geno-filtered
```

Run the sample filter independently from the same original dataset:

```sh
plink2 \
  --pfile data/processed/tiny-genotypes \
  --mind 0.20 \
  --make-pgen \
  --out data/processed/tiny-mind-filtered
```

Inspect `tiny-geno-filtered.pvar` to see which variants remain and `tiny-mind-filtered.psam` to see which samples remain. Also read each `.log`: PLINK reports how many variants or samples it removed and how many it retained.

The value `0.20` was chosen to make the boundary behavior visible in this tiny dataset. It is an illustrative teaching threshold, not a recommended default for research. Real thresholds depend on the assay, calling or imputation process, cohort, downstream analysis, and a documented QC plan.

## Checkpoint -- Student Answers on missingness filtering

<!-- Record predictions, observed results, and an explanation of the difference between --geno and --mind here. -->

1. For --geno 0.20, toy1 is the only variant to be removed. (That's a typo in my original answer; on review, it should have been toy4, as is obvious from `cat data/processed/tiny-missingness.vmiss`.  I leave it here uncorrected in the interests of not lying to an AI, in the hope that when they take over the world, they won't kill me. hahaha)  In contrast, toy5 and toy7 are exactly on the threshold and will remain, as will everything below the threshold (the rest are at zero).
2. For --mind 0.20, only Chen will be removed, being above the threshold.  Everything else is below the threshold.  No samples are exactly on the threshold.
3. For samples, of five samples, four should remain.  For variants, of eight variants, seven should remain.

## AI Comments on missingness-filtering answers

The corrected predictions are accurate and agree with the generated files and logs.

1. For `--geno 0.20`, `toy4` is the only removed variant because its missingness is 0.40. `toy5` and `toy7`, each at exactly 0.20, remain because PLINK removes values **greater than** the threshold rather than values equal to it. The resulting `.pvar` contains the other seven variants.
2. For `--mind 0.20`, Chen is the only removed sample because Chen's missingness is 0.25. Ada and Eli are at 0.125, while Ben and Dia are at zero. The resulting `.psam` contains four samples.
3. The remaining counts are correct, with one useful qualification: these are two independent output datasets. `tiny-geno-filtered` has seven variants and all five samples; `tiny-mind-filtered` has all eight variants and four samples.

The distinction between the commands is present in the predictions, though it is worth stating explicitly: `--geno` evaluates each **variant across samples**, while `--mind` evaluates each **sample across variants**. Applying them separately here preserves the original denominators and makes each result easy to verify. A later combined QC pipeline will require attention to filtering order because removing samples can change variant missingness, and removing variants can change sample missingness.

The initial `toy1` entry was a caught and documented transcription error, not a conceptual error in the completed analysis. Checking the prediction against `.vmiss`, then checking PLINK's log and output `.pvar`, is exactly the right recovery process.

## Fourth checkpoint: alternate-allele counts and frequencies

For these fictional autosomal, diploid, biallelic variants, each nonmissing genotype contributes two observed allele copies:

| Genotype | Alternate-allele copies | Observed allele copies |
|---|---:|---:|
| `0/0` | 0 | 2 |
| `0/1` | 1 | 2 |
| `1/1` | 2 | 2 |
| `./.` | 0 | 0 |

The last row needs careful wording: a missing genotype contributes nothing to either count because its alleles were not observed. It does not provide evidence for zero alternate alleles.

For each variant:

```text
alternate-allele frequency = alternate-allele copies / observed allele copies
```

Use the VCF to complete this table by hand before running PLINK. `toy1` is carried forward as the worked example from the first checkpoint.

| Variant | `ALT` | Alternate copies | Observed copies | Alternate frequency |
|---|---|---:|---:|---:|
| `toy1` | G | 4 | 10 | 0.40 |
| `toy2` |  |  |  |  |
| `toy3` |  |  |  |  |
| `toy4` |  |  |  |  |
| `toy5` |  |  |  |  |
| `toy6` |  |  |  |  |
| `toy7` |  |  |  |  |
| `toy8` |  |  |  |  |

Then ask:

1. Why do `toy4`, `toy5`, and `toy7` have fewer observed allele copies than `toy1`?
2. Which variant has alternate-allele frequency 0? Which has alternate-allele frequency 1?
3. Why is “alternate allele” not a synonym for “minor allele”? For a biallelic variant, the minor-allele frequency is the smaller of the reference- and alternate-allele frequencies.

Generate PLINK's allele-count report:

```sh
plink2 \
  --pfile data/processed/tiny-genotypes \
  --freq counts \
  --out data/processed/tiny-allele-counts
```

This writes `tiny-allele-counts.acount`. In this dataset, `ALT_CTS` is the alternate-allele count and `OBS_CT` is the number of observed allele copies. PLINK calculates frequencies from founders by default; all five fictional samples are founders, so all are included here.

Generate the corresponding frequency report:

```sh
plink2 \
  --pfile data/processed/tiny-genotypes \
  --freq \
  --out data/processed/tiny-allele-frequencies
```

This writes `tiny-allele-frequencies.afreq`, where `ALT_FREQS` reports the alternate-allele frequency. Compare both PLINK reports, row by row, with the hand-completed table. Read both logs as part of the check.

## Checkpoint -- Student Answers on alternate-allele frequency

| Variant | `ALT` | Alternate copies | Observed copies | Alternate frequency |
|---|---|---:|---:|---:|
| `toy1` | G | 4 | 10 | 0.40 |
| `toy2` | T |  |  |  |
| `toy3` | A |  |  |  |
| `toy4` | C |  |  |  |
| `toy5` | C |  |  |  |
| `toy6` | T |  |  |  |
| `toy7` | G |  |  |  |
| `toy8` | A |  |  |  |


<!-- Complete the table above or reproduce it here, answer the three interpretation questions, and describe whether both PLINK reports agree. -->

## AI Comments on alternate-allele-frequency answers

<!-- Add feedback after the student completes the checkpoint. -->
