---
name: tips-and-tricks
description: "Capture special workflows, debug tricks, and project wisdom in .tips_and_tricks. Trigger: 'note trick', 'debug tip', 'workflow note'."
kind: workflow
user-invocable: true
---

# Tips & Tricks

Collect project-specific tricks and workflows so future sessions don't relearn them.

## Workflow

1. **Create `.tips_and_tricks/`** at the project root if it doesn't exist.
2. **Categorize notes**:
   - `setup.md` — one-time or rare setup steps
   - `debug.md` — how to diagnose common failures
   - `workflow.md` — special command sequences or scripts
   - `decisions.md` — why a non-obvious choice was made
   - `external.md` — links to docs, dashboards, tickets
3. **Write atomic entries**: one trick per bullet, with context and command.
4. **Reference in CLAUDE.md** so every session knows where to find them.
5. **Prune** outdated entries during retrospectives.

## Output Artifacts

- `.tips_and_tricks/*.md`
- Updated `CLAUDE.md` pointer

## Rules

- Keep entries short and searchable.
- Include the exact command or config snippet.
- Date significant entries.
- Move evergreen tricks into shared skills or CLAUDE.md rules.
