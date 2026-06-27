# Installing Claude Code Skills

This repo contains reusable Claude Code skills under `historical_skills/` and guidance files under `claude_md_files/`. Use the instructions below to install them into Claude Code.

---

## Recommended starting point: Coding Agent Toolkit

The `historical_skills/coding-agent-toolkit/` folder is a curated set of skills for everyday coding work. Each skill is a single Markdown file with YAML frontmatter, ready to drop into Claude Code.

### Project-local install

```bash
# From the coding_skills repo root
SKILLS_SRC="historical_skills/coding-agent-toolkit/skills"
SKILLS_DST="/path/to/your/project/.claude/skills"

mkdir -p "$SKILLS_DST"
cp "$SKILLS_SRC"/*.md "$SKILLS_DST/"
```

Restart Claude Code in the project so the skill registry reloads.

### Global install

```bash
mkdir -p ~/.claude/skills
cp historical_skills/coding-agent-toolkit/skills/*.md ~/.claude/skills/
```

Restart Claude Code. The skills are available in every workspace.

### Symlink for development

If you are iterating on these skills, symlink them so edits are reflected immediately:

```bash
SKILLS_SRC="/absolute/path/to/coding_skills/historical_skills/coding-agent-toolkit/skills"
SKILLS_DST="/path/to/your/project/.claude/skills"

mkdir -p "$SKILLS_DST"
for f in "$SKILLS_SRC"/*.md; do
  ln -sfn "$f" "$SKILLS_DST/$(basename "$f")"
done
```

---

## Full historical_skills install

If you want the broader set of experimental or specialized skills, install them folder-by-folder:

```bash
SKILLS_SRC="historical_skills"
SKILLS_DST="/path/to/your/project/.claude/skills"

mkdir -p "$SKILLS_DST"
for skill in agentic-harness agent-cleanup agent-legibility ask-clarify-choose claude-api code-review coding-cautions conversation-recall context-handoff deep-research docker-china docs-gardening evaluator-tuning git-commit-history introspection language-selection library-analysis logging-rotation mechanical-enforcement naive-forking openapi-workflow plan-mode project-init reference-clone repo-as-ssot security-review setup-environment skill-extraction skill-selector sprint-contract testing-coverage tips-and-tricks verify-run; do
  cp -r "$SKILLS_SRC/$skill" "$SKILLS_DST/"
done
```

---

## Install guidance files

Guidance files are not invoked like skills; they are injected into context automatically when placed in the right location.

### Minimum recommended set

```bash
PROJ="/path/to/your/project"
cp claude_md_files/CLAUDE.md "$PROJ/CLAUDE.md"
cp claude_md_files/CODING_RULES.md "$PROJ/CODING_RULES.md"
cp claude_md_files/AGENTS.md.template "$PROJ/AGENTS.md"
```

Then fill in the template placeholders in `AGENTS.md`.

### Add language- or domain-specific guidance

```bash
PROJ="/path/to/your/project"
mkdir -p "$PROJ/claude_md_files/per-language" "$PROJ/claude_md_files/per-project-type"
cp claude_md_files/per-language/*.md "$PROJ/claude_md_files/per-language/"
cp claude_md_files/per-project-type/*.md "$PROJ/claude_md_files/per-project-type/"
```

Reference the copied guides from the root `CLAUDE.md` or `AGENTS.md` so future agents know where to look.

---

## Verify installation

After restarting Claude Code, verify the skills are loaded:

```text
/skills
```

Or invoke a specific skill:

```text
/setup-dev-env
/plan-mode
/verify-run
```

---

## Coding Agent Toolkit skill inventory

| Skill | Purpose |
|-------|---------|
| `/ask-clarify-choose` | Clarify ambiguous requirements and present researched choices. |
| `/project-planning` | Clarify tasks, reference code, suggest reference projects, and draft plans. |
| `/plan-mode` | Use Claude Code plan mode for non-trivial implementation tasks. |
| `/language-selection` | Choose a language/runtime for a new project or service. |
| `/skill-selector` | Suggest relevant skills and an orchestration plan for a task. |
| `/setup-dev-env` | Set up environments, Docker, mirrors, virtual envs, compile scripts, and run scripts. |
| `/docker-china` | Docker setup with China mirrors, Dockerfiles, compose files, and CI jobs. |
| `/code-with-caution` | Safe implementation: pin versions, handle secrets, use mirrors, avoid destructive changes. |
| `/analyze-before-use` | Analyze unknown code or libraries before using them. |
| `/reference-clone` | Find and clone reference open-source projects for imitation or customization. |
| `/api-and-docs` | Build OpenAPI-compatible servers and summarize APIs for LLMs. |
| `/openapi-workflow` | Detailed OpenAPI-first design, spec generation, and markdown conversion. |
| `/write-tests-and-verify` | Write tests, measure coverage, run lint, and leave verification scripts. |
| `/testing-coverage` | Write tests, run coverage, check code smell, and report quality metrics. |
| `/quality-review` | Review code for coverage, smell, rule adherence, and consistency. |
| `/verify-run` | Run the app and observe behavior to confirm a change works. |
| `/git-and-history` | Set up git safely, maintain `.gitignore`, and commit cleanly. |
| `/git-commit-history` | Initialize git, audit tracked files, exclude large files, and commit safely. |
| `/introspection-and-fork` | Summarize previous work, extract skills, and safely fork code. |
| `/naive-forking` | Copy current code to another folder for safe experimentation. |
| `/conversation-recall` | Summarize previous conversations and extract reusable skills and decisions. |
| `/skill-extraction` | Turn a coding session into reusable skills and documentation. |
| `/docs-and-tips` | Write docs and capture workflow/debug tricks in `.tips_and_tricks/`. |
| `/repo-knowledge-map` | Keep `AGENTS.md` short and `docs/` as the system of record. |
| `/agent-orchestration` | Design a multi-agent plan for pure agentic coding. |
| `/generator-evaluator-loop` | Separate generation from skeptical evaluation. |
| `/coding-skill-prototyping` | 5-phase pipeline: Plan → Prototype → Test → Convert → Finalize. |

---

## Claude MD file inventory

| File | Purpose |
|------|---------|
| `CLAUDE.md` | Universal agent behavior and session routine |
| `CODING_RULES.md` | Universal coding standards |
| `AGENTS.md.template` | Project-specific agent entry point template |
| `per-language/*.md` | Language-specific guides |
| `per-project-type/*.md` | Project-type-specific guides |
| `agentic_workflows/CODING_RULES.md` | Multi-agent coding rules |
| `agentic_workflows/META_PROMPT.md` | Meta prompt for suggesting skills and orchestration plans |

---

## Updating

To update after pulling a newer version of this repo, re-run the copy or symlink step for the skills and guidance files you use.

---

## Notes

- Do not include machine-only absolute paths inside skill files.
- Project-specific values (IPs, ports, secrets) should be asked for at runtime or read from environment variables.
- Keep `CLAUDE.md` project-specific if it exists; otherwise Claude Code will fall back to the universal copy.
- Customize `AGENTS.md` from the template for each project.
- Promote repeatedly violated rules into custom linters or structural tests.
