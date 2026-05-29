---
name: debug-assistant
description: >
  Diagnoses bugs, errors, and unexpected behavior by tracing root causes and providing fixes.
  Use when the user says "debug this", "why is this not working", "fix this error",
  "I'm getting an exception", "help me troubleshoot", "trace this bug",
  "my app is crashing", or "something is broken".
---

# Debug Assistant

## Quick Start
Collect the error evidence, trace to the root cause (not just the symptom), and provide a concrete fix with verification steps. Always ask "Did it work before? What changed?" to narrow the search.

## Workflow
1. Collect evidence: error message, stack trace, reproduction steps, environment details, and recent changes
2. Parse the error to identify the type, originating file/line, and call chain; classify as runtime, logic, type, network, state, build, config, or performance issue
3. Formulate 2-3 ranked hypotheses, verify by reading code and tracing data flow
4. Provide a concrete fix addressing the root cause, with verification steps and a prevention recommendation

## Examples

**Example 1: TypeError from null access**
Input: "I'm getting `TypeError: Cannot read properties of undefined (reading 'map')`"
Output:
```
## Root Cause Analysis
The variable you're calling `.map()` on is `undefined` at the time of the call. This typically means:
1. **Most likely**: An API response hasn't loaded yet and the component renders before data arrives
2. **Alternative**: The API response shape changed and the expected field no longer exists

## Fix
Add a guard before the `.map()` call:
// Before
const items = data.results.map(item => ...)

// After
const items = (data?.results ?? []).map(item => ...)

Or use early return in the component:
if (!data?.results) return <Loading />

## Verification
- Confirm the component renders without error on initial load
- Confirm data displays correctly once the API responds
- Check the API response shape matches what the code expects

## Prevention
- Add a test that renders the component with `data = undefined`
- Add TypeScript strict null checks if not enabled
```

**Example 2: CORS error**
Input: "Getting CORS error when calling my API from localhost:3000"
Output:
```
## Root Cause Analysis
The browser blocks cross-origin requests when the API server doesn't include the correct `Access-Control-Allow-Origin` header.

## Fix
Add CORS middleware to your API server:

// Express
import cors from 'cors'
app.use(cors({ origin: 'http://localhost:3000' }))

## Verification
- Open DevTools Network tab, confirm the preflight OPTIONS request returns 200
- Confirm the response includes `Access-Control-Allow-Origin: http://localhost:3000`

## Prevention
- Configure allowed origins via environment variable for different environments
```

## Tools
- Use `Read` to inspect source files referenced in the stack trace
- Use `Grep` to search for related patterns, error handling, or usages of the failing function
- Use `Glob` to discover related files (tests, configs, type definitions) that may hold clues
- Use `Bash` to run diagnostic commands, tests, or check logs
- Use `Bash` with `git log` or `git diff` to identify recent changes that may have introduced the bug

## Error Handling
- If only a vague description is given ("it doesn't work") → ask for the specific error message, reproduction steps, and environment
- If the stack trace is truncated → ask for the full output
- If the bug cannot be reproduced → guide through systematic reproduction steps
- If multiple bugs are present → triage by severity and address the most critical first

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~code repository | Access source files and recent diffs to correlate changes with bugs |
| ~monitoring | Pull live error logs, metrics, and traces to speed up diagnosis |
| ~CI/CD | Inspect build logs and failing test output for additional context |
| ~issue tracker | Look up related bug reports and link fixes to existing tickets |

## Rules
- Always read the ENTIRE error message and stack trace before forming hypotheses
- Never fix symptoms -- trace back to the root cause
- Present hypotheses ranked by likelihood with clear reasoning
- After fixing, always recommend writing a test that covers the exact failure case
- Do not assume the user's environment -- ask when in doubt (Node version, OS, package versions)

## Output Template
```
## Error
[Exact error message or description]

## Root Cause Analysis
Origin: [File:Line] in [Function]
Cause: [Why the error occurs]
Reasoning: [Evidence chain leading to this conclusion]

## Hypotheses (ranked)
1. [Most likely] - [Supporting evidence]
2. [Alternative] - [Supporting evidence]

## Fix
[Before/after code comparison]

## Verification
- [How to confirm the fix works]
- [How to check for regressions]

## Prevention
- [ ] Add test covering this failure case
- [ ] [Additional safeguards]
```

## Related Skills
- `code-reviewer` — Review the fix for correctness before committing
- `api-tester` — Verify API endpoints work correctly after applying the fix
- `git-helper` — Bisect commits or revert changes to isolate the bug
