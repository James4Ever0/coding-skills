#!/usr/bin/env bash
set -euo pipefail

# Tests for bash/lib/helpers.sh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/../lib/helpers.sh"

fail_count=0

assert_eq() {
    local expected="$1"
    local actual="$2"
    local msg="${3:-}"
    if [ "$expected" != "$actual" ]; then
        echo "  FAIL: $msg"
        echo "    expected: $expected"
        echo "    actual:   $actual"
        ((fail_count++))
    fi
}

assert_contains() {
    local haystack="$1"
    local needle="$2"
    local msg="${3:-}"
    if [[ "$haystack" != *"$needle"* ]]; then
        echo "  FAIL: $msg"
        echo "    expected to contain: $needle"
        ((fail_count++))
    fi
}

# Test info
echo "  Test: info output"
info_output=$(info "hello" 2>&1)
assert_contains "$info_output" "hello" "info should contain message"

# Test warn
echo "  Test: warn output"
warn_output=$(warn "careful" 2>&1)
assert_contains "$warn_output" "careful" "warn should contain message"

# Test error
echo "  Test: error output"
error_output=$(error "oh no" 2>&1)
assert_contains "$error_output" "oh no" "error should contain message"

# Test require_command with existing command
echo "  Test: require_command (bash)"
require_command bash
echo "  PASS: require_command bash"

# Test require_command with missing command
echo "  Test: require_command (nonexistent)"
rc=0
(require_command nonexistent_cmd_xyz 2>/dev/null) || rc=$?
if [ "$rc" -eq 0 ]; then
    echo "  FAIL: require_command should have failed"
    ((fail_count++))
else
    echo "  PASS: require_command correctly failed"
fi

# Test require_file
echo "  Test: require_file"
echo "temp" > /tmp/_test_helpers_file
require_file /tmp/_test_helpers_file
echo "  PASS"
rm -f /tmp/_test_helpers_file

# Test require_dir
echo "  Test: require_dir"
mkdir -p /tmp/_test_helpers_dir
require_dir /tmp/_test_helpers_dir
echo "  PASS"
rmdir /tmp/_test_helpers_dir

# Test run
echo "  Test: run"
run_output=$(run echo "hello from run" 2>&1)
assert_contains "$run_output" "+ echo" "run should print the command"
assert_contains "$run_output" "hello from run" "run should execute the command"

# Summary
echo ""
if [ "$fail_count" -gt 0 ]; then
    echo "FAILED: $fail_count assertion(s) failed."
    exit 1
fi

echo "All helper tests passed."
