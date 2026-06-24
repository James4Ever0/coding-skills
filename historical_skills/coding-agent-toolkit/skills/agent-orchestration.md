---
name: agent-orchestration
description: Suggest a multi-agent orchestration plan for pure agentic coding tasks (planner, generator, evaluator, bounded autonomy).
user-invocable: true
allowed-tools:
  - Bash
  - Read
  - Agent
  - Workflow
---

# agent-orchestration

Design the harness before unleashing the agents.

## When to use

- The user wants a complex app built mostly by agents.
- A single agent run is likely to drift, stall, or miss acceptance criteria.
- You need to separate planning, implementation, and judgment.

## Recommended pattern

```
Planner    →    Generator    →    Evaluator
  │                │                 │
  └──────── Sprint contracts ────────┘
```

1. **Planner**
   - Takes a short user prompt and expands it into a product spec.
   - Focuses on user stories, scope, and high-level design.
   - Avoids prescribing low-level implementation details that may be wrong.

2. **Generator / Worker**
   - Implements one feature or sprint at a time.
   - Runs tests and self-checks before handing off.
   - Proposes a sprint contract: "I will build X and verify it with Y."

3. **Evaluator / QA**
   - Reviews the sprint contract before work begins.
   - Independently tests the result (unit tests, API tests, browser automation, etc.).
   - Reports pass/fail with concrete evidence; major findings block completion.

4. **Orchestrator (optional)**
   - Coordinates Planner → Generator → Evaluator loops.
   - Decides whether to refine, pivot, or escalate to a human.
   - Keeps the generator/evaluator boundary visible.

## Procedure

1. **Define grading criteria**
   - Turn fuzzy goals into gradable dimensions (functionality, code quality, design, performance, security).
   - Weight the dimensions based on the project's priorities.

2. **Agree on sprint contracts**
   - Before coding, write what "done" means and how it will be verified.
   - Both generator and evaluator must agree.

3. **Run the loop**
   - Implement → evaluate → fix → re-evaluate.
   - Limit retries to a bounded number (e.g. 3) before escalating.

4. **Maintain handoff artifacts**
   - Keep `Plans.md`, `spec.md`, and review reports in the repo.
   - Use context resets between long sessions if the model shows context anxiety.

## Output

- An orchestration plan document.
- Defined roles and criteria.
- Sprint contract template.
- A decision log for refine/pivot/escalate.

## Caution

- More agents cost more tokens and time; use them only when the task justifies it.
- The evaluator must be skeptical, not lenient. Calibrate with examples.
- Never let a generator silently approve its own output.
