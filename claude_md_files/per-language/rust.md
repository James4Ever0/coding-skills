# Rust Guide

## Tooling

- **Toolchain manager**: `rustup`
- **Build tool**: `cargo`
- **Formatter**: `rustfmt`
- **Linter**: `clippy`
- **Test**: `cargo test`
- **Coverage**: `cargo tarpaulin` or `llvm-cov`

## Project Layout

```
project/
├── Cargo.toml
├── README.md
├── src/
│   ├── main.rs
│   └── lib.rs
├── tests/
│   └── integration_test.rs
├── scripts/
│   ├── install.sh
│   ├── test.sh
│   └── start.sh
└── .gitignore
```

## China Mirrors

```toml
# ~/.cargo/config.toml
[source.crates-io]
replace-with = 'ustc'

[source.ustc]
registry = "sparse+https://mirrors.ustc.edu.cn/crates.io-index/"
```

## Conventions

- Use `cargo clippy -- -D warnings` in CI.
- Prefer `Result` over `panic!` for recoverable errors.
- Use the type system to make invalid states unrepresentable.
- Keep async runtime choice consistent (`tokio` is common).
- Document public APIs with `///`.

## Scripts

```bash
# scripts/install.sh
cargo build

# scripts/test.sh
cargo test

# scripts/start.sh
cargo run
```

## Common Gotchas

- Don't commit `target/` or `Cargo.lock` for libraries (commit it for binaries).
- Avoid `.unwrap()` in production code.
- Use `?` propagation for errors.
- Be careful with lifetime annotations; prefer owned types at boundaries.

## Logging

Use `tracing` + `tracing-subscriber`. For rotating files, add `tracing-appender` or a custom rolling writer. Keep logs in `logs/` or `/tmp` and never commit them.

## Reference Projects

When building systems tools, CLIs, or async servers, clone reference Rust projects into `reference/` and summarize reusable patterns in `docs/library-notes/`.
