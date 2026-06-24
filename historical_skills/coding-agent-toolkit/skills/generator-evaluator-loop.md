---
name: generator-evaluator-loop
description: Separate code generation from independent evaluation using grading criteria, sprint contracts, and bounded retries.
user-invocable: true
allowed-tools:
  - Bash
  - Read
  - Agent
  - Workflow
---

# generator-evaluator-loop

Agents are poor judges of their own work. Separate generation from evaluation.

## Why

Generators tend to be lenient toward their own output, especially for subjective tasks. A standalone evaluator, tuned to be skeptical, gives concrete feedback the generator can iterate against.

## Procedure

1. **Define gradable criteria**
   Convert fuzzy quality into concrete dimensions:
   - Functionality — does it work as specified?
   - Code quality — maintainability, tests, boundaries.
   - Design / UX — coherence, usability, aesthetics.
   - Performance — latency, resource usage.
   - Security — input validation, secrets handling.

2. **Calibrate the evaluator**
   - Provide few-shot examples with score breakdowns.
   - Instruct it to be skeptical, not complimentary.
   - Give it access to tests, logs, screenshots, or the running app.

3. **Negotiate sprint contracts**
   - Generator proposes: "I will build X and verify it with Y."
   - Evaluator reviews the contract for completeness and testability.
   - Both agree before coding starts.

4. **Run the loop**
   - Generator implements.
   - Generator runs self-tests.
   - Evaluator independently verifies.
   - If any criterion falls below threshold, the sprint fails and the generator gets specific feedback.
   - Retry up to a bounded number of times, then escalate.

5. **Handle context anxiety**
   - For very long tasks, use context resets with structured handoff artifacts.
   - For shorter tasks, compaction may be enough.

## Output

- Grading rubric document.
- Sprint contract template.
- Evaluation reports per iteration.
- Final pass/fail verdict with evidence.

## Caution

- Evaluators can also be too generous early on; tune with real examples.
- Running full browser/API automation per iteration costs time; run the cheapest checks first.
- Do not let the generator rewrite evaluation criteria to make itself pass.
