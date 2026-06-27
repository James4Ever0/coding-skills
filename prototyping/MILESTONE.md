# Prototyping Milestone Tracker

## Principles

1. **Plan before prototype** — every prototype has a milestone file with acceptance criteria.
2. **Research before building** — search for existing demos and ask the user for examples.
3. **Test first where possible** — write the `run_all.py` or `run_all.sh` before the implementation.
4. **Language-agnostic** — prototype in any language. Conversion between languages is optional.
5. **Topic-based references** — save reference links by topic domain, not by language.
6. **Finalize or discard** — every prototype either becomes a skill or gets removed. No graveyard.
7. **Version everything** — milestone files, scripts, tests, references all live in the repo.

## Active Prototype

*None currently. Start a new one by creating a milestone file in `milestones/`.*

---

## Milestone Status

| # | Milestone | Status | Priority | Notes |
|---|-----------|--------|----------|-------|
| 001 | Scaffolding | Ready for review | High | Initial structure, guidance files |
| 002 | Python Logic | Done | High | Core logic + tests |
| 003 | Bash Tooling | Done | High | helpers.sh + tests |
| 004 | Go Conversion | Ready for review | Medium | Go target scaffolded |
| 005 | Rust Conversion | Ready for review | Medium | Rust target scaffolded |
| 006 | Test & Standalone | Ready for review | Medium | Unified runner, all tests verified |

Status legend: `Not Started` `In Progress` `Blocked` `Done` `Ready for review`

---

## Folder Tree

```
prototyping/
├── README.md
├── MILESTONE.md
├── milestones/              # Per-milestone files
├── scripts/                 # Helper scripts
├── docs/
│   ├── milestone-schema.md
│   ├── language-conversion-map.md
│   ├── testing-strategy.md
│   └── references/          # Topic-based reference files
│       ├── README.md
│       ├── cli-parsing.md
│       ├── file-io.md
│       └── testing.md
├── python/                  # Python prototypes
│   ├── __init__.py
│   ├── prototype_utils.py
│   ├── logic/
│   │   ├── __init__.py
│   │   └── core.py
│   └── tests/
├── bash/                    # Bash prototypes
│   ├── lib/
│   │   └── helpers.sh
│   └── tests/
├── golang/                  # Go conversion targets
│   ├── go.mod
│   ├── cmd/prototype/main.go
│   ├── internal/core.go
│   └── tests/
├── rust/                    # Rust conversion targets
│   ├── Cargo.toml
│   ├── src/
│   └── tests/
└── <lang>/                  # Add new languages freely
```

## Tips

- **Read PROTOTYPING_HOWTO.md first:** It explains how to use this folder as a template, what to ask the user, and how to set up a new project.
- **Reference first:** Before writing code, search the web for small demo projects in your target language. Ask the user if they have examples.
- **Ask before assuming:** Always ask the user for reference URLs, existing code, requirements, TODOs, target path, and language preference if not provided.
- **One language at a time:** Prototype in one language first, then optionally convert.
- **Keep references current:** Update `docs/references/` when you discover new patterns.
- **Do not modify prototyping/ in-place for new projects:** Replicate the pattern in the target workspace instead.
