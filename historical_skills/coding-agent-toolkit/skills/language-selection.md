---
name: language-selection
description: Help choose a programming language and runtime for a task based on ecosystem, performance, team skill, and deployment target.
user-invocable: true
allowed-tools:
  - Read
  - Bash
  - WebSearch
---

# language-selection

Recommend a language/runtime from the supported set: Java, JavaScript, TypeScript, Go, Rust, Python, Bash.

## When to use

- The user asks "which language", "choose stack", or "what tech stack".
- A new project or service is being started.
- The current stack is unclear or being reconsidered.

## Procedure

1. **Ask for constraints**:
   - Target platform (server, browser, embedded, CLI, mobile).
   - Performance and safety requirements.
   - Team familiarity and existing codebase.
   - Deployment target (container, serverless, bare metal).
   - Network location (China mirrors matter for some ecosystems).

2. **Read the current repo** if one exists.
   - Look at `package.json`, `go.mod`, `Cargo.toml`, `pyproject.toml`, `pom.xml`, etc.
   - Align the recommendation with the existing stack unless there is a strong reason to change.

3. **Score candidates** against the criteria.

   | Concern | Best candidates |
   |---------|-----------------|
   | Rapid prototyping / data / ML | Python |
   | Web backend / full-stack / large team | TypeScript / Go |
   | Frontend / browser | TypeScript / JavaScript |
   | Systems / performance / safety | Rust / Go |
   | Enterprise / Android / big-team | Java |
   | Glue scripts / CI / one-off automation | Bash / Python |

4. **Recommend one primary and one alternative** with trade-offs.
5. **Output a short rationale and next setup steps** (e.g. which skill to invoke next).

## Output

- A concise language/runtime recommendation.
- Rationale covering ecosystem, performance, team fit, and mirror availability.
- Suggested next skill: `/setup-dev-env`.

## Rules

- Do not force a language the user dislikes without a strong technical reason.
- Prefer boring, well-represented technologies for agent-generated code.
- Consider package-manager mirror availability in mainland China.
- Prefer static typing and strong tooling for long-lived codebases.
- Avoid platform lock-in unless the deployment target requires it.
