# Web Application Projects

> **Scope**: browser-facing applications, SPAs, SSR apps, and full-stack web products.

---

## 1. Project Layout

```text
.
├── apps/
│   └── web/              # Frontend application
├── packages/
│   ├── ui/               # Shared UI components
│   ├── lib/              # Shared utilities
│   └── api/              # API client / contracts
├── server/               # Backend API (if full-stack)
├── scripts/
├── docs/
├── README.md
└── package.json / pnpm-workspace.yaml / turbo.json
```

---

## 2. Frontend

- Use a component framework suited to the team (React, Vue, Svelte, etc.).
- Keep state management explicit; prefer local state, then URL state, then a store.
- Validate external data with typed schemas (Zod, io-ts, Yup).
- Make the app bootable per git worktree for agent verification.
- Write component and integration tests with Playwright, Vitest, or Jest.

---

## 3. Backend

- Expose OpenAPI-compatible endpoints; keep `openapi.json` or `docs/api.md` up to date.
- Parse and validate request bodies at the boundary.
- Return consistent error shapes with actionable messages.
- Use structured logging and request correlation IDs.

---

## 4. API Contracts

- Share TypeScript types or generated clients between frontend and backend.
- Version public APIs in the URL (`/v1/...`) or via headers.
- Document auth patterns, rate limits, and error codes.

---

## 5. Styling and Design

- Use a design system or component library to avoid one-off styles.
- Prefer CSS variables or a theme object for colors, spacing, and typography.
- Keep responsive breakpoints consistent.

---

## 6. Verification

- Run the dev server and verify in a browser or via Playwright.
- Capture screenshots or DOM snapshots for UI changes.
- Test critical user journeys end-to-end.

---

## 7. Deployment

- Build artifacts should be deterministic and cacheable.
- Keep environment-specific config out of the bundle.
- Provide a staging URL or local launch script for manual verification.
