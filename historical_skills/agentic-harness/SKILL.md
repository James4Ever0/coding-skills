---
name: agentic-harness
description: "Design planner/generator/evaluator agent workflows, context resets, sprint contracts, and in-repo knowledge for long-running coding. Trigger: 'agent harness', 'planner', 'evaluator', 'multi-agent'."
kind: workflow
user-invocable: true
---

# Agentic Harness

Structure long-running agentic coding sessions so they stay coherent, verifiable, and aligned with the spec.

## Workflow

1. **Planner**: turn a short prompt into a full product spec and task ledger.
   - Focus on deliverables and acceptance criteria, not every implementation detail.
   - Avoid over-specifying granular technical details that may cascade errors.
   - Record the spec in `spec.md` or `docs/spec/00-project-spec.md`.
2. **Generator**: implement one feature at a time.
   - Use `/plan-mode` for non-trivial implementation steps.
   - Use git for version control and checkpoint after each sprint.
   - Self-evaluate at the end of each sprint against the contract.
3. **Evaluator**: verify the running app/code against the sprint contract.
   - Use `/verify-run` to build, test, and smoke-test the artifact.
   - Use Playwright, tests, or domain-specific checks.
   - Tune the evaluator to be skeptical; few-shot examples reduce score drift.
   - Return pass/fail per criterion with concrete evidence.
4. **Sprint contract**: before coding, agree on what "done" means for the chunk, including testable behaviors.
5. **Context management**: use context resets for very long runs (clean slate + handoff artifact) or compaction for shorter runs.
   - Reset when the model shows context anxiety or the task exceeds the reliable context window.
   - Compaction preserves continuity for shorter runs.
   - Use `/context-handoff` to produce the handoff artifact.
6. **Sprint contracts**: before coding, agree on what "done" means for the chunk, including testable behaviors. Use `/sprint-contract` for detailed guidance.
7. **In-repo knowledge**: keep `AGENTS.md` as a map, and detailed docs under `docs/`.
8. **Docs gardening**: periodically scan for stale docs and fix them. Use `/docs-gardening` for cleanup passes.
9. **Golden principles**: encode mechanical rules (shared utils, boundary validation, file size limits) and run periodic cleanup agents.

## Output Artifacts

- `AGENTS.md` (map)
- `spec.md` or `docs/spec/`
- `Plans.md` or `docs/plans/`
- Sprint contract files
- Evaluation rubric/criteria

## Rules

- Treat the repo as the system of record; anything outside it is invisible to agents.
- Enforce architecture with custom linters/structural tests, not micromanagement.
- Human taste becomes documentation or tooling, not one-off comments.
- Use the evaluator only when the task sits beyond what the current model handles reliably solo.
- Escalate to humans only when judgment is required.
