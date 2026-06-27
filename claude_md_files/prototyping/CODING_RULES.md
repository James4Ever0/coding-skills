# Prototyping Coding Rules

## Philosophy

- **`prototyping/` is a template, not a workspace to use in-place** — read the patterns, then adapt and replicate in the target project. Do not modify `prototyping/` directly for new prototypes.
- **Language-agnostic** — prototype in any language. Python and Bash are defaults. C, Java, TypeScript, Go, Rust, and others can be added as needed.
- **Topic-based organization** — reference code is organized by **topic/domain**, not just by language.
- **No forced conversion** — prototypes can live in one language. Language conversion is optional, not required.
- **Ask before building** — never assume requirements, reference URLs, target paths, or language preferences. Always ask.
- **Maintain references** — reference files are living documents. Update them when you discover new patterns.

## Session Start: What to Ask

Before writing any code, ask the user for anything not provided:

| Info | Ask if missing |
|------|----------------|
| Reference URLs | "Do you have any reference projects or examples I should look at?" |
| Existing code | "Is there existing code I should reference or extend?" |
| Requirements | "What should the prototype do? What are the acceptance criteria?" |
| TODOs / task list | "What are the steps or tasks you want me to work through?" |
| Target directory | "Where should I create the new workspace / files?" |
| Language | "What language(s) should I use?" |
| Project structure | "Is there an existing project structure I should follow?" |

## General Rules

1. **Standalone tests** — No test framework coupling. Each language uses its own standard test library.
2. **No external dependencies** — Prototypes must work with only the standard library / built-in tools.
3. **Read `PROTOTYPING_HOWTO.md` first** — it explains how to use this workspace as a template.
4. **Add new languages freely** — Create `prototyping/<lang>/` for any new language. Copy the test pattern from an existing language.
5. **Scripts are structural** — Conversion scripts scaffold directories only. Semantic translation is agent-guided.
6. **Version everything** — Scripts, tests, milestone files, and reference files all live in the repo.

## Reference Organization

Reference files live in `prototyping/docs/references/` and are organized by **topic**, not language. Within each topic file, include language-specific sections for cross-language comparison.

## Using the Template for a New Project

When setting up a new prototype workspace:

1. **Read** `prototyping/PROTOTYPING_HOWTO.md` for the full usage guide.
2. **Replicate** the structure pattern in the target directory (adapt as needed).
3. **Write** key entries to the target `CLAUDE.md` and other path-mapped markdown files.
4. **Do NOT** modify `prototyping/` itself for the new project — it is the template/pattern store.

## Adding a New Language to the Template

1. Create `prototyping/<lang>/` and `prototyping/<lang>/tests/`.
2. Add a `run_all.sh` or equivalent entry point.
3. Update `prototyping/scripts/run-tests.sh` to include the new language.
4. Update `prototyping/docs/language-conversion-map.md` if relevant.
