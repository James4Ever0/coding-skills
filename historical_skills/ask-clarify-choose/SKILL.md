---
name: ask-clarify-choose
description: "Ask the user to clarify ambiguous requirements and present researched choices with recommendations. Trigger: 'clarify', 'what are my options', 'help me choose'."
kind: workflow
user-invocable: true
---

# Ask, Clarify, and Choose

When requirements are ambiguous or the implementation could go multiple ways, research options and present them to the user with a recommendation.

## Workflow

1. **Restate the goal** in your own words and identify missing facts.
2. **Research options**: look at existing code, libraries, docs, or GitHub projects that could serve as reference.
3. **List 2–4 viable approaches** with trade-offs (complexity, risk, maintainability, performance).
4. **Recommend one** and explain why.
5. **Ask for missing values**: IP, port, environment, API key, mirror preference, language/stack.
6. **Wait for confirmation** before proceeding with a non-reversible or broad change.

## Output Artifacts

- Short options comparison (markdown)
- Recommended approach
- List of needed user inputs

## Rules

- Do not pick a default that hides a real decision from the user.
- Reference code sections and file paths when discussing trade-offs.
- Offer research-backed options; avoid guesses.
- Capture the final choice in `docs/decisions/` or the task plan.
