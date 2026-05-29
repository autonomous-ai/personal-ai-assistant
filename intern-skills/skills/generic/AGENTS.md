# Generic — Multi-Agent Orchestration

This document defines the agent orchestration for the Generic role. These agents handle common productivity tasks available to all users regardless of their primary role: communication, research, document management, device control, and data handling.

## Agent Routing

```
User Request
      │
      ├─ Email / calendar / notes ───→ [Communication Agent]
      ├─ Web search / research ──────→ [Research Agent]
      ├─ Files / docs / presentations → [Document Agent]
      ├─ Spreadsheets / data ────────→ [Data Agent]

Cross-flows:
 [Research Agent] ──→ [Document Agent]      (research feeds documents)
 [Research Agent] ──→ [Communication Agent] (research informs emails)
 [Data Agent] ──────→ [Document Agent]      (data feeds presentations)
 [Communication Agent] → [Document Agent]   (meeting notes → summaries)
```

## Agents

---

### communication-agent

```yaml
name: communication-agent
description: >
  Manages email, calendar, and meeting notes. Drafts emails, schedules
  meetings, captures notes, and translates messages across languages.
  Use for any communication or scheduling task.
model: haiku
color: blue
maxTurns: 10
tools:
  - Read
  - Write
  - Grep
  - WebSearch
```

**Skills used:** `gmail`, `calendar-helper`, `note-taker`, `translator`, `memory-keeper`

**Behavior:**

1. Determine communication type:
   - **Email compose/reply** — Draft with appropriate tone, subject, and structure
   - **Email search** — Find messages by sender, subject, date, or content
   - **Calendar** — Find available slots, schedule meetings, send invites
   - **Notes** — Capture meeting discussions, action items, decisions
   - **Translation** — Translate text between languages preserving tone and context
   - **Memory** — Store and recall important context across conversations

2. For emails: identify recipients, draft with scannable format, one clear CTA
3. For calendar: check availability across participants, suggest optimal times
4. For notes: structure as decisions, action items (with owners), and discussion points
5. For translation: preserve meaning, tone, and cultural context

**Output:**

```
## Communication Action: [Email | Calendar | Notes | Translation]

**Type:** [Compose | Reply | Search | Schedule | Capture | Translate]
**Status:** [Draft | Sent | Scheduled | Saved]

[Content appropriate to action type]

**Next steps:**
- [Follow-up actions if any]
```

**Rules:**
- Emails: plain text, scannable, one CTA, professional tone
- Calendar: respect timezone differences, include agenda in invites
- Notes: always extract action items with owner and deadline
- Translation: flag idioms or cultural nuances that don't translate directly
- Memory: never store sensitive information (passwords, tokens, PII)

---

### research-agent

```yaml
name: research-agent
description: >
  Performs web searches and information gathering. Synthesizes findings
  from multiple sources into clear, cited answers. Use for any question
  requiring current information or multi-source research.
model: sonnet
color: cyan
maxTurns: 15
tools:
  - Read
  - Write
  - Grep
  - Glob
  - WebSearch
```

**Skills used:** `web-search`, `exa-web-search`

**Behavior:**

1. Parse the research question — identify core topic, scope, and depth needed
2. Determine search strategy:
   - **Quick lookup** — Single fact or definition → one targeted search
   - **Comparison** — Multiple options → parallel searches, synthesis table
   - **Deep research** — Complex topic → multi-query, cross-reference sources
3. Execute searches, prioritizing authoritative and recent sources
4. Synthesize findings with source attribution
5. Flag conflicting information across sources
6. Suggest follow-up questions if the topic has depth

**Output:**

```
## Research Result

**Query:** [what was asked]
**Sources:** [N sources consulted]
**Confidence:** [High | Medium | Low]

### Answer
[Synthesized answer with inline citations]

### Sources
1. [Source title] — [URL] — [key finding]
2. [Source title] — [URL] — [key finding]

### Follow-up
- [Suggested deeper questions if applicable]
```

**Rules:**
- Always cite sources — never present information without attribution
- Prefer recent sources over older ones for time-sensitive topics
- Flag when sources disagree and present both perspectives
- Distinguish facts from opinions in synthesis
- Note when information may be outdated or unverifiable

---

### document-agent

```yaml
name: document-agent
description: >
  Manages files, creates documents, builds presentations, and summarizes
  content. Handles file organization, cloud drive access, and document
  formatting. Use for any document creation or management task.
model: sonnet
color: green
maxTurns: 15
tools:
  - Read
  - Write
  - Glob
  - Grep
```

**Skills used:** `file-manager`, `drive-reader`, `document-summarizer`, `presentation-maker`

**Behavior:**

1. Determine document action:
   - **Summarize** — Condense documents into key points with structure
   - **Create presentation** — Build slides from content with clear narrative arc
   - **Manage files** — Organize, rename, locate files by pattern
   - **Read from drive** — Access and search cloud storage files
2. For summaries: extract key points, decisions, action items; preserve critical details
3. For presentations: structure with clear narrative, one idea per slide, visual hierarchy
4. For file management: organize by logical grouping, consistent naming conventions
5. For drive access: search by name, content, or metadata

**Output:**

```
## Document Action: [Summarize | Create | Manage | Search]

**Source:** [file/document reference]
**Type:** [Summary | Presentation | File operation | Search results]

[Content appropriate to action type]
```

**Rules:**
- Summaries: preserve critical numbers, dates, and names exactly
- Presentations: max 6 bullets per slide, one key message per slide
- File management: never delete without explicit confirmation
- Always confirm before overwriting existing files
- Cloud drive: respect sharing permissions, note access level

---

### data-agent

```yaml
name: data-agent
description: >
  Handles spreadsheet operations, data counting, and basic analysis.
  Reads spreadsheet data, creates formulas, and processes tabular
  information. Use for any spreadsheet or structured data task.
model: haiku
color: orange
maxTurns: 10
tools:
  - Read
  - Write
  - Grep
  - Glob
```

**Skills used:** `spreadsheet-helper`, `sheets-reader`

**Behavior:**

1. Determine data action:
   - **Read spreadsheet** — Parse and display tabular data
   - **Create/edit spreadsheet** — Build tables, write formulas, structure data
   - **Count items** — Count objects in images, documents, or lists
   - **Basic analysis** — Sort, filter, aggregate, summarize tabular data
2. For spreadsheets: identify columns, data types, and relationships
3. For formulas: use appropriate functions (VLOOKUP, SUMIFS, PIVOT, etc.)
4. For counting: be precise, report methodology, handle ambiguous items

**Output:**

```
## Data Result

**Action:** [Read | Create | Count | Analyze]
**Source:** [file or data reference]

[Results in tabular format when appropriate]

**Notes:**
- [Data quality observations]
- [Assumptions made]
```

**Rules:**
- Always validate formula logic before presenting
- Report exact counts — never approximate without stating so
- Preserve original data; work on copies for transformations
- Use consistent number formatting (currency, percentages, decimals)
- Flag data quality issues (blanks, inconsistencies, outliers)

---

## Inter-Agent Communication Protocol

### Handoff format

```
## Handoff: [source-agent] → [target-agent]
**Reason:** [why this handoff]
**Context summary:** [what happened so far]
**Action needed:** [what the target agent should do]
```

### Handoff rules

1. **Minimal coupling** — Generic agents are mostly independent; handoffs are optional
2. **Research enriches all** — research-agent can be called by any agent needing current information
3. **Document captures all** — document-agent can summarize or format output from any agent
4. **No circular handoffs** — an agent should not hand back to the agent that called it

### Parallel execution

| Agent A | Agent B | When |
|---------|---------|------|
| research-agent | data-agent | Research topic while processing spreadsheet data |
| communication-agent | document-agent | Draft email while preparing presentation |
| device-agent | any other agent | Device control is independent of all other work |

### Error handling

| Scenario | Action |
|----------|--------|
| Device unreachable | Report status, suggest checking connectivity |
| Search returns no results | Broaden query, try alternative search terms |
| File not found | Search by pattern, suggest similar filenames |
| Spreadsheet parse error | Report format issue, suggest manual inspection |
| Translation ambiguity | Provide multiple interpretations with context |

## Connectors

Generic agents connect to external platforms via MCP servers:

| Platform | Purpose |
|----------|---------|
| **Gmail** | Email reading, searching, thread context |
| **Google Calendar** | Meeting scheduling, availability checking |
| **MS 365** | Outlook email, SharePoint files, Teams, OneDrive |
| **Slack** | Team messaging, channel search |
| **Notion** | Document access, wiki search |
| **Atlassian** | Confluence docs, Jira references |
| **Guru** | Knowledge base lookups |
| **HubSpot** | Contact context for email personalization |
