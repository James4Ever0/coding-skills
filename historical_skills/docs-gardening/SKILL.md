---
name: docs-gardening
description: "Scan documentation for staleness, broken links, and drift from code; open targeted fix-up PRs. Trigger: 'doc gardening', 'stale docs', 'update docs', 'sync documentation'."
kind: workflow
user-invocable: true
---

# Docs Gardening

Documentation rots quickly in agent-generated codebases. A recurring docs-gardening pass keeps the knowledge base trustworthy and prevents agents from acting on stale rules.

## When to use

- `AGENTS.md`, `CLAUDE.md`, or `docs/` have not been updated in a while.
- Code behavior has drifted from documented behavior.
- Links between docs are broken or outdated.
- A plan, spec, or decision record is no longer accurate.

## Workflow

1. **Index the knowledge base**
   - List all markdown files in `docs/`, `CLAUDE.md`, `AGENTS.md`, `CODING_RULES.md`.
   - Note last-modified dates and cross-links.

2. **Detect drift**
   - Compare documented APIs, commands, and folder structures to the actual repo.
   - Check for broken internal links.
   - Flag decisions or plans that reference deleted files.
   - Identify docs that no longer match code behavior.

3. **Prioritize fixes**
   - High: `AGENTS.md`, `CLAUDE.md`, active plans, API docs.
   - Medium: architecture decisions, setup guides.
   - Low: historical notes that are clearly archived.

4. **Make minimal corrections**
   - Update outdated facts.
   - Remove or archive obsolete pages.
   - Add cross-links where they are missing.
   - Keep changes focused; one theme per pass.

5. **Verify and propose**
   - Run linters or link checkers if available.
   - Open a fix-up PR or leave a task list for the next session.

## Output Artifacts

- List of stale/broken findings
- Updated markdown files
- Fix-up PR or task ledger entry

## Rules

- Never delete docs without archiving or replacing them.
- Distinguish between historical context (keep) and stale instructions (update).
- Keep `AGENTS.md` under 150 lines; move detail to `docs/`.
- Ensure every doc has at least one incoming link or is listed in `AGENTS.md`.
- Treat docs as code: review and test changes.
