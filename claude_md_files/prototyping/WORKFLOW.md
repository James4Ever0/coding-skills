# Prototyping Workflow

## Entry

When asked to prototype a new skill:

1. Read `prototyping/PROTOTYPING_HOWTO.md` — understand how to use this workspace as a template.
2. Read `prototyping/MILESTONE.md` for current status.
3. Read `claude_md_files/prototyping/CODING_RULES.md` for coding constraints.
4. Read `claude_md_files/prototyping/MEMORY_SETUP.md` for memory conventions.

### Before starting, ask the user for missing info:

- Reference URLs or reference projects to imitate
- Existing code files or repos to integrate with
- Coding requirements and acceptance criteria
- TODOs or task breakdown
- Target directory path for the new workspace
- Language preference
- Target project structure (if matching an existing layout)

**Do not assume. Always ask.**

## Phase 1: Plan

1. Write a milestone file following `prototyping/docs/milestone-schema.md`.
2. Include:
   - Checklist of implementation steps.
   - Completion criteria (tests pass, scripts work, skill markdown ready).
   - Status section (Not Started / In Progress / Blocked / Done).
3. **Search for references** — search the web for small demo projects, reference implementations, or examples in your target language/topic. Ask the user if they have specific examples.
4. Save reference links in `docs/references/<topic>.md` (in the target workspace, not in `prototyping/`).
5. Write prototyping pointers into the target `CLAUDE.md`.

## Phase 2: Prototype

1. Implement in any language — create a new directory structure in the target workspace.
2. Adapt the `prototyping/` structure pattern to fit the project's needs (don't copy blindly).
3. Organize, rearrange, and write to path-mapped markdown files as needed.
4. Keep domain logic separate from I/O.

## Phase 3: Test

1. Write standalone tests using the language's standard test library.
2. Create a test runner entry point (`run_all.sh`, `run_all.py`, etc.).
3. Run tests to verify.

## Phase 4: Convert (optional)

1. Language conversion is **optional** — prototypes can stay in a single language.
2. If converting, use `prototyping/docs/language-conversion-map.md` for guidance.
3. Conversion is semantic (agent-guided), not automated.

## Phase 5: Finalize

1. Extract the proven prototype into a skill markdown file.
2. Create both atomic and toolkit versions.
3. Update milestone status and reference files.
4. Run final verification.
