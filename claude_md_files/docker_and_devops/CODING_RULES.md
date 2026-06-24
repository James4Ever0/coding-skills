# CODING_RULES.md — Docker and DevOps

> Rules for containerization, CI/CD scripts, and remote job submission.

## 1. Dockerfiles

- Use official base images with pinned tags (`python:3.12-slim`, `node:20-alpine`).
- Prefer small base images when possible.
- Pin package versions installed via `apt`, `pip`, or `npm`.
- Use multi-stage builds for compiled or frontend artifacts.
- Run the container as a non-root user.

## 2. Layer caching

- Copy dependency manifests (`requirements.txt`, `package.json`) before source code.
- Install dependencies before copying the rest of the project.
- Keep `.dockerignore` up to date.

## 3. Example `.dockerignore`

```
.git
venv/
node_modules/
tmp/
logs/
.env
*.md
Dockerfile*
docker-compose*
```

## 4. docker-compose

- Define services, networks, and volumes explicitly.
- Use `.env` files for environment-specific values.
- Mount only the directories the service actually needs.

## 5. Mirrors

- Use regional package mirrors inside the container when appropriate:
  - pip: Tsinghua / Aliyun
  - npm: npmmirror
  - apt: Tsinghua / Aliyun
- Configure mirrors in the Dockerfile or via build args, not by mutating the host.

## 6. CI / remote jobs

- Write CI configs as YAML in `.github/workflows/`, `.gitlab-ci.yml`, or equivalent.
- Keep CI steps small and cacheable.
- Use environment variables for secrets; never hard-code credentials.
- Provide a `scripts/submit-ci.sh` for custom remote job submission if needed.

## 7. Scripts

- Provide `scripts/build-image.sh`, `scripts/run-container.sh`, and `scripts/push-image.sh`.
- Make scripts executable (`chmod +x`) and add shebangs.
- Use relative paths; accept tag/version as arguments.

## 8. Secrets

- Never commit `.env`, SSH keys, or kubeconfig files.
- Mount secrets at runtime, not at build time, unless the build truly needs them.
- Use Docker BuildKit secret mounts when build-time secrets are unavoidable.

## 9. Health checks

- Add `HEALTHCHECK` instructions in long-running service images.
- Expose only the ports the service actually uses.

## 10. Common commands

```bash
# build
bash scripts/build-image.sh v1.0.0

# run locally
docker compose up --build

# push
bash scripts/push-image.sh v1.0.0
```
