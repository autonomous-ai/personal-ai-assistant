---
name: code-reviewer
description: >
  Reviews code for correctness, security, performance, and readability.
  Use when the user says "review this code", "check my PR", "is this code good",
  "find issues in this file", "give me feedback on my changes", "code review",
  "check this MR", "evaluate code quality", "find code smells", "review my pull request",
  "audit this code", "check for vulnerabilities", or "rate this implementation".
---

# Code Reviewer

## Quick Start
Analyze the provided code or file and deliver a structured review with actionable findings categorized by severity. Prioritize: Security > Correctness > Performance > Readability > Style.

## Workflow
1. Identify the input type (snippet, file path, diff, or PR reference) and determine language/framework
2. Scan the code for issues across all review dimensions: security vulnerabilities, correctness bugs, performance problems, readability concerns, DRY violations, error handling gaps, and missing tests
3. Categorize each finding by severity (Critical / Warning / Suggestion) with a concrete fix
4. Acknowledge strengths and deliver a verdict (Approve / Request Changes / Comment)

## Examples

**Example 1: Security issue in user input handling**
Input: "Review this Express route handler"
```javascript
app.get('/users', (req, res) => {
  const query = `SELECT * FROM users WHERE name = '${req.query.name}'`
  db.execute(query).then(rows => res.json(rows))
})
```
Output:
```
## Findings

### Critical (Must Fix)
**app.js:2** - SQL Injection vulnerability
User input is directly interpolated into SQL query string, allowing attackers to execute arbitrary SQL.
Suggested fix:
  const query = 'SELECT * FROM users WHERE name = ?'
  db.execute(query, [req.query.name]).then(rows => res.json(rows))

### Warning (Should Fix)
**app.js:2** - Missing input validation
No validation on `req.query.name` before use. Add schema validation with Zod or Joi.

### Warning (Should Fix)
**app.js:3** - Missing error handling
No `.catch()` handler on the promise. Unhandled rejection will crash the server.

## Verdict: Request Changes
Critical SQL injection must be fixed before merge.
```

**Example 2: Clean code**
Input: "Review this utility function"
```typescript
function clamp(value: number, min: number, max: number): number {
  return Math.min(Math.max(value, min), max)
}
```
Output:
```
## Summary
Clean, well-typed utility function with correct logic.

### Positives
- Proper TypeScript types on all params and return value
- Concise single-expression implementation

## Verdict: Approve
```

## Tools
- Use `Read` to load file contents when given a file path
- Use `Grep` to search for related patterns, usages, or duplicated logic across the codebase
- Use `Glob` to discover related files (tests, configs, types) for context
- Use `Bash` to run linters, type checkers, or test suites to validate findings

## Error Handling
- If no code or file path is provided → ask the user to share the code to review
- If the file path does not exist → report the error and ask for the correct path
- If the language cannot be determined → ask the user to clarify before applying language-specific rules
- If the change is too large (>500 lines) → suggest splitting the PR first

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~code repository | Pull diffs and file contents directly from PRs/MRs for seamless review |
| ~CI/CD | Correlate review findings with build/test failures and pipeline status |
| ~issue tracker | Link findings to existing issues or auto-create tickets for critical items |

## Rules
- Review the code, not the author -- keep tone constructive and respectful
- Explain WHY something is an issue, not just WHAT to change
- Always provide a concrete code suggestion for Critical and Warning findings
- Skip formatting nitpicks if a linter/prettier config is already in place
- Never approve code with known security vulnerabilities

## Output Template
```
## Summary
[1-2 sentence overview of the change and quality assessment]

## Findings

### Critical (Must Fix)
**[File:Line]** - [Title]
[Why it matters]
Suggested fix: [code]

### Warning (Should Fix)
**[File:Line]** - [Title]
[Explanation and impact]

### Suggestion (Nice to Have)
**[File:Line]** - [Title]
[Explanation and benefit]

### Positives
- [Good patterns or clean code worth calling out]

## Verdict: [Approve / Request Changes / Comment]
[Brief justification]
```

## Related Skills
- `debug-assistant` — Diagnose and fix the bugs uncovered during code review
- `doc-generator` — Generate or update documentation for reviewed code
- `git-helper` — Manage branches and commits related to review feedback
