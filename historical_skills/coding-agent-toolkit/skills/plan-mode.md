---
name: plan-mode
description: Use Claude Code plan mode for non-trivial implementation tasks.
user-invocable: true
allowed-tools:
  - Bash
  - Read
  - Agent
  - EnterPlanMode
  - ExitPlanMode
---

# plan-mode

Enter plan mode for any implementation task that is non-trivial, ambiguous, or affects multiple files. Planning prevents wasted effort and keeps the user in control.

## When to use

- New feature
- Multiple valid approaches exist
- Changes existing behavior or structure
- Architectural decision
- Multi-file change
- Unclear requirements

Skip plan mode for single-line fixes or obvious tweaks.

## Procedure

1. **Explore first**:
   - Read relevant files and directories.
   - Identify existing patterns and reusable code.
   - Launch Explore agents for broad searches when needed.

2. **Design the approach**:
   - Consider 2–3 alternatives and their trade-offs.
   - Choose the simplest approach that meets constraints.
   - Identify critical files and functions to modify.

3. **Write the plan**:
   - Create the plan file at `.claude/plans/<slug>.md`.
   - Include context, recommended approach, critical files, and verification steps.
   - Keep it concise enough to scan, detailed enough to execute.

4. **Ask clarifying questions** if the approach depends on user preference.

5. **Exit plan mode** with `ExitPlanMode` only when the plan is ready for approval.

## Output

- `.claude/plans/<slug>.md`
- List of critical files
- Verification commands

## Rules

- Do not write or edit non-plan files while in plan mode.
- Do not ask "is this plan okay?" in prose; use `ExitPlanMode` for approval.
- The plan file is the only file you may edit during plan mode.
- If the user rejects the plan, revise it and exit again.
- After approval, execute the plan; update it if reality diverges significantly.
