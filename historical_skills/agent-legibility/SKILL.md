---
name: agent-legibility
description: "Make logs, metrics, UI, and traces directly legible to agents for self-verify and debugging. Trigger: 'agent legible', 'observability', 'debug for agents'."
kind: workflow
user-invocable: true
---

# Agent Legibility

Increase leverage by making the application, logs, metrics, and UI directly inspectable by agents.

## Workflow

1. **Boot per worktree**: ensure the app can launch in an isolated worktree or environment.
2. **Expose logs**: structured logs with correlation IDs; allow agents to query by request/trace ID.
3. **Expose metrics**: PromQL/LogQL endpoints or local observability stack agents can query.
4. **Expose UI state**: DOM snapshots, screenshots, or accessibility trees for Playwright inspection.
5. **Expose traces**: OpenTelemetry or equivalent spans with clear operation names.
6. **Add agent tools**: skills or scripts that let agents ask "what happened during request X?"

## Output Artifacts

- Logging/metrics/tracing configuration
- Agent-facing query skills or scripts
- Local observability stack setup (optional)

## Rules

- Keep observability local and ephemeral by default; tear down with the worktree.
- Use stable, searchable identifiers (request IDs, trace IDs, correlation IDs).
- Error messages must be actionable for agents.
- Prefer structured logs over plain text.
