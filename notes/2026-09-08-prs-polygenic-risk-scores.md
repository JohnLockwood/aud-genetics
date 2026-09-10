# Polygenic Risk Scores (PRS)

## Notes from September 8, 2026

PRS stands for Polygenic Risk Score.  A related but perhaps somewhat broader term is a Polygenic Gene Score, which is described well in the [PGS Catalog](https://www.pgscatalog.org/about/):

> A polygenic score (PGS) aggregates the effects of many genetic variants into a single number which predicts genetic predisposition for a phenotype. PGS are typically composed of hundreds-to-millions of genetic variants (usually SNPs) which are combined using a weighted sum of allele dosages multiplied by their corresponding effect sizes, as estimated from a relevant genome-wide association study (GWAS).

> PGS nomenclature is heterogeneous: they can also be referred to as genetic scores or genomic scores, and as polygenic risk scores (PRS) or genomic risk scores (GRS) if they predict a discrete phenotype, such as a disease.

We end up with a single number, which is the sum of the weights for each variation (typically an SNP) detected.

## A First Exercise:

We begin by investigating a PRS scoring file for Alcohol Use Disorder (AUD).  Our tasks are:

* [ ] Understand the article explaining the research, i.e. Deng et al., "A high-resolution PheWAS approach to alcohol-related polygenic risk scores reveals mechanistic influences of alcohol reinforcing value and drinking motives" (https://academic.oup.com/alcalc/article/59/2/agad093/7585168, accessed 9/6/2026). This is available locally as literature/papers/Deng_et_al_AUD_PRS.pdf
* [x] Grab a Makefile from my broader [bioinformatics project] and modify it to download the one or more  PRS data scoring files. OK but see TO DO SECTION BELOW...

## Provenance:

Most of this file were human written but I did consult [ChatGPT](https://chatgpt.com/share/6aa00dc4-127c-83ea-b06e-9acb84dd74c9) on a couple of points as I went along, bumping into usage limits as always. :(.

Here's how ChatGPT suggested we document this:

```
PGP: PGP000731
Paper: Deng et al., 2024

Scores:
- PGS005211 — AUDIT_C
- PGS005212 — AUDIT_P

Development ancestry: European
Evaluation ancestry: European
Genome build: hg19
```

Note that our online source for this (https://ftp.ebi.ac.uk/pub/databases/spot/pgs/scores/PGS005211/ScoringFiles/) also includes a "Harmonized" directory, which updates the scoring file to be applicable to more recent genome standards, i.e. GRCh37 and GRCh38.

Open question:  How are these created?

Hey cool, thanks to ChatGPT TIL about zcat!  No need to unzip the file necessarily...


I've sorted the dataframe using Polars in scripts/python/read_pgs005211.py for now since the effect_weight needs to be considered as a number, and I don't know offhand how to achieve that using Linux "sort" command.  Oh wait, yes I do:

```
sort -k2 -n data.txt # Assumes sorting on second column is numeric.
```
OK, that means I didn't need to un-gzip it necessarily.

## TO DO:

* [ ] Document how to do the sorting using sort etc, even if it means supplanting the python script with some simple bash equivalent.
* Go back and read the article (RTFM, dude.) See todo list item above
* [ ] Consider that if you're looking to discover top weighted SNPs, you might need a harmonized hg38 version to look this up efficiently.  Ask openAI about that.  So far some of the search results for rs* have been underwhelming on https://gemini.google.com/app/324d9ddb5934ccd5


## September 9, 2026
## Article Questions

Reading Deng:

* Used 23AndMe for sequencing?
* Get ChatGPT to unpack this section: "Genotyping, imputation, and quality control" (page 2)
* Generally speaking the statistics went over my head.  How to fill in that gap?
* 