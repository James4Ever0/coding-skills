---
name: plan-mode
description: "Use Claude Code plan mode for non-trivial implementation tasks. Trigger: '/plan', 'plan this', 'let me plan', 'enter plan mode', 'design the implementation'."
kind: workflow
user-invocable: true
---

# Plan Mode

Enter plan mode for any implementation task that is non-trivial, ambiguous, or affects multiple files. Planning prevents wasted effort and keeps the user in control.

## Workflow

1. **Decide whether to plan**:
   - New feature: yes.
   - Multiple valid approaches: yes.
   - Changes existing behavior or structure: yes.
   - Architectural decision: yes.
   - Multi-file change: yes.
   - Unclear requirements: yes.
   - Single-line fix or obvious tweak: no.

2. **Explore first**:
   - Read relevant files and directories.
   - Identify existing patterns and reusable code.
   - Launch Explore agents for broad searches when needed.

3. **Design the approach**:
   - Consider 2-3 alternatives and their trade-offs.
   - Choose the simplest approach that meets constraints.
   - Identify critical files and functions to modify.

4. **Write the plan**:
   - Create the plan file at `.claude/plans/<slug>.md`.
   - Include context, recommended approach, critical files, and verification steps.
   - Keep it concise enough to scan, detailed enough to execute.

5. **Ask clarifying questions** if the approach depends on user preference.

6. **Exit plan mode** with `ExitPlanMode` only when the plan is ready for approval.

## Output Artifacts

- `.claude/plans/<slug>.md`
- List of critical files
- Verification commands

## Rules

- Do not write or edit non-plan files while in plan mode.
- Do not ask "is this plan okay?" in prose; use `ExitPlanMode` for approval.
- The plan file is the only file you may edit during plan mode.
- If the user rejects the plan, revise it and exit again.
- After approval, execute the plan; update it if reality diverges significantly.
