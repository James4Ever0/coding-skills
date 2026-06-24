# Installing and Using These Skills

This folder contains reusable Claude Code skills and coding guides.

## What is a skill?

A skill is a reusable prompt + workflow stored in a folder with a `SKILL.md` file. It teaches Claude Code how to perform a repeatable task consistently.

## Folder layout

```
coding_skills/
├── historical_skills/     # Reusable skill definitions
│   ├── setup-environment/
│   │   └── SKILL.md
│   ├── docker-china/
│   │   └── SKILL.md
│   └── ...
├── claude_md_files/       # Guides and templates
│   ├── CLAUDE.md
│   ├── CODING_RULES.md
│   ├── AGENTS.md.template
│   └── per-language/
└── SKILL_INSTALL.md       # This file
```

## Quick install (project-scoped)

Copy all skills and guides into a project:

```bash
PROJECT=/path/to/your/project
SKILLS_SRC=/path/to/coding_skills

# Skills
mkdir -p "$PROJECT/.claude/skills"
for skill in agentic-harness agent-cleanup agent-legibility ask-clarify-choose coding-cautions conversation-recall context-handoff docker-china docs-gardening evaluator-tuning git-commit-history mechanical-enforcement naive-forking openapi-workflow repo-as-ssot setup-environment skill-selector sprint-contract testing-coverage tips-and-tricks; do
  cp -r "$SKILLS_SRC/historical_skills/$skill" "$PROJECT/.claude/skills/"
done

# Guides
cp "$SKILLS_SRC/claude_md_files/CLAUDE.md" "$PROJECT/CLAUDE.md"
cp "$SKILLS_SRC/claude_md_files/CODING_RULES.md" "$PROJECT/CODING_RULES.md"
cp "$SKILLS_SRC/claude_md_files/AGENTS.md.template" "$PROJECT/AGENTS.md"
mkdir -p "$PROJECT/claude_md_files/per-language" "$PROJECT/claude_md_files/per-project-type"
cp "$SKILLS_SRC/claude_md_files/per-language/"*.md "$PROJECT/claude_md_files/per-language/"
cp "$SKILLS_SRC/claude_md_files/per-project-type/"*.md "$PROJECT/claude_md_files/per-project-type/"
```

Restart Claude Code in the project to load the skills.

## Quick install (global user skills)

```bash
mkdir -p ~/.claude/skills
for skill in agentic-harness agent-cleanup agent-legibility ask-clarify-choose coding-cautions conversation-recall context-handoff docker-china docs-gardening evaluator-tuning git-commit-history mechanical-enforcement naive-forking openapi-workflow repo-as-ssot setup-environment skill-selector sprint-contract testing-coverage tips-and-tricks; do
  cp -r "/path/to/coding_skills/historical_skills/$skill" ~/.claude/skills/
done
```

## Installing a single skill

```bash
mkdir -p /path/to/your/project/.claude/skills
cp -r /path/to/coding_skills/historical_skills/setup-environment \
      /path/to/your/project/.claude/skills/
```

Invoke it with `/setup-environment` or by describing the task.

## Installing the universal guides

1. Copy `CLAUDE.md` and `CODING_RULES.md` into your project root.
2. Customize the placeholders in `CLAUDE.md` for your project.
3. Copy `AGENTS.md.template` to `AGENTS.md`, fill in the project details, and keep it short.
4. Copy relevant per-language guides from `claude_md_files/per-language/` into `docs/` or your project root.

## How to add a new skill

1. Create a new folder under `historical_skills/`.
2. Write `SKILL.md` with frontmatter:

   ```markdown
   ---
   name: my-skill
   description: "Short description of what this skill does."
   kind: workflow
   user-invocable: true
   ---
   ```

3. Document the workflow, output artifacts, and rules.
4. Keep it under 300 lines when possible.

## Available skills

| Skill | Purpose |
|-------|---------|
| `agentic-harness` | Multi-agent planner/generator/evaluator harness design |
| `agent-cleanup` | Periodic garbage-collection and refactoring passes |
| `agent-legibility` | Make logs/metrics/UI/traces inspectable by agents |
| `ask-clarify-choose` | Ask clarifying questions and present researched choices |
| `coding-cautions` | Apply defensive coding defaults |
| `conversation-recall` | Summarize past conversations and extract skills |
| `context-handoff` | Clean-slate handoff artifacts for long sessions |
| `docker-china` | Docker setup with China mirrors and CI job templates |
| `docs-gardening` | Scan for stale docs and open fix-up PRs |
| `evaluator-tuning` | Tune a skeptical evaluator agent |
| `git-commit-history` | Initialize git, write `.gitignore`, exclude large files, commit |
| `language-selection` | Choose a language/stack for a task |
| `library-analysis` | Analyze unknown libraries before use |
| `mechanical-enforcement` | Enforce rules via custom linters and structural tests |
| `naive-forking` | Safely copy code to a new folder |
| `openapi-workflow` | Build OpenAPI-compatible servers and summarize specs |
| `repo-as-ssot` | Maintain repository as the system of record |
| `setup-environment` | Install runtimes, mirrors, virtual envs, and launch scripts |
| `skill-selector` | Suggest skills and orchestration for a task |
| `sprint-contract` | Negotiate testable done criteria before coding |
| `testing-coverage` | Write tests, run coverage, check code smell |
| `tips-and-tricks` | Capture project workflows in `.tips_and_tricks/` |

## Notes

- These skills avoid machine-specific absolute paths. Replace placeholder paths with paths valid on your machine.
- Keep skills focused; one skill per workflow.
- Update skills as tools and best practices evolve.
- For symlink-based development, see `INSTALL.md`.
