# CODING_RULES.md — APIs and Documentation

> Rules for designing, documenting, and summarizing APIs.

## 1. OpenAPI-first

- Design routes using OpenAPI-compatible frameworks.
- Generate `openapi.json` automatically from code annotations.
- Validate the spec with `openapi-generator` or online validators.

## 2. Framework choices

- Python: FastAPI
- Node/TS: NestJS, Fastify + Swagger, Express + tsoa
- Go: Gin + swag, Fiber + swagger
- Rust: axum + utoipa

## 3. Spec hygiene

- Tag endpoints by resource.
- Provide summary and description for each route.
- Define request/response schemas explicitly.
- Document error responses and status codes.

## 4. LLM-friendly summary

- Keep a `docs/api.md` derived from `openapi.json`.
- Include:
  - Base URL
  - Authentication method
  - Resource overview
  - Key endpoints with examples
  - Common error codes
- Regenerate `docs/api.md` whenever routes change significantly.

## 5. Examples

- Provide at least one `curl` example per important endpoint.
- Use placeholder values for tokens, IDs, and hostnames.
- Keep examples copy-pasteable for onboarding.

## 6. Versioning

- Include an API version in the path (`/v1/...`) or header.
- Document breaking changes in a changelog.

## 7. Security

- Use standard auth (Bearer, OAuth2, API keys) and document it.
- Do not expose admin/internal endpoints in public docs unless intended.
- Redact real hostnames and keys from generated documentation.

## 8. Client generation

- Generate typed clients from `openapi.json` when possible.
- Commit generated clients only if they are stable; otherwise generate in CI.

## 9. Documentation structure

```
docs/
├── api.md              # LLM-friendly summary
├── openapi.json        # machine-readable spec
└── examples/
    └── curl.sh
```

## 10. Example `docs/api.md` outline

```markdown
# API Reference

## Base URL
`https://api.example.com/v1`

## Authentication
Bearer token in `Authorization` header.

## Resources

### Users

- `GET /users` — list users
- `POST /users` — create user
- `GET /users/{id}` — get user

#### Example

```bash
curl https://api.example.com/v1/users \
  -H "Authorization: Bearer YOUR_TOKEN"
```
```
