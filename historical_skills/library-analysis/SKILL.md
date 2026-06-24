---
name: library-analysis
description: "Analyze unknown code and libraries before usage; summarize key areas and plan verification. Trigger: 'analyze library', 'what does this do', 'unknown dependency'."
kind: workflow
user-invocable: true
---

# Library Analysis

Understand unknown code or dependencies before relying on them.

## Workflow

1. **Locate the source**: package manager cache, GitHub repo, vendored folder, or local file.
2. **Read the entry point and public API** (exports, main module, README).
3. **Identify the features relevant to the user's task**.
4. **Summarize key areas**:
   - What problem it solves
   - Public API surface
   - Configuration options and defaults
   - Error handling patterns
   - Side effects (network, filesystem, global state)
   - License and maintenance status
5. **Plan verification**: write a small test script or spike to prove the library behaves as expected.
6. **Recommend**: use, replace, vendor, or avoid; suggest simpler alternatives if applicable.

## Output Artifacts

- `docs/library-notes/<library-name>.md`
- Small verification script in `spikes/` or `scripts/verify-<library>.sh`

## Rules

- Do not trust a library's marketing copy; read source for behavior-critical details.
- Prefer libraries with stable APIs and strong representation in training data.
- When in doubt, implement a minimal version in-repo rather than fight opaque upstream behavior.
- Document version constraints and why the library was chosen.
