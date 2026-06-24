# Docker Guide

## Tooling

- **Engine**: Docker, Podman, or Colima
- **Compose**: `docker compose` v2 (preferred) or legacy `docker-compose`
- **Registry**: local registry, Docker Hub, GHCR, or cloud vendor registries
- **China mirror**: configure daemon registry mirrors for pull speed

## Project Layout

```
project/
├── Dockerfile
├── .dockerignore
├── compose.yaml
├── scripts/
│   ├── docker-build.sh
│   └── docker-run.sh
└── README.md
```

## China Mirrors

Edit `/etc/docker/daemon.json` (Linux) or Docker Desktop settings:

```json
{
  "registry-mirrors": [
    "https://docker.mirrors.sjtug.sjtu.edu.cn",
    "https://hub-mirror.c.163.com",
    "https://mirror.baidubce.com"
  ]
}
```

Then restart Docker.

## Conventions

- Pin base image versions: `FROM python:3.11.4-slim`, not `FROM python:latest`.
- Use multi-stage builds for compiled languages.
- Run containers as non-root user when possible.
- Keep `.dockerignore` strict: exclude `.git`, `.env`, build artifacts, caches.
- Expose documented ports; accept host/port via environment variables.
- Health checks for long-running services.

## Scripts

```bash
# scripts/docker-build.sh
docker build -t "${IMAGE:-myapp}:$(git rev-parse --short HEAD)" .

# scripts/docker-run.sh
docker run -p "${PORT:-8080}:8080" --env-file .env.example "${IMAGE:-myapp}:latest"
```

## Common Gotchas

- Don't commit `.env` or secrets into images.
- Don't run `apt-get upgrade` blindly in Dockerfiles; pin package versions if needed.
- Don't bind-mount sensitive host paths without explicit user consent.
- Clean up package caches in the same layer they are created.

## Logging

Forward container logs to stdout/stderr; use the runtime's log driver for rotation. For long-lived containers, configure `log-opts` (`max-size`, `max-file`).

## Reference Projects

When designing containerized deployments, clone reference Docker setups into `reference/` and summarize reusable patterns in `docs/library-notes/`.
