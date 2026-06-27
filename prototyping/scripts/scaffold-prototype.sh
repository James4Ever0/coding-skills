#!/usr/bin/env bash
set -euo pipefail

# scaffold-prototype.sh — Create a new prototype skeleton
# Usage: scaffold-prototype.sh <python|bash> <skill-name>

if [ $# -ne 2 ]; then
    echo "Usage: $0 <python|bash> <skill-name>"
    echo ""
    echo "Create a new prototype skeleton in prototyping/<lang>/."
    echo ""
    echo "Examples:"
    echo "  $0 python my-awesome-skill"
    echo "  $0 bash config-linter"
    exit 1
fi

LANG="$1"
SKILL_NAME="$2"
PROTOTYPE_DIR="$(cd "$(dirname "$0")/.." && pwd)"

case "$LANG" in
    python)
        TARGET_DIR="$PROTOTYPE_DIR/python"
        mkdir -p "$TARGET_DIR/tests"

        # Ensure __init__.py exists
        touch "$TARGET_DIR/__init__.py"
        touch "$TARGET_DIR/tests/__init__.py"

        echo "# $SKILL_NAME — Python Prototype" >> "$TARGET_DIR/README.md"
        echo "" >> "$TARGET_DIR/README.md"
        echo "Prototype scaffolded on $(date +%Y-%m-%d)." >> "$TARGET_DIR/README.md"
        echo "TODO: implement $SKILL_NAME" >> "$TARGET_DIR/README.md"

        echo "Scaffolded Python prototype '$SKILL_NAME' in $TARGET_DIR"
        echo "  - Added README.md placeholder"
        ;;
    bash)
        TARGET_DIR="$PROTOTYPE_DIR/bash"
        mkdir -p "$TARGET_DIR/lib" "$TARGET_DIR/tests"

        echo "# $SKILL_NAME — Bash Prototype" >> "$TARGET_DIR/README.md"
        echo "" >> "$TARGET_DIR/README.md"
        echo "Prototype scaffolded on $(date +%Y-%m-%d)." >> "$TARGET_DIR/README.md"
        echo "TODO: implement $SKILL_NAME" >> "$TARGET_DIR/README.md"

        echo "Scaffolded Bash prototype '$SKILL_NAME' in $TARGET_DIR"
        echo "  - Added README.md placeholder"
        ;;
    *)
        echo "Error: unsupported language '$LANG'. Use 'python' or 'bash'."
        exit 1
        ;;
esac
