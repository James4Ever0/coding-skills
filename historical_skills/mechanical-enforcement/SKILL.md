---
name: mechanical-enforcement
description: "Enforce architecture, taste, and rules through custom linters and structural tests instead of repeated review comments. Trigger: 'lint rules', 'structural test', 'enforce architecture'."
kind: workflow
user-invocable: true
---

# Mechanical Enforcement

Encode team taste and architectural boundaries into tooling so agents apply them everywhere at once.

## Workflow

1. **Identify invariants**: boundary validation, file size limits, dependency direction, naming conventions, structured logging, platform reliability.
2. **Choose enforcement**: custom linter, static analysis script, structural test, or CI check.
3. **Write remediation messages**: lint errors should tell the agent exactly how to fix the issue.
4. **Add to CI**: fail the build on violations.
5. **Evolve**: when review comments repeat, promote the rule into code.

## Output Artifacts

- `scripts/lint.sh` or custom linter
- `tests/structural/` tests
- CI job configuration
- Updated `CODING_RULES.md` reference

## Rules

- Enforce boundaries centrally; allow autonomy locally.
- Custom lints are preferable to human-style nit comments.
- Error messages must be actionable for agents.
- Re-run linters after every rule change.
