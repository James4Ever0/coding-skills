---
name: sprint-contract
description: "Negotiate a testable sprint contract between generator and evaluator before coding. Trigger: 'sprint contract', 'define done', 'done criteria', 'acceptance contract'."
kind: workflow
user-invocable: true
---

# Sprint Contract

A sprint contract bridges the gap between a high-level spec and testable implementation. The generator proposes what it will build and how success will be verified; the evaluator reviews it to make sure the right thing is being built.

## When to use

- A feature is too large for a single turn.
- The spec is high-level and implementation details are ambiguous.
- You are running a planner/generator/evaluator harness.
- Quality or scope drift has been a problem.

## Workflow

1. **Generator proposes**
   - Scope: what will be built in this sprint.
   - Deliverables: files, functions, APIs, UI states.
   - Verification: tests, Playwright checks, log assertions, or domain checks.
   - Out of scope: what is explicitly deferred.

2. **Evaluator challenges**
   - Are the acceptance criteria concrete enough to pass/fail?
   - Do they cover the user-visible behavior in the spec?
   - Are edge cases and error paths included?
   - Is the scope realistic for one sprint?

3. **Iterate until agreement**
   - Revise criteria based on evaluator feedback.
   - Add missing edge cases or remove unrealistic ones.
   - Record the final contract.

4. **Execute and verify**
   - Generator builds against the contract.
   - Evaluator grades each criterion with evidence.
   - Any failure produces specific, actionable feedback.

## Output Artifacts

- `docs/plans/sprint-contract-NN.md` or inline in the active plan
- Test/verification checklist
- Evaluator rubric for the sprint

## Contract Template

```markdown
## Sprint N: Title

### Goal
One-sentence outcome.

### Deliverables
- File/change 1
- File/change 2

### Acceptance Criteria
- [ ] Criterion 1 (how to verify)
- [ ] Criterion 2 (how to verify)
- [ ] Error/edge case X returns Y

### Out of Scope
- Deferred item A
- Deferred item B

### Verification Method
- Unit tests: `scripts/test.sh`
- Playwright scenario: `tests/e2e/feature.spec.ts`
- Manual check: launch app, perform action Z
```

## Rules

- Criteria must be binary pass/fail when possible.
- Each criterion includes the verification method.
- The evaluator must inspect running behavior, not just code.
- Failed sprints get detailed feedback, not just a score.
- Update the active plan when the sprint is complete.
