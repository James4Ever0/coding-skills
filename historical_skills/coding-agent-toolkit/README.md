# Coding Agent Toolkit

A reusable set of Claude Code skills distilled from coding best practices, harness engineering, and agentic workflow research.

## Skills

### Planning & scoping

| Skill | Purpose |
|-------|---------|
| `/ask-clarify-choose` | Ask the user to clarify ambiguous requirements and present researched choices. |
| `/project-planning` | Clarify tasks, reference code, suggest reference projects, and draft plans. |
| `/plan-mode` | Use Claude Code plan mode for non-trivial implementation tasks. |
| `/language-selection` | Choose a language/runtime for a new project or service. |
| `/skill-selector` | Suggest relevant skills and an orchestration plan for a task. |

### Implementation

| Skill | Purpose |
|-------|---------|
| `/setup-dev-env` | Set up environments, Docker, mirrors, virtual envs, compile scripts, and run scripts. |
| `/docker-china` | Docker setup with China mirrors, Dockerfiles, compose files, and CI jobs. |
| `/code-with-caution` | Safe implementation: pin versions, handle secrets, use mirrors, avoid destructive changes. |
| `/analyze-before-use` | Analyze unknown code or libraries before using them. |
| `/reference-clone` | Find and clone reference open-source projects for imitation or customization. |
| `/api-and-docs` | Build OpenAPI-compatible servers and summarize APIs for LLMs. |
| `/openapi-workflow` | Detailed OpenAPI-first design, spec generation, and markdown conversion. |

### Verification

| Skill | Purpose |
|-------|---------|
| `/write-tests-and-verify` | Write tests, measure coverage, run lint, and leave verification scripts. |
| `/testing-coverage` | Write tests, run coverage, check code smell, and report quality metrics. |
| `/quality-review` | Review code for coverage, smell, rule adherence, and consistency. |
| `/verify-run` | Run the app and observe behavior to confirm a change works. |

### History, memory & reuse

| Skill | Purpose |
|-------|---------|
| `/git-and-history` | Set up git safely, maintain `.gitignore`, and commit cleanly. |
| `/git-commit-history` | Initialize git, audit tracked files, exclude large files, and commit safely. |
| `/introspection-and-fork` | Summarize previous work, extract skills, and safely fork code. |
| `/naive-forking` | Copy current code to another folder for safe experimentation. |
| `/conversation-recall` | Summarize previous conversations and extract reusable skills and decisions. |
| `/skill-extraction` | Turn a coding session into reusable skills and documentation. |
| `/docs-and-tips` | Write docs and capture workflow/debug tricks in `.tips_and_tricks/`. |
| `/repo-knowledge-map` | Keep `AGENTS.md` short and `docs/` as the system of record. |

### Prototyping & creation

| Skill | Purpose |
|-------|---------|
| `/coding-skill-prototyping` | 5-phase pipeline: Plan → Prototype → Test → Convert → Finalize new skills. |

### Agentic workflows

| Skill | Purpose |
|-------|---------|
| `/agent-orchestration` | Design a multi-agent plan for pure agentic coding. |
| `/generator-evaluator-loop` | Separate generation from skeptical evaluation. |

## Install

See [INSTALL.md](./INSTALL.md).

## Design notes

- Each skill is a single Markdown file with YAML frontmatter.
- Skills are intentionally small and focused on one repeatable workflow.
- No machine-specific paths or secrets are included.
- The toolkit is meant to be customized: edit the Markdown bodies to match your team's conventions.

## Sources

- Coding best-practice checklist (`prompt.txt`)
- OpenAI harness engineering blog: agent-first development, repository as system of record, mechanical enforcement, golden cleanup
- Anthropic harness engineering blog: planner/generator/evaluator separation, sprint contracts, context resets
- Claude Code Harness reference structure
