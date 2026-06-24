---
name: setup-dev-env
description: Set up development environments, Docker, language-specific mirrors, virtual envs, compile scripts, and launch scripts for a project.
user-invocable: true
allowed-tools:
  - Bash
  - Read
  - Write
  - Edit
---

# setup-dev-env

Set up a reproducible development environment for the current project. Prefer convention over machine-specific paths.

## When to use

- The user asks to install dependencies, set up a project, containerize an app, or prepare a build environment.
- You see missing package managers, virtual environments, or run scripts.

## Procedure

1. **Detect the project type** by reading the root directory.
   - Look for `package.json`, `requirements.txt`, `pyproject.toml`, `Cargo.toml`, `go.mod`, `pom.xml`, `build.gradle`, `Gemfile`, `composer.json`, `Dockerfile`, etc.

2. **Choose the right sandbox**.
   - Python: create `venv` or `conda` env; activate it before installs.
   - Node: check for `.nvmrc` or `package.json` engines; use `nvm` if available.
   - Rust / Go / Java: use their native toolchain but respect pinned versions.

3. **Use fast regional mirrors when appropriate**.
   - npm: `registry = https://registry.npmmirror.com`
   - pip: `pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple`
   - apt: replace `/etc/apt/sources.list` with Tsinghua / Aliyun mirrors on Debian/Ubuntu.
   - cargo: `https://mirrors.tuna.tsinghua.edu.cn/git/crates.io-index.git`
   - go: `GOPROXY=https://goproxy.cn,direct`
   - Always ask the user before changing system-wide config; prefer project-local config (`.npmrc`, `pip.conf`, `cargo/config.toml`).

4. **Write a setup script** (e.g. `scripts/setup.sh`) that:
   - detects the project type,
   - creates/activates the virtual environment,
   - installs dependencies from lock files when they exist,
   - prints clear success/failure output.

5. **Write a compile/build script** if the project needs compilation (`scripts/build.sh`).

6. **Write a launch script** (`scripts/start.sh` or `launch.sh`) that:
   - activates the environment,
   - runs the application,
   - supports common flags (`--dev`, `--test`, `--port`).

7. **Add a manual test script** (`scripts/test-manual.sh`) for smoke testing the artifact.

8. **Document in README or SETUP.md** how to run the scripts.

9. **Verify** by running the setup script and the launch/test scripts. If a step fails, collect logs and ask the user before changing system settings.

## Output

- `scripts/setup.sh`
- `scripts/build.sh` (if needed)
- `scripts/start.sh`
- `scripts/test-manual.sh` (if applicable)
- Updated README/SETUP.md section

## Cautions

- Never leak real API keys, router IPs, or hostnames into committed scripts.
- Use relative paths; never hard-code absolute paths from your own machine.
- Keep verbose logs under `tmp/` or `logs/` and add those directories to `.gitignore`.
