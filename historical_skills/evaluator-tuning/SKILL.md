---
name: evaluator-tuning
description: "Tune a skeptical evaluator agent to grade generated work against concrete criteria with Playwright, tests, or domain checks. Trigger: 'tune evaluator', 'qa agent', 'grade output'."
kind: workflow
user-invocable: true
---

# Evaluator Tuning

Separate the generator from the evaluator and tune the evaluator to be skeptical so feedback drives real improvement.

## Workflow

1. **Define criteria**: translate subjective quality into gradable terms.
   - Example (design): coherence, originality, craft, functionality.
   - Example (code): correctness, test coverage, architecture fit, UX depth.
2. **Weight criteria**: emphasize the dimensions the model usually underperforms.
3. **Few-shot calibration**: provide scored examples that align with your taste.
4. **Tool the evaluator**: give it Playwright, tests, log queries, or domain checks so it inspects real behavior.
5. **Iterate**: review evaluator logs, find judgment divergences, and update the prompt.
6. **Thresholds**: fail a sprint if any critical criterion falls below its threshold.

## Output Artifacts

- Evaluator prompt/template
- Grading rubric
- Playwright or test harness
- Example scored outputs

## Rules

- The evaluator must inspect running behavior, not static output.
- Tune skepticism; default evaluator behavior is too lenient.
- Criteria must be concrete enough to act on.
- Generator gets detailed feedback, not just a score.
