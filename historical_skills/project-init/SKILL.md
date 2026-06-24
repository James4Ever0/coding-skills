---
name: project-init
description: "Initialize a new project with CLAUDE.md, AGENTS.md, scripts, and folder structure. Trigger: 'init project', 'initialize repo', 'setup claude.md', 'bootstrap project'."
kind: workflow
user-invocable: true
---

# Project Initialization

Bootstrap a new repository so it is agent-friendly from day one.

## Workflow

1. **Understand the project**:
   - Language / stack
   - Type (CLI, web app, API service, library, data pipeline, etc.)
   - Build and test tooling
   - Deployment target

2. **Create the agent entry points**:
   - `CLAUDE.md` — project-specific behavior and session routine.
   - `AGENTS.md` — short map with quick-start commands and escalation rules.
   - `CODING_RULES.md` — if the project needs overrides to universal rules.

3. **Create the folder structure**:
   - Source folders matching the stack convention.
   - `docs/spec/`, `docs/plans/`, `docs/decisions/`
   - `.tips_and_tricks/`
   - `scripts/` with install, build, test, and run scripts.
   - `logs/` (gitignored)

4. **Add tooling config**:
   - Formatter / linter config.
   - `.gitignore` appropriate for the stack.
   - Dependency manifest with pinned versions.

5. **Write the README**:
   - What the project does.
   - How to install and run.
   - How to test.
   - Where to find docs.

6. **Verify**:
   - Run install and build scripts.
   - Run tests.
   - Confirm the project is in a working state.

## Output Artifacts

- `CLAUDE.md`
- `AGENTS.md`
- `README.md`
- `scripts/install.sh`, `scripts/build.sh`, `scripts/test.sh`
- `docs/` folder structure
- `.gitignore`
- Dependency manifest

## Rules

- Keep `AGENTS.md` under 150 lines; put detail in `docs/`.
- Use universal rules from `claude_md_files/` as defaults.
- Do not include machine-specific paths or secrets.
- Make every script executable and idempotent where possible.
- Verify the project builds and tests pass before finishing.
