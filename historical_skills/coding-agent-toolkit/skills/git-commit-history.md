---
name: git-commit-history
description: Initialize git, write .gitignore, list tracked files with sizes, exclude large files, and commit safely.
user-invocable: true
allowed-tools:
  - Bash
  - Read
  - Write
  - Edit
---

# git-commit-history

Keep a clean, portable project history without accidentally committing large or generated files.

## When to use

- Initializing a new project.
- Preparing to commit a large change.
- Auditing what should and should not be tracked.
- The user asks to exclude large files or list source files.

## Procedure

1. **Initialize git** if `.git/` is missing:
   ```bash
   git init
   ```

2. **Write `.gitignore`** for the language/stack and project artifacts:
   - logs, build output, dependencies, OS files, IDE files
   - Python: `__pycache__/`, `.pytest_cache/`, `*.egg-info/`
   - Node: `dist/`, `.next/`, `coverage/`, `node_modules/`

3. **Install `fd`** (optional but recommended):
   - `https://github.com/sharkdp/fd`
   - Ask the user before installing system-wide packages.

4. **List not-ignored files** in descending human-readable size order:
   ```bash
   fd --type f --exec ls -lh {} \; | awk '{ print $5, $NF }' | sort -rh
   ```
   Or a portable fallback script: `scripts/list-source-files.sh`.

5. **Review large files** (>~100 KB). Ask the user whether to exclude each or keep it.

6. **Commit** the approved files with a clear message.

7. **Leave history optional**: if the user prefers not to commit, document the file list and `.gitignore` state.

## Output

- `.gitignore`
- `scripts/list-source-files.sh`
- Initial commit (if requested)

## Rules

- Never commit secrets, `.env`, or local-only configuration.
- Never delete files without explicit permission; exclude via `.gitignore` instead.
- Prefer `fd` if available; provide a fallback `find` command for portability.
- Commit messages follow conventional prefixes: `feat:`, `fix:`, `docs:`, `test:`, `chore:`.
- Use explicit file lists or `grep -v` filters when copying; avoid blind `cp -r`.
