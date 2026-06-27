# Milestone 004: Python → Go Conversion

## Checklist

- [x] Create `prototyping/golang/` structure
- [x] Create `go.mod`
- [x] Implement `cmd/prototype/main.go` entry point
- [x] Implement `internal/core.go` with translated logic
- [x] Write `tests/core_test.go`
- [x] Write `tests/run_all.sh`
- [ ] Verify `go build ./cmd/prototype` succeeds
- [ ] Verify `go test ./...` succeeds

## Completion Criteria

- [ ] Go build succeeds
- [ ] Go tests pass
- [ ] Tests mirror Python test structure

## Status

**Status:** In Progress

**Notes:**
- Structure scaffolded via `convert-py-to-go.sh`.
- `core.go` translates `validate_name` and `Result` from Python.
- Need `go build` verification.
