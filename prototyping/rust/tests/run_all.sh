#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
echo "Running Rust tests..."
cargo test
