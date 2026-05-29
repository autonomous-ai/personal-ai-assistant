---
name: doc-generator
description: >
  Generates technical documentation including READMEs, JSDoc/TSDoc comments, changelogs, and API docs.
  Use when the user says "document this code", "add JSDoc comments", "create a README",
  "generate a changelog", "write API docs", "add TSDoc to this function",
  "generate documentation", or "write inline comments".
---

# Doc Generator

## Quick Start
Identify what needs documenting and for whom, then generate accurate documentation with copy-paste-ready examples. Documentation must match the current code -- outdated docs are worse than none.

## Workflow
1. Determine the doc type (README, JSDoc/TSDoc, API docs, changelog, ADR) and identify the target (function, module, project, endpoint)
2. Read and understand the source code to accurately capture behavior, parameters, return values, side effects, and error conditions
3. Generate documentation with working examples, cross-references, and consistent terminology

## Examples

**Example 1: JSDoc for a function**
Input: "Add JSDoc to this function"
```typescript
async function fetchUser(id: string, options?: { includeOrders: boolean }) {
  if (!id) throw new ValidationError('User ID is required')
  const user = await db.user.findUnique({ where: { id }, include: { orders: options?.includeOrders } })
  if (!user) throw new NotFoundError('User')
  return user
}
```
Output:
```typescript
/**
 * Fetches a user by ID with optional related data.
 *
 * @param id - The unique user identifier
 * @param options - Optional configuration
 * @param options.includeOrders - When true, includes the user's order history
 * @returns The user object, optionally with orders
 * @throws {ValidationError} If id is empty
 * @throws {NotFoundError} If no user exists with the given id
 *
 * @example
 * const user = await fetchUser('usr_123')
 *
 * @example
 * const userWithOrders = await fetchUser('usr_123', { includeOrders: true })
 * console.log(userWithOrders.orders) // Order[]
 */
```

**Example 2: README Quick Start section**
Input: "Generate a README for my Express API project"
Output:
```markdown
# My API

> RESTful API for user and order management

## Quick Start
pnpm install
cp .env.example .env
pnpm dev

## Features
- User CRUD with JWT authentication
- Order management with pagination
- Input validation with Zod
- Structured error responses

## Installation
pnpm install
cp .env.example .env    # Configure DATABASE_URL and JWT_SECRET
pnpm db:migrate         # Run database migrations
pnpm dev                # Start dev server on http://localhost:3000

## API Reference
| Method | Endpoint         | Description       |
|--------|-----------------|-------------------|
| GET    | /api/v1/users   | List users        |
| POST   | /api/v1/users   | Create user       |
| GET    | /api/v1/users/:id | Get user by ID  |

## Contributing
1. Create a branch: `git checkout -b feat/your-feature`
2. Commit using Conventional Commits: `feat(users): add email verification`
3. Open a PR against `main`
```

**Example 3: Changelog entry**
Input: "Generate changelog for version 2.1.0"
Output:
```markdown
## [2.1.0] - 2026-03-18

### Added
- User email verification flow with magic link
- Rate limiting on auth endpoints (100 req/min)

### Changed
- Upgraded Zod from v3.21 to v3.22
- Improved error response format to include `code` field

### Fixed
- Race condition in concurrent order creation
- Missing CORS headers on preflight requests
```

## Tools
- Use `Read` to load source files, existing docs, and config files
- Use `Grep` to find function signatures, exported symbols, route definitions, and existing doc comments
- Use `Glob` to discover related files (tests for usage examples, type definitions, config files)
- Use `Bash` to run documentation generators like `typedoc` or `jsdoc`

## Error Handling
- If the target is not specified → ask what code, module, or project to document
- If source code has no type information → ask about parameter types and return values rather than guessing
- If existing docs conflict with current code → flag the discrepancy and update docs to match code
- If scope is too broad ("document everything") → suggest starting with the public API surface

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~code repository | Read source files and commit history to generate accurate, up-to-date docs |
| ~documentation | Publish generated docs directly to wiki or documentation platform |
| ~CI/CD | Auto-generate changelogs from merged PRs and release tags |
| ~issue tracker | Link documentation updates to feature tickets and release milestones |

## Rules
- Documentation must match the current code exactly
- Every function doc must include at least one working example
- README installation steps must be copy-paste-ready with zero debugging
- Inline comments explain WHY, not WHAT -- the code already shows what it does
- Do not document the obvious (trivial getters, self-explanatory one-liners)
- Use consistent terminology -- do not alternate between synonyms for the same concept

## Output Template
```
## Target
[What is being documented]

## Audience
[Who will read this]

---

[Generated documentation in the appropriate format: JSDoc, README, Changelog, etc.]
```

## Related Skills
- `code-reviewer` — Review code to understand what needs documenting
- `api-tester` — Test endpoints to generate accurate API documentation
- `git-helper` — Generate changelogs from commit history and tags
