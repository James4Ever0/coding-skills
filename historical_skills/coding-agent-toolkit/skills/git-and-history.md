---
name: git-and-history
description: Set up git safely, maintain .gitignore, list tracked files, commit history, and extract reusable skills from past work.
user-invocable: true
allowed-tools:
  - Bash
  - Read
  - Write
  - Edit
---

# git-and-history

Treat git history as a first-class artifact.

## When to use

- Initializing a new project.
- Preparing to commit a large change.
- Auditing what should and should not be tracked.

## Procedure

1. **Initialize git if needed**
   - `git init` only when the directory is not already a repo.
   - Set a sensible `.gitignore` from the start.

2. **Maintain `.gitignore`**
   - Exclude: `venv/`, `node_modules/`, `tmp/`, `logs/`, `*.log`, `.env`, secrets, build artifacts, IDE files.
   - For Python, add `__pycache__/`, `.pytest_cache/`, `*.egg-info/`.
   - For Node, add `dist/`, `.next/`, `coverage/`.

3. **Audit tracked files before committing**
   - Use `fd --type f` (recommended) or `git ls-files` to list files.
   - Generate a human-readable descending file-size list.
   - Ask the user to exclude any large or sensitive files explicitly.

4. **Commit cleanly**
   - Use conventional commits when the project defines them:
     `feat:`, `fix:`, `docs:`, `refactor:`, `test:`, `chore:`.
   - One logical change per commit.
   - Do not commit secrets or debug logs.
   - Do not force-push.

5. **Extract skills from history**
   - After a coding session, review what repeatable steps emerged.
   - Write or update skill files in `.claude/skills/` or a shared skills folder.
   - Note special tricks in `.tips_and_tricks/`.

6. **Remember user preferences**
   - If the user prefers to skip commits, large-file exclusions, or specific conventions, record that in memory or project docs.

## Output

- A clean `.gitignore`.
- A commit or a ready-to-commit staged state.
- A file-size audit report (optional).
- Updated skills or tips when patterns are reusable.

## Caution

- Never run `git push --force` or `git push -f`.
- Never rewrite shared history.
- Keep binary artifacts and credentials out of git.
