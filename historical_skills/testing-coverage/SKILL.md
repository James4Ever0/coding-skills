---
name: testing-coverage
description: "Write tests, run coverage, check code smell, enforce coding rules, and report modifiability/consistency. Trigger: 'write tests', 'coverage', 'code smell', 'quality check'."
kind: workflow
user-invocable: true
---

# Testing & Coverage

Make code verifiable and maintainable with tests, coverage, and lightweight quality gates.

## Workflow

1. **Identify test framework** from the project (pytest, jest, vitest, cargo test, go test, junit, etc.).
2. **Write tests** for new or changed functions:
   - Unit tests for pure logic
   - Integration tests for I/O and external dependencies
   - At least one happy-path and one failure-path case
3. **Leave test scripts**: `scripts/test.sh`, `scripts/test-watch.sh`.
4. **Run coverage** with the language's coverage tool and generate a human-readable report.
5. **Check code smell**: long functions, deep nesting, duplicated code, magic strings, tight coupling.
6. **Check rule adherence**: naming, formatting, import order, error handling.
7. **Report**: coverage percentage, top uncovered areas, smell count, and recommended fixes.

## Output Artifacts

- New/updated test files
- `scripts/test.sh`
- Coverage report file (e.g. `coverage/index.html`, `target/coverage`)
- Short `QUALITY_REPORT.md` snippet (optional)

## Rules

- Do not skip tests for "trivial" code; if it's worth writing, it's worth testing.
- Mock external services and filesystems when possible.
- Fail loudly if coverage drops below the project baseline.
- Report flaky tests separately from real failures.
- Use tests as spec evidence during agentic sprints.
