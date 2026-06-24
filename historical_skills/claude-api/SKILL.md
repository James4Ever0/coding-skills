---
name: claude-api
description: "Build or debug applications using the Anthropic API / Claude SDK. Trigger: 'claude api', 'anthropic sdk', 'tool use', 'messages api', 'claude agent'."
kind: workflow
user-invocable: true
---

# Claude API Development

Build, test, and debug applications that call the Anthropic API or use the Anthropic SDK.

## Workflow

1. **Set up the client**:
   - Use the official SDK for the language (`anthropic` for Python, `@anthropic-ai/sdk` for TypeScript, etc.).
   - Load the API key from the environment (`ANTHROPIC_API_KEY`); never hard-code it.
   - Pin the SDK version.

2. **Design the prompt**:
   - Be explicit about the model's role, task, and output format.
   - Use system prompts for stable behavior instructions.
   - Keep user prompts focused; include only relevant context.

3. **Use tool use correctly**:
   - Define tool schemas with clear names, descriptions, and typed parameters.
   - Validate tool outputs before acting on them.
   - Handle tool_use_result blocks properly in the conversation loop.

4. **Handle streaming and errors**:
   - Stream responses for long outputs or real-time UIs.
   - Retry on rate limits and transient errors with exponential backoff.
   - Surface API errors to the user without leaking internal details.

5. **Test and evaluate**:
   - Write unit tests for prompt construction and response parsing.
   - Run integration tests against the API with small, cheap prompts.
   - Evaluate output quality with sample inputs and expected formats.

6. **Debug**:
   - Log request IDs, model names, and token usage.
   - Inspect raw request/response bodies when behavior is unexpected.
   - Check token counts and context limits.

## Output Artifacts

- Working client code
- Prompt templates
- Tool schemas
- Test cases
- Debug notes

## Rules

- Never commit API keys.
- Use the latest stable model family unless the user specifies otherwise.
- Validate all inputs before sending them to the API.
- Respect rate limits and token budgets.
- Log enough context to reproduce issues without exposing secrets.
