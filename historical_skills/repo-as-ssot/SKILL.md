---
name: repo-as-ssot
description: "Maintain the repository as the system of record for specs, plans, decisions, and agent guidance. Trigger: 'system of record', 'docs first', 'repo knowledge'."
kind: workflow
user-invocable: true
---

# Repository as System of Record

Keep every decision, spec, plan, and piece of agent guidance in versioned repo artifacts so future agents can reason from the codebase alone.

## Workflow

1. **Map**: keep `AGENTS.md` short (under 150 lines) as a table of contents.
2. **Spec**: store the product contract in `spec.md` or `docs/spec/00-project-spec.md`.
3. **Plan**: store task ledgers in `Plans.md` or `docs/plans/`.
4. **Decisions**: record non-obvious choices in `docs/decisions/`.
5. **Tips**: capture workflows and debug notes in `.tips_and_tricks/`.
6. **Verify**: run mechanical checks (cross-links, stale-doc scans, structural tests) periodically.
7. **Garden**: schedule periodic cleanup agents to open fix-up PRs for stale docs.

## Output Artifacts

- `AGENTS.md`
- `spec.md` / `docs/spec/`
- `Plans.md` / `docs/plans/`
- `docs/decisions/`
- `.tips_and_tricks/`

## Rules

- If a fact is only in chat or a human's head, it effectively does not exist.
- Progressive disclosure: start small, link deeper.
- Custom linters and CI jobs are the enforcement mechanism.
- Do not let `AGENTS.md` grow into a monolithic manual; move detail to `docs/`.
