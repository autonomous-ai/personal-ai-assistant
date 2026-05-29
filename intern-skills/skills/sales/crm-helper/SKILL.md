---
name: crm-helper
description: >
  Manages CRM data including pipeline updates, activity logging, deal tracking, sales forecasting,
  and pipeline health analysis.
  Use when the user says "update the deal", "log this call", "log my meeting with X",
  "show me the pipeline", "how's my pipeline looking", "generate a forecast",
  "which deals are at risk", "move this deal to negotiation", or "review my deals".
---

# CRM Helper

## Quick Start
Describe what you need: log an activity, update a deal stage, review your pipeline, or generate a forecast. Provide deal names, contact details, or CRM exports as needed. The skill ensures pipeline hygiene and actionable outputs.

## Workflow
1. Parse the request: add/update a record, view pipeline, log an activity, generate forecast, or run win/loss analysis
2. Identify scope: single deal, specific pipeline stage, full pipeline, or time-bound period
3. Gather current state (deal stage, last activity, value, owner) for accurate updates
4. Map to standard pipeline stages: Prospecting → Qualified → Proposal Sent → Negotiation → Closed Won / Closed Lost
5. Execute the requested action (log, update, aggregate, forecast, or flag risks)
6. Surface at-risk deals: stale (30+ days without activity), slipped close dates, or missing next steps
7. Deliver structured output with actionable recommendations

## Examples

**Example 1: Log a meeting**
Input: "Log a meeting with Sarah Chen at NovaTech. We did a 45-minute product demo, she loved the reporting features, and we agreed to send a proposal by Friday."
Output:
```
## Activity Log
- Type: Meeting (Demo)
- Contact: Sarah Chen, NovaTech
- Date: 03/18/2026
- Duration: 45 minutes
- Outcome: Completed
- Key Notes: Positive response to reporting features. Strong interest in dashboard customization.
- Next Step: Send proposal — 03/21/2026

Deal Update: NovaTech moved from Qualified → Proposal Sent
```

**Example 2: Pipeline review**
Input: "Give me a pipeline overview for Q1"
Output:
```
Sales Pipeline Overview — Q1 2026

## Summary
- Total deals: 24
- Pipeline value: $1,850,000
- Weighted value: $742,000
- Average deal size: $77,083
- Win rate: 32%
- Average sales cycle: 47 days

## Pipeline by Stage
| Stage | Deals | Value | Weighted Value | Avg Age |
|-------|-------|-------|----------------|---------|
| Prospecting | 8 | $480,000 | $48,000 | 12 days |
| Qualified | 7 | $560,000 | $168,000 | 28 days |
| Proposal Sent | 5 | $410,000 | $246,000 | 35 days |
| Negotiation | 4 | $400,000 | $280,000 | 41 days |

## At-Risk Deals
| Deal | Risk Reason | Days Inactive | Action |
|------|-------------|---------------|--------|
| Acme - Platform | Stale | 38 days | Re-engage or downgrade |
| Bolt - Analytics | No next step | 22 days | Define next step immediately |
```

## Tools
- Use `Read` to access CRM exports, deal spreadsheets, or activity logs
- Use `WebFetch` to pull data from CRM web interfaces if URLs are provided
- Use `WebSearch` to enrich CRM records with external company intelligence

## Error Handling
- If deal or contact cannot be identified → ask for deal name, contact name, or CRM record ID
- If pipeline stage is ambiguous → present the standard 6-stage pipeline and ask for confirmation
- If forecast data is insufficient → generate forecast with explicit caveats about data quality
- If activity details are vague → prompt for interaction type, outcomes, and next step

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~CRM | Read and write deal records, contacts, and activities directly in the CRM |
| ~~email | Auto-log email interactions as CRM activities |
| ~~calendar | Sync meeting data to activity logs and next-step dates |
| ~~LinkedIn | Enrich contact records with LinkedIn profile data |

## Rules
- Every deal must have a defined next step with a specific date
- Flag stale deals (30+ days without activity) for review: re-engage, downgrade, or close lost
- Forecast probabilities must be evidence-based — never inflated to meet targets
- CRM is the single source of truth — all sales info must be recorded
- Consistent formatting: currency in one format, dates as MM/DD/YYYY, deal names as [Company - Product/Service]
- Log activities immediately — details degrade over time

## Output Template
```
Sales Pipeline Overview

## Summary
- Total deals: [N]
- Pipeline value: [Total]
- Weighted value: [Probability-adjusted total]
- Average deal size: [Amount]
- Win rate: [%]
- Average sales cycle: [Days]

## Pipeline by Stage
| Stage | Deals | Value | Weighted Value | Avg Age |
|-------|-------|-------|----------------|---------|
| Prospecting | [N] | [Amount] | [Weighted] | [Days] |
| Qualified | [N] | [Amount] | [Weighted] | [Days] |
| Proposal Sent | [N] | [Amount] | [Weighted] | [Days] |
| Negotiation | [N] | [Amount] | [Weighted] | [Days] |

## At-Risk Deals
| Deal | Risk Reason | Days Inactive | Action |
|------|-------------|---------------|--------|
| [Deal] | [Stale/Slipped/No next step] | [Days] | [Action] |

## Activity Log
- Type: [Call / Email / Meeting / Demo]
- Contact: [Name]
- Date: [MM/DD/YYYY]
- Duration: [Minutes]
- Outcome: [Result]
- Key Notes: [Summary]
- Next Step: [Action] — [Date]
```

## Related Skills
- `lead-researcher` -- For enriching CRM records with fresh company intelligence
- `follow-up-drafter` -- For drafting follow-up emails triggered by CRM activity
- `proposal-writer` -- For creating proposals when deals move to the proposal stage
- `competitor-briefer` -- For competitive context on deals where rivals are involved
