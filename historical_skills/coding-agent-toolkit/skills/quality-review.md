---
name: quality-review
description: Review code for coverage, smell, rule adherence, consistency, and a stable plan-act loop.
user-invocable: true
allowed-tools:
  - Bash
  - Read
  - Agent
---

# quality-review

Judge code as an independent reviewer, not as its author.

## When to use

- After implementation, before declaring a task complete.
- The user asks for a code review, smell check, or rules audit.
- Before merging a branch or opening a PR.

## Procedure

1. **Run the automated gate**
   - Tests: `scripts/test.sh` or project equivalent.
   - Lint: `scripts/lint.sh`.
   - Coverage: `scripts/test-coverage.sh`.
   - Type check: `tsc`, `mypy`, `cargo check`, etc.

2. **Check functional correctness**
   - Do the changes match the acceptance criteria?
   - Are edge cases handled?
   - Are errors propagated and logged?

3. **Check maintainability**
   - File and function sizes.
   - Naming consistency.
   - Duplicated code that should be shared.
   - Magic numbers and strings.

4. **Check rules adherence**
   - Compare against `CLAUDE.md`, `CODING_RULES.md`, and project conventions.
   - Look for unsafe file deletion, force-push risks, hard-coded paths, leaked secrets.

5. **Check the plan-act loop**
   - Is the `Plans.md` / task list updated?
   - Are decisions recorded?
   - Is there a clear handoff or completion report?

6. **Write a review report**
   - List blockers (must fix) and nits (can fix later).
   - Suggest concrete fixes with file references.
   - Separate opinion from fact.

## Output

- A review report in the project or as a comment.
- A list of blockers and follow-ups.
- Confirmation that the automated gate passes or fails.

## Caution

- Do not approve your own work silently.
- If you are also the implementer, explicitly flag self-review limitations.
- Major correctness issues must be resolved before completion.
