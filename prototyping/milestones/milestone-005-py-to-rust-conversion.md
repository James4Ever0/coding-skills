# Milestone 005: Python → Rust Conversion

## Checklist

- [x] Create `prototyping/rust/` structure
- [x] Create `Cargo.toml`
- [x] Implement `src/main.rs` entry point
- [x] Implement `src/lib.rs` re-exports
- [x] Implement `src/core.rs` with translated logic
- [x] Write `tests/integration_test.rs`
- [x] Write `tests/run_all.sh`
- [ ] Verify `cargo build` succeeds
- [ ] Verify `cargo test` succeeds

## Completion Criteria

- [ ] Cargo build succeeds
- [ ] Rust tests pass
- [ ] Tests mirror Go test structure

## Status

**Status:** In Progress

**Notes:**
- Structure scaffolded via `convert-py-to-rust.sh`.
- `core.rs` translates `validate_name` and `Result` from Python.
- Unit tests inline in `core.rs`, integration in `tests/`.
- Need `cargo build` verification.
