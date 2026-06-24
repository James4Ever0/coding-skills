---
name: write-tests-and-verify
description: Write tests, measure coverage, run verification, and leave reusable test and launch scripts.
user-invocable: true
allowed-tools:
  - Bash
  - Read
  - Write
  - Edit
---

# write-tests-and-verify

Testing is not optional. Every implementation must ship with proof that it works.

## Procedure

1. **Choose the test framework**
   - Python: `pytest` with `pytest-cov`
   - Node/TS: `jest`, `vitest`, or `playwright` for UI
   - Go: `go test`
   - Rust: `cargo test`
   - Java: Maven/Gradle test tasks

2. **Write tests alongside code**
   - Unit tests for pure functions and utilities.
   - Integration tests for API routes, DB layers, and external calls (use mocks/fakes).
   - End-to-end tests for critical user journeys when feasible.

3. **Measure coverage**
   - Aim for the project's chosen threshold (default: ≥ 70% for new code).
   - Add coverage configuration (`.coveragerc`, `jest.config.js`, etc.).
   - Generate and inspect the coverage report.

4. **Leave reusable scripts**
   - `scripts/test.sh` — run the full suite.
   - `scripts/test-coverage.sh` — run with coverage.
   - `scripts/lint.sh` — run linters and formatters.
   - `scripts/test-manual.sh` — quick manual smoke test.

5. **Check code smell and consistency**
   - Run linters (ruff, eslint, golangci-lint, clippy, etc.).
   - Look for duplicated code, oversized functions, and obvious anti-patterns.

6. **Gate completion**
   - A task is not complete while tests or lint are failing.
   - If you cannot make tests pass after three reasonable attempts, escalate with logs.

## Output

- Tests in the project's conventional location.
- `scripts/test.sh`, `scripts/test-coverage.sh`, `scripts/lint.sh`.
- A short report of coverage, lint status, and any known gaps.

## Caution

- Do not game tests by changing assertions to match broken behavior.
- Keep tests deterministic; mock time, randomness, and external network calls.
