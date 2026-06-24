---
name: setup-environment
description: "Set up a reproducible dev environment: language runtime, package manager, China mirrors, virtual env, compile scripts, and launcher scripts. Trigger: 'setup environment', 'init project', 'install dependencies'."
kind: workflow
user-invocable: true
---

# Setup Environment

Create a reproducible, mirror-friendly development environment for the chosen language/stack.

## Workflow

1. **Detect language/runtime** from existing files (`package.json`, `requirements.txt`, `Cargo.toml`, `go.mod`, `pom.xml`, `build.gradle`, etc.) or ask the user.
2. **Check installed versions** with the language's version command; if missing, install via official installer or package manager.
3. **Configure China mirror** (when the user is in mainland China or latency matters):
   - Python: Tsinghua PyPI `https://pypi.tuna.tsinghua.edu.cn/simple`
   - Node/npm: Taobao/`npmmirror` or Aliyun registry
   - Rust: USTC/SJTU crates mirror; configure `~/.cargo/config.toml`
   - Go: GOPROXY via `https://goproxy.cn`
   - Java: Maven Aliyun mirror
   - Docker: Tsinghua, Aliyun, or SJTU registry mirror
4. **Create isolated environment**: `venv`, `nvm`/`fnm`, `rustup` toolchain, `goenv`, `conda`, etc.
5. **Write install script**: `scripts/install.sh` or `scripts/setup.bat` that installs deps, pins versions, and activates the env.
6. **Write compile/build script** if the project needs compilation.
7. **Write launch script**: `scripts/start.sh`, `scripts/dev.sh`, or `scripts/run.sh` for manual testing.
8. **Write log/coverage scripts**: `scripts/tail-logs.sh`, `scripts/coverage.sh`.
9. **Verify**: run install + launch and report success/failure.

## Output Artifacts

- `scripts/install.sh` (or `.bat`/`.ps1`)
- `scripts/build.sh`
- `scripts/start.sh`
- Environment marker file (`.python-version`, `.nvmrc`, `rust-toolchain.toml`, etc.)
- Updated lockfile if generated

## Rules

- Always pin language/library versions.
- Always activate the virtual env before install/compile/run.
- Never pollute the user's global environment.
- If a step fails, log the exact command and error, and ask the user for the next move.
