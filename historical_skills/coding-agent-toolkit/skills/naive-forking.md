---
name: naive-forking
description: Copy current code to another folder for safe experimentation or a new implementation without breaking the original.
user-invocable: true
allowed-tools:
  - Bash
  - Read
  - Write
---

# naive-forking

Create a safe copy of the current codebase so you can experiment without breaking the original.

## When to use

- The user asks to fork code, copy to a new folder, or create a naive fork.
- You need a sandbox for a risky refactor or experimental implementation.
- The user wants to maintain the original while building a v2.

## Procedure

1. **Ask the user for the target folder name** or propose one based on the task (e.g. `experiment-tts`, `v2-refactor`).

2. **List files to copy** using `fd` or `find`, excluding ignored/generated files.

3. **Copy files explicitly** by name, or pipe a filtered file list to `xargs`:
   ```bash
   fd --type f > /tmp/filelist.txt
   cat /tmp/filelist.txt | xargs -I{} cp --parents {} /path/to/target/{}
   ```

4. **Initialize git in the target folder** if it will become the new working project.

5. **Copy relevant config**:
   - `.gitignore`
   - Environment templates
   - Scripts

6. **Do not copy**:
   - Secrets
   - Local env files
   - Build artifacts
   - Logs
   - Dependency caches

7. **Report** the copied file count and any skipped items.

## Output

- New folder with a clean copy of source/config files
- `.gitignore` in the new folder
- `README.md` or `NOTES.md` describing why the fork exists

## Rules

- Never delete the original folder.
- Never copy `.env`, `.claude/settings.local.json`, or other local-only files.
- Use explicit file lists or invert filters with `grep -v`; avoid blind `cp -r` of the whole directory.
- Ask the user before copying large binary assets.
- Preserve relative paths; do not hard-code absolute paths from the source machine.

## When forking for a refactor

- Extract reusable code into importable, callable modules; keep the main script thin (delegate, don't inline).
- Move code via file copy; avoid re-dumping large blocks that already exist as files.
- Leave a file-structure overview in the new folder (`AGENTS.md`/`NOTES.md`) for navigation.
