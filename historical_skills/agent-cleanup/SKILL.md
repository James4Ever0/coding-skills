---
name: agent-cleanup
description: "Run periodic garbage-collection and refactoring passes to prevent AI-generated drift and stale patterns. Trigger: 'cleanup', 'refactor pass', 'garbage collection'."
kind: workflow
user-invocable: true
---

# Agent Cleanup (Garbage Collection)

Agents replicate existing patterns, including uneven ones. Run periodic cleanup passes to keep the codebase from drifting.

## Workflow

1. **Detect drift**: scan for duplicated helpers, stale docs, oversized files, dead code, and repeated patterns.
2. **Prioritize**: focus on patterns that propagate (bad abstractions, copy-pasted code, stale rules).
3. **Refactor**: extract shared utilities, delete dead code, split oversized files.
4. **Update docs**: move lessons into `CODING_RULES.md`, custom lints, or `docs/decisions/`.
5. **Verify**: run tests and linters after each cleanup.
6. **Hand off**: if the cleanup spans sessions, leave a handoff artifact in `docs/plans/`.

## Output Artifacts

- Refactored code
- Updated or deleted stale docs
- New/extracted shared utilities
- Test/lint evidence

## Rules

- Never delete files without explicit permission.
- Copy before overwriting when unsure.
- One cleanup theme per pass; don't mix large refactors with feature work.
- Capture recurring fixes as mechanical rules.
