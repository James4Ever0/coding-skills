"""
Prototyping utility functions — I/O, formatting, file operations.

Keep this module free of domain logic; domain logic goes in logic/core.py.
"""

import os
import json
import sys


def read_file(path: str) -> str:
    """Read a text file and return its contents."""
    with open(path, "r", encoding="utf-8") as f:
        return f.read()


def write_file(path: str, content: str) -> None:
    """Write content to a text file, creating parent directories if needed."""
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", encoding="utf-8") as f:
        f.write(content)


def read_json(path: str) -> dict:
    """Read a JSON file and return the parsed dict."""
    with open(path, "r", encoding="utf-8") as f:
        return json.load(f)


def write_json(path: str, data: dict) -> None:
    """Write a dict as JSON to a file."""
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=2)


def format_error(message: str) -> str:
    """Format an error message for CLI output."""
    return f"Error: {message}"


def format_success(message: str) -> str:
    """Format a success message for CLI output."""
    return f"OK: {message}"


def exit_with_error(message: str, code: int = 1) -> None:
    """Print an error message and exit with the given code."""
    print(format_error(message), file=sys.stderr)
    sys.exit(code)
