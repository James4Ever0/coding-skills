#!/usr/bin/env bash
set -euo pipefail

# run-tests.sh — Run all prototype tests across all languages
# Usage: run-tests.sh [lang]

SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
LANG="${1:-all}"

FAILURES=0

run_python_tests() {
    local dir="$SCRIPT_DIR/python/tests"
    if [ -f "$dir/run_all.py" ]; then
        echo "=== Python Tests ==="
        PYTHONPATH="$SCRIPT_DIR/python:$SCRIPT_DIR/python/tests" python3 "$dir/run_all.py" && echo "PASS" || { echo "FAIL"; return 1; }
    else
        echo "=== Python Tests: SKIP (no run_all.py) ==="
    fi
}

run_bash_tests() {
    local dir="$SCRIPT_DIR/bash/tests"
    if [ -f "$dir/run_all.sh" ]; then
        echo "=== Bash Tests ==="
        bash "$dir/run_all.sh" && echo "PASS" || { echo "FAIL"; return 1; }
    else
        echo "=== Bash Tests: SKIP (no run_all.sh) ==="
    fi
}

run_go_tests() {
    local dir="$SCRIPT_DIR/golang"
    if [ -f "$dir/go.mod" ]; then
        echo "=== Go Tests ==="
        (cd "$dir" && go test ./... 2>/dev/null) && echo "PASS" || { echo "FAIL"; return 1; }
    else
        echo "=== Go Tests: SKIP (no go.mod) ==="
    fi
}

run_rust_tests() {
    local dir="$SCRIPT_DIR/rust"
    if [ -f "$dir/Cargo.toml" ]; then
        echo "=== Rust Tests ==="
        (cd "$dir" && cargo test 2>/dev/null) && echo "PASS" || { echo "FAIL"; return 1; }
    else
        echo "=== Rust Tests: SKIP (no Cargo.toml) ==="
    fi
}

case "$LANG" in
    all)
        run_python_tests || ((FAILURES++))
        run_bash_tests || ((FAILURES++))
        run_go_tests || ((FAILURES++))
        run_rust_tests || ((FAILURES++))
        ;;
    python) run_python_tests || ((FAILURES++)) ;;
    bash)   run_bash_tests || ((FAILURES++)) ;;
    go|golang) run_go_tests || ((FAILURES++)) ;;
    rust)   run_rust_tests || ((FAILURES++)) ;;
    *)
        echo "Usage: $0 [all|python|bash|go|rust]"
        exit 1
        ;;
esac

if [ "$FAILURES" -gt 0 ]; then
    echo ""
    echo "FAILED: $FAILURES test suite(s) have errors."
    exit 1
fi

echo ""
echo "All test suites passed."
