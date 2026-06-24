---
name: docker-china
description: Docker setup with China registry mirrors, containerization, Dockerfile generation, compose files, and CI job submission.
user-invocable: true
allowed-tools:
  - Bash
  - Read
  - Write
  - Edit
---

# docker-china

Build, run, and ship containerized applications with China-friendly registry mirrors.

## When to use

- The user asks to dockerize, containerize, write a Dockerfile, or submit a CI job.
- Docker Hub access is slow or unreliable.
- Local services (database, cache, reverse proxy) are needed for development.

## Procedure

1. **Check Docker installation**:
   - `docker --version`
   - `docker compose version`
   - Suggest install if missing.

2. **Configure China mirror** in `/etc/docker/daemon.json` (Linux) or Docker Desktop settings:
   ```json
   {
     "registry-mirrors": [
       "https://docker.mirrors.sjtug.sjtu.edu.cn",
       "https://docker.mirrors.ustc.edu.cn",
       "https://hub-mirror.c.163.com",
       "https://mirror.baidubce.com"
     ]
   }
   ```
   Restart Docker daemon after change. Ask the user before changing system-wide config.

3. **Pick a pinned base image** matching the project runtime:
   - `python:3.11-slim`
   - `node:20-alpine`
   - `golang:1.26-alpine`
   - `rust:1.85-slim`
   - `eclipse-temurin:21-jdk-alpine`

4. **Write `Dockerfile`**:
   - Multi-stage when build artifacts differ from runtime.
   - Non-root user when possible.
   - Pin package versions if installing via package manager.
   - Clean up caches in the same layer they are created.

5. **Write `.dockerignore`**:
   - Skip local env files, logs, dependency caches, build artifacts, and `.git`.

6. **Write `docker-compose.yml` / `compose.yaml`** if local services are needed.

7. **Write helper scripts**:
   - `scripts/docker-build.sh`
   - `scripts/docker-run.sh`

8. **Submit CI job** if requested:
   - Generate `.github/workflows/ci.yml` or GitLab CI snippet.
   - Build, test, and push the image.

9. **Verify**: build the image and run a smoke test.

## Output

- `Dockerfile`
- `.dockerignore`
- `docker-compose.yml` / `compose.yaml` (if needed)
- `scripts/docker-build.sh`
- `scripts/docker-run.sh`
- CI pipeline file (if requested)

## Rules

- Pin base image tags or digests; never use `latest` in production pipelines.
- Keep image layers cacheable; copy dependency manifests before source code.
- Do not bake secrets into images.
- Use build args only for non-sensitive configuration.
- Ask for host port and environment name before hard-coding them.
- Respect OS conventions for log paths.
