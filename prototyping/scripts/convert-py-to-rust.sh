#!/usr/bin/env bash
set -euo pipefail

# convert-py-to-rust.sh — Scaffold Rust conversion target from Python prototype
# Usage: convert-py-to-rust.sh <skill-name>

if [ $# -ne 1 ]; then
    echo "Usage: $0 <skill-name>"
    echo ""
    echo "Scaffold a Rust conversion target in prototyping/rust/."
    echo "Copies Python prototype files as reference comments."
    echo "Semantic translation is agent-guided."
    exit 1
fi

SKILL_NAME="$1"
SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
RUST_DIR="$SCRIPT_DIR/rust"
PYTHON_DIR="$SCRIPT_DIR/python"

if [ ! -d "$PYTHON_DIR" ]; then
    echo "Warning: Python prototype directory not found at $PYTHON_DIR."
    echo "Creating Rust structure without Python reference."
fi

mkdir -p "$RUST_DIR/src" "$RUST_DIR/tests"

# Create or update Cargo.toml
if [ ! -f "$RUST_DIR/Cargo.toml" ]; then
    cat > "$RUST_DIR/Cargo.toml" <<CARGO
[package]
name = "prototype"
version = "0.1.0"
edition = "2021"
CARGO
    echo "Created Cargo.toml"
fi

# Create main.rs
cat > "$RUST_DIR/src/main.rs" <<MAIN
mod core;
mod lib;

fn main() {
    println!("Prototype: $SKILL_NAME");
    println!("TODO: implement CLI interface");
}
MAIN
echo "Created src/main.rs"

# Create lib.rs
cat > "$RUST_DIR/src/lib.rs" <<LIB
pub mod core;

// Re-export public API
pub use core::Result;
LIB
echo "Created src/lib.rs"

# Create core.rs with Python reference
cat > "$RUST_DIR/src/core.rs" <<CORE
/// Reference: prototyping/python/logic/core.py
/// Translate Python logic here, preserving test structure.
/// TODO: implement core logic for $SKILL_NAME

/// Result represents the output of a prototype operation.
#[derive(Debug, PartialEq)]
pub struct Result {
    pub success: bool,
    pub message: String,
}

impl Result {
    pub fn new(success: bool, message: &str) -> Self {
        Result {
            success,
            message: message.to_string(),
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_new_result() {
        let r = Result::new(true, "test");
        assert!(r.success);
        assert_eq!(r.message, "test");
    }

    #[test]
    fn test_new_result_failure() {
        let r = Result::new(false, "fail");
        assert!(!r.success);
    }
}
CORE
echo "Created src/core.rs"

# Create integration test
cat > "$RUST_DIR/tests/integration_test.rs" <<INTEG
use prototype::core::Result;

#[test]
fn test_result_integration() {
    let r = Result::new(true, "integration test");
    assert!(r.success);
    assert_eq!(r.message, "integration test");
}
INTEG
echo "Created tests/integration_test.rs"

# Create run_all.sh
cat > "$RUST_DIR/tests/run_all.sh" <<RUNALL
#!/usr/bin/env bash
set -euo pipefail
cd "\$(dirname "\$0")/.."
echo "Running Rust tests..."
cargo test
RUNALL
chmod +x "$RUST_DIR/tests/run_all.sh"
echo "Created tests/run_all.sh"

echo ""
echo "Rust conversion scaffolded for '$SKILL_NAME' in $RUST_DIR"
echo "Next steps:"
echo "  1. Translate python/logic/core.py -> rust/src/core.rs"
echo "  2. Update rust/src/main.rs with CLI interface"
echo "  3. Run: cd rust && cargo build"
echo "  4. Run: rust/tests/run_all.sh"
