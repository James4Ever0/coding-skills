# TypeScript / JavaScript Guide

## Tooling

- **Runtime manager**: `nvm`, `fnm`, or `mise`
- **Package manager**: `pnpm` (preferred), `yarn`, or `npm`
- **Bundler**: `vite`, `esbuild`, or `tsup`
- **Formatter**: `prettier`
- **Linter**: `eslint`
- **Type checker**: `tsc`
- **Test runner**: `vitest` or `jest`
- **Coverage**: built into vitest/jest

## Project Layout

```
project/
├── package.json
├── tsconfig.json
├── README.md
├── src/
│   └── main.ts
├── tests/
│   └── main.test.ts
├── scripts/
│   ├── install.sh
│   ├── test.sh
│   └── dev.sh
└── .gitignore
```

## China Mirrors

```bash
# .npmrc
registry=https://registry.npmmirror.com
```

## Conventions

- Use TypeScript for anything non-trivial.
- Strict `tsconfig.json` (`strict: true`, `noImplicitAny: true`).
- Prefer `pnpm` for deterministic installs and disk efficiency.
- Use Zod for runtime validation at boundaries.
- Prefer `async/await` over raw promises.
- Use `fetch` or `ky` for HTTP; avoid heavy Axios unless needed.

## Scripts

```bash
# scripts/install.sh
fnm use
pnpm install

# scripts/test.sh
pnpm test

# scripts/dev.sh
pnpm dev
```

## Common Gotchas

- Don't commit `node_modules/`, `.next/`, `dist/`, `build/`, or `.env`.
- Keep `any` usage minimal; document intentional escapes.
- Use `===` and `!==` always.
- Avoid callback pyramids.

## Logging

Use `pino` or `winston` for structured logs. For rotating files, use `rotating-file-stream` or similar. Keep logs in `logs/` or `/tmp` and never commit them.

## Reference Projects

When exploring frontend/backend patterns, clone reference TypeScript projects into `reference/` and summarize reusable patterns in `docs/library-notes/`.
