---
name: coding-skill-prototyping
description: "Plan, prototype, test, and finalize new Claude Code skills. Trigger: 'prototype a skill', 'create a new skill', 'skill prototyping'."
kind: workflow
user-invocable: true
---

# Coding Skill Prototyping

A 5-phase workflow for creating new Claude Code skills using `prototyping/` as a template workspace.

## First: Read the HOWTO

Before doing anything, read `prototyping/PROTOTYPING_HOWTO.md`. It explains:

- That `prototyping/` is a **template/pattern folder**, not a workspace to modify in-place.
- What information to ask the user for before starting (reference URLs, requirements, target path, language).
- How to adapt the structure to the target project.

## Workflow

### Phase 1: Plan

1. Read `prototyping/MILESTONE.md` and `PROTOTYPING_HOWTO.md`.
2. **Ask the user for missing info**: reference URLs, existing code, requirements, TODOs, target directory, language.
3. Search the web for reference projects if the user doesn't provide them.
4. Write a milestone file following `prototyping/docs/milestone-schema.md`.
5. Save reference links in the target project's `docs/references/<topic>.md`.

### Phase 2: Prototype

1. Implement in any language. Replicate the `prototyping/` structure pattern in the target project.
2. Organize, rearrange, and write entries to the target project's `CLAUDE.md` and other markdown files.
3. Keep domain logic separate from I/O.

### Phase 3: Test

1. Write standalone tests using the language's standard test library.
2. Run with `prototyping/scripts/run-tests.sh` or adapt the pattern for the target.

### Phase 4: Convert (optional)

1. Use `prototyping/docs/language-conversion-map.md` for cross-language guidance.
2. Conversion is agent-guided, not automated.

### Phase 5: Finalize

1. Extract proven prototype into a skill markdown file in `historical_skills/`.
2. Update milestones and reference files.
3. Run final verification.

## File Pointers

| File | Purpose |
|------|---------|
| `prototyping/PROTOTYPING_HOWTO.md` | **Start here** — how to use this workspace as a template |
| `prototyping/MILESTONE.md` | Milestone tracker |
| `prototyping/docs/milestone-schema.md` | Milestone format |
| `prototyping/docs/language-conversion-map.md` | Translation guidance |
| `prototyping/docs/references/` | Topic-based reference files |
| `claude_md_files/prototyping/CODING_RULES.md` | Coding rules |
| `claude_md_files/prototyping/WORKFLOW.md` | Detailed workflow |
