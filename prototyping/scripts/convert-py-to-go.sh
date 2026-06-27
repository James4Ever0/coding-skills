#!/usr/bin/env bash
set -euo pipefail

# convert-py-to-go.sh — Scaffold Go conversion target from Python prototype
# Usage: convert-py-to-go.sh <skill-name>

if [ $# -ne 1 ]; then
    echo "Usage: $0 <skill-name>"
    echo ""
    echo "Scaffold a Go conversion target in prototyping/golang/."
    echo "Copies Python prototype files as reference comments."
    echo "Semantic translation is agent-guided."
    exit 1
fi

SKILL_NAME="$1"
SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
GO_DIR="$SCRIPT_DIR/golang"
PYTHON_DIR="$SCRIPT_DIR/python"

if [ ! -d "$PYTHON_DIR" ]; then
    echo "Warning: Python prototype directory not found at $PYTHON_DIR."
    echo "Creating Go structure without Python reference."
fi

mkdir -p "$GO_DIR/cmd/prototype" "$GO_DIR/internal" "$GO_DIR/tests"

# Create or update go.mod
if [ ! -f "$GO_DIR/go.mod" ]; then
    cat > "$GO_DIR/go.mod" <<GOMOD
module prototype

go 1.21
GOMOD
    echo "Created go.mod"
fi

# Create main.go
cat > "$GO_DIR/cmd/prototype/main.go" <<MAIN
package main

import (
    "fmt"
    "os"
)

func main() {
    fmt.Println("Prototype: $SKILL_NAME")
    fmt.Println("TODO: implement CLI interface")
    os.Exit(0)
}
MAIN
echo "Created cmd/prototype/main.go"

# Create internal/core.go with Python reference
cat > "$GO_DIR/internal/core.go" <<CORE
package internal

// Reference: prototyping/python/logic/core.py
// Translate Python logic here, preserving test structure.
// TODO: implement core logic for $SKILL_NAME

// Result represents the output of a prototype operation.
type Result struct {
    Success bool
    Message string
}

// NewResult creates a new Result.
func NewResult(success bool, message string) Result {
    return Result{Success: success, Message: message}
}
CORE
echo "Created internal/core.go"

# Create test file
cat > "$GO_DIR/tests/core_test.go" <<TEST
package tests

import (
    "testing"
    "prototype/internal"
)

func TestNewResult(t *testing.T) {
    r := internal.NewResult(true, "test")
    if !r.Success {
        t.Errorf("expected success=true, got false")
    }
    if r.Message != "test" {
        t.Errorf("expected message='test', got '%s'", r.Message)
    }
}

func TestNewResultFailure(t *testing.T) {
    r := internal.NewResult(false, "fail")
    if r.Success {
        t.Errorf("expected success=false, got true")
    }
}
TEST
echo "Created tests/core_test.go"

# Create run_all.sh
cat > "$GO_DIR/tests/run_all.sh" <<RUNALL
#!/usr/bin/env bash
set -euo pipefail
cd "\$(dirname "\$0")/.."
echo "Running Go tests..."
go test ./...
RUNALL
chmod +x "$GO_DIR/tests/run_all.sh"
echo "Created tests/run_all.sh"

echo ""
echo "Go conversion scaffolded for '$SKILL_NAME' in $GO_DIR"
echo "Next steps:"
echo "  1. Translate python/logic/core.go -> golang/internal/core.go"
echo "  2. Update golang/cmd/prototype/main.go with CLI interface"
echo "  3. Run: cd golang && go build ./cmd/prototype"
echo "  4. Run: golang/tests/run_all.sh"
