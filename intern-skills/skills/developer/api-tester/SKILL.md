---
name: api-tester
description: >
  Tests and validates API endpoints by constructing requests, executing them, and verifying responses.
  Use when the user says "test this API", "send a request to this endpoint", "generate a curl command",
  "validate this response", "check if this endpoint works", "debug this API call",
  "test my REST endpoint", or "verify API behavior".
---

# API Tester

## Quick Start
Parse the endpoint details, construct test requests covering both happy path and error cases, execute them, and validate responses against expected status codes, schemas, and response times.

## Workflow
1. Extract endpoint details: HTTP method, URL, path/query params, headers, auth scheme, and request body
2. Build a test matrix: happy path, validation errors (400), auth failures (401), not found (404), and edge cases
3. Execute each test case, capture the full response (status, headers, body, time), and validate against expectations
4. Compile results into a structured test report with pass/fail for each case

## Examples

**Example 1: Test a REST endpoint**
Input: "Test GET /api/v1/users/123 with Bearer token"
Output:
```
## Test Cases

### 1. Happy Path - Get existing user
$ curl -s -w "\nTime: %{time_total}s" \
  -H "Authorization: Bearer $API_TOKEN" \
  https://api.example.com/api/v1/users/123

Status: 200 OK | Time: 0.142s
Body: { "id": "123", "name": "Jane Doe", "email": "jane@example.com" }
Result: PASS

### 2. Auth Failure - No token
$ curl -s https://api.example.com/api/v1/users/123

Status: 401 Unauthorized
Body: { "error": { "code": "UNAUTHORIZED", "message": "Missing auth token" } }
Result: PASS

### 3. Not Found - Non-existent user
$ curl -s -H "Authorization: Bearer $API_TOKEN" \
  https://api.example.com/api/v1/users/999999

Status: 404 Not Found
Body: { "error": { "code": "NOT_FOUND", "message": "User not found" } }
Result: PASS

## Summary
Total: 3 | Passed: 3 | Failed: 0
Avg Response Time: 0.138s
```

**Example 2: Test a POST endpoint with validation**
Input: "Test creating a user at POST /api/v1/users"
Output:
```
## Test Cases

### 1. Happy Path - Valid user creation
$ curl -s -X POST \
  -H "Authorization: Bearer $API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"email":"new@example.com","name":"New User"}' \
  https://api.example.com/api/v1/users

Status: 201 Created
Result: PASS

### 2. Validation Error - Missing required field
$ curl -s -X POST \
  -H "Authorization: Bearer $API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"name":"No Email User"}' \
  https://api.example.com/api/v1/users

Status: 400 Bad Request
Body: { "error": { "code": "VALIDATION_ERROR", "message": "email is required" } }
Result: PASS

### 3. Duplicate - Existing email
$ curl -s -X POST \
  -H "Authorization: Bearer $API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"email":"existing@example.com","name":"Dupe"}' \
  https://api.example.com/api/v1/users

Status: 409 Conflict
Result: PASS

## Summary
Total: 3 | Passed: 3 | Failed: 0
```

## Tools
- Use `Bash` with `curl` to execute HTTP requests and capture responses
- Use `Read` to load API specification files (OpenAPI/Swagger) or existing test files
- Use `Grep` to search for endpoint definitions and route handlers in the codebase
- Use `Glob` to discover test files, API route files, or specification documents

## Error Handling
- If the HTTP method is not specified → infer from context or ask for clarification
- If auth details are missing → ask for the auth mechanism (remind not to share production secrets)
- If the endpoint returns 5xx → suggest checking server logs and provide common troubleshooting steps
- If the response does not match the spec → highlight every discrepancy between expected and actual

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~code repository | Read route definitions and OpenAPI specs directly from the repo |
| ~monitoring | Correlate test results with server-side logs and performance metrics |
| ~documentation | Pull API specs and endpoint documentation to auto-generate test cases |

## Rules
- Always test both success AND error cases for every endpoint
- Validate the full response schema, not just the status code
- Never hardcode auth tokens -- use environment variables or placeholders like `$API_TOKEN`
- Test idempotency for PUT and DELETE operations
- Test pagination for list endpoints (first page, last page, out-of-range)
- Include edge cases: empty body, special characters, max payload size

## Output Template
```
## Endpoint
[METHOD] [URL]
Auth: [type] | Content-Type: [type]

## Test Cases

### 1. [Test name]
$ curl [command]
Status: [code] [text] | Time: [ms]
Body: [response]
Result: [PASS / FAIL]

### 2. [Test name]
...

## Summary
Total: [N] | Passed: [N] | Failed: [N]
Avg Response Time: [ms]
Schema Validation: [PASS / FAIL]
```

## Related Skills
- `debug-assistant` — Diagnose root causes when API tests reveal failures
- `doc-generator` — Generate API documentation from tested endpoint behavior
- `code-reviewer` — Review the endpoint implementation for correctness and security
