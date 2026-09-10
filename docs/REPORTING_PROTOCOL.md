# Tutorial and Research Reporting Protocol

## Why this exists

Each material tutorial, literature search, or design decision should leave a concise, auditable Markdown record. These notes support learning, reproducibility, and later manuscript methods writing.

## What to record

Create a dated file in `notes/` using `notes/templates/session-report.md`. Record:

1. Date, author, and model/version (if AI assisted).
2. The user prompt(s), or a faithful redacted summary when a prompt could expose restricted information.
3. The assistant response or an accurate summary of the findings and teaching explanation.
4. Sources with stable links and access date.
5. Commands, package versions, inputs, outputs, and decisions, when applicable.
6. Assumptions, limitations, open questions, and the next lesson.

## Data-safety rule

Notes are repository content. They must contain no controlled-access or participant-level data, identifiers, credentials, restricted paths, or small-cell outputs. Describe sensitive work only at an approved, non-identifying level and only where the governing agreement permits it.

## Indexing

Add each new note to `notes/INDEX.md`, newest first. Update the current lesson and next actions in `SYLLABUS.md` when work is selected or completed, linking completion evidence to the session note. Change the learning sequence only when the curriculum changes.

`SYLLABUS.md` owns the current plan and active actions; dated notes own session history and provenance; the index provides navigation. A note's next-lesson section records suggestions made in that session, not a separately maintained task queue. `STATUS.md` is deprecated and retained only as a historical snapshot; do not update it.
