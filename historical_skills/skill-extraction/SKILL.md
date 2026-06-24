---
name: skill-extraction
description: "Summarize a coding conversation or project and extract reusable skills, patterns, and CLAUDE.md guidance. Trigger: 'extract skills', 'summarize conversation', 'turn this into a skill', 'codify learnings'."
kind: workflow
user-invocable: true
---

# Skill Extraction

Turn a coding conversation, debugging session, or completed project into reusable skills and documentation so future agents benefit from the same lessons.

## Workflow

1. **Collect source material**:
   - The current conversation transcript (via `/recall` or `/readchat`)
   - Plan files, `Plans.md`, or `docs/plans/`
   - `CLAUDE.md`, `CODING_RULES.md`, and `.tips_and_tricks/`
   - Commits and code changes
2. **Identify recurring patterns**:
   - Commands or scripts the agent kept running
   - Gotchas and their fixes
   - Decision points and trade-offs
   - Verification steps that proved progress
   - Special workflows or debug tricks
3. **Extract candidate skills**:
   - A workflow skill if a repeatable process exists.
   - A caution/tip if it is a one-line guardrail.
   - A CLAUDE.md rule if it should apply to every session.
4. **Write or update a skill** under `historical_skills/<skill-name>/SKILL.md`:
   - Frontmatter: `name`, `description`, `kind`, `user-invocable`.
   - A short `# Title`.
   - `## Workflow` with numbered steps.
   - `## Output Artifacts`.
   - `## Rules`.
5. **Update CLAUDE.md or CODING_RULES.md** if the learning is universal.
6. **Update `.tips_and_tricks/`** if the learning is project-specific.
7. **Report**: list the new/updated skills and where to find them.

## Output Artifacts

- New or updated `historical_skills/<skill-name>/SKILL.md`
- Updated `CLAUDE.md` / `CODING_RULES.md` / per-language guide (if universal)
- Updated `.tips_and_tricks/` note (if project-specific)

## Rules

- Do not include absolute paths or machine-specific values.
- Keep descriptions actionable and trigger-friendly.
- One skill per concern; split broad lessons into multiple focused skills.
- Link related skills with cross-references.
- Only extract lessons that actually appeared in the source material; avoid invented wisdom.
