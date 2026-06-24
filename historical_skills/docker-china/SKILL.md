---
name: docker-china
description: "Docker setup with China mirrors, containerization, Dockerfile generation, and CI job submission. Trigger: 'dockerize', 'Dockerfile', 'CI job', 'containerize'."
kind: workflow
user-invocable: true
---

# Docker China + Containerization

Build, run, and ship containerized applications with China-friendly registry mirrors.

## Workflow

1. **Check Docker installation** (`docker --version`, `docker compose version`). Suggest install if missing.
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
   Restart Docker daemon after change.
3. **Pick base image** matching the project runtime with a pinned tag (e.g. `python:3.11-slim`, `node:20-alpine`).
4. **Write `Dockerfile`**:
   - Multi-stage when build artifacts differ from runtime.
   - Non-root user when possible.
   - Pin package versions if installing via package manager.
   - Clean up caches in the same layer they are created.
5. **Write `.dockerignore`**: skip local env files, logs, dependency caches, build artifacts.
6. **Write `docker-compose.yml` / `compose.yaml`** if local services (DB, cache, reverse proxy) are needed.
7. **Write `scripts/docker-build.sh` and `scripts/docker-run.sh`**.
8. **Submit CI job** if requested: generate a `.github/workflows/ci.yml` or GitLab CI snippet that builds, tests, and pushes the image.
9. **Verify**: build the image and run a smoke test.

## Output Artifacts

- `Dockerfile`
- `.dockerignore`
- `docker-compose.yml` / `compose.yaml` (if needed)
- `scripts/docker-build.sh`
- `scripts/docker-run.sh`
- CI pipeline file (if requested)

## Rules

- Pin base image digests or tags; never use `latest` in production pipelines.
- Keep image layers cacheable; copy dependency manifests before source code.
- Do not bake secrets into images.
- Use build args only for non-sensitive configuration.
- Ask for host port and environment name before hard-coding them.
