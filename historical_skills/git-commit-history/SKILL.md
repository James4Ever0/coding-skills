---
name: git-commit-history
description: "Initialize git, write .gitignore, list tracked files with sizes, exclude large files, and commit safely. Trigger: 'git init', 'commit history', 'exclude large files', 'list files'."
kind: workflow
user-invocable: true
---

# Git Commit History

Keep a clean, portable project history without accidentally committing large/generated files.

## Workflow

1. **Initialize git** if `.git/` is missing (`git init`).
2. **Write `.gitignore`** for the language/stack and project artifacts (logs, build output, dependencies, OS files).
3. **Install `fd`** (optional but recommended): `https://github.com/sharkdp/fd` — a fast `.gitignore`-respecting file finder.
4. **List not-ignored files** in descending human-readable size order:
   ```bash
   fd --type f --exec ls -lh {} \; | awk '{ print $5, $NF }' | sort -rh
   ```
   Or a portable fallback script: `scripts/list-source-files.sh`.
5. **Review large files** (>~100 KB). Ask the user whether to exclude each or keep it.
6. **Commit** the approved files with a clear message.
7. **Leave history optional**: if the user prefers not to commit, document the file list and `.gitignore` state.

## Output Artifacts

- `.gitignore`
- `scripts/list-source-files.sh`
- Initial commit (if requested)

## Rules

- Never commit secrets, `.env`, or local-only configuration.
- Never delete files without explicit permission; exclude via `.gitignore` instead.
- Prefer `fd` if available; provide a fallback `find` command for portability.
- Commit messages follow `feat:`, `fix:`, `docs:`, `test:`, `chore:` prefixes.
- Use explicit file lists or `grep -v` filters when copying; avoid blind `cp -r`.
