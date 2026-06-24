---
name: ask-clarify-choose
description: Ask the user to clarify ambiguous requirements and present researched choices with recommendations.
user-invocable: true
allowed-tools:
  - Read
  - Agent
  - WebSearch
  - WebFetch
  - AskUserQuestion
---

# ask-clarify-choose

When requirements are ambiguous or the implementation could go multiple ways, research options and present them to the user with a recommendation.

## When to use

- Requirements are vague or contradictory.
- Multiple valid approaches exist.
- Missing values would change the implementation (IP, port, environment, API key, mirror preference, language/stack).
- The user asks "what are my options" or "help me choose".

## Procedure

1. **Restate the goal** in your own words and identify missing facts.

2. **Research options**:
   - Look at existing code, libraries, docs, or GitHub projects that could serve as reference.
   - Use web search for well-known solutions.

3. **List 2–4 viable approaches** with trade-offs:
   - Complexity
   - Risk
   - Maintainability
   - Performance
   - Cost

4. **Recommend one** and explain why.

5. **Ask for missing values**:
   - IP, port, environment name
   - API key or secret location
   - Mirror preference
   - Language/stack

6. **Wait for confirmation** before proceeding with a non-reversible or broad change.

## Output

- Short options comparison (markdown)
- Recommended approach
- List of needed user inputs

## Rules

- Do not pick a default that hides a real decision from the user.
- Reference code sections and file paths when discussing trade-offs.
- Offer research-backed options; avoid guesses.
- Capture the final choice in `docs/decisions/` or the task plan.
- Use `AskUserQuestion` when the choice has concrete previews or trade-offs to compare.
