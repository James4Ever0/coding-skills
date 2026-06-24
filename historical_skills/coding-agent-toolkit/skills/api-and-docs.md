---
name: api-and-docs
description: Build OpenAPI-compatible servers, generate openapi.json, and summarize APIs into LLM-friendly markdown.
user-invocable: true
allowed-tools:
  - Bash
  - Read
  - Write
  - Edit
  - Agent
---

# api-and-docs

Make the backend easy for humans and machines to consume.

## Procedure

1. **Prefer OpenAPI-compatible frameworks**
   - Python: FastAPI, Flask + apispec, Django REST Framework
   - Node/TS: Express + tsoa, NestJS, Fastify + @fastify/swagger
   - Go: Gin + swag, Fiber + swagger, standard library + ogen
   - Rust: axum + utoipa, actix-web + paperclip

2. **Generate `openapi.json`**
   - Add the framework's OpenAPI plugin.
   - Export the spec as part of the build or startup.
   - Commit `openapi.json` only if it is stable and reviewed; otherwise generate it in CI.

3. **Summarize the API for LLMs**
   - Convert `openapi.json` into a concise markdown file (`docs/api.md`).
   - Include: base URL, auth method, resource names, key endpoints, request/response shapes, and error codes.
   - Keep the summary current whenever routes change.

4. **Validate the spec**
   - Use `swagger-codegen`, `openapi-generator`, or online validators.
   - Run contract tests against the generated spec.

5. **Document examples**
   - Add at least one `curl` example per important endpoint.
   - Keep examples copy-pasteable but free of real secrets.

## Output

- OpenAPI annotations or schema definitions in source code.
- A generated or committed `openapi.json`.
- `docs/api.md` LLM-friendly summary.
- Example requests in README or docs.

## Caution

- Do not expose internal admin endpoints in the public spec unless intended.
- Redact real hostnames and API keys from generated docs.
