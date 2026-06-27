# Milestone 003: Bash Tooling

## Checklist

- [x] Create `prototyping/bash/` structure
- [x] Implement `lib/helpers.sh` (info, warn, error, die, require_*, run, confirm)
- [x] Write `tests/run_all.sh` standalone runner
- [x] Write `tests/test_helpers.sh`
- [x] Verify all Bash tests pass

## Completion Criteria

- [x] All Bash tests pass with `bash run_all.sh`
- [x] No external dependencies

## Status

**Status:** Done

**Notes:**
- Tests cover `info`, `warn`, `error`, `require_command`, `require_file`, `require_dir`, `run`.
- `helpers.sh` guards against double-sourcing.
