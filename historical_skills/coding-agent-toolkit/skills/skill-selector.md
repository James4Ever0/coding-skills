---
name: skill-selector
description: Suggest relevant skills and an agent orchestration plan for a pure agentic coding task.
user-invocable: true
allowed-tools:
  - Read
  - Agent
---

# skill-selector

For a given task, identify useful skills and propose an agent orchestration plan.

## When to use

- The user asks "what skills should I use", "make an agent plan", or "orchestrate this".
- A task is complex enough that multi-agent coordination is worth considering.
- You want to map a user request onto the installed skill library.

## Procedure

1. **Understand the task**:
   - Language / stack
   - Scope and risk
   - Unknowns and dependencies

2. **List relevant skills** from the coding-agent-toolkit catalog:

   | Task type | Skills to consider |
   |-----------|-------------------|
   | New project / stack choice | `/language-selection`, `/project-planning`, `/setup-dev-env` |
   | Ambiguous requirements | `/ask-clarify-choose`, `/project-planning`, `/plan-mode` |
   | Environment / Docker | `/setup-dev-env`, `/docker-china` |
   | Implementation | `/code-with-caution`, `/analyze-before-use`, `/reference-clone` |
   | API backend | `/api-and-docs`, `/openapi-workflow` |
   | Testing | `/write-tests-and-verify`, `/testing-coverage`, `/verify-run` |
   | Review | `/quality-review`, `/code-review` |
   | Multi-agent build | `/agent-orchestration`, `/generator-evaluator-loop` |
   | History / memory | `/git-and-history`, `/conversation-recall`, `/skill-extraction` |
   | Fork / experiment | `/naive-forking`, `/introspection-and-fork` |

3. **Propose orchestration** if the task justifies it:
   - **Planner** agent: spec + task ledger
   - **Generator** agent(s): implement per sprint or feature
   - **Evaluator** agent: QA/review against contract

4. **Recommend order**:
   ```
   Read CLAUDE.md/AGENTS.md → plan → setup → implement → test → review → docs
   ```

5. **Output**: a markdown plan with skill triggers, agent roles, and acceptance checkpoints.

## Output

- Skill shortlist with trigger phrases
- Orchestration plan (markdown)
- Suggested sprint contracts or task ledger entries

## Rules

- Prefer a small number of focused skills over a long checklist.
- Match evaluator depth to task risk.
- Mention context-reset strategy for long tasks.
- Keep the plan actionable; do not over-orchestrate trivial work.
