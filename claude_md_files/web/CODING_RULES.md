# CODING_RULES.md — Web Projects (JavaScript / TypeScript)

> Rules for frontend and full-stack web development.

## 1. Environment

- Use the Node version specified in `.nvmrc` or `package.json` `engines`.
- Use `nvm` or a project-local Node manager.
- Use `npm` or `pnpm` consistently; commit the lock file (`package-lock.json` or `pnpm-lock.yaml`).

## 2. Package mirrors

- Use a regional registry if appropriate:
  - `npm config set registry https://registry.npmmirror.com`
  - Or project-level `.npmrc`: `registry=https://registry.npmmirror.com`
- Do not change global config without user approval.

## 3. Tooling

- TypeScript first for new projects.
- Use `vite` for frontend builds when no strong preference exists.
- Lint with `eslint`; format with `prettier`.
- Run type checks with `tsc --noEmit`.

## 4. Project structure

```
web_project/
├── package.json
├── tsconfig.json
├── vite.config.ts
├── index.html
├── src/
│   ├── main.tsx
│   ├── components/
│   ├── hooks/
│   ├── pages/
│   ├── services/
│   └── types/
├── tests/
│   ├── unit/
│   └── e2e/
├── scripts/
│   ├── setup.sh
│   ├── test.sh
│   └── start.sh
└── public/
```

## 5. Testing

- Unit: `vitest` or `jest`.
- Component: `@testing-library/react`.
- E2E: `playwright` for critical user journeys.
- Aim for ≥ 70% coverage on new code.

## 6. API integration

- Prefer typed clients generated from OpenAPI specs.
- Keep base URLs configurable via environment variables.
- Handle loading, error, and empty states explicitly.

## 7. Styling

- Use CSS variables for theming.
- Keep styles co-located with components or in a `styles/` folder.
- Ensure responsive layouts; test at mobile widths.

## 8. Environment variables

- Prefix client-side variables with `VITE_` (Vite) or the framework's convention.
- Never commit `.env`; provide `.env.example`.

## 9. Accessibility

- Use semantic HTML.
- Add `alt` text to images.
- Ensure keyboard navigation for interactive elements.

## 10. Common commands

```bash
# setup
npm install

# dev
npm run dev

# test
npm run test
npm run test:e2e

# build
npm run build
npm run lint
npm run typecheck
```
