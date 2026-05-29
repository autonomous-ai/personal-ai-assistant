---
name: document-summarizer
description: >
  Summarizes long documents, reports, email threads, meeting transcripts, and articles into concise, structured overviews.
  Use when the user says "summarize this", "give me the key points", "TL;DR",
  "condense this report", "what are the main takeaways", "extract action items",
  "break down this document", "cliff notes of this", "what does this say",
  or asks to summarize, condense, or extract key points from any text content.
---

# Document Summarizer

## Quick Start
Condense long content into structured summaries. Identify key decisions, action items, and important details. Adjust summary depth based on user needs — from one-line TL;DR to detailed section-by-section breakdowns.

## Workflow
1. Determine content type: report, email thread, meeting transcript, article, policy document, contract
2. Confirm summary depth: TL;DR (1-2 sentences), standard (key points), detailed (section-by-section)
3. Read and analyze the full content
4. Extract: key decisions, action items, important data points, deadlines, stakeholders
5. Organize into a structured summary with clear hierarchy
6. Highlight anything requiring immediate attention or follow-up

## Examples

**Example 1: Meeting Transcript Summary**
Input: "Summarize this meeting transcript" (followed by a long meeting transcript)
Output:
```
MEETING SUMMARY
===============
Meeting: Q1 Budget Review
Date: 03/15/2026
Attendees: 8 (Finance, Ops, Marketing leads)
Duration: 60 minutes

TL;DR: Marketing budget approved for 15% increase; Engineering hiring frozen until Q3.

Key Decisions:
1. Marketing Q2 budget increased from $500K to $575K (+15%)
2. Engineering headcount freeze extended through Q2
3. Cloud infrastructure migration moved to Q3

Action Items:
| Owner    | Task                              | Deadline   |
|----------|-----------------------------------|------------|
| Sarah    | Submit revised Q2 forecast        | 03/20/2026 |
| Tom      | Schedule CFO follow-up            | 03/22/2026 |
| Marketing| Present campaign ROI breakdown    | 03/25/2026 |

Open Issues:
- Cloud cost overrun (12% over budget) — pending vendor negotiation
- New CRM tool evaluation postponed to next meeting
```

**Example 2: Report Summary**
Input: "Summarize this 20-page annual report into key highlights"
Output:
```
DOCUMENT SUMMARY
================
Document: Annual Report 2025
Type: Corporate Annual Report
Pages: 20

TL;DR: Revenue grew 23% YoY to $45M; company expanded to 3 new markets; profitability target missed by 2%.

Key Highlights:
- Revenue: $45M (+23% YoY), driven by enterprise segment
- New Markets: Southeast Asia, Middle East, Latin America
- Headcount: 450 → 620 employees (+38%)
- Product: Launched 3 major features, 99.7% uptime

Concerns:
- Net margin 8% vs 10% target — higher-than-expected hiring costs
- Customer churn increased from 5% to 7% in SMB segment

Outlook:
- 2026 revenue target: $60M (+33%)
- Focus: profitability improvement and SMB retention
```

## Tools
- Use `Read` to load documents, reports, or transcript files
- Use `Grep` to search for specific topics or keywords within large documents
- Use `Write` to save summaries to files when requested

## Error Handling
- If document is too large → process in sections and combine summaries
- If content type is ambiguous → ask user what aspects to focus on
- If document contains conflicting information → flag discrepancies in the summary
- If summary depth not specified → default to standard (key points with action items)

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~drive | Read and summarize documents stored in Google Drive |
| ~~email | Summarize email threads and long message chains directly |
| ~~notes | Save summaries to your note-taking app for future reference |
| ~~search engine | Provide additional context for technical or industry-specific documents |

## Rules
- Never fabricate information — only include what is in the source content
- Always include action items with owners and deadlines when present
- Flag urgent or time-sensitive items prominently
- Preserve numerical accuracy — double-check figures and percentages
- Use the same language as the source document unless user requests otherwise
- For multi-topic documents, organize summary by topic, not chronologically
- Keep TL;DR to 1-2 sentences maximum
- Standard summaries should be under 300 words

## Output Template
```
[DOCUMENT TYPE] SUMMARY
========================
Document: [Title or description]
Type: [Report / Email Thread / Meeting / Article / Policy]
Length: [Pages / Messages / Duration]

TL;DR: [1-2 sentence summary]

Key Points:
- [Most important point with supporting data]
- [Second most important point]
- [Additional key points]

Action Items:
| Owner | Task | Deadline |
|-------|------|----------|
| [Name]| [Task] | [Date] |

[Open Issues / Concerns / Follow-ups if applicable]

---
Summary generated from: [Source description]
Summary depth: [TL;DR / Standard / Detailed]
```

## Related Skills
- `gmail` -- For fetching email threads that need summarization
- `drive-reader` -- For accessing documents stored in Google Drive to summarize
- `note-taker` -- For organizing summaries into structured meeting notes or action items
