# Prototyping Memory Setup

Memory files live at `/home/jamesbrown/.claude/projects/-home-jamesbrown-mounts-rainbow-coding-skills/memory/`.

## File Convention

| File | Purpose |
|------|---------|
| `prototyping-workflow.md` | Current active prototype, milestone, conversion target |
| `prototyping-decisions.md` | ADR-format decisions (test framework choice, etc.) |
| `prototyping-cautions.md` | Recurring gotchas |

## Recording Decisions

Use lightweight ADR format:

```markdown
## YYYY-MM-DD: Title

**Context:** Why this decision was needed.
**Decision:** What was chosen.
**Consequence:** What it means for future work.
```

## When to Write

- Starting a new prototype → update `prototyping-workflow.md`.
- Making a design decision → append to `prototyping-decisions.md`.
- Discovering a gotcha → append to `prototyping-cautions.md`.

## When Starting a New Project Session

1. Read `prototyping/PROTOTYPING_HOWTO.md` first.
2. Ask the user for missing info (ref URLs, existing code, requirements, TODOs, target path, language).
3. Update memory files as the session progresses.
