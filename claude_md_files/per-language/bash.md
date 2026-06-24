# Bash Guide

## Tooling

- **Interpreter**: `bash` 4+ or `bash` 5+
- **Linter**: `shellcheck`
- **Formatter**: `shfmt`
- **Test**: `bats-core`

## Project Layout

```
project/
├── README.md
├── scripts/
│   ├── install.sh
│   ├── test.sh
│   └── utils.sh
└── tests/
    └── utils.bats
```

## Conventions

- Start every script with `#!/usr/bin/env bash` and `set -euo pipefail`.
- Quote variables: `"$var"`.
- Use `[[ ]]` for conditionals.
- Prefer functions over long linear scripts.
- Use `printf` over `echo` for portability.
- Validate inputs with usage messages.

## Scripts

```bash
# scripts/test.sh
shellcheck scripts/*.sh
bats tests/
```

## Common Gotchas

- Don't commit secrets in scripts.
- Avoid parsing `ls` output.
- Use `mktemp` for temporary files and clean them in a trap.
- Be careful with word splitting and globbing.

## Logging

Use `logger` or redirect to rotating files via `logrotate`. For scripts, append to `logs/` or `/tmp` with timestamps. Never commit logs.

## Reference Projects

When automating complex workflows, clone reference shell projects into `reference/` and summarize reusable patterns in `docs/library-notes/`.
