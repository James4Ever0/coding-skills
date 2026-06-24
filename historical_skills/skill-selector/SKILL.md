---
name: skill-selector
description: "Suggest relevant skills and an agent orchestration plan for a pure agentic coding task. Trigger: 'what skills', 'agent plan', 'orchestrate coding'."
kind: workflow
user-invocable: true
---

# Skill Selector & Orchestration Plan

For a given task, identify useful skills and propose an agent orchestration plan.

## Workflow

1. **Understand the task**: language/stack, scope, risk, unknowns.
2. **List relevant skills** from the available catalog (e.g. `setup-environment`, `coding-cautions`, `plan-mode`, `agentic-harness`, `context-handoff`, `sprint-contract`, `openapi-workflow`, `testing-coverage`, `verify-run`, `code-review`, `security-review`, `docker-china`, `repo-as-ssot`, `docs-gardening`, `project-init`, `deep-research`, `claude-api`).
3. **Propose orchestration**:
   - **Planner** agent: spec + task ledger
   - **Generator** agent(s): implement per sprint or feature
   - **Evaluator** agent: QA/review against contract
4. **Recommend order**: read CLAUDE.md/AGENTS.md → plan → setup → implement → test → review → docs.
5. **Output**: markdown plan with skill triggers, agent roles, and acceptance checkpoints.

## Output Artifacts

- Skill shortlist with trigger phrases
- Orchestration plan (markdown)
- Suggested sprint contracts or task ledger entries

## Rules

- Prefer a small number of focused skills over a long checklist.
- Match evaluator depth to task risk.
- Mention context-reset strategy for long tasks.
- Keep the plan actionable; do not over-orchestrate trivial work.
