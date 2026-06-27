# Claude MD Files Index

This directory contains language- and domain-specific guidance for Claude Code.

## Existing files

This directory also contains:

- `CLAUDE.md` — the main universal instructions (use this as the project root `CLAUDE.md`).
- `CODING_RULES.md` — universal coding standards.
- `AGENTS.md.template` — a short template for the agent entry-point map.
- `per-language/*.md` — language-specific guides (Python, TypeScript, Go, Rust, Java, Bash, etc.).
- `per-project-type/*.md` — guidance for common project shapes.

The new subfolders below supplement these with deeper, domain-specific rules:

| Path | Purpose |
|------|---------|
| `universal/CLAUDE.md` | Concise universal rules (alternative starting point). |
| `agentic_workflows/CODING_RULES.md` | Multi-agent coding, sprint contracts, evaluator separation. |
| `python/CODING_RULES.md` | Python-specific environment, style, testing, and structure. |
| `web/CODING_RULES.md` | JavaScript / TypeScript / frontend rules. |
| `docker_and_devops/CODING_RULES.md` | Docker, compose, CI/CD, remote jobs. |
| `api_and_docs/CODING_RULES.md` | OpenAPI-first APIs and LLM-friendly docs. |
| `prototyping/CODING_RULES.md` | Prototyping-specific coding rules (template-based, language-agnostic). |
| `prototyping/WORKFLOW.md` | Prototyping 5-phase workflow (plan, prototype, test, convert, finalize). |
| `prototyping/MEMORY_SETUP.md` | Memory file conventions for prototyping sessions. |

## How to use

1. Start with the root `CLAUDE.md` and `CODING_RULES.md`.
2. Add the relevant per-language guide for your stack.
3. Copy any domain-specific `CODING_RULES.md` (agentic, docker, api) into `docs/` or append to the project `CLAUDE.md`.
4. Use `AGENTS.md.template` as the starting point for your project `AGENTS.md`.
5. Install the companion skills from `historical_skills/coding-agent-toolkit/` for reusable workflows.

## Companion skills

Reusable Claude Code skills that align with these guidance files are available in `historical_skills/coding-agent-toolkit/`. See its `README.md` and `INSTALL.md` for the skill list and installation steps.

## Keeping guidance current

- Update these files when conventions change.
- Promote rules that are repeatedly violated into linters, tests, or skills.
- Cross-link related guidance rather than duplicating it.
