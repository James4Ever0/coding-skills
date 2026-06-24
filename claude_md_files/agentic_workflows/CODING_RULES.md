# CODING_RULES.md — Agentic Workflows

> Rules for running multi-agent coding sessions (planner/generator/evaluator), long-running tasks, and repository-scale automation.

## 1. Repository knowledge map

- Keep `AGENTS.md` short (~100 lines). It is a table of contents, not an encyclopedia.
- Put detailed guidance in `docs/`:
  - `docs/ARCHITECTURE.md`
  - `docs/DESIGN.md`
  - `docs/QUALITY.md`
  - `docs/plans/` for active and completed plans
  - `docs/decisions/` for decision records
- Cross-link everything. When a rule is repeatedly violated, promote it into a linter or test.

## 2. Multi-agent roles

| Role | Responsibility | Guardrail |
|------|----------------|-----------|
| Planner | Expands user intent into a spec and sprint list. Avoids prescribing low-level details that may be wrong. | Preserves user intent and source of truth. |
| Generator / Worker | Implements one sprint at a time; runs self-tests. | Does not silently game tests. |
| Evaluator / QA | Independently verifies output against agreed criteria. | Read-only by default; no file writes unless documented. |
| Orchestrator | Coordinates loops and decides refine / pivot / escalate. | Keeps generator/evaluator boundary visible. |

## 3. Sprint contracts

Before coding, write what "done" means and how it will be verified:

```markdown
## Sprint Contract

- **Goal**: [what will be built]
- **Verification**: [tests, screenshots, API calls, etc.]
- **Out of scope**: [what is not included]
- **Threshold**: [minimum acceptable quality]
```

Planner proposes, Evaluator reviews, both agree.

## 4. Grading criteria

Turn subjective goals into gradable dimensions. Example weights:

1. Functionality (30%)
2. Code quality / maintainability (25%)
3. Design / UX (20%)
4. Performance (15%)
5. Security (10%)

Calibrate the evaluator with few-shot examples. Instruct it to be skeptical.

## 5. Iteration loop

```
Plan → Contract → Implement → Self-test → Evaluate → Fix → Re-evaluate
```

- Retry up to a bounded number of times (default 3).
- After the bound, escalate to a human with evidence.
- Keep evaluation reports in `docs/plans/` or `.tips_and_tricks/`.

## 6. Context management

- For very long sessions, use context resets with structured handoff artifacts.
- For shorter sessions, rely on compaction if the model handles it well.
- Treat `Plans.md`, `spec.md`, and review reports as the persistent state.

## 7. Guardrails and taste invariants

- Enforce architectural boundaries mechanically (linters, structural tests).
- Define taste invariants: naming, file size limits, structured logging, dependency direction.
- Run a recurring cleanup pass to prevent "AI slop" from compounding.

## 8. Autonomy boundaries

- Agents can implement, test, review, and open PRs.
- Production deploys require human approval.
- Security-sensitive changes require explicit authorization.
- Evaluators must not rewrite criteria to make generated output pass.

## 9. Handoff protocol

Generator to Evaluator:

```markdown
## Handoff

- **Sprint**: [id]
- **Changes**: [file list]
- **Self-test results**: [pass/fail + output]
- **Known gaps**: [list]
- **How to verify**: [commands or URLs]
```

Evaluator to Orchestrator:

```markdown
## Evaluation

- **Verdict**: PASS / FAIL / PARTIAL
- **Evidence**: [logs, screenshots, test output]
- **Blockers**: [must-fix items]
- **Nits**: [optional improvements]
```
