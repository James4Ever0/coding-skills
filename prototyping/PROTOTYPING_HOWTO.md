# PROTOTYPING_HOWTO — How to Use This Workspace

## What `prototyping/` Is

`prototyping/` is a **template/reference workspace** — it demonstrates a structure pattern for skill prototyping. It is NOT intended to be modified in-place for every new project.

When starting a new prototyping session, the agent should:

1. **Read** this folder for structure patterns and conventions.
2. **Replicate** the relevant structure in the target workspace (or adapt it).
3. **Write** key entries into the target project's `CLAUDE.md`, milestone files, and reference docs.
4. **Ask** for missing information before assuming.

---

## Session Start Checklist

Before writing any code, the agent MUST ask the user for anything not provided:

| Info Needed | Why | If Missing |
|-------------|-----|------------|
| Reference URLs | Existing projects to imitate or learn from | Ask user to provide links, or search the web |
| Reference files / existing code | Code to reference, extend, or integrate with | Ask user for file paths or repos |
| Coding requirements | What the prototype should do | Ask for requirements, acceptance criteria |
| TODOs / task list | What to build step by step | Ask for task breakdown |
| Target directory path | Where to set up the new workspace | Ask where to create files |
| Language preference | What language(s) to prototype in | Ask for preferred language(s) |
| Target project structure | Whether to match an existing layout | Ask if there's an existing project structure to follow |

**Never assume.** Always ask when any of these are missing.

---

## How the Agent Uses `prototyping/`

### 1. Reference, don't copy blindly

```
prototyping/                       # ← Read this for patterns
├── python/                        #   Pattern: one dir per language
├── bash/
├── golang/
├── rust/
├── docs/
│   ├── milestone-schema.md        #   Pattern: milestone format
│   └── references/                #   Pattern: topic-based refs
└── milestones/                    #   Pattern: per-milestone trackers
```

The agent reads these to understand the pattern, then adapts for the target project. The target may use:
- Different directory layout
- Different languages
- Different milestone format
- Different file organization

### 2. Write to target CLAUDE.md and path-mapped files

When setting up a new workspace, the agent should **write key entries** to:

- `CLAUDE.md` in the target project — add prototyping section pointers
- Milestone files in the target project
- Reference files in the target project
- Any other path-mapped markdown files the target project uses

Example CLAUDE.md prototyping section for a target project:

```markdown
## Prototyping

This project uses the prototyping pipeline from `coding-skills/prototyping/`.
Active milestone: `milestones/milestone-XXX.md`
Reference patterns: `docs/references/<topic>.md`
```

### 3. Organize and rearrange

The agent has freedom to:
- Reorganize the directory structure to fit the project
- Create new topic-based reference files
- Merge or split milestone files as needed
- Adapt the 5-phase workflow to the project's needs

---

## The 5-Phase Workflow (Adaptable)

| Phase | Purpose | Key Action |
|-------|---------|------------|
| Plan | Gather requirements, ask questions, set up structure | Ask user for missing info |
| Prototype | Build the implementation | Write code iteratively |
| Test | Verify with standalone tests | Run test entry point |
| Convert | Optional language translation | Scaffold + translate |
| Finalize | Extract into deliverables | Write skill files, update docs |

Each phase is a guideline, not a rule. Adapt as needed.

---

## Core Principles (Immutable)

These principles apply regardless of how the structure is adapted:

1. **Ask before building** — never assume requirements, reference URLs, or target paths.
2. **Standalone tests** — no framework coupling. Stdlib tests only.
3. **Topic-based references** — organize by domain, not by language.
4. **Language-agnostic** — prototype in any language, convert optionally.
5. **Dynamic content in separate files** — per-milestone files, references, notes change frequently. Keep `CLAUDE.md` stable with only static pointers.

---

## Reference Files Organization

Reference files are organized by **topic/domain**, not by language:

```
docs/references/
├── README.md            # Index of all reference files
├── cli-parsing.md       # CLI argument parsing across all languages
├── file-io.md           # File I/O across all languages
├── testing.md           # Testing patterns across all languages
└── <topic>.md           # Add new topics as needed
```

Each file has language-specific sections within it, so patterns are easy to compare across languages.

---

## File Pointers Reference

| File in `prototyping/` | Purpose |
|------------------------|---------|
| `MILESTONE.md` | Main milestone tracker — status table, principles |
| `PROTOTYPING_HOWTO.md` | **This file** — how to use the workspace |
| `docs/milestone-schema.md` | Required format for milestone files |
| `docs/language-conversion-map.md` | Cross-language translation guidance |
| `docs/testing-strategy.md` | Testing conventions across languages |
| `docs/references/` | Topic-organized reference files |
| `scripts/scaffold-prototype.sh` | Initialize a new prototype skeleton |
| `scripts/run-tests.sh` | Unified test runner |
| `claude_md_files/prototyping/WORKFLOW.md` | Detailed 5-phase workflow |
| `claude_md_files/prototyping/CODING_RULES.md` | Coding rules for prototyping |
| `claude_md_files/prototyping/MEMORY_SETUP.md` | Memory file conventions |
