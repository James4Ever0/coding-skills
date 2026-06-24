---
name: conversation-recall
description: "Summarize previous coding conversations and extract reusable skills, decisions, and patterns. Trigger: 'summarize conversation', 'extract skills', '/recall'."
kind: workflow
user-invocable: true
---

# Conversation Recall

Mine past conversations for reusable guidance and project context.

## Workflow

1. **Locate the JSONL log** for the project, usually under `~/.claude/projects/<project>/`.
2. **Compile the log** with the VCC tool (`conversation-compiler` skill) into `.min.txt` and `.txt` views.
3. **Read the `.min.txt`** to get the outline.
4. **Search** for key topics: decisions, architecture changes, bugs, workarounds, user preferences.
5. **Extract**:
   - Reusable skills or prompts
   - Project-specific constraints
   - Decision rationale
   - Tips and tricks
6. **Write findings** to `.claude/memory/` or the project's `.tips_and_tricks/` folder.
7. **Cross-check** extracted facts against current files; do not assume old context is still true.

## Output Artifacts

- Memory file in `.claude/memory/<slug>.md`
- Updated `.tips_and_tricks/` notes
- Optional skill proposal under `historical_skills/`

## Rules

- Always verify old claims against the current repo state.
- Link related memories with `[[name]]` syntax.
- Never re-derive absolute paths that only exist on one machine.
- Preserve user preferences and corrections.
- Project paths must be relative or use environment variables; no machine-only absolute paths.
