# CODING_RULES.md — Universal Coding Standards

> **Purpose**: concrete rules that apply across languages and projects unless overridden by a project-specific guide.

---

## 1. Code Structure

- **One concern per file**: keep modules focused; prefer many small files over one giant file.
- **File size limit**: aim for <400 lines per file; if a file grows larger, refactor.
- **Architecture boundaries**: respect the project's layer/domain rules; dependencies should only flow in allowed directions.
- **Naming**: use clear, intention-revealing names. Avoid abbreviations unless domain-standard.
- **Imports**: group and order imports consistently (stdlib, third-party, local).
- **Single source of truth**: define schemas, constants, and config in one place and derive other uses from them.

## 2. Defensive Coding

- **Validate at boundaries**: parse and validate all external input (HTTP bodies, files, env vars, CLI args).
- **Fail fast**: throw or return errors early; don't swallow exceptions silently.
- **No magic values**: extract constants with descriptive names.
- **Avoid deep nesting**: use early returns, guard clauses, and helper functions.
- **Explicit over implicit**: prefer configuration files and typed schemas over hidden conventions.

## 3. Error Handling

- Every async operation or I/O call must handle failure.
- Log errors with context; include operation name, relevant IDs, and stack traces when appropriate.
- Never expose internal stack traces or secrets to end users.
- Error messages should be actionable: include file paths, expected vs actual, and remediation hints.

## 4. Logging

- Support a verbose mode (`--verbose`, `DEBUG=1`, `LOG_LEVEL=debug`).
- Write rotating logs to `logs/` or the system temp directory (`$TMPDIR`, `%TEMP%`).
- Use structured logging when a library is available.
- Include request/correlation IDs in server logs.
- When unsure about an interaction, log the process and tell the user how to collect evidence.

## 5. Testing

- Write tests for every new function or behavior change.
- Cover at least happy path and one failure path.
- Mock external services and slow I/O.
- Keep tests fast and deterministic.
- Run the full test suite before declaring work done.
- Check code coverage and aim to maintain or improve it.

## 6. Documentation

- Every public function/module gets a short docstring or comment.
- Every script gets a `--help` message.
- Every project gets a `README.md` with setup and run instructions.
- Complex decisions go into `docs/decisions/` or `docs/architecture/`.
- Summarize OpenAPI specs to `docs/api.md` for LLM interaction.

## 7. Versioning

- Pin language runtimes, dependency versions, Docker base images, and CI action versions.
- Record version constraints in manifest files (`package.json`, `requirements.txt`, `Cargo.toml`, etc.).
- Use lockfiles when the ecosystem supports them.
- Ask for local IP, router/public IP, and port range rather than hard-coding network values.

## 8. Security

- Never commit secrets.
- Validate and sanitize all input.
- Use parameterized queries; never concatenate SQL.
- Keep dependencies up to date; audit new dependencies.
- Run with least privilege.

## 9. Performance

- Avoid premature optimization; measure first.
- Keep I/O bounded; use streaming for large files.
- Cache repeated computations when profiling shows benefit.

## 10. Verification and Run Artifacts

- Every implementation must be runnable: provide a build script, a test command, and a manual launch script.
- After changes, run the full test suite and at least one end-to-end smoke test.
- For UI work, leave a script or command that launches the app so a human or agent can verify visually.
- For API work, leave example requests or an OpenAPI spec summary.
- Capture proof of work (logs, screenshots, curl output) for complex external steps.
- If a verification step cannot be automated, write explicit manual verification instructions.
- Prefer OpenAPI-compatible server libraries so frontend and LLM consumers can share a typed contract.

## 11. Step-by-Step Implementation

- Build core functions and critical paths first; auxiliary work follows.
- Write or update the plan before coding for any change spanning multiple files or sessions.
- Update plans and task lists as status changes.
- Record decisions, risks, and unknowns in `docs/decisions/` or the active plan.
- Capture non-obvious workflows and debug tricks in `.tips_and_tricks/`.

## 12. Agent-Friendly Practices

- Keep build/test commands in `scripts/` so any agent can run them.
- Keep architecture decisions in markdown, not chat.
- Use explicit configuration files over hidden conventions.
- Make error messages actionable for agents (remediation hints, file paths, expected vs actual).
- Enforce rules mechanically with custom linters and structural tests where possible.
- Use `AGENTS.md` as a map and put deep guidance in `docs/`.
- Write lint/test failures with remediation instructions an agent can follow.
- Prefer skills over ad-hoc prompts: encode repeatable workflows in `SKILL.md` files.

## 13. Golden Principles

Capture recurring fixes as invariant rules:

- Prefer shared utility packages over hand-rolled helpers.
- Validate data shapes at boundaries; don't probe data "YOLO-style."
- Keep `AGENTS.md` and `CLAUDE.md` current; move detail to `docs/`.
- Delete or archive stale docs and dead code during cleanup passes.
- Promote repeated review comments into custom lints or structural tests.
- Capture human taste as criteria, not one-off instructions.

## 14. China Mirrors and Environment Setup

When the user is in mainland China or network latency matters:

- **Python**: Tsinghua PyPI `https://pypi.tuna.tsinghua.edu.cn/simple`
- **Node/npm**: Taobao / `npmmirror` or Aliyun registry
- **Rust**: ustc / sjtu crates mirror
- **Go**: `https://goproxy.cn`
- **Java**: Maven Aliyun mirror
- **Docker**: Tsinghua or Aliyun registry mirror

Always use isolated environments (venv, nvm, conda, rustup toolchain) and activate them before install/compile/run.

## 15. Skill Extraction and Naive Forking

- After completing a repeatable workflow, extract it into a `SKILL.md` or `.claude/skills/*.md` file.
- Keep skills focused on one task; link related skills instead of duplicating.
- When forking code for an experimental implementation, ask for the destination folder, copy files by name, and do not delete the original.
- Verify the fork independently before proposing a merge.

## 16. Stable Plan-Act Loop

- Plan before implementing for any change spanning multiple files or sessions.
- Update plans and task lists as status changes.
- Record decisions, risks, and unknowns in versioned markdown.
- End long sessions with a continuation note if work is not finished.

## 17. Refactoring Discipline

When restructuring existing code, move it — don't rewrite it from memory:

- **Copy + rename first**: copy the script to its new home and rename it; keep the original until the new path is imported and verified (see §15 and the `/naive-forking` skill).
- **Move via file copy, don't re-dump**: refactor by relocating existing files, not by re-emitting large code blocks from scratch when an equivalent file already exists.
- **Extract callable units**: pull logic into importable functions/modules so other code can call it, instead of leaving it inline in one script.
- **Keep the entry point thin**: the main script should parse args, wire dependencies, and delegate to modules — minimal logic of its own.
- **Rearrange folders by concern**: group the extracted modules so one concern lives per file/directory (ties to §1).
- **Leave a structure overview**: after the refactor, write or refresh a short file-structure overview (in `AGENTS.md` or `docs/`) so future development and navigation are easy — `/repo-knowledge-map` can generate it.

---

*Language-specific rules live in `claude_md_files/per-language/`.*
