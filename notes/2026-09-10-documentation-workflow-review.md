# Review of curriculum, status, and session-note workflow

**Date:** 2026-09-10  
**Author:** Codex (GPT-6 Astra), reviewing at the project owner's request  
**Session type:** Analysis design

## Prompts / scope

The project owner asked for a comparison of the notes and index scheme with `SYLLABUS.md` and `STATUS.md`, identifying redundancies and opportunities to streamline the transition from plans to actions. `ROADMAP.md` and `README.md` were also inspected for overlapping responsibilities.

## Teaching notes / findings

* The syllabus names Phase 0 as current; status, last updated September 5, marks Phase 0 complete and Phase 1 next. The September 8 note, including September 9 additions, records PRS exploration associated with Phase 3. Exploration does not establish completion of prerequisite phases.
* The roadmap duplicates the syllabus's phase sequence and adds another set of task checkboxes. Its unchecked setup tasks conflict with setup accomplishments recorded in status.
* Status contains a historical work log; notes already serve that purpose. The PRS note contains repeated article-reading tasks and live TODOs, while status lists different next tasks.
* The notes index says newest entries go first, but the existing entries were in ascending order. Its Topic and Outcome columns can be useful if topics describe subject matter and outcomes describe actual learning or decisions; “More to do” does not provide that distinction.
* The PRS note is a useful human-authored working notebook, but does not consistently use the reporting template's metadata and headings. Its dated filename also covers a later session. Preserve its content; apply a consistent session convention prospectively.

## Sources and provenance

Local files inspected on 2026-09-10: [syllabus](../SYLLABUS.md), [status](../STATUS.md), [roadmap](../ROADMAP.md), [README](../README.md), [working agreement](../AGENTS.md), [reporting protocol](../docs/REPORTING_PROTOCOL.md), [index](INDEX.md), [template](templates/session-report.md), [governance note](2026-09-06-project-governance.md), and [PRS note](2026-09-08-prs-polygenic-risk-scores.md). No external scientific claims were verified in this structural review.

## Decisions and artifacts

Recommendations for discussion, not an adopted restructuring:

* Let the syllabus own phase order, learning objectives, and evidence required for completion. Move useful roadmap teaching detail there and retain a short roadmap redirect if needed.
* Let status own current focus, a small ordered action queue, blockers, and links to evidence of completion. Remove the syllabus's independently maintained current-lesson field. Keep environment specifications in their reproducibility files and link to them from status.
* Let dated notes own session findings, provenance, and historical decisions. Their next-lesson sections record proposals at that time; status owns the current selection. Link active status tasks back to the relevant note section.
* Keep the index chronological and navigational, with concise concrete outcomes, rather than adding another task list.
* At session close, write the note, index it, and update status. Update the syllabus only when curriculum or completion criteria change. Revise the protocol and template together if this workflow is adopted.
* Example proposed next action: explain Deng's genotyping, imputation, and QC section, producing a short glossary and a list of remaining statistical questions. This follows the latest recorded questions; it is not a confirmed priority or evidence of phase completion.

Created this review note and indexed it. Corrected index ordering. No curriculum, status, roadmap, protocol, or existing session-note content was changed.

## Assumptions, limitations, and open questions

Documentation establishes what was recorded, not actual environment health or mastery. Current priorities and phase completion need reconciliation against evidence rather than inference from dates or topics. The existing PRS note had uncommitted changes and was left untouched.

An adjacent documentation inconsistency remains: README's data-governance paragraph suggests individual-level data can be kept locally if ignored by Git, whereas AGENTS.md imposes a stricter repository boundary. README should be aligned with the working agreement in a future documentation edit.

## Next lesson

Discuss adoption of the proposed file responsibilities and choose the next bounded learning task. The latest recorded learning questions concern Deng's methods and statistical prerequisites.

## Follow-up decision: deprecate STATUS

The project owner asked, “Could we just deprecate STATUS?” This supersedes the recommendation above to make status the active task tracker.

Adopted on 2026-09-10: `SYLLABUS.md` owns the current lesson and next actions; dated notes preserve history; `notes/INDEX.md` provides navigation. `STATUS.md` now has a deprecation notice and links to these destinations, with its original September 5 snapshot preserved underneath. The reporting protocol and session template were updated to distinguish historical suggestions from the current action queue.

The syllabus retains its existing Phase 0 lesson and links to the recent PRS exploration, with an action to reconcile the focus and select a bounded next lesson. No phase completion or new scientific priority was inferred. `ROADMAP.md` remains unchanged; its duplication can be addressed separately. Validation: documentation diff whitespace check passed.

## Follow-up decision: consolidate ROADMAP into SYLLABUS

The project owner authorized consolidating the curriculum and roadmap in `SYLLABUS.md` and plans to remove `ROADMAP.md` separately in a later step.

Adopted on 2026-09-10 with Codex (GPT-5) assistance: the roadmap's core concepts and hands-on milestones were incorporated into six expanded syllabus phases. Each phase now distinguishes core concepts, practical work, and evidence of learning. The current lesson and next actions remain a separate short section so curriculum requirements do not become a competing live task list.

The consolidation also reconciles several methodological differences. Phase 0 includes data classification and a scoped research question; Phase 3 requires explicit score provenance and allele harmonization and limits demonstrations to public or synthetic data; Phase 4 explicitly requires nested validation; and Phase 5 includes calibration, subgroup performance, and limits on generalization. Candidate-locus analyses are framed as methodological comparisons rather than causal or clinical claims.

`ROADMAP.md` was deliberately left unchanged for the project owner's subsequent Git removal. No lesson or phase was marked complete as part of the consolidation.
