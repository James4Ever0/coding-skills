---
name: analyze-before-use
description: Analyze unknown code or third-party libraries before using them; summarize key features and plan verification steps.
user-invocable: true
allowed-tools:
  - Bash
  - Read
  - Agent
  - WebFetch
  - WebSearch
---

# analyze-before-use

Do not import, copy, or modify code you do not understand. Analyze first, then act.

## When to use

- The user asks to use a library you have not worked with recently.
- You are entering a legacy codebase and need to know the rules.
- You are about to refactor a module with unclear dependencies.

## Procedure

1. **Identify the artifact**
   - File path, package name, version, commit hash, or URL.

2. **Read the surface**
   - Public API / exported functions.
   - README, examples, and type signatures.
   - For third-party code, read the source of the functions you will call.

3. **Summarize key areas**
   - What problem it solves.
   - Critical inputs/outputs and side effects.
   - Threading / async / lifecycle assumptions.
   - License and compatibility.

4. **Map to the user's goal**
   - Highlight which features map to the requested task.
   - Flag mismatches or risky assumptions.

5. **Plan verification**
   - Define how you will prove the integration works (tests, logs, screenshots, etc.).
   - List edge cases you will exercise.

6. **Proceed with caution**
   - Implement behind a small wrapper or adapter first.
   - Keep the original code untouched until the new path is verified.

## Output

- A short analysis note (can be appended to `.tips_and_tricks/` or a project doc).
- A verification plan.
- The actual integration, covered by tests.

## Caution

- Do not trust marketing copy; verify behavior with code or tests.
- If the source is unavailable or too large, ask the user for a smaller alternative.
