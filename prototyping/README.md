# Prototyping Workspace

A **template/pattern workspace** for planning, prototyping, testing, and finalizing new Claude Code skills. Read the patterns here, then adapt and replicate in your target project.

> **Important:** `prototyping/` is a reference folder, not a workspace to modify in-place. See `PROTOTYPING_HOWTO.md` for detailed usage instructions.

## Philosophy

- **Template-first** — read the patterns here, then apply them to your target project
- **Language-agnostic** — prototype in any language (Python, Bash, Go, Rust, C, Java, TypeScript, etc.)
- **Topic-based references** — reference code organized by domain topic, not just by language
- **Conversion is optional** — a prototype can live in one language forever
- **Ask before building** — never assume requirements, reference URLs, or target paths

## 5-Phase Workflow

| Phase | What | Key Action |
|-------|------|------------|
| **Plan** | Gather requirements, ask questions, write milestone | Ask user for missing info, search for references |
| **Prototype** | Implement in any language | Create structure in target project |
| **Test** | Write standalone tests using stdlib | Run `run_all.sh`/`run_all.py` |
| **Convert** | Optional language translation | Scaffold + agent-guided translation |
| **Finalize** | Extract into skill markdown, update docs | Write skill files, update references |

## Key Files

| File | Purpose |
|------|---------|
| `PROTOTYPING_HOWTO.md` | **Start here** — full guide on using this workspace as a template |
| `MILESTONE.md` | Milestone tracker and status |
| `docs/milestone-schema.md` | Required format for milestone files |
| `docs/language-conversion-map.md` | Translation guidance across languages |
| `docs/testing-strategy.md` | Testing conventions |
| `docs/references/` | Topic-organized reference files |
| `scripts/` | Helper scripts (scaffold, run tests, convert) |
