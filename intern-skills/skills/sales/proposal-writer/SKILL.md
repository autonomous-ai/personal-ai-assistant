---
name: proposal-writer
description: >
  Drafts persuasive B2B sales proposals, quotations, and pitch documents customized to a specific
  client's needs with value-led messaging and tiered pricing.
  Use when the user says "write a proposal for X", "create a quote", "draft a pitch deck",
  "respond to this RFP", "put together pricing options", "send a proposal",
  "build a sales deck", or "revise the pricing for this deal".
---

# Proposal Writer

## Quick Start
Provide the client name, their core need, and approximate budget range. The skill produces a complete sales proposal with executive summary, needs analysis, solution design, 3-tier pricing, implementation timeline, and next steps.

## Workflow
1. Extract deal parameters: client name, industry, deal size, scope, and requirements
2. Classify document type: full proposal, quick quotation, pitch deck outline, or RFP response
3. Identify gaps in context and ask for missing critical info before drafting
4. Write executive summary (problem → solution → outcome, under one page)
5. Map client pain points to business impact in a needs analysis table
6. Design the solution with features tied explicitly to client benefits
7. Build 3-tier pricing (Standard / Professional / Enterprise) with ROI projections
8. Create implementation timeline with milestones and deliverables
9. Define time-bound next steps with 30-day proposal validity

## Examples

**Example 1: Full proposal**
Input: "Write a proposal for DataFlow Inc. They need a customer analytics platform. Budget is around $150K."
Output:
```
Sales Proposal: Customer Analytics Platform

Client: DataFlow Inc.
Date: 03/18/2026
Estimated Deal Value: $150,000
Proposal Valid Until: 04/17/2026

## Executive Summary
DataFlow Inc. currently relies on fragmented spreadsheet-based reporting, costing an estimated 30+ hours per week in manual analysis. Our analytics platform consolidates all customer data into real-time dashboards, enabling DataFlow to reduce reporting time by 80% and surface revenue opportunities 3x faster. Within 90 days of deployment, DataFlow can expect a measurable uplift in customer retention through data-driven engagement.

## Understanding Your Needs
| Challenge | Business Impact | Priority |
|-----------|----------------|----------|
| Fragmented data sources | Delayed insights, missed trends | High |
| Manual reporting | 30+ hours/week wasted | High |
| No predictive capability | Reactive instead of proactive | Medium |

## Proposed Solution
Unified analytics platform with automated ingestion, real-time dashboards, and predictive churn modeling — each feature directly addressing the challenges above.

## Pricing Options
| Package | Key Features | Price | Expected ROI |
|---------|-------------|-------|-------------|
| Standard | Dashboards + ingestion | $100,000 | 3x in 12 months |
| Professional (Recommended) | + Predictive models + support | $150,000 | 5x in 12 months |
| Enterprise | + Custom ML + dedicated CSM | $220,000 | 7x in 12 months |

## Next Steps
1. Stakeholder alignment call — 03/21/2026
2. Technical deep-dive demo — 03/28/2026
3. Contract review — 04/04/2026

Follow-up Schedule: Day 3 / Day 7 / Day 14
```

**Example 2: Quick quotation**
Input: "Send a quick quote to Bloom Agency for our starter consulting package, $25K"
Output: A streamlined quotation with scope summary, single price point, deliverables list, and next steps.

## Tools
- Use `Read` to access client briefs, prior proposals, pricing sheets, or case study files
- Use `WebSearch` to research client industry trends, news, or competitive landscape
- Use `WebFetch` to pull client web pages or competitor pricing for positioning

## Error Handling
- If client name or deal context is missing → ask for at minimum client name, core need, and budget range
- If pricing info is unavailable → generate template with placeholder pricing marked for user input
- If proposal type is ambiguous → present options (full proposal, quotation, pitch deck) and confirm

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~CRM | Pull deal details, contact info, and prior interactions for personalization |
| ~~email | Access email threads to reference past discussions in the proposal |
| ~~calendar | Check stakeholder availability for proposed next-step meetings |
| ~~LinkedIn | Research client decision-makers for tailored messaging |

## Rules
- Always lead with value and outcomes, never features alone
- Personalize every section to the specific client — no generic proposals
- Structure pricing in 3 tiers using anchoring psychology toward the recommended option
- Include a 30-day validity period on all proposals
- Plan follow-up cadence: day 3, day 7, day 14
- Never overstate capabilities or make undeliverable promises
- Keep the executive summary under one page

## Output Template
```
Sales Proposal: [Project / Deal Name]

Client: [Company Name]
Date: [MM/DD/YYYY]
Estimated Deal Value: [Amount]
Proposal Valid Until: [Date — 30 days from issue]

## Executive Summary
[2-3 paragraphs: Problem → Solution → Expected outcome with quantified impact]

## Understanding Your Needs
| Challenge | Business Impact | Priority |
|-----------|----------------|----------|
| [Challenge] | [Impact] | [High/Medium/Low] |

## Proposed Solution
[Solution description with features tied to client benefits]

## Why Us
- [Differentiator 1 with proof point]
- [Differentiator 2 with proof point]
- [Relevant case study]

## Pricing Options
| Package | Key Features | Price | Expected ROI |
|---------|-------------|-------|-------------|
| Standard | [Features] | [Price] | [ROI] |
| Professional (Recommended) | [Features] | [Price] | [ROI] |
| Enterprise | [Features] | [Price] | [ROI] |

## Implementation Timeline
| Phase | Milestone | Timeline | Deliverable |
|-------|-----------|----------|-------------|
| Phase 1 | [Milestone] | [Weeks] | [Deliverable] |

## Next Steps
1. [Action] — [Date]
2. [Action] — [Date]

Follow-up Schedule: Day 3 / Day 7 / Day 14
```

## Related Skills
- `lead-researcher` -- For researching the client before writing the proposal
- `follow-up-drafter` -- For follow-up emails after the proposal is sent
- `competitor-briefer` -- For competitive positioning when the client is evaluating alternatives
- `crm-helper` -- For logging the proposal and updating the deal stage
