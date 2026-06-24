# Go Guide

## Tooling

- **Runtime manager**: `mise`, `goenv`, or official Go installer
- **Build tool**: `go build`
- **Formatter**: `gofmt` / `goimports`
- **Linter**: `golangci-lint`
- **Test runner**: `go test`
- **Coverage**: `go test -coverprofile`

## Project Layout

```
project/
├── go.mod
├── README.md
├── cmd/
│   └── project/
│       └── main.go
├── internal/
│   ├── domain/
│   ├── service/
│   └── repo/
├── pkg/
│   └── publiclib/
├── scripts/
│   ├── install.sh
│   ├── test.sh
│   └── start.sh
└── .gitignore
```

## China Mirrors

```bash
# ~/.bashrc or ~/.zshrc
export GOPROXY=https://goproxy.cn,direct
export GOSUMDB=sum.golang.google.cn
```

## Conventions

- Pin Go version in `go.mod` and `go.work`.
- Keep `main` packages under `cmd/`.
- Put internal code in `internal/`.
- Use interfaces to define boundaries; mock for tests.
- Handle errors explicitly; never ignore returned errors.
- Use `context.Context` for cancellation and deadlines.

## Scripts

```bash
# scripts/install.sh
go mod download

# scripts/test.sh
go test ./...

# scripts/start.sh
go run ./cmd/project
```

## Common Gotchas

- Don't commit `vendor/` unless required by policy.
- Don't ignore errors from `defer` close calls.
- Avoid global state; inject dependencies.
- Use `go vet` and `golangci-lint` before committing.

## Logging

Use `log/slog` with JSON handler. For rotating files, use `gopkg.in/natefinch/lumberjack.v2` or a custom `io.Writer`. Keep logs in `logs/` or `/tmp` and never commit them.

## Reference Projects

When building network services or CLIs, clone reference Go projects into `reference/` and summarize reusable patterns in `docs/library-notes/`.
