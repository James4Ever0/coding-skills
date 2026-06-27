#!/usr/bin/env bash
set -euo pipefail

# run-py-prototype.sh — Run Python prototype tests
# Usage: run-py-prototype.sh [test-file-or-directory]

SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
PYTHON_DIR="$SCRIPT_DIR/python"
TEST_TARGET="${1:-$PYTHON_DIR/tests/run_all.py}"

if [ ! -d "$PYTHON_DIR" ]; then
    echo "Error: Python prototype directory not found at $PYTHON_DIR"
    echo "Run './scripts/scaffold-prototype.sh python <name>' first."
    exit 1
fi

if [ ! -f "$TEST_TARGET" ] && [ ! -d "$TEST_TARGET" ]; then
    echo "Error: test target not found: $TEST_TARGET"
    exit 1
fi

export PYTHONPATH="$PYTHON_DIR:$PYTHON_DIR/tests"

echo "Running Python tests: $TEST_TARGET"
echo "---"

python3 "$TEST_TARGET"

echo "---"
echo "All Python tests passed."
