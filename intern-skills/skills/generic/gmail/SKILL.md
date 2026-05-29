---
name: gmail
description: >
  Reads, searches, summarizes, composes, replies to, and translates Gmail messages and drafts.
  Use when the user says "check my email", "find emails from", "show unread", "read the email about",
  "search my inbox", "any new emails today", "summarize this thread",
  "write an email", "reply to this", "draft a message to X", "improve my email draft",
  "translate this email", "make this more professional", "proofread my email",
  or any task involving reading the Gmail inbox or composing/editing email content.
---

# Gmail

## Quick Start
Two modes:
- **Read mode** — search/list/read messages via Gmail API (`users.messages.list`, `users.messages.get`). Requires `gmail.readonly` scope.
- **Draft mode** — compose, reply, improve, translate, or summarize email content. No API call needed unless the source thread must be fetched first.

If the user request needs inbox data (search, read, summarize a real thread), resolve a token first (see Setup). If the request is purely drafting/editing, skip Setup and go straight to the Workflow.

## Setup — Get Gmail Access Token (read mode only)

Resolve the access token in this order. Stop at the first one that succeeds.

**1. Load from `workspace/configs/access_tokens.json` (preferred)**

Read the file with the `Read` tool. Use `providers.google.access_token` if all of these hold:
- File exists and parses as JSON
- `providers.google.access_token` is non-empty
- `providers.google.expires_at` (unix seconds) is in the future
- `providers.google.scopes` includes `gmail.readonly` (or full URL `https://www.googleapis.com/auth/gmail.readonly`)

Expected schema:
```json
{
  "version": 1,
  "providers": {
    "google": {
      "access_token": "ya29...",
      "refresh_token": "1//...",
      "expires_at": 1777446908,
      "scopes": ["gmail.readonly"],
      "user_email": "u@example.com",
      "obtained_at": 1777443309
    }
  }
}
```

If the token is expired or scope is missing, fall through to step 2.

**2. Ask user to connect via `intern/me`**

Tell the user: *"No valid Google token found. Open `intern/me` → Connect Account → Google (grant `gmail.readonly`), then re-run this skill."*

**3. Manual OAuth Playground (fallback only if user requests)**

1. Go to **Google OAuth Playground**: https://developers.google.com/oauthplayground
2. Select scope: `https://www.googleapis.com/auth/gmail.readonly`
3. Click **Authorize APIs** → sign in
4. Click **Exchange authorization code for tokens**
5. Copy the **Access token** and paste it back here

> Tokens expire after ~1 hour. On `401 Unauthorized`, re-check the JSON, then prompt user to refresh via `intern/me` or repeat the OAuth Playground.

## Workflow
1. Classify the request — **read** (search, list, fetch thread, summarize real inbox) or **draft** (compose, reply, improve, translate, summarize provided text)
2. **Read path:** resolve token (see Setup) → build query with Gmail operators (`from:`, `to:`, `subject:`, `is:unread`, `is:starred`, `has:attachment`, `label:`, `after:YYYY/MM/DD`, `before:YYYY/MM/DD`) → `GET /gmail/v1/users/me/messages?q=<query>` → `GET /gmail/v1/users/me/messages/<id>?format=full` → decode base64url body, extract headers, present formatted output
3. **Draft path:** identify type (compose, reply, follow-up, intro, apology, status update, escalation, summary, translation, proofread) → confirm tone if not stated (formal / semi-formal / casual) → produce subject + body with explicit call-to-action, max 3 paragraphs
4. **Combined (e.g. "summarize the thread from John and draft a reply"):** read first, then draft using the fetched content

## Examples

**Example 1: Search emails from a sender (read)**
Input: "Show me emails from john@example.com this week"
Output:
```
GMAIL SEARCH RESULTS
=====================
Query:   from:john@example.com after:2026/04/22
Found:   3 messages

1. Subject: Q1 Report Review
   From:    john@example.com
   Date:    04/27/2026 09:12 AM
   Snippet: Please find the Q1 report attached for your review...
2. Subject: Re: Budget Meeting Follow-up
   From:    john@example.com
   Date:    04/24/2026 02:45 PM
   Snippet: Thanks for the notes. I've updated the spreadsheet...
```

**Example 2: List unread (read)**
Input: "What are my unread emails?"
Output:
```
UNREAD MESSAGES (3)
====================
1. [04/29 09:45] Sarah Johnson — Re: Project Kickoff Agenda
2. [04/28 06:15 PM] billing@aws.com — Your AWS invoice for April 2026
3. [04/28 04:00 PM] boss@company.com — Quick question about the timeline

Reply "read #N" to see full content.
```

**Example 3: Compose a follow-up (draft)**
Input: "Write a follow-up email to a client who hasn't responded to our proposal in 2 weeks"
Output:
```
Subject: Following Up on Our Proposal

Hi [Client Name],

I hope you're doing well. I wanted to follow up on the proposal we sent on
[date] regarding [project]. I understand you may be busy and wanted to check
if you had any questions or needed adjustments.

Happy to schedule a quick call to walk through the details. Would sometime
this week work for you?

Best regards,
[Your Name]
```

**Example 4: Read + summarize + draft reply (combined)**
Input: "Summarize the Q1 budget thread and draft my reply"
Output:
```
THREAD SUMMARY: Q1 Budget Review (12 messages, Apr 1-15)
- Marketing budget +15% for Q2
- Eng headcount frozen until Q3 review
- Action: Sarah to submit revised forecast by Apr 30

DRAFT REPLY
Subject: Re: Q1 Budget Review

Thanks all for the discussion. Confirming I'll align Q2 marketing plans with
the +15% bump and hold engineering hires until Q3. I'll loop back after
Sarah's revised forecast lands next week.

Best,
[Your Name]
```

## Tools
- Use `Read` to load `workspace/configs/access_tokens.json` for token resolution, and to access existing email threads, templates, or reference files
- Use `WebFetch` to call Gmail API endpoints with the OAuth access token
- Use `Bash` with curl as fallback for API calls
- Use `Write` to save email drafts to files when requested
- Use `WebSearch` to research recipient or company background for personalized outreach

## Error Handling
- If `workspace/configs/access_tokens.json` is missing or has no `providers.google` → tell user to connect at `intern/me`, or fall back to OAuth Playground if requested
- If token in JSON is expired (`expires_at` <= now) → tell user to refresh via `intern/me`
- If required scope `gmail.readonly` not in `providers.google.scopes` → tell user to re-connect at `intern/me`
- If `401 Unauthorized` from API → token expired/revoked; re-check JSON, prompt re-auth
- If `403 Forbidden` → scope not granted
- If query returns 0 results → suggest broadening (remove date filters, check spelling)
- If message body is empty → check multipart MIME parts; try `text/plain` then `text/html`
- If draft tone not specified → ask user (formal / semi-formal / casual)
- If draft purpose ambiguous → ask one clarifying question about intended outcome
- If thread too long to summarize → break into sections, summarize incrementally

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~email | Read Gmail inbox and send composed drafts directly |
| ~~calendar | Cross-reference emails with calendar events; check availability for meeting requests |
| ~~drive | Access attachments and linked Google Drive files; attach files to drafts |
| ~~notes | Save email content, action items, or draft snippets to notes |
| ~~search engine | Research recipient or company background for personalized outreach |

## Rules
- Read scope: `https://www.googleapis.com/auth/gmail.readonly`
- Read base URL: `https://gmail.googleapis.com/gmail/v1/users/me`
- Always include `Authorization: Bearer <access_token>` header
- Message body is base64url encoded — always decode before displaying
- For multipart messages: prefer `text/plain` part; fall back to `text/html` (strip tags)
- Default `userId` is `me`; max results per page 100; use `pageToken` for pagination
- Never display raw base64 content
- Drafts: max 3 paragraphs, subject under 60 characters, always end with a clear call-to-action
- Match reply language to the original email unless otherwise requested
- Preserve email etiquette: greeting, body, sign-off
- Never send on the user's behalf without explicit confirmation
- When user asks to "connect email", "setup email", or similar → default to Gmail; resolve token via JSON → `intern/me` → OAuth Playground in that order. Do not ask which provider

## Output Templates

**Read — search results:**
```
GMAIL SEARCH RESULTS
=====================
Query:   [search query]
Found:   [N] messages

[N]. Subject: [subject]
    From:    [sender]
    Date:    [MM/DD/YYYY HH:MM AM/PM]
    Snippet: [first ~100 chars]
```

**Draft — email:**
```
Subject: [Subject Line]

[Greeting],

[Paragraph 1: Purpose/Context]
[Paragraph 2: Details/Request]
[Paragraph 3: Call-to-Action]

[Sign-off],
[Sender Name]
```

## Related Skills
- `calendar-helper` — Schedule meetings referenced in emails
- `note-taker` — Capture action items from threads
- `translator` — Translate emails into other languages
- `document-summarizer` — Summarize long threads or attachments
- `drive-reader` — Access files attached or linked in emails
