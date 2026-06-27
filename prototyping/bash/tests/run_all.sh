#!/usr/bin/env bash
set -euo pipefail

# Standalone Bash test runner
# Sources helpers.sh and runs all test_*.sh scripts in this directory.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
FAILURES=0

for test_file in "$SCRIPT_DIR"/test_*.sh; do
    if [ ! -f "$test_file" ]; then
        echo "No test files found in $SCRIPT_DIR"
        exit 0
    fi

    test_name="$(basename "$test_file")"
    echo "=== Running $test_name ==="

    if bash "$test_file"; then
        echo "PASS: $test_name"
    else
        echo "FAIL: $test_name"
        ((FAILURES++))
    fi
    echo ""
done

if [ "$FAILURES" -gt 0 ]; then
    echo "FAILED: $FAILURES test(s) failed."
    exit 1
fi

echo "All Bash tests passed."
