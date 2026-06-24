---
name: code-with-caution
description: Implement code safely: pin versions, handle networks/IPs, use mirrors, log verbosely, copy carefully, and avoid destructive changes.
user-invocable: true
allowed-tools:
  - Bash
  - Read
  - Write
  - Edit
  - Agent
---

# code-with-caution

A guardrail skill for everyday coding. Apply it whenever you write, edit, or refactor code.

## Rules

1. **Pin versions**
   - Lock language/tool versions in `requirements.txt`, `package.json`, `Cargo.toml`, `go.mod`, etc.
   - Record the Python/Node/Rust/Go version in a `.tool-versions`, `.nvmrc`, or README section.

2. **Network and host clarity**
   - Distinguish `localhost` / `127.0.0.1` from LAN/router IPs.
   - Make ports configurable through environment variables or config files.
   - Never commit secrets, real API keys, or production endpoints.

3. **Regional mirrors**
   - Prefer project-local mirror config over system-wide changes.
   - Common mirrors: npm (npmmirror), pip (Tsinghua/Aliyun), apt (Tsinghua/Aliyun), cargo (TUNA), go (goproxy.cn).

4. **Verbose logging**
   - Add a `DEBUG` / `VERBOSE` flag.
   - Write rotating logs to `tmp/` or `logs/`; add these to `.gitignore`.
   - If an interaction is unclear, log the process and tell the user how to collect proof of work.

5. **Virtual environments**
   - Always activate the correct venv / conda / nvm environment before installing or running.
   - Write wrapper scripts so future agents do not forget.

6. **Safe file operations**
   - Do not delete files without explicit permission.
   - Copy files by name; use `find` + inverse filters or `fd` to build a file list, then `cat filelist.txt | xargs -I{} cp {} dest/{}`.
   - Preserve originals when experimenting (`cp -r src src.bak`).

7. **No silent assumptions**
   - If a requirement is ambiguous, ask clarifying questions with code references.
   - Reference the files and line numbers you are about to change.

## Quick checklist

Apply this to every implementation task:

- [ ] Versions pinned (runtime, dependencies, Docker images, CI actions).
- [ ] Network values are configurable (IP, port) and not hard-coded secrets.
- [ ] Regional mirrors configured if needed.
- [ ] Verbose logging and rotating log path exist.
- [ ] Virtual environment activated before install/run.
- [ ] `scripts/build.sh` exists for compiled projects.
- [ ] `scripts/start.sh` or `scripts/dev.sh` exists.
- [ ] No silent deletes; copies use explicit file lists.
- [ ] Tests written and run for new behavior.
- [ ] Manual verification steps documented if automation is unsafe.

## Verification

Before finishing, run the build/test/lint commands and confirm they pass. If they fail, fix or escalate with logs.
