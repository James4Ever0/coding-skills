#!/usr/bin/env bash
# helpers.sh — Reusable Bash helper functions for prototypes
# Source this file in your scripts: source "$(dirname "$0")/lib/helpers.sh"

# Prevent double-sourcing
if [ -n "${_HELPERS_SH_LOADED:-}" ]; then return; fi
_HELPERS_SH_LOADED=1

# Color output (disabled if not a terminal)
if [ -t 1 ]; then
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    YELLOW='\033[1;33m'
    NC='\033[0m' # No Color
else
    RED=''
    GREEN=''
    YELLOW=''
    NC=''
fi

# Log an info message
info() {
    echo -e "${GREEN}[INFO]${NC} $*"
}

# Log a warning message
warn() {
    echo -e "${YELLOW}[WARN]${NC} $*"
}

# Log an error message
error() {
    echo -e "${RED}[ERROR]${NC} $*" >&2
}

# Exit with an error message
die() {
    error "$*"
    exit 1
}

# Check if a command exists
require_command() {
    if ! command -v "$1" &>/dev/null; then
        die "Required command not found: $1"
    fi
}

# Check if a file exists
require_file() {
    if [ ! -f "$1" ]; then
        die "Required file not found: $1"
    fi
}

# Check if a directory exists
require_dir() {
    if [ ! -d "$1" ]; then
        die "Required directory not found: $1"
    fi
}

# Run a command and print it first
run() {
    echo "+ $*"
    "$@"
}

# Confirm with the user
confirm() {
    local prompt="${1:-Continue?}"
    local response
    read -r -p "$prompt [y/N] " response
    case "$response" in
        [yY]|[yY][eE][sS]) return 0 ;;
        *) return 1 ;;
    esac
}
