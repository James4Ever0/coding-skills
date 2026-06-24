# Install Guide — Coding Agent Toolkit Skills

These skills are plain Markdown files with YAML frontmatter. You can install them in two ways.

## Option 1: Project-local install (recommended for a single repo)

1. Copy the `skills/*.md` files into your project's Claude Code skills folder:

   ```bash
   mkdir -p /path/to/your/project/.claude/skills
   cp skills/*.md /path/to/your/project/.claude/skills/
   ```

2. Restart Claude Code or run `/reload` if available.

3. Verify the skills are loaded with `/skills` or by typing `/setup-dev-env`.

## Option 2: Global install (available in every project)

1. Copy the skill files into your global Claude Code skills directory:

   ```bash
   mkdir -p ~/.claude/skills
   cp skills/*.md ~/.claude/skills/
   ```

2. Restart Claude Code.

3. The skills are now available in any workspace.

## File structure after install

```
.claude/skills/
├── ask-clarify-choose.md
├── project-planning.md
├── plan-mode.md
├── language-selection.md
├── skill-selector.md
├── setup-dev-env.md
├── docker-china.md
├── code-with-caution.md
├── analyze-before-use.md
├── reference-clone.md
├── api-and-docs.md
├── openapi-workflow.md
├── write-tests-and-verify.md
├── testing-coverage.md
├── quality-review.md
├── verify-run.md
├── git-and-history.md
├── git-commit-history.md
├── introspection-and-fork.md
├── naive-forking.md
├── conversation-recall.md
├── skill-extraction.md
├── docs-and-tips.md
├── repo-knowledge-map.md
├── agent-orchestration.md
└── generator-evaluator-loop.md
```

## How to invoke

- Type the skill name with a leading slash: `/setup-dev-env`
- Or describe the task naturally; Claude Code may load the matching skill automatically based on its `description`.

## Customizing

- Edit the Markdown body to match your team's conventions.
- Keep the `name:` field stable if other prompts reference it.
- Add or remove `allowed-tools:` entries if your runtime requires different tool permissions.

## Updating

When a new version of the toolkit is released, copy the updated `.md` files over the old ones and restart Claude Code.

## Companion guidance

Pair these skills with the guidance files in `claude_md_files/`:

- `CLAUDE.md` — universal agent behavior and session routine
- `CODING_RULES.md` — universal coding standards
- `AGENTS.md.template` — short agent entry-point map
- `per-language/*.md` — language-specific guides
- `per-project-type/*.md` — guidance for common project shapes
- `agentic_workflows/` — multi-agent coding rules and meta prompts

Copy the relevant guidance files into your project root or `docs/` so they are injected into context automatically.
