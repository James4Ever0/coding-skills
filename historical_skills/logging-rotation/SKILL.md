---
name: logging-rotation
description: "Add verbose, rotating log files to an application so debugging evidence is always available. Trigger: 'add logging', 'rotating logs', 'verbose log', 'debug log file'."
kind: workflow
user-invocable: true
---

# Logging & Rotation

Add verbose, rotating log files to an application so debugging evidence is always available without filling the disk.

## Workflow

1. **Choose a log destination**:
   - `logs/` under the project root for long-lived sessions.
   - System temp directory (`$TMPDIR`, `%TEMP%`, `/tmp`) for ephemeral or sensitive output.
2. **Add a verbosity flag**: `--verbose` / `-v`, `DEBUG=1`, or `LOG_LEVEL=debug`.
3. **Pick a rotation strategy**:
   - **Time-based**: rotate daily or hourly.
   - **Size-based**: rotate when a file exceeds a limit (e.g., 10 MB).
   - **Count-based**: keep the last N files (e.g., 7).
4. **Use the language's standard library or a small logging crate/package**:
   - **Python**: `logging` with `RotatingFileHandler` / `TimedRotatingFileHandler`.
   - **Node/TypeScript**: `pino`, `winston`, or `rotating-file-stream`.
   - **Go**: `slog` with `lumberjack` or a custom `io.Writer`.
   - **Rust**: `tracing` + `tracing-appender` or a custom rolling writer.
   - **Java**: `logback` / `log4j2` rolling policies.
   - **Bash**: `logger`, `ts`, or `logrotate` via `trap`.
5. **Write a log helper/wrapper** that is easy to swap between stdout, stderr, and file.
6. **Add a script**: `scripts/tail-logs.sh` to stream the latest log file.
7. **Verify**: run with verbose mode, confirm logs appear and rotate as expected.

## Output Artifacts

- Logging configuration or module
- `logs/` directory (gitignored)
- `scripts/tail-logs.sh`
- Updated `README.md` or `.tips_and_tricks/debug.md` explaining how to collect logs

## Rules

- Never commit log files.
- Always log to a writable location; fall back to stderr if the file cannot be opened.
- Include timestamps, log level, and a correlation/request ID when possible.
- For agents, make log messages actionable (file paths, expected vs actual, remediation hints).
- Rotate before the disk fills; cap total log size when possible.
- When unsure about an interaction, log the process and tell the user how to collect evidence.
