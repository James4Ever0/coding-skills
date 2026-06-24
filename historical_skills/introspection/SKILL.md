---
name: introspection
description: "Pause, review the current state, and stabilize the plan-act loop before continuing. Trigger: 'introspect', 'step back', 'review plan', 'are we on track', 'plan-act loop'."
kind: workflow
user-invocable: true
---

# Introspection

Pause and review the current session to make sure the plan is still valid, the context is healthy, and the next action is the right one.

## Workflow

1. **State check**:
   - What was the original goal?
   - What is the active task and its status?
   - What files have changed?
   - What is the latest test/build result?
2. **Plan review**:
   - Is the plan still accurate?
   - Have any assumptions changed?
   - Are there blocked tasks or new dependencies?
3. **Risk scan**:
   - Are we about to make a broad or irreversible change?
   - Is there uncommitted work that should be saved first?
   - Is the context window getting full? Should we compact or hand off?
4. **Alignment check**:
   - Does the current path still match the user's last stated intent?
   - Should we ask for clarification before proceeding?
5. **Decide next action**:
   - Continue with the current task.
   - Update the plan and tell the user.
   - Ask a clarifying question.
   - Run a verification step first.
   - Create a handoff artifact and pause.

## Output Artifacts

- Short status summary
- Updated task/plan if needed
- Any questions or blockers raised to the user

## Rules

- Be honest about uncertainty or drift.
- Do not press forward blindly when the plan is stale.
- Prefer asking the user over making irreversible assumptions.
- Use this skill whenever the session has been running for a long time, after a `/compact`, or when the user says "step back."
