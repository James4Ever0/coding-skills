# API Service Projects

> **Scope**: REST, GraphQL, gRPC, and event-driven backend services.

---

## 1. Project Layout

```text
.
├── cmd/                  # Service entry points
├── internal/
│   ├── domain/           # Business logic, no external deps
│   ├── service/          # Use-case orchestration
│   ├── repo/             # Data access
│   ├── transport/        # HTTP/gRPC handlers
│   └── config/
├── api/
│   └── openapi.yaml      # API contract
├── scripts/
│   ├── build.sh
│   ├── test.sh
│   └── run-local.sh
├── docs/
│   └── api.md            # LLM-readable API summary
└── README.md
```

---

## 2. Design Principles

- Validate all input at the transport boundary.
- Keep domain logic free of framework and I/O concerns.
- Depend on abstractions (interfaces/ports) for data access and external services.
- Return consistent response envelopes and error shapes.

---

## 3. REST Conventions

- Use nouns for resources (`/users`, `/orders/{id}`).
- Use HTTP verbs semantically (`GET`, `POST`, `PUT`, `PATCH`, `DELETE`).
- Return `201 Created` with a `Location` header for creations.
- Return `409 Conflict` for duplicate resources, `422 Unprocessable Entity` for validation errors.
- Version public APIs (`/v1/...`).

---

## 4. GraphQL / gRPC

- GraphQL: keep resolvers thin; delegate to domain services.
- gRPC: define `.proto` as the source of truth; generate server and client stubs.
- Either way, maintain a human-readable summary in `docs/api.md`.

---

## 5. Authentication and Authorization

- Use standard mechanisms (OAuth2, JWT, session cookies, mTLS).
- Never roll your own crypto.
- Validate tokens at the edge and propagate identity to domain services.

---

## 6. Observability

- Emit structured logs with request IDs.
- Expose health (`/health`) and readiness (`/ready`) endpoints.
- Add metrics and tracing for critical paths.

---

## 7. Testing

- Unit-test domain logic.
- Integration-test handlers with an in-memory or test database.
- Contract-test external service boundaries.
- Run load tests for throughput-sensitive endpoints.

---

## 8. Deployment

- Containerize with a small base image.
- Make the service configurable via environment variables.
- Provide a local run script and a docker-compose file for integration testing.
