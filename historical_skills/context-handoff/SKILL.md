---
name: context-handoff
description: "Create clean-slate handoff artifacts for long agentic sessions so a fresh agent can resume without context anxiety. Trigger: 'handoff', 'context reset', 'resume session', 'long-running task'."
kind: workflow
user-invocable: true
---

# Context Handoff

Long agentic sessions can suffer from context anxiety or window pressure. A context reset gives a clean slate, but only if the handoff artifact carries enough state for the next agent to continue.

## When to use

- The model shows context anxiety (prematurely wrapping up, repeating itself, losing track of the plan).
- The task has run for many turns or consumed significant context.
- You are switching from one agent to another in a multi-agent harness.
- A session ended unexpectedly and must be resumed.

## Workflow

1. **Capture current state**
   - What was the original goal and acceptance criteria?
   - What is the current sprint/feature being worked on?
   - What files were changed? (`git status -sb`, `git diff --stat`)
   - What tests pass/fail? What commands were last run?

2. **Summarize decisions**
   - List architectural or product decisions made during the session.
   - Note rejected alternatives and why.
   - Record any open questions or blockers.

3. **Identify next steps**
   - What is the very next action the next agent should take?
   - What are the remaining tasks from the spec or plan?
   - Which have highest priority?

4. **Write the handoff artifact**
   - Save to `docs/plans/handoff-YYYY-MM-DD-HHMM.md` or `docs/plans/session-handoff.md`.
   - Include links to relevant spec, plan, and code locations.
   - Keep it scannable: bullets, checkboxes, and file paths.

5. **Resume with the handoff**
   - The new agent reads the handoff first, then `CLAUDE.md`/`AGENTS.md`, then the active plan.
   - New agent confirms understanding before continuing implementation.

## Output Artifacts

- `docs/plans/session-handoff.md` (or timestamped variant)
- Updated `docs/plans/active-plan.md` with progress markers
- `git status` and test-result snapshots

## Rules

- Handoff must be written before the context reset, never reconstructed from memory.
- Include concrete file paths and line numbers when relevant.
- Distinguish facts from assumptions; flag anything uncertain.
- Keep the artifact under 300 lines; move deep detail to linked docs.
- Do not include secrets, API keys, or local-only paths.
