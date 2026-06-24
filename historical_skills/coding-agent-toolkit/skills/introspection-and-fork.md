---
name: introspection-and-fork
description: Summarize previous work, extract reusable skills, and safely fork code into a new folder for experimental implementation.
user-invocable: true
allowed-tools:
  - Bash
  - Read
  - Write
  - Edit
  - Agent
---

# introspection-and-fork

Learn from the past before building the future.

## When to use

- The user asks to reuse a pattern from an earlier conversation or project.
- You need to experiment without destabilizing the current codebase.
- You want to extract reusable skills from completed work.

## Procedure

1. **Gather context**
   - Use `/recall`, conversation history, project files, and plan files.
   - Read the relevant source files and previous summaries.

2. **Summarize previous work**
   - What was built.
   - What worked and what did not.
   - Reusable patterns, helpers, or configurations.

3. **Extract skills**
   - Convert recurring steps into short skill prompts.
   - Store them in a shared skills folder or project `.claude/skills/`.

4. **Fork safely (naive forking)**
   - Ask the user for the new folder/repo name if not provided.
   - Copy the needed files by name; do not move them.
   - Use `find` + inverse filters or `fd` to build a file list, then copy with `xargs`.
   - Preserve `.git` history when possible: `git clone --bare` or `cp -r` the whole project.

5. **Plan and implement in the fork**
   - Write a fresh plan for the forked copy.
   - Make changes only inside the new folder.
   - Leave the original untouched until the user asks to merge.

## Output

- A summary of lessons learned.
- New or updated skill files.
- A forked directory with its own plan and implementation.

## Caution

- Never delete or overwrite the original without explicit permission.
- Avoid absolute paths in forked scripts and configs.
