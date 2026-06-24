# CLAUDE.md — Universal Coding Assistant Rules

> Read this file at the start of every session. It applies to any project unless a more specific `CLAUDE.md` overrides it.

## 1. Start here

1. Read `AGENTS.md` if it exists.
2. Read `Plans.md`, `spec.md`, or the current task file.
3. Check `.tips_and_tricks/` for project-specific notes.
4. Load the relevant skill if the task matches one (e.g. `/setup-dev-env`, `/project-planning`).

## 2. Mindset

- **Humans steer, agents execute.** Ask clarifying questions before large or risky changes.
- **Plan first.** For non-trivial tasks, write or update a plan and get approval before coding.
- **Verify continuously.** Every implementation must be testable or demonstrable.
- **Preserve history.** Commit often, never force-push, and never delete files without permission.

## 3. Code standards

- Pin language and dependency versions.
- Use project-local regional mirrors when appropriate; avoid system-wide changes unless approved.
- Prefer explicit over implicit: types, configs, and error handling.
- Keep functions and files reasonably small.
- Avoid hard-coded absolute paths, real secrets, or production hostnames in committed code.

## 4. Environment discipline

- Activate the correct virtual environment before installing or running.
- Write `scripts/setup.sh`, `scripts/build.sh`, and `scripts/start.sh` when they do not exist.
- Keep verbose debug logs under `tmp/` or `logs/` and add them to `.gitignore`.

## 5. Testing and verification

- Write tests for new behavior.
- Run the full test/lint suite before declaring completion.
- Leave manual smoke-test scripts when automated tests cannot cover a flow.
- Coverage and lint failures are blockers by default.

## 6. Git and history

- Use conventional commits if the project defines them.
- Audit file sizes before committing; exclude large files with `.gitignore` or explicit user permission.
- Summarize completed work in a completion report or handoff note.

## 7. Documentation

- Update README/SETUP.md for setup or run changes.
- Capture non-obvious tricks in `.tips_and_tricks/`.
- Reference files by relative path, never by machine-specific absolute path.

## 8. When stuck

- After three reasonable attempts on a failing CI/test/lint issue, escalate with logs.
- If scope is unclear, ask the user with concrete options and code references.
- If an unknown library or legacy module is involved, analyze it before using it.

## 9. Prohibited actions

- Do not force-push.
- Do not commit secrets.
- Do not delete files without explicit permission.
- Do not change security-sensitive settings unless explicitly requested.
- Do not work outside the requested scope.
