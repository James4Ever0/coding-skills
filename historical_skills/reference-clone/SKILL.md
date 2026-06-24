---
name: reference-clone
description: "Find and clone reference open-source projects for imitation, simplification, or customization. Trigger: 'find reference project', 'clone example', 'github reference', 'similar project'."
kind: workflow
user-invocable: true
---

# Reference Clone

Find and clone reference open-source projects so you can imitate, simplify, and customize proven patterns instead of inventing them from scratch.

## Workflow

1. **Clarify the target**: summarize the feature/domain in 1–2 sentences (e.g., "pure-Rust terminal recorder with internal VT emulator").
2. **Search for references**:
   - Use web search with specific keywords and language filters.
   - Search GitHub topics and awesome-lists.
   - Ask the user for projects they already know.
3. **Evaluate candidates** against:
   - License compatibility
   - Maintenance status (recent commits, issues responded to)
   - Scope match (small focused project vs. large framework)
   - Dependency tree size and platform restrictions
   - Presence of tests and documentation
4. **Clone the best 1–3 candidates** into a `reference/` or `refs/` folder at the project root.
5. **Annotate**: create a short `reference/README.md` listing each cloned repo, why it was chosen, and which files are most relevant.
6. **Read key files**: entry points, core modules, tests, and build config.
7. **Summarize**: write `docs/library-notes/<project>.md` covering:
   - What problem it solves
   - Public API / key modules
   - Build and test commands
   - What to reuse vs. reimplement
8. **Imitate or vendor**: copy/adapt only the needed parts; do not blindly depend on the whole repo.
9. **Verify**: build the reference and run its tests to confirm it works in your environment.

## Output Artifacts

- `reference/` folder with cloned repos
- `reference/README.md`
- `docs/library-notes/<project>.md`
- Notes on what to reuse

## Rules

- Respect licenses; include attribution when copying code.
- Do not commit large reference repos if avoidable; use shallow clones (`git clone --depth 1`).
- Exclude `reference/` from the main build and from production artifacts.
- Do not treat a reference project as a dependency unless it is published and maintained.
- Prefer small, focused references over large frameworks.
