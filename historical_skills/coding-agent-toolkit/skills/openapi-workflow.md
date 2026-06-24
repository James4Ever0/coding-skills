---
name: openapi-workflow
description: Design OpenAPI-compatible servers, generate openapi.json, and convert it to markdown for LLM interaction.
user-invocable: true
allowed-tools:
  - Bash
  - Read
  - Write
  - Edit
  - Agent
---

# openapi-workflow

Build APIs that are easy for humans and LLMs to consume.

## When to use

- The user asks about OpenAPI, API specs, or generating `openapi.json`.
- You are designing a backend that will be consumed by a frontend or other clients.
- You want an LLM-friendly summary of the API surface.

## Procedure

1. **Choose server library** that emits OpenAPI natively or via a plugin:
   - Python: FastAPI
   - TypeScript/Node: NestJS, tRPC with OpenAPI generator, or Express + swagger-jsdoc
   - Go: gin + swag, Fiber + swagger
   - Rust: utoipa, poem-openapi
   - Java: SpringDoc OpenAPI

2. **Design endpoints** around resources and HTTP verbs; keep paths noun-based.

3. **Define schemas** with validation (Pydantic, Zod, struct tags, etc.).

4. **Generate `openapi.json`** as part of the build process.

5. **Summarize to markdown**: create `docs/api.md` from `openapi.json` with operation tables, request/response examples, and error codes.

6. **Expose spec**: serve `/openapi.json` and `/docs` (Swagger UI or Scalar) in development.

7. **Verify**: run the server, call each endpoint, and confirm the spec matches behavior.

## Output

- Server source files
- `openapi.json` (generated, checked in only if consumers need it)
- `docs/api.md`
- `scripts/generate-api-docs.sh`

## Rules

- Keep schemas single-source-of-truth in code, not in the JSON file.
- Version the spec path (`/v1/openapi.json`).
- Markdown summary must include at least one example per operation.
- Do not expose admin/debug endpoints in the public spec without auth documentation.
