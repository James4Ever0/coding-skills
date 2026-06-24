---
name: naive-forking
description: "Copy current code to another folder for safe experimentation or new implementation. Trigger: 'fork code', 'copy to new folder', 'naive fork'."
kind: workflow
user-invocable: true
---

# Naive Forking

Create a safe copy of the current codebase so you can experiment without breaking the original.

## Workflow

1. **Ask the user for the target folder name** or propose one based on the task (e.g. `experiment-tts`, `v2-refactor`).
2. **List files to copy** using `fd` or `find`, excluding ignored/generated files.
3. **Copy files explicitly** by name, or pipe a filtered file list to `xargs`:
   ```bash
   fd --type f > /tmp/filelist.txt
   cat /tmp/filelist.txt | xargs -I{} cp --parents {} /path/to/target/{}
   ```
4. **Initialize git in the target folder** if it will become the new working project.
5. **Copy relevant config** (`.gitignore`, environment templates, scripts).
6. **Do not copy**: secrets, local env files, build artifacts, logs, or dependency caches.
7. **Report** the copied file count and any skipped items.

## Output Artifacts

- New folder with a clean copy of source/config files
- `.gitignore` in the new folder
- `README.md` or `NOTES.md` describing why the fork exists

## Rules

- Never delete the original folder.
- Never copy `.env`, `.claude/settings.local.json`, or other local-only files.
- Use explicit file lists or invert filters with `grep -v`; avoid blind `cp -r` of the whole directory.
- Ask the user before copying large binary assets.
