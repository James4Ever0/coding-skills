# Milestone File Schema

Every milestone file in `prototyping/milestones/` must follow this structure.

## Required Sections

```markdown
# Milestone NNN: Title

## Checklist

- [ ] Step 1 description
- [ ] Step 2 description
- [ ] ...

## Completion Criteria

- [ ] All checklist items complete
- [ ] Tests pass (`./scripts/run-tests.sh`)
- [ ] Skill markdown extracted and verified
- [ ] MILESTONE.md status updated

## Status

**Status:** Not Started | In Progress | Blocked | Done

**Notes:**
- Optional context or blockers.
```

## Status Values

| Status | Meaning |
|--------|---------|
| Not Started | Not yet begun |
| In Progress | Actively being worked on |
| Blocked | Waiting on something (specify what) |
| Done | All completion criteria met |

## File Naming

Files go in `prototyping/milestones/` with the pattern:

```
milestone-NNN-description.md
```

Where `NNN` is a zero-padded 3-digit number and `description` is a short kebab-case name.
