---
name: security-review
description: "Review code for security issues before merging. Trigger: 'security review', 'is this secure', 'check for vulnerabilities', 'security audit'."
kind: workflow
user-invocable: true
---

# Security Review

Scan changes for common security issues before they reach production.

## Workflow

1. **Identify the attack surface**:
   - New endpoints, CLI flags, config options, file paths, network calls.
   - Places where user input enters the system.

2. **Check input handling**:
   - Is all user input validated and sanitized?
   - Are file paths normalized and restricted?
   - Are there injection risks (SQL, command, XPath, template)?

3. **Check secrets and credentials**:
   - Are secrets hard-coded?
   - Are they logged or returned in errors?
   - Is `.env` or similar excluded from version control?

4. **Check authentication and authorization**:
   - Are protected endpoints authenticated?
   - Are permissions checked at the right layer?
   - Are tokens handled securely?

5. **Check dependencies**:
   - Are new dependencies from reputable sources?
   - Are they pinned and audited?
   - Do they introduce unnecessary permissions?

6. **Check output and errors**:
   - Are internal stack traces hidden from users?
   - Are error messages informative without leaking internals?
   - Is sensitive data excluded from logs?

7. **Summarize findings**:
   - List issues by severity.
   - Provide concrete remediation steps.
   - Escalate critical issues to the user immediately.

## Output Artifacts

- Security review summary
- Severity-ranked findings
- Remediation recommendations

## Rules

- Do not assume a library is safe; check how it is used.
- Prefer parameterized queries and safe APIs over escaping.
- Treat all user input as untrusted until validated.
- Never commit secrets, keys, or credentials.
- When in doubt, escalate to the user.
