---
name: memory-keeper
description: >
  Periodically extracts important context from the current session, writes it to memory.md,
  then compacts the session to free up context window. Runs automatically via cronjob every
  2 hours. Also triggers when the user says "save memory", "remember this", "compact session",
  "clean session", "store this for later", "don't forget this", "save what we discussed",
  "free up context", or when context usage feels heavy.
metadata: {"openclaw":{"emoji":"🧠","cronjob":"0 */2 * * *"}}
---

# Memory Keeper

## Quick Start

Scan the current session for valuable context, write it to `{baseDir}/memory.md`, then run `/compact` to summarize and compress the session history.

## Workflow

1. Read current `{baseDir}/memory.md` if it exists (to avoid duplicating existing entries)
2. Scan the session history for:
   - User preferences and working style
   - Key decisions made
   - Ongoing tasks and their status
   - Important facts, names, numbers, deadlines
   - Frequently referenced resources or paths
3. Merge new findings into `{baseDir}/memory.md` — update existing entries, append new ones
4. Run `/compact` to compress the session
5. Confirm silently — do NOT send a message to the user unless triggered manually

## Examples

**Example 1 — Cronjob run (silent):**
Session contains: user prefers English, working on a React project, deadline Friday.

→ Appends to memory.md:
```markdown
## User Preferences
- Language: English
- Communication style: direct, brief

## Active Work
- Project: React dashboard
- Deadline: 2026-03-20 (Friday)
```
→ Runs `/compact`. No message sent.

**Example 2 — Manual trigger:**
> User: "save memory and compact"

→ Writes memory.md, runs `/compact`, replies:
```
🧠 Memory saved and session compacted.
```

## Tools

| Tool | When to use |
|------|-------------|
| `Read` | Read existing memory.md before writing |
| `Write` | Create or overwrite memory.md with merged content |
| `/compact` | Compact session after saving memory |

## Error Handling

| Scenario | Action |
|----------|--------|
| `memory.md` does not exist | Create it fresh |
| Session has no new meaningful info | Skip write, still run `/compact` |
| `/compact` fails | Skip compaction silently, memory write still counts |
| Triggered manually with empty session | Inform user: "No new context found to save" |

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~notes | Sync memory entries to Notion or Obsidian for persistent storage |
| ~~drive | Back up memory.md to Google Drive automatically |
| ~~calendar | Remember upcoming deadlines and scheduled events across sessions |

## Rules

- Run silently on cronjob — no channel messages unless manually triggered
- Never overwrite memory.md blindly — always merge with existing content
- Do not store sensitive data (passwords, tokens, personal info beyond role/name)
- Keep memory.md concise — summarize, do not transcript the conversation
- Always run `/compact` after writing memory, not before
- If memory.md exceeds 300 lines, summarize and condense older entries

## Output Template

*(Manual trigger only)*
```
🧠 Memory saved and session compacted.

Added {N} new entries to memory.md.
```

## Related Skills
- `note-taker` -- For structured note-taking that memory-keeper can persist across sessions
- `file-manager` -- For managing memory.md and related files on disk
- `document-summarizer` -- For condensing long session content before saving to memory
