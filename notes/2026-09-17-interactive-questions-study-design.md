## User

For this session, please do not create notes in the notes directory or otherwise edit files.  The intent here is just to chat in this window.

## Assistant

Understood. I’ll keep this session conversational and won’t edit files or create a session note.

## User

Let's take a moment to consider what data sets we might ultimately use.  I don't have a university affilitation, but I could take bioinformatics graduate level courses at UNC Charlotte if that would provide access to any good AUD data sets.  Can you investigate that?  Do they cooperate with Duke University medical school for example for genomics data?  If we don't have AUD partitioned controlled data sets to work from, what can we accomplish using publically available summaries or sources?

## Assistant

I’ll investigate current UNC Charlotte access paths, any Duke genomics collaborations relevant to alcohol use disorder, and public-data alternatives. I’ll keep this read-only and distinguish confirmed institutional access from possibilities that would require a faculty sponsor or formal data-use approval.

<thinking>


**Planning optimized web searches**
</thinking>

**Tool Call: Web search: site:charlotte.edu bioinformatics graduate course research computing dbGaP access genomics UNC Charlotte student, site:charlotte.edu Duke University genomics collaboration alcohol genetics, site:duke.edu UNC Charlotte genomics collaboration, alcohol use disorder public GWAS summary statistics dbGaP controlled access datasets**
Status: Completed

## Assistant

<thinking>


**Investigating UNCC enrollment and data policies**
</thinking>

The first pass shows a key distinction: taking a course can provide training and campus computing access, but controlled genomic datasets are generally approved to an eligible investigator and institution for a specific project. I’m checking UNC Charlotte’s enrollment/research rules and concrete Duke links before judging whether coursework alone would change your access.

**Tool Call: Web search: site:charlotte.edu non-degree graduate student enrollment bioinformatics courses, site:research.charlotte.edu dbGaP genomic data institutional signing official controlled access, site:charlotte.edu IRB student investigator faculty advisor research human subjects, site:charlotte.edu Duke collaboration bioinformatics genomics research**
Status: Completed

## Assistant

<thinking>


**Researching dbGaP eligibility officials and partners**
</thinking>

**Tool Call: Web search: site:sharing.nih.gov dbGaP request access principal investigator trainee student institutional signing official eligibility, site:dbgap.ncbi.nlm.nih.gov Authorized Access System PI eligibility trainee student, site:charlotte.edu "Duke University Medical Center" bioinformatics, site:duke.edu "UNC Charlotte" genomics**
Status: Completed

## Assistant

<thinking>


**Surveying genetic and expression data sources**
</thinking>

**Tool Call: Web search: site:pgc.unc.edu alcohol use disorder GWAS summary statistics download, site:ebi.ac.uk/gwas alcohol use disorder summary statistics GCST, site:finngen.gitbook.io alcohol dependence endpoint summary statistics FinnGen, site:niaaa.nih.gov alcohol genetics public data summary statistics COGA**
Status: Completed

## Assistant

<thinking>


**Querying PGC SUD downloads**
</thinking>

**Tool Call: Web search: Psychiatric Genomics Consortium substance use disorders alcohol dependence downloads, Million Veteran Program alcohol use disorder GWAS summary statistics phs001672 public, 2024 multi ancestry GWAS alcohol use disorder summary statistics public PGC FinnGen MVP, public transcriptomic datasets alcohol use disorder postmortem brain GEO**
Status: Completed

## Assistant

<thinking>


**Investigating faculty research interests for AUD datasets**
</thinking>

**Tool Call: Web search: site:cci.charlotte.edu/departments/bioinformatics faculty human genetics psychiatric addiction genomics UNC Charlotte, site:charlotte.edu bioinformatics faculty statistical genetics human genomics alcohol, site:charlotte.edu "alcohol use disorder" genomics, site:charlotte.edu COGA alcohol genetics**
Status: Completed

## Assistant

<thinking>


**Assessing Duke alcohol genetics collaborations**
</thinking>

**Tool Call: Web search: site:duke.edu alcohol use disorder genetics genomics Duke research data, site:duke.edu addiction genomics alcohol Duke University Medical School, site:charlotte.edu Duke alcohol addiction research collaboration, UNC Charlotte Duke MURDOCK study genomics collaboration**
Status: Completed

## Assistant

<thinking>


**Outlining public data analysis options**

**Evaluating public phenotype and expression datasets**
</thinking>

**Tool Call: Web search: site:charlotte.edu research computing restricted data HIPAA genomic data secure enclave, site:charlotte.edu data classification genomic research data high security computing, site:charlotte.edu dbGaP "Signing Official", site:charlotte.edu controlled access genomic data**
Status: Completed

## Assistant

<thinking>


**Classifying public transcriptomics data**
</thinking>

**Tool Call: Web search: site:samhsa.gov NSDUH public use data alcohol use disorder download 2024, site:cdc.gov NHANES alcohol questionnaire public data genetics restricted, site:abcdstudy.org data access alcohol genetics controlled access, site:niaaa.nih.gov public datasets alcohol use disorder data archive**
Status: Completed

## Assistant

<thinking>


**Assessing Duke-UNC collaboration evidence**

**Planning faculty contact and research phases**

**Verifying SAGE summary license**
</thinking>

<thinking>


**Identifying limitations of summary statistics analysis**

**Compiling controlled AUD dataset access overview**

**Verifying authoritative citations for dataset access**
</thinking>

My conclusion is that **taking one or two UNC Charlotte courses would not, by itself, unlock controlled AUD genomic data**. Enrollment could become useful if it leads to a faculty supervised research role on an approved project. UNC Charlotte appears to have the institutional and computing infrastructure needed for that arrangement.

UNC Charlotte explicitly permits bachelor’s degree holders to take some bioinformatics courses as post baccalaureate students. Relevant offerings include genomics, advanced statistics for genomics, machine learning for bioinformatics, and bioinformatics programming. The master’s program also includes a research project or internship component. [UNC Charlotte bioinformatics FAQ](https://cci.charlotte.edu/departments/department-of-bioinformatics-and-genomics/academics-2/courses/frequently-asked-questions/), [M.S. curriculum](https://academics.charlotte.edu/program/bioinformatics-m-s-on-campus/)

The decisive issue is the research relationship. NIH says a dbGaP controlled-data application must be submitted by a permanent institutional employee at roughly the tenure-track professor or senior-scientist level. Graduate students and other trainees cannot submit their own application, although they can work on an approved project under an eligible investigator. The university’s signing official must cosign the request, and the NIH data access committee then reviews it. [NIH dbGaP access requirements](https://sharing.nih.gov/accessing-data/accessing-genomic-data/how-to-request-and-access-datasets-from-dbgap)

UNC Charlotte is better equipped for this than I initially expected. It now has a Secure Research Enclave intended in part for controlled genomic data, and its research office explicitly describes an intake and compliance process for NIH controlled-access datasets. Access is project based, requires approval from the research office and IT, uses Charlotte managed computers, and has usage costs that the PI must budget. [UNC Charlotte Secure Research Enclave](https://research.charlotte.edu/departments/office-of-research-protections-and-integrity-orpi/research-data-compliance/secure-research-enclave-sere/), [controlled-data guidance](https://research.charlotte.edu/departments/office-of-research-protections-and-integrity-orpi/research-data-compliance/data-security-categories/data-categories/)

So the possibilities look like this:

| Your relationship with UNC Charlotte | Likely effect on controlled-data access |
|---|---|
| Enrolled in one post-baccalaureate course | Training, library and ordinary computing access; no independent dbGaP eligibility |
| Student doing an informal class project | Usually still public or synthetic data only |
| Student/research assistant on a faculty PI’s approved project | Potentially eligible to be named as project personnel |
| M.S. student with a faculty supervised research project | A plausible route, provided a PI supports the project and the university approves the data environment |
| Independent researcher with only a student login | Unlikely to satisfy NIH’s PI and institutional oversight requirements |

### UNC Charlotte and Duke

There is real cooperation, but I did not find evidence of a standing **AUD genetics data-sharing program** between UNC Charlotte and Duke School of Medicine.

Both institutions operate at the North Carolina Research Campus in Kannapolis. UNC Charlotte describes Duke and UNC Charlotte as university partners there, while Duke identifies UNC Charlotte professor Cory Brouwer as both director of UNC Charlotte’s Bioinformatics Services Division and executive director of research for the campus. [UNC Charlotte NCRC partnerships](https://partnerships.charlotte.edu/nc-research-campus/), [Duke CTSI Kannapolis profile](https://ctsi.duke.edu/duke-kannapolis/guest-list)

There are also concrete project-level relationships. UNC Charlotte advertises collaborations with Duke University Medical Center, including student work with Duke Radiation Oncology, and Duke’s health-informatics seminars have included UNC Charlotte faculty. [UNC Charlotte–Duke project example](https://cci.charlotte.edu/research/undergraduate-research-opportunities/sis-opportunities/), [Duke health-informatics seminars](https://medschool.duke.edu/education/health-professions-education-programs/duke-center-health-informatics/informatics-6)

Duke also operates substantial genomic resources such as OneDukeGen and the MURDOCK Study. These are governed research cohorts, however, rather than datasets made available to someone merely because they attend UNC Charlotte. Access would require a Duke or collaborating PI, an approved protocol, and institutional agreements. [OneDukeGen](https://ctsi.duke.edu/centers-pillars/center-precision-health/cph-programs/onedukegen-genomic-medicine-study/onedukegen-0), [Duke research-data access overview](https://myresearchpath.duke.edu/topics/discover-and-access-data)

I would therefore treat Duke as a **possible collaborator reached through a particular faculty project**, rather than the reason to enroll at UNC Charlotte.

### Controlled AUD datasets that could become relevant

Several valuable individual-level resources exist:

- **NESARC-III:** 36,309 adults, detailed DSM-5 AUD and comorbidity phenotypes, and saliva DNA. Both phenotype and genomic access are controlled. This is especially attractive for phenotype definition, comorbidity, and gene-environment questions. [NIAAA NESARC-III](https://www.niaaa.nih.gov/research/data-archive-resources/niaaa-controlled-datasets/nesarc-iii-study)
- **SAGE:** approximately 4,100 participants, including European American and African American alcohol-dependence cases and alcohol-exposed controls; individual-level data are in dbGaP, while submitted association summaries are public. [SAGE public analysis page](https://www.ncbi.nlm.nih.gov/projects/gap/cgi-bin/analysis.cgi?pha=2907&study_id=phs000092.v1.p1)
- **OZ-ALC:** approximately 6,775 Australian twins and family members.
- **Alcohol Dependence GWAS in European and African Americans:** approximately 2,900 participants.
- **COGA:** deeply characterized families with AUD, related disorders, electrophysiology, longitudinal information, and genomic data.
- **Million Veteran Program alcohol GWAS:** much larger, multi-ancestry samples, but individual-level access is highly governed.

The NIDA catalog identifies SAGE, OZ-ALC, and the European/African American alcohol-dependence study and gives their dbGaP accessions. [NIDA addiction GWAS catalog](https://nidagenetics.org/available-datasets/other-gwas-datasets-at-dbgap/)

For a student project, the important question is less “Does UNC Charlotte have these datasets?” and more “Is there an eligible UNC Charlotte PI willing to submit and maintain the access request for this exact study?” Each dataset’s consent restrictions must also permit the proposed question.

### What we can accomplish without controlled data

There is enough public material for a serious, potentially publishable program of work.

**1. Reproduce and compare AUD GWAS results**

Public genome-wide summary statistics are available through combinations of dbGaP public files, FinnGen, the Psychiatric Genomics Consortium, and the NHGRI-EBI GWAS Catalog. FinnGen’s current public release includes GWAS statistics, fine-mapping results, annotations, and meta-analysis resources. The GWAS Catalog provides full statistics for many contributed studies and records each dataset’s license. [FinnGen data downloads](https://finngen.gitbook.io/documentation/data-download), [GWAS Catalog summary statistics](https://www.ebi.ac.uk/gwas/downloads/summary-statistics)

A good initial project could:

- harmonize genome build, alleles, variants, and phenotype metadata;
- compare DSM alcohol dependence, ICD AUD, problematic alcohol use, AUDIT-P, and consumption phenotypes;
- test whether major loci replicate across definitions and ancestry groups;
- quantify how phenotype choice changes genetic correlations and biological conclusions;
- explicitly audit cohort overlap, which otherwise can inflate agreement.

That phenotype-comparison problem is scientifically meaningful because consumption and pathological alcohol use are related but do not represent the same construct.

**2. Estimate genetic architecture**

With full summary statistics and a suitable ancestry-matched LD reference, we can perform:

- SNP heritability estimation;
- genetic correlation with depression, smoking, externalizing behavior, anxiety, liver disease, and alcohol consumption;
- partitioned heritability by functional annotation or tissue;
- genomic structural equation modeling of common and alcohol-specific addiction liability;
- cautious cross-ancestry effect comparison.

The published multi-ancestry literature already shows that AUD datasets now reach roughly one million combined participants, while retaining major differences in phenotype, ancestry representation, and cohort composition. [Multi-ancestry AUD study](https://pmc.ncbi.nlm.nih.gov/articles/PMC12048032/)

**3. Move from variants toward genes and tissues**

Summary statistics can support:

- statistical fine-mapping, subject to the quality and ancestry match of the LD panel;
- gene-based association and pathway enrichment;
- colocalization with public eQTL or other molecular-QTL resources;
- transcriptome-wide association analyses;
- prioritization of genes expressed in brain, liver, gut, or immune tissues;
- comparison with known alcohol-metabolism loci such as the ADH region.

These analyses prioritize mechanisms; they do not establish that a gene causes AUD or that it is a treatment target.

**4. Integrate public AUD brain expression data**

GEO now includes public human postmortem AUD datasets. For example, **GSE253155** contains bulk RNA-seq from nucleus accumbens and dorsolateral prefrontal cortex from 58 AUD cases and 56 controls, with matched methylation data available for many donors under a related accession. [GEO GSE253155](https://ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE253155)

That enables a coherent multi-omics project:

1. Reproduce the published differential-expression analysis.
2. Test sensitivity to brain region, RNA quality, sex, smoking, and other recorded covariates.
3. Compare differentially expressed or coexpression-network genes with GWAS-prioritized genes.
4. Seek convergent evidence across genetic association, expression, and methylation.

Postmortem expression reflects disease, exposure, treatment, terminal events, and tissue composition, so it cannot by itself show whether expression differences caused AUD.

**5. Study AUD epidemiology without genomics**

The NSDUH public-use files contain individual-level, disclosure-protected data on alcohol use, SUD, mental health, treatment, risk factors, and demographics. They can support survey-weighted studies of AUD prevalence, comorbidity, treatment gaps, and temporal changes. [NSDUH public-use files](https://www.samhsa.gov/data/data-we-collect/nsduh-national-survey-drug-use-and-health/datafiles?data_collection=1135&year=2016)

NHANES provides public alcohol-use, biomarker, health, and demographic data, although its genetics cannot be linked publicly to those records. [NHANES alcohol questionnaires](https://wwwn.cdc.gov/nchs/nhanes/search/datapage.aspx?Component=Questionnaire), [NHANES genetic-data restrictions](https://www.cdc.gov/nchs/nhanes/biospecimen/dna-specimens.html)

These datasets would let us develop careful phenotype and epidemiology work while keeping the genetics stream separate.

### What summary data cannot support

Without an independent, individual-level genotype-plus-phenotype cohort, we cannot credibly:

- train and validate an individual AUD prediction model;
- report real-world polygenic-score discrimination, calibration, or clinical utility;
- examine most gene-by-environment interactions;
- reconstruct longitudinal AUD trajectories;
- control flexibly for individual covariates;
- distinguish rare-variant effects well;
- test performance across detailed demographic and ancestry subgroups unless stratified results were released.

Synthetic data can test software and statistical behavior, but it cannot supply external validation or evidence of clinical prediction.

### The route I would take

I would begin the project entirely with public data:

1. Build a carefully documented catalog of AUD and related-phenotype GWAS summary datasets, including ancestry, phenotype definition, sample size, sample overlap, genome build, license, and available fields.
2. Reproduce one established AUD analysis using SAGE, FinnGen, or another openly downloadable result.
3. Compare two genuinely different AUD definitions.
4. Add one functional layer, probably the public brain RNA-seq dataset.
5. Use the resulting work to formulate a question that actually requires individual-level data.

Only then would I consider paying for UNC Charlotte coursework for access reasons. Before enrolling, I would ask the graduate program three concrete questions:

- Is any faculty member currently able and interested in supervising secondary analysis of AUD, psychiatric-genetics, or substance-use genomic data?
- Can a post-baccalaureate student be named as approved research personnel on a faculty-led dbGaP project and use the Secure Research Enclave?
- Are there active Duke, VA, COGA, NIAAA, or PGC collaborations specifically involving addiction genetics?

If the answer to the first two is yes, UNC Charlotte could provide a real access pathway. If they only offer coursework without a sponsoring investigator, the public-data program will give us nearly the same immediate research opportunities at far lower cost.

## User

I have switched the model to 6 astra at this point.  Astra, can you please review the foregoing context, especially the last section on "The route I would take" and tell me if you concur with that or would make any changes?

## Assistant

<thinking>


**Checking unverified microdata boundary**
</thinking>

I concur with **starting with public summary data and exploring faculty mentorship before enrolling for data access**. I would change the proposed sequence to make it more focused and less likely to produce a technically elaborate project without a clear scientific question.

The previous answer’s strongest point is that **we can make meaningful progress without individual-level genotypes**. Its weakest point is the suggestion that comparing phenotypes and adding brain expression data naturally leads toward a publishable project. Those are possible directions, but novelty, adequate data, and a defensible comparison still need to be demonstrated.

I would revise the route this way:

1. **Choose a provisional question before building a large data catalog.** For example: “How consistently do established alcohol-related genetic associations appear across clinically defined AUD and questionnaire-defined alcohol problems?” That is a starting question we can refine as we inspect what is available.

2. **Audit a small number of candidate datasets.** For each, confirm that the actual full summary statistics are accessible, usable under their terms, and sufficiently documented. Record phenotype, ancestry, case/control counts, contributing cohorts, and available statistics. The previous investigation identified promising resources; it did **not** establish that every proposed file is immediately downloadable and suitable.

3. **Reproduce one modest published result.** Start with an interpretable locus or a small set of established associations, then scale to a genome-wide analysis once we understand the inputs and assumptions. That gives us a methodological foundation and an early checkpoint for understanding.

4. **Decide whether a comparison can answer the question.** Differences between two GWAS can reflect phenotype definition, ancestry, age, sex composition, recruitment, diagnostic practices, or statistical power. We cannot attribute those differences to phenotype alone. Similarly, two publications are not independent replication if they share participants. These issues should determine our study design before we select sophisticated methods.

5. **Add functional data only if it resolves a specific uncertainty.** Brain expression could be valuable, but I would not make it the automatic next step. A focused, carefully interpreted summary-statistics study may be stronger than a broad combination of GWAS, expression, and methylation. Colocalization, for example, requires compatible molecular-QTL data; a case/control differential-expression table cannot substitute for that.

I would also **start conversations with potential mentors earlier**, while doing the public-data work. A short, concrete project outline and a small reproducible example give a faculty member something useful to assess. We do not need to finish an extensive analysis before learning whether anyone at Charlotte has the interest, time, and institutional support to supervise it. Coursework can still be worthwhile for education, even if it never provides controlled-data access; I would evaluate those benefits separately.

Two qualifications to the earlier answer matter:

- **Publication is a possibility, not an expected consequence of running established tools.** Reproduction is an excellent learning outcome. Publication would require a substantive new question, a useful methodological contribution, or unusually strong evidence resolving an existing uncertainty.
- **Public availability does not automatically make participant-level data appropriate for our workspace.** The proposed GEO and survey analyses would need separate handling decisions under your working agreement. Aggregate summaries and synthetic examples fit our present approach most straightforwardly.

My preferred immediate objective would be: **identify one tractable AUD genetics question, verify two or three candidate summary datasets, and work through one small replication together.** That would tell us much more about the project’s direction—and whether institutional access is necessary—than either enrolling immediately or building a large pipeline first.

## User

I agree that choosing a provisional question early on is the right approach.  I also agree that I can learn a lot here without necessarily creating something of publication quality, but if any areas of my interest might also lead us in that direction, so much the better.

  That said, you mentioned things like differences in  age, sex, ancestry, etc. as confounding factors for the question of how confounding factors in phenotype association.  Perhaps some aspect of that "confounding" is itself of interest.  For example, are there differences in comorbidity, other addictions, other psychological disorders that vary significantly according to different age, sex, ancestry, etc.

  Another interesting question to me is the possible overlap in personality characteristics, as there seems to be some relationship to impulsivity.  The core of this question might be something like "Is it meaningful at all to speak of an alcoholic personality?".  Given that personality studies and their relationship to genomes / environment may already be fraught, this may be a difficult one to say anything scientifically meaningful about.

  Does this suggest any possible new starter questions, or can you think of others unrelated to this that would be "right sized" for such a project?

## Assistant

I’ll check the research on AUD, impulsivity, and comorbidity, then suggest a few starter questions matched to the data we could realistically use.

**Tool Call: Web search: alcohol use disorder impulsivity facets genetic correlation negative urgency lack premeditation GWAS study, alcohol use disorder personality big five longitudinal meta analysis, NSDUH 2024 alcohol use disorder major depressive episode age sex co occurring tables**
Status: Completed

**Tool Call: Open page: https://pmc.ncbi.nlm.nih.gov/articles/PMC12039315/**
Status: Completed

## Assistant

Yes. **The variation you’re describing could become the research question itself.** My earlier wording was too broad: age, sex, and ancestry are not automatically “confounders.” Their role depends on what we are asking.

For example, three different questions are:

- **Description:** Among people with AUD, does depression prevalence differ by age?
- **Variation in association:** Is the association between AUD and depression stronger at some ages than others?
- **Confounding:** Does an apparent AUD–depression association partly reflect differences in the age composition of the groups being compared?

All three can be worthwhile. The second requires people with and without AUD: differences within the AUD group alone cannot tell us whether the AUD–depression association differs across ages.

Your personality question also has a scientifically useful core. I would translate “Is there an alcoholic personality?” into:

> **Which personality dimensions are associated with alcohol problems, how specific are those associations to AUD, and do they precede the problems?**

Those are three separable questions. An average trait difference between groups would not establish a distinct personality type, a necessary characteristic of AUD, or a useful way to identify individuals.

There is already research we can build on. “Impulsivity” includes distinguishable dimensions: seeking excitement, acting rashly when distressed, acting without planning, and difficulty persisting with tasks. Genetic studies have examined these dimensions separately and found differing patterns of association with alcohol-related outcomes. That makes a narrowly defined question quite reasonable. [Impulsivity GWAS](https://pmc.ncbi.nlm.nih.gov/articles/PMC6435820/), [study of impulsivity and shared genetic liability](https://pmc.ncbi.nlm.nih.gov/articles/PMC10006209/)

Here are four starter projects I think fit your interests.

| Provisional question | Manageable first version | What it would teach us |
|---|---|---|
| **Do sensation seeking and acting rashly under distress relate differently to drinking quantity versus alcohol problems?** | Compare these two traits and two alcohol outcomes in a small, explicitly selected set of studies. Start with published estimates; consider GWAS reanalysis after checking access. | Whether the broad term “impulsivity” obscures meaningful differences. |
| **Does depression co-occur with AUD differently across age groups?** | One survey period, one depression measure, and a few prespecified adult age groups. Begin by checking whether public aggregate tables provide the required comparisons. | The distinction between comorbidity prevalence and strength of association. |
| **Are personality associations with AUD also present for another addiction?** | Choose one trait, such as lack of premeditation, and compare AUD with nicotine dependence using compatible published results. | Whether an association appears alcohol-specific or reflects a broader vulnerability. |
| **Do personality differences precede alcohol problems, or change alongside them?** | A structured review of a handful of longitudinal studies, carefully separating consumption from AUD outcomes. | Temporal ordering, reverse causation, and the limitations of cross-sectional evidence. |

**The first is my favorite starting point for you.** It connects your personality interest to our genetics project, while remaining understandable without immediately building a complex statistical model.

A concrete version would be:

> **Are sensation seeking and negative urgency—acting rashly when distressed—associated differently with alcohol consumption and alcohol-related problems?**

We could begin with a small evidence table: two personality dimensions × two alcohol outcomes. For each estimate, we would record the population, measurement instrument, study design, effect size, and uncertainty. We would keep ordinary behavioral associations separate from genetic correlations: the latter describe shared patterns of genetic association and do not show that a personality trait causes AUD.

That question already has relevant literature, including recent work comparing impulsivity dimensions across substance use and substance use disorders. This makes it a good replication and learning project; discovering something new would require a more specific extension. [Genomic study of impulsivity facets and substance involvement](https://pmc.ncbi.nlm.nih.gov/articles/PMC12039315/)

**The comorbidity question is the most straightforward statistical starter.** NSDUH publishes aggregate information on AUD, major depressive episodes, age, and other demographic characteristics, although we must check whether the exact joint breakdown we need is available. We should also verify that a table concerns AUD specifically: many combine alcohol and other substance use disorders. [NSDUH detailed tables](https://www.samhsa.gov/data/report/2024-nsduh-detailed-tables)

I would start with age alone, then consider sex as an extension. Ancestry would need a different design: self-reported race and ethnicity in surveys are not measurements of genetic ancestry, and group differences cannot be interpreted as genetic explanations.

For either project, our goal should be **estimating how large the differences are and how uncertain we are**, rather than merely finding significant results. “Significant in one group but not another” does not itself establish that the groups differ.

Finally, the longitudinal personality question could be especially rewarding as a reading project. A pooled analysis of six cohorts examined alcohol use and subsequent personality change, demonstrating that the direction from drinking to personality is also investigable. Its consumption outcomes should not be treated as equivalent to diagnosed AUD. [Longitudinal personality-change study](https://pubmed.ncbi.nlm.nih.gov/29540247/)

My recommendation is to keep **“personality dimensions and alcohol problems” as the motivating theme**, and use the two-trait, two-outcome comparison as our first bounded exercise. It gives us a concrete way to examine your larger question without assuming that one personality profile characterizes everyone with AUD.

