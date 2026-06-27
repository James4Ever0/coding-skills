# Prototyping Testing Strategy

## Principle

Tests are **standalone from any test framework**. They run with only the language's standard library — no pytest, no bats, no test harness.

## Python Tests

- Location: `prototyping/python/tests/`
- Runner: `run_all.py` (uses `unittest.TestCase` and `unittest.TestLoader`)
- Pattern: `test_*.py` files with `unittest.TestCase` classes
- Execute: `python3 prototyping/python/tests/run_all.py`
- Coverage: Unit tests for `logic/core.py` and `prototype_utils.py`

**Rules:**
- No `pytest` or third-party test libraries.
- Set `PYTHONPATH` environment variable via `run-py-prototype.sh`.
- `run_all.py` discovers tests from its own directory.

## Bash Tests

- Location: `prototyping/bash/tests/`
- Runner: `run_all.sh` (sources and tests each `test_*.sh`)
- Pattern: `test_*.sh` files with exit-code assertions
- Execute: `bash prototyping/bash/tests/run_all.sh`

**Rules:**
- Each test file sets `set -euo pipefail`.
- Use `assert_eq`, `assert_contains` helper functions.
- Exit 0 on success, non-zero on failure.

## Go Tests

- Location: `prototyping/golang/tests/`
- Runner: `go test ./...` via `run_all.sh`
- Pattern: `*_test.go` files with `TestXxx(t *testing.T)`
- Execute: `cd prototyping/golang && go test ./...`

**Rules:**
- Standard `testing` package only.
- Mirror Python test structure where possible.

## Rust Tests

- Location: `prototyping/rust/tests/` (integration) and `src/` (unit)
- Runner: `cargo test` via `run_all.sh`
- Pattern: `#[test]` attributes
- Execute: `cd prototyping/rust && cargo test`

**Rules:**
- Standard `#[test]` attributes only.
- Unit tests inline in `src/*.rs`; integration tests in `tests/`.
- Mirror Go test structure where possible.

## Unified Runner

`prototyping/scripts/run-tests.sh` runs all test suites and reports per-language status.
