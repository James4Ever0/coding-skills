"""
Core domain logic for prototypes.

Place business logic here, keeping it free of I/O.
I/O operations belong in prototype_utils.py.
"""

from dataclasses import dataclass
from typing import Any


@dataclass
class Result:
    """Standard result type for prototype operations."""
    success: bool
    message: str
    data: Any = None


def validate_name(name: str) -> Result:
    """Validate a skill name (lowercase, hyphens allowed, no spaces)."""
    if not name:
        return Result(False, "Name cannot be empty")
    if " " in name:
        return Result(False, "Name cannot contain spaces")
    if not all(c.isalnum() or c == "-" for c in name):
        return Result(False, "Name can only contain letters, digits, and hyphens")
    return Result(True, "Name is valid")


def parse_args(args: list[str]) -> dict:
    """Parse simple key=value arguments into a dict."""
    result = {}
    for arg in args:
        if "=" in arg:
            key, value = arg.split("=", 1)
            result[key] = value
    return result
