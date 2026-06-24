---
name: language-selection
description: "Help choose a programming language and runtime for a task based on ecosystem, performance, team skill, and deployment target. Trigger: 'which language', 'choose stack', 'tech stack'."
kind: workflow
user-invocable: true
---

# Language Selection

Recommend a language/runtime from: Java, JavaScript, TypeScript, Go, Rust, Python, Bash.

## Decision Matrix

| Concern | Best candidates |
|---------|-----------------|
| Rapid prototyping / data / ML | Python |
| Web backend / full-stack / large team | TypeScript / Go |
| Frontend / browser | TypeScript / JavaScript |
| Systems / performance / safety | Rust / Go |
| Enterprise / Android / big-team | Java |
| Glue scripts / CI / one-off automation | Bash / Python |

## Workflow

1. Ask the user for: target platform, performance needs, team familiarity, existing codebase, deployment constraints.
2. Score each candidate against the criteria.
3. Recommend **one primary** and **one alternative** with trade-offs.
4. If the user already has an existing repo, read key files (`package.json`, `go.mod`, etc.) and align with the current stack.
5. Output a short rationale and the next setup steps.

## Rules

- Do not force a language the user dislikes without a strong technical reason.
- Prefer boring, well-represented technologies for agent-generated code.
- Consider package-manager mirror availability in China.
- Prefer static typing and strong tooling for long-lived codebases.
- Avoid language-specific platform lock-in unless the deployment target requires it.
