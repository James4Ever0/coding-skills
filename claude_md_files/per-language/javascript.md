# JavaScript Guide

## Tooling

- **Runtime manager**: `nvm`, `fnm`, or `mise`
- **Package manager**: `pnpm` (preferred) or `npm`
- **Linter**: `eslint`
- **Formatter**: `prettier`
- **Test runner**: `vitest` or `jest`
- **Coverage**: built into test runner

## Project Layout

```
project/
├── package.json
├── README.md
├── src/
│   └── main.js
├── tests/
│   └── main.test.js
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

- Use ESM (`"type": "module"`) for new projects.
- Add JSDoc types for public functions when not using TypeScript.
- Use `const` and `let`; avoid `var`.
- Prefer `async/await`.
- Validate external data with a schema library (Zod, Yup, Joi).

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

- Don't commit `node_modules/`, `dist/`, `build/`, or `.env`.
- Use `===` / `!==`.
- Avoid implicit type coercion.
- Handle rejected promises.
