---
name: project-planning
description: Clarify tasks, reference existing code, suggest reference projects, and produce a verifiable implementation plan.
user-invocable: true
allowed-tools:
  - Bash
  - Read
  - Agent
  - WebSearch
---

# project-planning

Start every non-trivial task with clarity, not code.

## When to use

- The request is vague or has multiple valid approaches.
- The change touches more than two or three files.
- The user asked for a new feature, refactor, or migration.

## Procedure

1. **Read the current state**
   - List relevant files.
   - Read the entry points and existing tests.
   - Check `CLAUDE.md`, `AGENTS.md`, `Plans.md`, and `.tips_and_tricks/` if they exist.

2. **Ask clarifying questions**
   - What is the acceptance criteria?
   - Are there constraints on dependencies, versions, or hosting?
   - What should not change?
   - Provide code references and a few concrete options when possible.

3. **Research references**
   - Search GitHub or documentation for well-known projects that solve a similar problem.
   - Suggest repos to clone or read for imitation, simplification, and customization.
   - Prefer stable, well-documented dependencies.

4. **Draft a plan**
   - Break the work into small, verifiable steps.
   - Each step should have a clear "done" signal (test passes, UI visible, API responds, etc.).
   - Identify risks and unknowns.

5. **Update project artifacts**
   - Write or update `Plans.md`, `spec.md`, or a task file.
   - Reference files by relative path, not absolute path.

6. **Get approval**
   - Present the plan and options to the user.
   - Wait for a decision before implementing large or risky changes.

## Output

- A written plan with acceptance criteria.
- A list of files likely to change.
- Reference project suggestions (URLs only, no local paths).

## Caution

- Do not start coding before the user confirms the plan unless explicitly told to proceed.
- Keep plans versioned; do not overwrite existing plans without noting the change.
