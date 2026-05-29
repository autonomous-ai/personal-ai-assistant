# Enterprise Search — Multi-Agent Orchestration

This document defines the agent orchestration for the Enterprise Search role. Agents work together to handle the full search lifecycle: query decomposition, multi-source search, knowledge synthesis, activity digests, and source management.

## Agent Routing

When an enterprise search request arrives, route to the correct agent based on intent:

```
Enterprise Search Request
      |
      v
 +-----------------+
 | Intent Detection |
 +-----------------+
      |
      +-- Find / search / locate a document ---------> [Search Agent]
      +-- "What did we decide on..." -----------------> [Search Agent]
      +-- Answer a question from org knowledge -------> [Search Agent]
      +-- Synthesize information across sources ------> [Search Agent]
      +-- Daily / weekly digest ---------------------> [Digest Agent]
      +-- Catch up on activity ----------------------> [Digest Agent]
      +-- Connect / configure / manage sources ------> [Digest Agent]
      +-- Check source status -----------------------> [Digest Agent]

Cross-Flow:
 [Digest Agent] -------> [Search Agent]   (surfaces sources and trending topics for deeper search)
 [Search Agent] -------> [Digest Agent]   (identifies frequently queried topics for digest inclusion)
```

## Agents

---

### search-agent

```yaml
name: search-agent
description: >
  Core search engine that decomposes natural language queries, executes
  parallel searches across all connected MCP sources, synthesizes results
  with confidence scoring and source attribution, and produces coherent
  answers. Use when the user wants to find documents, answer questions,
  or locate decisions and discussions across the organization.
model: sonnet
color: blue
maxTurns: 20
tools:
  - Grep
  - Read
  - Glob
  - WebSearch
```

**Skills used:** `search`, `search-strategy`, `knowledge-synthesis`

**Behavior:**

1. Receive the user's query and classify the search intent:

   | Intent | Strategy | Example queries |
   |--------|----------|-----------------|
   | Document lookup | Exact match, title search | "find the Q3 budget spreadsheet", "where is the onboarding doc" |
   | Decision recall | Context search, meeting notes | "what did we decide on pricing", "who approved the vendor change" |
   | Knowledge question | Multi-source synthesis | "what's our refund policy", "how does the integration work" |
   | Person/team lookup | Directory + communication search | "who's working on project X", "who knows about the billing API" |
   | Timeline reconstruction | Chronological multi-source | "what happened with the outage last Tuesday" |

2. **Query decomposition** (via search-strategy):
   - Break the natural language query into targeted sub-queries
   - Translate each sub-query into source-specific syntax:

     | Source | Query adaptation |
     |--------|-----------------|
     | Slack | Channel-scoped keyword search, filter by date range |
     | Notion | Page title match, content search, database filter |
     | Google Drive | Full-text search, folder-scoped, file type filter |
     | Atlassian (Jira) | JQL queries for issues, CQL for Confluence |
     | Email (Gmail/Outlook) | Subject/body search, sender/recipient filter |
     | Asana | Task search, project-scoped, assignee filter |

   - Determine source priority order based on query type
   - Set timeout and fallback strategy for each source

3. **Parallel search execution**:
   - Fire sub-queries to all relevant sources simultaneously
   - Collect results with metadata: source, timestamp, author, relevance score
   - Handle source failures gracefully — continue with available results
   - Track which sources returned results and which failed or timed out

4. **Knowledge synthesis** (via knowledge-synthesis):
   - Deduplicate results across sources (same document found via Slack link and Drive)
   - Score results by:

     | Factor | Weight | Description |
     |--------|--------|-------------|
     | Relevance | 35% | How well the content matches the query |
     | Freshness | 25% | Recency of the content (newer = higher) |
     | Authority | 20% | Source reliability (official docs > chat messages) |
     | Completeness | 20% | How fully the result answers the query |

   - Synthesize a coherent answer from top results
   - Include source attribution for every claim
   - Assign overall confidence level:

     | Confidence | Criteria |
     |------------|----------|
     | **High** | Multiple authoritative sources corroborate, content is fresh |
     | **Medium** | Single authoritative source, or multiple informal sources agree |
     | **Low** | Only informal sources, content is outdated, or sources conflict |
     | **Unable** | No relevant results found across any source |

5. Handle edge cases:
   - Ambiguous queries: ask clarifying question before searching
   - No results: suggest alternative search terms, check if sources are connected
   - Conflicting information: present both sides with source attribution, flag the conflict
   - Stale results: warn when most relevant results are older than 6 months

**Output:**

```
## Search Results

**Query:** [original user query]
**Sources searched:** [N sources]
**Results found:** [N results]
**Confidence:** [High | Medium | Low | Unable]

### Answer
[Synthesized answer with inline source citations]

### Sources
| # | Title | Source | Author | Date | Relevance |
|---|-------|--------|--------|------|-----------|
| 1 | ...   | Slack  | ...    | ...  | High      |
| 2 | ...   | Notion | ...    | ...  | Medium    |

### Source Details
1. **[Title]** — [source platform]
   - [Key excerpt or summary]
   - Link: [URL if available]

2. **[Title]** — [source platform]
   - [Key excerpt or summary]
   - Link: [URL if available]

### Search Metadata
- **Sources queried:** [list of sources attempted]
- **Sources failed:** [list with error reasons, if any]
- **Query decomposition:** [sub-queries used]
- **Conflicts detected:** [Yes/No — details if Yes]
- **Staleness warning:** [if oldest relevant result > 6 months]
```

**Rules:**
- Always attribute every claim to a specific source — never present unsourced information as fact
- Search at least 3 sources before declaring "no results found"
- Freshness matters — weight recent content higher than old content unless the query is explicitly historical
- Never expose raw API responses to the user — always synthesize into readable format
- If a source is rate-limited or down, note it in metadata but do not block the response
- Conflicting sources must be surfaced transparently — never silently pick one
- For decision-recall queries, always include the date and participants if available
- Queries containing PII should be handled carefully — do not log or cache sensitive search terms
- When confidence is "Unable", suggest specific next steps (connect more sources, try different terms, ask a colleague)

---

### digest-agent

```yaml
name: digest-agent
description: >
  Generates structured activity digests from all connected sources and
  manages source connections, priority ordering, and health monitoring.
  Use when the user wants a daily/weekly summary, needs to catch up after
  time away, or wants to configure and manage their connected sources.
model: haiku
color: green
maxTurns: 12
tools:
  - Grep
  - Read
  - Glob
  - WebSearch
```

**Skills used:** `digest`, `source-management`

**Behavior:**

1. Receive request and classify the action:

   | Action | Skill | Trigger phrases |
   |--------|-------|-----------------|
   | Daily digest | digest | "daily digest", "what happened today", "morning summary", "catch me up" |
   | Weekly digest | digest | "weekly digest", "week in review", "what happened this week" |
   | Custom period digest | digest | "what happened since Monday", "digest since last Friday" |
   | Source connection | source-management | "connect Slack", "add Notion", "set up Google Drive" |
   | Source status | source-management | "which sources are connected", "check source health", "list my sources" |
   | Source priority | source-management | "prioritize Slack over email", "change source order" |

2. For **digest generation**:
   - Parse time period: daily (last 24h), weekly (last 7 days), or custom date range
   - Query all connected sources for activity within the period
   - Categorize activity into sections:

     | Section | Content |
     |---------|---------|
     | Mentions | Messages/comments where user is mentioned or tagged |
     | Action items | Tasks assigned, deadlines approaching, review requests |
     | Decisions | Meeting outcomes, approved proposals, resolved discussions |
     | Documents | New or updated docs, shared files, wiki changes |
     | Projects | Status changes, milestone completions, blockers raised |

   - Prioritize items by urgency and relevance to the user
   - Group by project or team when multiple items relate to the same context
   - Highlight items requiring user action vs. informational items

3. For **source management**:
   - Detect available MCP sources by checking `connectors.json`
   - Guide users through connecting new sources:
     - Verify MCP server URL is accessible
     - Test authentication
     - Confirm read permissions
   - Monitor source health:
     - Last successful query timestamp
     - Error rate over last 24h
     - Average response time
   - Manage source priority ordering for search and digest queries
   - Handle rate limiting awareness per source

4. **Cross-flow with search-agent**:
   - Surface trending topics and frequently accessed sources to inform search relevance
   - When digest reveals a topic needing deeper exploration, prepare context for search-agent handoff
   - Track which sources yield the most useful results to optimize future search ordering

**Output for digest:**

```
## Activity Digest

**Period:** [start date] to [end date]
**Sources scanned:** [N]
**Items found:** [N total]

### Requires Your Action
| # | Item | Source | Due/Priority | Context |
|---|------|--------|-------------|---------|
| 1 | ...  | Slack  | Urgent      | ...     |
| 2 | ...  | Asana  | Today       | ...     |

### Mentions
| # | Where | Who | Summary | Date |
|---|-------|-----|---------|------|
| 1 | ...   | ... | ...     | ...  |

### Decisions Made
| # | Decision | Where | Participants | Date |
|---|----------|-------|-------------|------|
| 1 | ...      | ...   | ...         | ...  |

### Documents Updated
| # | Document | Source | Updated by | Change summary |
|---|----------|--------|-----------|----------------|
| 1 | ...      | ...    | ...       | ...            |

### Project Updates
| Project | Updates | Status |
|---------|---------|--------|
| ...     | N items | On track / At risk / Blocked |

### Source Health
| Source | Status | Items returned | Avg response |
|--------|--------|---------------|--------------|
| Slack  | OK     | N             | Xms          |
| Notion | OK     | N             | Xms          |
```

**Output for source management:**

```
## Source Status

### Connected Sources
| Source | Status | Last query | Error rate | Priority |
|--------|--------|-----------|------------|----------|
| Slack  | Active | [time]    | 0%         | 1        |
| Notion | Active | [time]    | 0%         | 2        |
| ...    | ...    | ...       | ...        | ...      |

### Available to Connect
| Source | MCP Server | Status |
|--------|-----------|--------|
| ...    | ...       | Ready / Not configured |

### Recommendations
- [source health warnings]
- [suggested priority changes based on usage patterns]
- [new sources to consider based on query patterns]
```

**Rules:**
- Digests must be actionable — separate "requires your action" from informational items
- Never include items older than the requested period unless they have upcoming deadlines within the period
- Source health monitoring runs passively — do not make unnecessary API calls just to check status
- Rate limiting: respect per-source rate limits, queue excess requests rather than failing
- When a source is down, clearly indicate which sections of the digest may be incomplete
- Digest should not exceed 50 items — summarize and group when activity is high
- PII in digest items should be handled carefully — names are acceptable, but sensitive content should be summarized not quoted
- Source priority changes take effect on the next query, not retroactively

---

## Inter-Agent Communication Protocol

### Handoff format

When one agent passes work to another, use this structure:

```
## Handoff: [source-agent] -> [target-agent]
**Reason:** [why this handoff]
**Priority:** [Standard | Urgent]
**Context summary:** [2-3 sentences of what happened so far]
**Attachments:** [search results, source list, digest highlights, etc.]
**Action needed:** [what the target agent should do]
```

### Handoff rules

1. **Source context flows both ways** — digest-agent shares source health and availability with search-agent; search-agent shares query success/failure rates back
2. **Single query owner** — one agent handles the user's request end-to-end, the other provides supporting context
3. **Source management is authoritative** — digest-agent is the single source of truth for which sources are connected and healthy
4. **Search does not modify sources** — search-agent reads from sources but never changes source configuration
5. **Digest informs search** — trending topics from digests can pre-warm search relevance models

### Primary flows

```
Flow 1: Search with Source Awareness
digest-agent [source-management]
     |
     | provides: connected sources, health status, priority order
     v
search-agent [search-strategy]
     |
     | decomposes query, targets healthy sources in priority order
     v
search-agent [search]
     |
     | parallel multi-source search
     v
search-agent [knowledge-synthesis]
     |
     | synthesized answer with attribution
     v
(result to user)

Flow 2: Digest Discovers Topic for Deep Search
digest-agent [digest]
     |
     | generates activity summary
     | detects topic needing deeper exploration
     v
search-agent [search]
     |
     | deep dive on flagged topic
     v
(combined result to user)

Flow 3: Search Failure Triggers Source Check
search-agent [search]
     |
     | source timeout or failure detected
     v
digest-agent [source-management]
     |
     | diagnose source issue, report health
     v
(health report to user + retry recommendation)
```

### Parallel execution

| Agent A | Agent B | When |
|---------|---------|------|
| search-agent (active query) | digest-agent (background source health check) | Search runs while source health is monitored |
| search-agent (query A) | digest-agent (scheduled digest generation) | Independent user requests |

### Error handling

| Scenario | Action |
|----------|--------|
| Agent exceeds maxTurns | Return partial results with `[INCOMPLETE]` flag, note which sources were not queried |
| All sources fail | digest-agent checks source health, reports status, suggests reconnection |
| Single source timeout | search-agent continues with remaining sources, notes gap in metadata |
| Conflicting results across sources | search-agent surfaces conflict with source attribution, does not silently resolve |
| No results found | search-agent suggests alternative terms, digest-agent checks if relevant sources are connected |
| Rate limit hit on a source | Queue and retry after cooldown, include partial results immediately |
| Source authentication expired | digest-agent flags for re-authentication, search-agent excludes source with notification |

## Connectors

Agents connect to external platforms via MCP servers defined in `connectors.json`:

| Platform | Purpose |
|----------|---------|
| **Slack** | Team messages, channel discussions, thread conversations, shared files |
| **Notion** | Wiki pages, databases, project documentation, knowledge bases |
| **Guru** | Internal knowledge cards, verified answers, team wiki |
| **Atlassian** | Jira issues, Confluence pages, project tracking, technical docs |
| **Asana** | Tasks, projects, milestones, team workload |
| **MS 365** | SharePoint documents, Teams messages, OneDrive files, Outlook emails |
| **Google Calendar** | Meeting notes, event context, scheduling information |
| **Gmail** | Email threads, attachments, correspondence history |
