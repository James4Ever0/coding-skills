---
name: deep-research
description: "Conduct multi-source research on a technical topic and synthesize findings. Trigger: 'research', 'deep dive', 'investigate', 'compare options', 'survey'."
kind: workflow
user-invocable: true
---

# Deep Research

Research a technical question across code, docs, conversation history, and the web, then synthesize a concise, actionable summary.

## Workflow

1. **Clarify the question**:
   - What decision or implementation depends on the answer?
   - What constraints matter (language, license, maturity, performance)?

2. **Search available sources**:
   - Project files and documentation.
   - Conversation history (`/searchchat`, `/recall`).
   - Web search for recent information, docs, and alternatives.
   - Reference projects or open-source repos for patterns.

3. **Evaluate options**:
   - List candidates with pros, cons, and trade-offs.
   - Note version compatibility and maintenance status.
   - Identify risks and unknowns.

4. **Synthesize findings**:
   - Start with a one-paragraph recommendation.
   - Provide supporting evidence and source links.
   - Include concrete next steps.

5. **Record reusable knowledge**:
   - If the finding is likely to be needed again, save it to `.claude/memory/` or `docs/decisions/`.

## Output Artifacts

- Research summary with recommendation
- Option comparison table
- Source links
- Decision record if applicable

## Rules

- Prefer primary sources (official docs, source code) over secondary summaries.
- Note the date of the research; stale information can mislead.
- Distinguish facts from opinions.
- When uncertain, say so and list what would reduce uncertainty.
- Do not include machine-specific paths in shared artifacts.
