---
name: verify-run
description: "Verify code changes by building, running, and testing the artifact. Trigger: 'verify', 'run the tests', 'test this', 'smoke test', 'check it works'."
kind: workflow
user-invocable: true
---

# Verify and Run

Every implementation must be verified. Run tests, build the artifact, and exercise at least one end-to-end path.

## Workflow

1. **Run automated tests**:
   - Use the project's test command (`scripts/test.sh`, `go test ./...`, `pytest`, `npm test`, etc.).
   - Capture pass/fail status and file names.
   - If tests fail, fix them or escalate.

2. **Build the artifact**:
   - Run the build command (`scripts/build.sh`, `go build`, `npm run build`, etc.).
   - Ensure no compiler warnings that indicate real issues.

3. **Run a smoke test**:
   - For a CLI: invoke the built binary with a representative command.
   - For a web app: start the dev server and load the page.
   - For an API: send a request to a representative endpoint.
   - For a library: run the example code or integration test.

4. **Capture proof of work**:
   - Save logs, screenshots, curl output, or terminal output when useful.
   - Tell the user how to reproduce the verification.

5. **Report results**:
   - State plainly what passed and what failed.
   - Include exact commands run.
   - Do not hedge when reporting failures.

## Output Artifacts

- Test output summary
- Build result
- Smoke-test evidence (logs, screenshots, etc.)

## Rules

- Never declare work done without running tests.
- If a verification step cannot be automated, write explicit manual steps.
- Report failures honestly; do not suppress them.
- Prefer running the actual artifact over static inspection.
