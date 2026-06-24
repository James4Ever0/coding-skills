---
name: docs-and-tips
description: Write docs, help text, and capture workflow or debug tricks in a project tips folder.
user-invocable: true
allowed-tools:
  - Bash
  - Read
  - Write
  - Edit
---

# docs-and-tips

Good docs compound. Capture knowledge where the next agent can find it.

## When to use

- After setting up a project, workflow, or tricky integration.
- After debugging a non-obvious issue.
- When the user asks for help, how-to, or onboarding docs.

## Procedure

1. **Keep a project README**
   - What the project does.
   - How to install, build, test, and run.
   - Common commands and environment variables.

2. **Create `.tips_and_tricks/`**
   - Store small, searchable notes:
     - `debug-foo.md`
     - `mirror-setup.md`
     - `local-test-secrets.md` (without real secrets)
   - Link to them from `CLAUDE.md` or README.

3. **Document decisions**
   - Why a dependency was chosen.
   - Why a file is organized a certain way.
   - Known limitations and workarounds.

4. **Write inline help**
   - CLI `--help` messages.
   - Makefile / task runner comments.
   - Script usage banners.

5. **Summarize for LLMs**
   - Keep a concise `docs/context-for-agents.md` with the most important constraints.
   - Update it when major architecture changes.

6. **Cross-link**
   - Reference related tips and docs by relative path.
   - Avoid absolute paths.

## Output

- Updated README / SETUP.md.
- New or updated `.tips_and_tricks/*.md` notes.
- Decision logs or architecture notes.

## Caution

- Do not duplicate the entire codebase in prose.
- Keep tips current; stale docs are worse than no docs.
- Never commit real secrets, even in "example" snippets.
