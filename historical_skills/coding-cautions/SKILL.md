---
name: coding-cautions
description: "Apply defensive coding cautions: version pinning, local/router IPs, ports, China mirrors, verbose logging, and safe file operations. Trigger: 'coding cautions', 'be careful', 'safety rules'."
kind: workflow
user-invocable: true
---

# Coding Cautions

A set of defensive defaults to reduce environment drift, broken networking, and accidental data loss.

## Checklist

- [ ] **Pin versions**: language runtime, libraries, Docker base images, CI action versions.
- [ ] **Network awareness**: ask for or detect local IP vs router/public IP and port range.
- [ ] **China mirrors**: use Taobao/npm, Tsinghua PyPI, Aliyun Maven, USTC/SJTU crates, goproxy.cn when appropriate.
- [ ] **Verbose logging**: add a `--verbose` / `DEBUG=1` flag and write rotating logs to `/tmp` or `logs/`.
- [ ] **Virtual environments**: activate venv / nvm / conda / rustup toolchain before installing or running.
- [ ] **Compile scripts**: every compiled project has a `scripts/build.sh`.
- [ ] **Launch scripts**: every project has a `scripts/start.sh` or `scripts/dev.sh`.
- [ ] **Rotating logs**: add `--verbose` / `DEBUG=1` and write rotating logs to `logs/` or `/tmp`.
- [ ] **OpenAPI-friendly servers**: prefer server libraries that emit or summarize `openapi.json` for frontend-backend exchange.
- [ ] **No silent deletes**: never `rm -rf` without explicit permission; copy before overwriting.
- [ ] **Safe copies**: use explicit file lists or `grep -v` filters piped to `xargs` for bulk copy.
- [ ] **Proof of work**: if a step is complex or external, log it and tell the user how to collect evidence.
- [ ] **Tests and coverage**: write tests for new behavior and run coverage checks.
- [ ] **Manual verification**: when a process is too complex to automate safely, ask the user to run it and collect logs/observations.

## Workflow

1. Apply the checklist to the current task.
2. If a checklist item is missing, create the missing artifact (script, config, or documentation).
3. Ask the user for missing values (IP, port, mirror preference) before hard-coding them.
4. Summarize what was made safe and what still needs user input.

## Rules

- Defaults must be overridable via environment variables.
- Never commit secrets, `.env`, or local-only IPs.
- Log paths must respect OS conventions (`$TMPDIR`, `%TEMP%`, `logs/`).
- Prefer `cp --parents` or `xargs -I{}` over recursive copies that include junk files.
- When unsure about a specific interaction, log its process and tell the user how to collect proof of work.
