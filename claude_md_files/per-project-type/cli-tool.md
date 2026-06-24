# CLI Tool Projects

> **Scope**: command-line utilities, interactive terminals, daemons, and shell-like programs.

---

## 1. Project Layout

```text
.
├── cmd/                  # Entry points (one per binary)
├── pkg/                  # Public library code
├── internal/             # Private implementation
├── scripts/
│   ├── build.sh          # Cross-platform build
│   ├── test.sh           # Run unit + integration tests
│   └── install.sh        # Local install script
├── docs/
├── README.md
├── LICENSE
└── .goreleaser.yaml      # or equivalent release config
```

---

## 2. Argument Parsing and Configuration

- Use a mature parser: `cobra`/`urfave/cli` (Go), `argparse`/`click` (Python), `clap` (Rust), `commander`/`yargs` (Node).
- Support `--help`, `--version`, and meaningful exit codes (`0` success, `1` general error, `2` misuse, `130` interrupted).
- Configuration precedence: CLI flags > environment variables > config file > defaults.
- Validate config early and fail fast with actionable error messages.

---

## 3. Input / Output Conventions

- Write normal output to `stdout` and diagnostics to `stderr`.
- Support `--quiet` and `--verbose`/`--debug`.
- When emitting structured output, support `--json` or `--format`.
- Detect terminal capabilities (`isatty`) before using color or interactive prompts.
- Respect `NO_COLOR` and `TERM`/`TERM_PROGRAM`.

---

## 4. Interactive and TUI Programs

- Use a PTY wrapper for interactive child processes and forward resize signals.
- When using a VT emulator, treat it as bidirectional: feed it output and forward generated replies back to the PTY.
- Handle `SIGINT`, `SIGTERM`, and `SIGHUP` for clean shutdown.
- Restore terminal state (raw mode, cursor visibility) on exit.

---

## 5. Logging

- Write verbose logs to a rotating file under `logs/` or the system temp directory.
- Keep `stderr` clean unless the user asked for verbosity or an error occurred.
- Include timestamps, log level, and operation context.

---

## 6. Testing

- Unit-test pure functions and parsers.
- Integration-test the CLI by invoking the built binary in a subprocess and checking exit code + output.
- Leave a `scripts/test.sh` that runs both.

---

## 7. Distribution

- Provide a single-file install script or package manager instructions.
- Build static binaries where possible.
- Version with semver and keep a changelog.
