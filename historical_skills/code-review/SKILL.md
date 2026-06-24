---
name: code-review
description: "Review pending changes for correctness, maintainability, and consistency. Trigger: 'review this', 'code review', 'check my changes', 'critique the diff'."
kind: workflow
user-invocable: true
---

# Code Review

Review changes before they are considered complete. Look for bugs, regressions, style violations, and missed edge cases.

## Workflow

1. **Understand the change**:
   - Read the plan or user request that motivated the change.
   - List the files that were modified, added, or deleted.

2. **Check correctness**:
   - Does the change do what the plan asked?
   - Are there off-by-one errors, race conditions, or unhandled errors?
   - Are inputs validated at boundaries?

3. **Check maintainability**:
   - Are names clear and intention-revealing?
   - Are functions small and focused?
   - Is there duplicated code that should be shared?
   - Are there magic values or hidden conventions?

4. **Check tests and docs**:
   - Are there tests for new behavior?
   - Do tests cover at least one failure path?
   - Is documentation updated (README, API docs, comments)?

5. **Check consistency**:
   - Does the code follow the project's style and conventions?
   - Does it respect architecture boundaries?
   - Are error messages actionable?

6. **Summarize findings**:
   - List issues by severity (blocker, warning, nit).
   - Suggest concrete fixes with file/line references.
   - Note what looks good.

## Output Artifacts

- Review summary with severity labels
- File/line references for each issue
- Suggested fixes

## Rules

- Be specific; cite files and line numbers.
- Distinguish blockers from nits.
- Do not praise work to avoid criticizing it; be constructive.
- If the change is large, focus on the highest-risk areas first.
