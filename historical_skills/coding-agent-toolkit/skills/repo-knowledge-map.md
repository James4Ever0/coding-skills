---
name: repo-knowledge-map
description: Maintain a small AGENTS.md table of contents plus structured docs/ so agents can navigate progressively.
user-invocable: true
allowed-tools:
  - Bash
  - Read
  - Write
  - Edit
---

# repo-knowledge-map

A monolithic instruction manual rots. Give agents a map instead.

## Principle

Context is scarce. A giant `AGENTS.md` crowds out the actual task and quickly becomes stale. Treat `AGENTS.md` as a short table of contents; put the real detail in structured, versioned docs.

## Procedure

1. **Keep `AGENTS.md` short (~100 lines)**
   - Development flow overview.
   - Role boundaries (e.g. PM vs Worker).
   - File map and where to look next.
   - Prohibited actions.
   - Troubleshooting pointers.

2. **Structure `docs/` as the system of record**
   - `docs/ARCHITECTURE.md` — domains and package layering.
   - `docs/DESIGN.md` — design decisions and core beliefs.
   - `docs/QUALITY.md` — grades per domain/layer and known gaps.
   - `docs/plans/` — active, completed, and technical-debt plans.
   - `docs/decisions/` — decision records.

3. **Treat plans as first-class artifacts**
   - Lightweight plans for small changes.
   - Execution plans with progress logs and decision trails for complex work.
   - Version plans in the repo so agents can operate across sessions.

4. **Mechanically verify docs**
   - Cross-link checks.
   - Lint for stale references.
   - A periodic doc-gardening pass.

5. **Progressive disclosure**
   - Start agents with `AGENTS.md`.
   - Point to deeper sources of truth instead of inlining everything.

## Output

- A concise `AGENTS.md`.
- A `docs/` directory with index and structured pages.
- Updated cross-links when files move.

## Caution

- Do not dump everything into one file.
- When a rule is violated repeatedly, promote it into code or a linter rather than adding another doc paragraph.
