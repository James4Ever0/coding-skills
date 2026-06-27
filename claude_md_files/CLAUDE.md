---
_harness_template: "CLAUDE.md"
_harness_version: "1.2.0"
---

# CLAUDE.md — Universal Coding Agent Instructions

> **Scope**: default behavior for Claude Code on any project unless a project-specific `CLAUDE.md` overrides these rules.
> **Purpose**: reduce repetitive mistakes, keep code maintainable, and make agent sessions predictable.

---

## 1. Read This First

Before starting work, read:

1. `CLAUDE.md` (this file or the project-specific one)
2. `AGENTS.md` if it exists
3. `Plans.md` or `docs/plans/` if they exist
4. `.tips_and_tricks/` notes if they exist
5. `CODING_RULES.md` and the relevant per-language guide in `claude_md_files/per-language/`

These files are the system of record for how this codebase should be worked on.

---

## 2. Core Defaults

### 2.1 Keep `AGENTS.md` a map, not an encyclopedia

- `AGENTS.md` should stay under 150 lines and act as a table of contents.
- Put detailed guidance in `docs/` and per-language guides.
- Link related documents so agents navigate rather than memorize.
- A stale, bloated `AGENTS.md` is worse than no `AGENTS.md`.

### 2.2 Prefer legible, boring technology

- Use well-known libraries with stable APIs and strong training-data representation.
- When an upstream library behaves opaquely, prefer a small in-repo implementation with tests.
- Avoid bleeding-edge features unless the user explicitly asks for them.

### 2.3 Progressive disclosure

- Keep `CLAUDE.md` short and map-like; put deep guidance in `docs/` or per-language guides.
- Link related documents so agents can navigate rather than memorize.

### 2.4 Repository as system of record

- Decisions, specs, plans, and known issues should live in versioned markdown in the repo.
- Anything only in chat, docs outside the repo, or a person's head is effectively invisible to future agents.
- Push team Slack discussions and ad-hoc decisions into discoverable repo artifacts.

### 2.5 Boundaries, not micromanagement

- Enforce architecture and taste through linters, structural tests, and clear conventions.
- Within those boundaries, allow freedom of implementation.
- Custom linters are preferable to repeated human review comments.

### 2.6 Agent-first legibility

- Organize the repo so a new agent can reason about the business domain from the code and docs alone.
- Make logs, metrics, UI snapshots, and traces accessible to agents when possible.
- Favor dependencies that can be fully reasoned about in-repo; vendor or reimplement opaque upstream behavior when cheaper.

### 2.7 Mechanical enforcement

- Encode architecture, taste, and recurring review feedback into custom linters, structural tests, or CI checks.
- Lint error messages must be actionable: include file path, expected vs actual, and remediation steps.
- Enforce boundaries centrally; allow freedom of implementation within them.

### 2.8 Golden principles and cleanup

- Capture recurring patterns and taste invariants as "golden principles" in `CODING_RULES.md` or custom lints.
- Run periodic cleanup passes to extract shared utilities, delete dead code, and fix stale docs.
- Human taste should become tooling or documentation, not one-off comments.

---

## 3. Session Routine

### At session start

1. `git status -sb` — understand current state.
2. Read `Plans.md` or active plan if present.
3. Read `AGENTS.md` if present.
4. Check `.tips_and_tricks/` for relevant notes.

### Before implementation

1. Confirm scope and acceptance criteria.
2. Identify affected files and estimate risk.
3. For non-trivial changes, write or update a plan in `.claude/plans/` or `docs/plans/`.
4. For ambiguous or multi-step tasks, use planning mode and get user approval.
5. Check `.claude/memory/` for relevant past decisions or constraints.

### After implementation

1. Write/update tests.
2. Run tests and lint.
3. Run at least one end-to-end smoke test or verification command.
4. Update relevant docs (`README.md`, `Plans.md`, `.tips_and_tricks/`).
5. Summarize changes for the user.

---

## 4. Communication Rules

- **Ask for missing values**: local IPs, ports, secrets, API keys, environment names.
- **Reference code locations**: cite files and line numbers when discussing changes.
- **Offer choices**: when multiple valid approaches exist, list trade-offs and recommend one.
- **Log proof of work**: for external or complex steps, capture output and tell the user how to verify.

---

## 5. Safety Rules

1. **Do not delete files** without explicit permission.
2. **Copy before overwriting** when unsure.
3. **Never commit secrets**, `.env`, or local-only configuration.
4. **Activate virtual environments** before installing or running code.
5. **Pin versions** for runtimes, libraries, Docker images, and CI actions.
6. **Use China mirrors** when the user is in mainland China or network latency matters.
7. **Write tests** for new behavior and leave test scripts.
8. **Write launch scripts** so the user can run artifacts manually.
9. **Prefer explicit file lists** over blind `cp -r` or `rm -rf`.
10. **Ask the user to manually verify** complex external processes and collect logs.

---

## 6. Special Folders

| Folder | Purpose |
|--------|---------|
| `docs/` | Architecture, specs, decisions, API docs |
| `docs/spec/` | Product and technical specifications |
| `docs/plans/` | Execution plans and task ledgers |
| `docs/decisions/` | Architecture decision records |
| `.tips_and_tricks/` | Project-specific workflows and debug notes |
| `.claude/memory/` | Persistent, project-scoped memory facts |
| `.claude/plans/` | Active execution plans for the current session |
| `scripts/` | Install, build, test, and launch scripts |
| `spikes/` | Time-boxed experiments and verification code |
| `logs/` | Rotating log output (never commit) |
| `prototyping/` | Skill prototyping template workspace (start with `PROTOTYPING_HOWTO.md`, see `claude_md_files/prototyping/`) |

---

## 7. Memory and Context Handoffs

- Use `.claude/memory/` for durable facts that should survive across sessions (decisions, preferences, recurring gotchas).
- Keep each memory file focused on one fact; link related memories.
- For long-running tasks, use context resets with a structured handoff artifact rather than relying on compaction alone.
- When a session ends mid-task, leave a concise continuation note in `.claude/plans/` or `.claude/memory/`.

---

## 8. Skill Suggestion and Orchestration

When a task is complex or the user asks for an agentic workflow:

1. **Suggest relevant skills** from the installed skill library:
   - `/project-planning` for ambiguous or multi-file tasks.
   - `/setup-dev-env` for environment or Docker work.
   - `/write-tests-and-verify` or `/quality-review` for verification-heavy work.
   - `/agent-orchestration` or `/generator-evaluator-loop` for multi-agent builds.
   - `/reference-clone` when entering an unfamiliar domain.
   - `/docker-china` when containerizing in mainland China.

2. **Propose an orchestration plan** before starting:
   - Define roles (Planner, Generator, Evaluator, Orchestrator).
   - Draft a sprint contract with done criteria and verification steps.
   - Mark human decision points.
   - Keep the plan in `docs/plans/` or `.claude/plans/`.

3. **Prefer skills over ad-hoc prompts** for repeatable workflows.

---

## 9. Agentic Workflows

When asked to run an agentic workflow or when a task spans multiple sessions:

1. **Planner**: expand the user prompt into a spec and task ledger.
2. **Generator**: implement one feature at a time with git checkpoints.
3. **Evaluator**: verify against the sprint contract using tests, Playwright, or domain checks.
4. **Sprint contract**: agree on done criteria before coding.
5. **Context resets**: use clean-slate handoffs for very long runs; use compaction for shorter runs.
6. **Progressive disclosure**: keep `AGENTS.md` short; detailed knowledge lives under `docs/`.

---

## 10. Step-by-Step Implementation Discipline

- Core functions and critical paths come first; polish follows.
- Write or update the plan before coding for any non-trivial change.
- Update `Plans.md` or `.claude/plans/` as status changes.
- Record decisions, risks, and unknowns in versioned markdown.
- Capture non-obvious workflows and debug tricks in `.tips_and_tricks/`.

---

## 11. Commit Convention

```text
feat: add a new feature
fix: fix a bug
docs: update documentation
refactor: refactor code
test: add or update tests
chore: maintenance work
```

- Use concise, descriptive messages.
- Reference issue numbers when applicable.

---

## 12. Escalation

Escalate to the user when:

- A decision changes product behavior or public API.
- Scope is unclear or contradictory.
- CI fails after 3 fix attempts.
- A change requires secrets, permissions, or production access.
- You're unsure whether a file is safe to delete or overwrite.

---

## 13. Skill Extraction and Reuse

After a non-trivial coding session:

1. Review the steps that were repeatable.
2. Convert them into short skill prompts with YAML frontmatter.
3. Store them in `.claude/skills/` or a shared skills folder.
4. Link related skills in `.tips_and_tricks/` or `docs/`.

When moving an implementation to a new location, ask for the destination folder, copy files by name, and preserve the original until the new version is verified.

---

*Use this file together with `AGENTS.md`, `CODING_RULES.md`, and per-language guides in `claude_md_files/per-language/`.*
