Yesterday 7:12 PM
So, I have been thinking about the polygenic nature of alcoholism and the fact that given some of the datasets that might be available, it may be possible to take the known genes, obviously that includes GABRA2 and a whole host of others that are related in one way or another to alcoholism, and take a subset of those from various human genome data, possibly subset it as a first step in the pipeline if that's necessary, if not, not, and then run it through some kind of machine learning algorithm to try to detect patterns. And of course, this could be a labeled learning exercise at first, and see to what extent one might be able to predict the disease based on the public datasets that are available. I'm sure someone's probably done something like this or done similar sorts of studies for other conditions at least, but I imagine there's probably people who have gotten ahead of me on the alcoholism side. Can you first of all dig into maybe some of the literature in general as to tools that might be used? Clearly, scikit-learn is a contender, but there may be more appropriate tools, perhaps something in R. I know R has good statistical tools for bioinformatic analysis. And there are I read about some literature seems to mention hidden Markov models as being a part of this kind of analysis as well, so something that can do that. Anyhow, I'm looking for a kind of a starting point, existing literature, that sort of thing, background, and then at some point we'll need to subset the genes and go from there against whatever datasets are available, but we can do that in a separate step.

Yes — and in fact, you have landed very close to an active research area. There are already papers doing pieces of what you're describing, including one that is strikingly close to your proposed experiment: using alcohol-related SNPs as features in a supervised machine-learning model to predict who later developed AUD.

But I think there is an interesting project hiding inside your idea that is slightly different from simply reproducing a PRS study. The key would be to compare several increasingly sophisticated ways of representing the genetic information.

1. The basic idea is absolutely viable

Conceptually, you could construct something like:

genotypes → selected genetic features → dimensionality reduction/feature selection → classifier → AUD/non-AUD

For example:

             Human genotype data
                     │
                     ▼
           QC / ancestry / missingness
                     │
                     ▼
        ┌──────────────────────────┐
        │ Candidate SNPs / genes   │
        │ e.g. GABRA2 + others     │
        └──────────────────────────┘
                     │
                     ▼
             Feature matrix
          individuals × variants
                     │
          ┌──────────┴──────────┐
          ▼                     ▼
       Logistic              Random
       / LASSO               Forest
          │                     │
          └──────────┬──────────┘
                     ▼
              AUD prediction
              AUC / ROC /
          sensitivity/specificity

And then you could ask a series of increasingly interesting questions:

Can the known AUD-associated variants distinguish cases from controls?
Does using all variants in the implicated genes improve prediction?
Does a conventional genome-wide PRS perform better?
Does a nonlinear ML model improve on an ordinary logistic/PRS model?
Are there detectable variant × variant interactions that improve prediction?
Does ancestry substantially alter the performance?
Can a model trained in one cohort predict AUD in another?

Those are much more interesting scientifically than simply asking whether a machine-learning algorithm can classify the training dataset.

2. And yes, people have already done surprisingly similar work

The most directly relevant paper I found is:

"Predicting risk for Alcohol Use Disorder using longitudinal data with multimodal biomarkers and family history: a machine learning study."

They used 656 COGA participants, half of whom subsequently developed DSM-5 AUD. Their predictors included:

220 EEG measures
149 alcohol-related SNPs
parental AUD/family-history variables

and they used a supervised linear SVM classifier to predict which people subsequently developed AUD.

That's remarkably close to the direction you're contemplating.

The important difference is that their genetic component was only one part of a multimodal model. That leaves an excellent educational/research question:

How much predictive information is contained in genetic variants alone?

That's a much cleaner experiment.

3. The really important thing I'd change in your proposed approach

I would not start by taking a list of "known alcoholism genes" and feeding all of those genes into ML.

I'd actually make that one of the experimental arms.

Why?

Because there's a subtle statistical problem here.

Suppose the literature says:

GABRA2 is associated with AUD.

You select GABRA2 because it is associated with AUD.

Then you train a classifier on GABRA2.

That's legitimate, but you've incorporated prior knowledge into the feature selection. You aren't really asking whether the genome contains a signal; you're asking:

How much predictive signal remains in a previously identified set of genes?

That's still an interesting question — but it should be labeled as such.

And there's an even bigger issue: many GWAS associations aren't actually inside genes. Regulatory variants can be upstream, downstream, intronic, intergenic, etc. So restricting yourself to gene boundaries could throw away a lot of relevant information.

The 2024 multi-ancestry AUD GWAS is a particularly good illustration of this. It included 1,041,450 people and 102,079 AUD cases, identifying 37 genome-wide-significant loci and 105 variants. The implicated biology included GABAergic, dopaminergic and serotonergic systems, as well as brain regions relevant to AUD.

So I'd actually make your project:

Model A — candidate-gene model

GABRA2 + other established AUD genes

↓

ML

Model B — GWAS-significant variant model

All variants with strong published AUD association

↓

ML

Model C — genome-wide PRS

Hundreds of thousands of variants

↓

PRS / regression

Model D — genome-wide ML

Potentially much larger feature space

↓

regularized ML / dimensionality reduction

That would let you see what you gain by moving from biological prior knowledge toward increasingly data-driven models.

4. There's a particularly important distinction between PRS and ML

This is where the literature gets interesting.

A conventional polygenic risk score is basically:

$$ PRS_i = \sum_j \beta_j G_{ij} $$

where:

\(G_{ij}\) = genotype of person \(i\) at variant \(j\)
\(\beta_j\) = effect size estimated by GWAS

So every person's genome gets reduced to one number.

That is a very powerful dimensionality reduction.

And there is already substantial AUD literature showing that this works.

For example, a study using COGA found that people in the highest PRS decile had approximately 1.96× the odds of AUD compared with the reference group. PRS also tracked increasing DSM-5 symptom counts.

Another study found that AUD/problem-drinking PRSs predicted AUD-related outcomes across COGA, ALSPAC, Generation Scotland and UK Biobank, although the amount of variance explained was modest.

And there's now a very useful resource for this: the Polygenic Score Catalog.

It contains actual AUD scores, including:

AUD scores based on 336,813 variants
problematic alcohol use scores based on 453,914 variants
AUDIT-related scores
gene-based AUD scores

For example, PGS005213 is a DSM-5 AUD score constructed using lassosum, while PGS002739 is particularly interesting for your purposes because it is a gene-based AUD score involving 858 variants in 410 genes.

That last one is almost exactly the bridge between your "known genes" idea and modern PRS methodology.

5. This also suggests a terrific experiment

I'd actually compare:

Baseline 1

GABRA2 alone

Baseline 2

Known AUD candidate genes

Baseline 3

Gene-based PRS

Baseline 4

Genome-wide PRS

Model 5

LASSO / elastic net using SNPs directly

Model 6

Random forest

Model 7

XGBoost

And evaluate all of them on the same held-out individuals.

Then you get a beautiful little machine-learning/genomics experiment:

Representation	Model	Question
GABRA2	logistic regression	Is the classic candidate gene predictive?
Candidate genes	logistic/LASSO	Does biological prior knowledge help?
Candidate genes	RF/XGBoost	Are nonlinear interactions useful?
Gene-based PRS	logistic	Does aggregation help?
Genome-wide PRS	logistic	How much does genome-wide information add?
Genome-wide SNPs	LASSO	Can ML discover its own sparse representation?
Genome-wide SNPs	XGBoost	Are nonlinear relationships detectable?

That would be a very respectable bioinformatics learning project.

6. I would use R for the first version

Given that you already know both R and Python, I'd actually lean toward R for the initial experiment.

Not because Python isn't good — scikit-learn is excellent — but because the surrounding statistical genetics ecosystem makes R particularly attractive.

The centerpiece I'd use: glmnet

glmnet gives you:

logistic regression
LASSO
elastic net
multinomial models
Cox models
regularization paths

and is specifically designed to handle situations where the number of predictors is much larger than the number of observations — exactly the sort of problem you encounter with SNP data.

For example, conceptually:

10,000 individuals
        ×
500,000 SNPs

is a classic p >> n situation.

A regularized model is vastly more appropriate here than ordinary logistic regression.

7. Then add tidymodels

I'd use tidymodels for the general ML framework.

It gives you a consistent framework for:

train/test splitting
cross-validation
preprocessing
hyperparameter tuning
model comparison
performance metrics

and it supports SVMs, trees, neural networks, regression, classification, etc.

That gives you something conceptually similar to scikit-learn, but in R.

And importantly, it will help keep you from accidentally doing something like:

select the best SNPs using the entire dataset → cross-validate the resulting model

which produces optimistically biased performance estimates.

The feature-selection step has to occur inside the training folds.

That will be one of the most important methodological lessons in this project.

8. XGBoost would be my nonlinear model

Once you've established the baseline with logistic regression/LASSO, I'd try XGBoost.

XGBoost is available directly in R and implements gradient-boosted decision trees.

It's especially interesting here because your hypothesis is partly:

Perhaps the relevant information isn't simply additive.

A PRS assumes something approximately like:

$$ Risk = \beta_1 SNP_1+\beta_2 SNP_2+\cdots+\beta_n SNP_n $$

XGBoost can discover things more like:

SNP A matters if SNP B has a particular genotype.

That's the kind of interaction your original intuition about "detect patterns" is getting at.

But I would not start there.

I'd start with LASSO/logistic regression because you'll have a much easier time understanding what the model is doing.

9. And your HMM idea is real — but it's probably a different part of the pipeline

Your memory about hidden Markov models is correct.

HMMs are heavily used in genetics, particularly for:

haplotype inference
genotype phasing
genotype imputation

They model the unobserved haplotype structure underlying observed genotypes.

So you might have:

raw genotype data
       │
       ▼
phasing / imputation
       │
       │   ← HMM territory
       ▼
clean genotype matrix
       │
       ▼
ML / PRS
       │
       ▼
AUD prediction

In other words, I wouldn't put an HMM in the classifier initially.

I'd regard it as part of the genotype preprocessing/inference machinery.

This is actually a useful conceptual distinction:

HMM → infer the genetic state

versus

ML classifier → predict the phenotype

Those are two different problems.

10. There is an excellent R package specifically relevant to this

I'd put bigsnpr very high on our eventual tool list.

It is specifically designed for large SNP-array datasets and includes:

SNP data handling
imputation
penalized regression
clumping and thresholding
LDpred2
lassosum2
polygenic scores

among other things.

That's potentially the single most interesting R package for the project you're imagining.

In fact, the fact that lassosum appears both in the PGS literature and in bigsnpr makes a nice bridge between conventional statistical genetics and your ML experiment.

11. I'd use PLINK as the genetic-data workhorse

Even if the actual modeling is done in R, I'd expect us to use PLINK 2 extensively for the genotype preprocessing.

It handles the standard GWAS operations:

genotype filtering
missingness
allele frequencies
LD pruning
PCA
genotype formats
phenotype/covariate handling
etc.

PLINK also produces principal-component files, which are particularly important because population stratification can otherwise make a classifier look much better than it really is.

That is going to be one of the central methodological issues in your project.

12. Population stratification is probably the biggest trap

Imagine your cases are predominantly European ancestry and your controls are predominantly African ancestry.

A classifier could achieve spectacular accuracy.

But it hasn't learned:

"genetic susceptibility to alcoholism."

It has learned:

"which genetic variants distinguish these ancestry populations."

And because allele frequencies differ across populations, there are thousands upon thousands of SNPs capable of doing that.

This is why the recent AUD literature is increasingly emphasizing multi-ancestry analyses. The 2024 GWAS I mentioned explicitly found ancestry-specific patterns and demonstrated the value of multi-ancestry analysis.

So PCA/ancestry adjustment isn't a minor technicality. It should be part of the experimental design from day one.

13. There are some very nice public datasets

This is where the project becomes especially feasible.

COGA

The Collaborative Study on the Genetics of Alcoholism is probably the dataset I'd investigate first.

There are several COGA-derived datasets in dbGaP.

For example, SAGE contains:

1,897 alcohol-dependent cases
1,932 alcohol-exposed nondependent controls
genome-wide genotype data
European-American and African-American participants

with carefully characterized phenotypes.

There's also a COGA case-control dataset with detailed standardized assessments.

Another interesting dataset

There is also a dbGaP alcohol-dependence GWAS with approximately 2,900 subjects, including both African-American and European-American participants.

The catch is that individual-level genotype/phenotype data in dbGaP are generally controlled-access, rather than simply downloadable. dbGaP distinguishes public aggregate/summary information from authorized individual-level data.

That's something we'll need to investigate carefully before choosing the actual dataset.

14. There's also a really interesting "modern" direction

The UK Biobank is obviously enormous, and there is already an active research project there specifically titled:

"Identification of Genomic Risk Factors and Prediction of Problematic Alcohol Use Phenotypes, Outcomes, and Associated Cardiometabolic Phenotypes through Machine Learning."

The project description explicitly discusses building PRSs and improving on conventional PRSs by incorporating interactions between genetic variants and environmental/clinical variables.

So your intuition that:

"Surely somebody has gotten ahead of me on this"

is correct — but that's actually good news.

It means we can use their work as a benchmark rather than reinventing the conceptual framework.

15. One particularly important finding from the literature

There's a subtle point I think you'll find fascinating.

Alcohol consumption and AUD aren't genetically identical phenotypes.

The Million Veteran Program study found distinct genetic architectures for:

alcohol consumption
AUD diagnosis

even though they overlap substantially.

And the AUDIT research similarly separates a:

Consumption factor
Problems factor

with different genetic relationships.

That's important because a naive project might download "alcoholism SNPs" without distinguishing:

drinks per week

from

pathological alcohol use.

Those are not the same phenotype genetically.

For your first experiment, I'd therefore use actual AUD diagnosis as the label if possible, rather than drinks/week.

16. What I would make our first actual project

I'd keep this deliberately modest.

Phase 1 — literature/reproducibility

Read:

the original GABRA2 papers
the major AUD GWAS
the PRS literature
the SVM/AUD ML paper
the gene-based PRS paper

Then identify the exact SNPs/genes used in those studies.

Phase 2 — small dataset

Get one manageable case/control dataset.

Something like:

~1,000–4,000 people
       ×
perhaps 10–100 candidate genes
       ×
hundreds/thousands of SNPs

would be plenty.

Phase 3 — establish statistical baseline

Build:

Model 0: demographic/ancestry covariates only

Model 1: GABRA2

Model 2: candidate genes

Model 3: candidate-gene PRS

Then measure:

ROC AUC
PR-AUC
sensitivity
specificity
calibration
cross-validated performance
Phase 4 — actual ML

Then:

LASSO
elastic net
SVM
random forest
XGBoost
Phase 5 — external validation

This is the part that really matters.

Train on Dataset A.

Never touch Dataset B during model development.

Then predict Dataset B.

If the performance survives external validation, you've got something much more interesting.

One thing I would not do

I wouldn't begin with deep learning.

A neural network thrown at:

2,000 people × 500,000 SNPs

is almost tailor-made for producing an impressive-looking but meaningless result.

I'd rather have:

LASSO AUC = 0.63
XGBoost AUC = 0.64
external validation AUC = 0.61

than:

neural network AUC = 0.94

on a badly designed dataset.

The former teaches us something about the genetic signal. The latter might just teach us something about leakage.

My tentative software stack

I'd therefore put the stack at:

Genetic data

PLINK 2
bcftools
possibly Hail for very large datasets

Statistical genetics

R
bigsnpr
glmnet
PRSice-2
LDpred2
lassosum2

Machine learning

tidymodels
glmnet
SVM
random forest
XGBoost

Visualization

ggplot2

Python

scikit-learn
pandas
XGBoost
possibly Hail

Hail is worth knowing about if we eventually move toward UK Biobank-scale data; it's a Python-accessible genomics framework designed specifically for large-scale genomic datasets and GWAS.

And I think there's a particularly good project here for you

Because you already know both R and Python, I'd actually resist choosing between them right now.

I'd use R for the statistical-genetics/PRS side and Python/scikit-learn for a parallel ML implementation once we have a clean feature matrix.

That would let us learn something much more interesting than "how to run an XGBoost classifier":

What does machine learning actually add to conventional statistical genetics when trying to predict a highly polygenic human phenotype?

And AUD is an unusually good case study because we have candidate genes like GABRA2, enormous modern GWASs, established PRSs, longitudinal COGA data, multiple ancestries, and an existing ML literature against which to benchmark ourselves.

I think the next step should be a literature/data map rather than coding yet: identify perhaps 5–8 cornerstone papers, the exact SNP/gene sets they used, the publicly accessible datasets, what requires dbGaP authorization, and which dataset would make the cleanest first experiment. Then we can design the pipeline around the dataset rather than the other way around.

Yes. Having looked at the repository itself, I definitely think the new project should be separate—but I also think your existing bioinformatics repository is more valuable to the new project than I had appreciated.

Your existing `bioinformatics` repository is currently functioning as a general learning notebook/curriculum, not as a single research project. The README explicitly describes it as notes and a somewhat disorganized learning repository, and it currently contains biostar, rAndStatistics, alcoholismResearch, setup material, Quarto/R material, etc.

And your old study plan actually anticipated almost exactly the distinction we're now making: it says you envisioned a two-pronged approach—learning the field/tools and exploratory research in Alcohol Use Disorder—with R/statistics as a third component.

So I'd now divide things this way

Existing repo: bioinformatics

Think of this as your:

Bioinformatics education / laboratory notebook

It contains things like:

bioinformatics/
├── biostar/
├── rAndStatistics/
├── Resources/
├── alcoholismResearch/
├── hacking/
├── ...

That is actually a perfectly reasonable place for the broad learning material.

New repo: aud-genetics

This becomes the actual:

AUD genetics research + applied learning project

And that's an important distinction. We're not merely continuing your old alcoholismResearch folder with more notes. We're going to build an actual reproducible computational investigation.

And I would NOT throw away the old alcoholismResearch

In fact, I think it should become our starting intellectual background.

I looked at that directory, and it contains exactly the sort of material we'd want to preserve: presentation.md, sources, dataset/overview notes, the GABRA2 work, literature queries, etc.

Your presentation is particularly interesting because it represents where you started thinking about the problem.

So I'd envision:

bioinformatics/
    alcoholismResearch/
        presentation.md
        ...
             │
             │  background / motivation
             ▼
       ┌─────────────────┐
       │   aud-genetics  │
       │                 │
       │ actual project  │
       └─────────────────┘

We don't need to duplicate all those files. We can link to the old material, selectively copy useful material, or eventually extract some of it into the new project's literature notes.

What about R and statistics?

I don't think we should delete or abandon that either.

But I do think we've learned something important from looking at your old repository:

Your original plan had a tendency to make "learn R," "learn statistics," "learn Biostar," and "research alcoholism" parallel projects. That's potentially a recipe for spending a lot of time learning prerequisites without ever getting to the interesting problem.

I'd change the philosophy.

Instead of:

First learn R → then statistics → then bioinformatics → then genetics → finally AUD

I'd like us to do:

AUD question → what do I need to understand to answer it? → learn that → apply it immediately.

So if we need PCA, we learn PCA in the context of population structure.

If we need logistic regression, we learn it in the context of genotype/phenotype association.

If we need GWAS, we learn it by actually doing a small GWAS.

If we need PRS, we learn it because we're trying to answer the question of how much polygenic information predicts AUD.

And eventually:

Can machine-learning approaches improve on simpler genetic models?

That's where ML comes in.

This is also consistent with the kind of hands-on curriculum structure used by other bioinformatics self-study projects: fundamentals are useful, but they're tied to concrete computational exercises rather than treated as prerequisites that must all be mastered first.

One other thing I would change

I wouldn't make the new repository contain a big lessons/ hierarchy quite as prominently as I originally suggested.

Now that I've seen your existing repository, I think that would duplicate its purpose.

Instead, aud-genetics should probably look more like a research project with an embedded curriculum.

Something along these lines:

aud-genetics/
├── README.md
├── ROADMAP.md
├── notes/
├── literature/
├── data/
├── analyses/
├── scripts/
├── results/
└── lessons/

And lessons/ would contain only the things we actually learn because this project requires them.

That feels much more natural than building a second general-purpose bioinformatics school inside the new repository.

So my current architectural opinion is: keep bioinformatics as the broad learning repository, create aud-genetics as the serious applied project, and let the two inform each other.

And yes, I think this also makes aud-genetics an even better name than aud-genetics-ml. It describes the subject rather than prematurely describing the eventual method.

Hmmm... It sounds like you're wanting to push lessons into bioinformatics, but if these are integrated (conceptually) in what we'll later do in the project, perhaps it's best to start with a clean slate.  I can always symlink related things locally if that makes sense.  I'm already including a symlink to bioinformatics root, for example, in my main Obsidian (all my goals and notes) heirarchy.  If the lessons in this new project are going to inform the research, perhaps your original structure was already good.  What do you think of that, and you mentioned that we might order the lessons.  Can you show me what you're thinking for that portion of the structure?

Yes — I think your reasoning is better than my revised suggestion. Now that you've clarified the role of the lessons, I'd go back toward the original architecture.

The key distinction is:

Your existing bioinformatics repo is a general collection of things you're learning about bioinformatics.
aud-genetics would be a self-contained curriculum whose lessons exist specifically to equip us to do this particular research project.

That second thing is valuable. We shouldn't make the new project depend on the old repository merely because you already have some R/statistics material there. And your symlink approach makes the two repositories easy to connect without making either one structurally dependent on the other.

I would therefore keep the lessons

And I would make them progressive, but not artificially numbered in the filesystem.

Something like:

lessons/
├── genomics-data/
├── command-line-and-unix/
├── plink/
├── statistical-genetics/
├── gwas/
├── population-genetics/
├── polygenic-scores/
├── machine-learning/
└── advanced-topics/

But there's an important wrinkle: the order in which we study these doesn't have to be identical to the directory order.

For example, I could imagine the actual curriculum developing roughly like this:

1. Project & computational foundations
       ↓
2. Genomic data: what exactly is a genotype?
       ↓
3. Working with real genotype data
       ↓
4. QC, missingness, allele frequencies, etc.
       ↓
5. Population structure / PCA
       ↓
6. Association & GWAS
       ↓
7. Statistical genetics
       ↓
8. Polygenic scores
       ↓
9. Prediction / machine learning
       ↓
10. Validation, interpretation & limitations

And each stage would produce something useful for the eventual AUD analysis, rather than being a detached tutorial.

For example, the PCA lesson isn't just "here's how PCA works." It eventually becomes:

We need to understand ancestry/population structure before attempting to predict AUD from genetic variation.

Likewise, the GWAS lesson eventually becomes:

Let's see what the data tell us about AUD-associated variants before we try to build a predictive model.

And the PRS lesson becomes a natural bridge between statistical genetics and ML.

One thing I'd add to the original structure

I'd probably add a top-level curriculum/ or lessons/ distinction from the research artifacts.

So I'm currently leaning toward:

aud-genetics/
├── README.md
├── ROADMAP.md
├── NOTES.md
├── .gitignore
│
├── lessons/
│   ├── genomics-data/
│   ├── command-line-and-unix/
│   ├── plink/
│   ├── statistical-genetics/
│   ├── gwas/
│   ├── population-genetics/
│   ├── polygenic-scores/
│   ├── machine-learning/
│   └── advanced-topics/
│
├── literature/
│   ├── papers/
│   ├── literature-notes/
│   └── references/
│
├── data/
│   ├── raw/
│   ├── processed/
│   └── metadata/
│
├── scripts/
│   ├── r/
│   ├── python/
│   └── plink/
│
├── analyses/
│   ├── exploratory/
│   ├── gwas/
│   ├── prs/
│   └── machine-learning/
│
└── results/
    ├── figures/
    ├── tables/
    └── reports/

I wouldn't put numbers on those directories. The ROADMAP.md can provide the actual sequence, and we can change that sequence as we learn.

And there's a nice conceptual separation here:

lessons/ = what we're learning

analyses/ = what we're doing with it

literature/ = what other people have learned

data/ = what we're working with

scripts/ = machinery

results/ = what comes out

That feels like a genuinely useful architecture for the project rather than just a place to store notes.

And yes, I particularly like your symlink idea. Your existing bioinformatics material can remain available from your Obsidian environment without forcing this repository to inherit its history or organization. That gives us the clean slate you're suggesting while preserving the ability to reach backward when something you've already studied is relevant.

OK, as you can perhaps see, I've moved this chat into a new ChatGPT project, aud-genetics.  I'll create a public repo and clone it locally under the same name.  Go ahead and create a directory structure based on what we have so far, but add a "shell" directory under scripts as well.  I'll run your directory setup script from that, so please assume I'll create the directories from the project root, but do so by running a script in ./scripts/shell/setup_dirs.sh.  Therefore of course you won't need to create ./scripts or ./scripts/shell.  I'll let you do that, probably much quicker than I set up the local and remote github repo.

Absolutely. I think we're at a good point to make the structure concrete.

I've created the setup script here:

Download setup_dirs.sh

Once you've cloned your new repo and are sitting at its root:

cd ~/Projects/aud-genetics   # or wherever you cloned it
./scripts/shell/setup_dirs.sh

It will create:

aud-genetics/
├── lessons/
│   ├── genomics-data/
│   ├── command-line-and-unix/
│   ├── plink/
│   ├── statistical-genetics/
│   ├── gwas/
│   ├── population-genetics/
│   ├── polygenic-scores/
│   ├── machine-learning/
│   └── advanced-topics/
├── literature/
│   ├── papers/
│   ├── literature-notes/
│   └── references/
├── data/
│   ├── raw/
│   ├── processed/
│   └── metadata/
├── scripts/
│   ├── r/
│   ├── python/
│   ├── plink/
│   └── shell/
├── analyses/
│   ├── exploratory/
│   ├── gwas/
│   ├── prs/
│   └── machine-learning/
└── results/
    ├── figures/
    ├── tables/
    └── reports/

A couple of deliberate choices in the script:

It doesn't create the project root.
It assumes you're running it from the project root, exactly as you specified.
It uses mkdir -p, so it's safe to run again later.
It creates scripts/shell/ as part of the repository structure, although naturally the script itself has to live there.
It doesn't create empty placeholder files yet. I'd rather decide on README.md, ROADMAP.md, .gitignore, etc. together now that we have the project actually created.

Once you've got the GitHub repo cloned and the script in place, the next interesting step is probably to construct ROADMAP.md. That's where we can turn the lesson directories above into an actual sequence—and, importantly, decide what we really mean by each stage before we start filling the directories with stuff. 

setup_dirs.sh
Code
