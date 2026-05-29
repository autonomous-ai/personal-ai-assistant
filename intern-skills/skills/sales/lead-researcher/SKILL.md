---
name: lead-researcher
description: >
  Researches potential B2B leads by gathering company intelligence, identifying decision makers,
  analyzing pain points, and scoring leads using the BANT framework.
  Use when the user says "research this company", "find me prospects", "who should I contact at X",
  "qualify this lead", "prep me for my call with X", "build a prospect list",
  "look up this company", or "what do we know about X".
---

# Lead Researcher

## Quick Start
Provide a company name (or criteria like industry/size/location) and any known context. The skill will produce a structured research brief with company profile, decision-maker map, pain point analysis, and BANT lead score.

## Workflow
1. Parse the target company name, industry, or lead criteria from user input
2. Classify the request: single-company deep dive, multi-lead list build, lead qualification, or pre-call briefing
3. Compile firmographic data (industry, size, revenue, location, funding)
4. Map decision makers (C-level, VP, Director) with titles and LinkedIn profiles
5. Surface business intelligence: recent news, hiring signals, tech stack, current vendors
6. Analyze pain points and map them to solution value propositions
7. Score the lead using BANT (Budget, Authority, Need, Timeline) on a 0-100 scale
8. Deliver the structured research brief with a recommended next action

## Examples

**Example 1: Single company research**
Input: "Research Acme Corp for our enterprise sales pipeline"
Output:
```
Lead Research: Acme Corp

## Company Profile
- Industry: SaaS / Supply Chain Management
- Size: ~450 employees
- Revenue: ~$60M (estimated)
- Location: Austin, TX
- Website: https://acmecorp.com
- Founded: 2015

## Decision Makers
| Name | Title | LinkedIn |
|------|-------|----------|
| Jane Smith | CTO | linkedin.com/in/janesmith |
| Mark Lee | VP Engineering | linkedin.com/in/marklee |

## Business Intelligence
- Recent news: Raised $30M Series C in Q1 2026
- Hiring signals: 12 open engineering roles, expanding platform team
- Tech stack: AWS, Snowflake, Salesforce
- Current vendors: Uses legacy in-house tooling for analytics

## Pain Points & Opportunities
| Pain Point | Impact | How We Help |
|------------|--------|-------------|
| Manual reporting workflows | 20+ hours/week lost | Automated dashboards |
| Data silos across teams | Delayed decision-making | Unified data platform |

## Lead Score: 78/100 - Warm
- Budget: Series C funding provides budget capacity
- Authority: CTO identified as economic buyer
- Need: Hiring patterns suggest scaling pain
- Timeline: No immediate deadline detected

## Recommended Next Action
Request a warm intro to CTO via mutual LinkedIn connection within 5 business days.
```

**Example 2: Lead qualification**
Input: "Qualify this lead: ByteWave, 50-person fintech startup in Singapore"
Output: A BANT-scored brief focused on qualification criteria with a Hot/Warm/Cold rating and recommended action.

## Tools
- Use `WebSearch` to find company info, news, funding announcements, and hiring data
- Use `WebFetch` to pull company About pages, LinkedIn profiles, and press releases
- Use `Read` to access local files the user references (CRM exports, prospect lists)

## Error Handling
- If the company is ambiguous or unidentifiable → ask for a website URL or LinkedIn page
- If insufficient public info exists → report what was found, flag gaps, and suggest alternatives (Crunchbase, LinkedIn intro)
- If user provides conflicting data → highlight the discrepancy and ask which source to trust

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~CRM | Pull existing lead records and deal history for context |
| ~~email | Access prior email threads with the prospect |
| ~~calendar | Check scheduled meetings and past interactions |
| ~~LinkedIn | Fetch decision-maker profiles and mutual connections directly |

## Rules
- Only use publicly available information (websites, LinkedIn, news, public filings)
- Remain GDPR/CCPA compliant; never collect unnecessary personal data
- Verify critical facts from at least 2 independent sources
- Mark financial estimates clearly as "estimated" or "approximate"
- Lead scores must include explicit BANT reasoning

## Output Template
```
Lead Research: [Company Name]

## Company Profile
- Industry: [Industry]
- Size: [Employee count]
- Revenue: [Estimated or confirmed]
- Location: [HQ address]
- Website: [URL]
- Founded: [Year]

## Decision Makers
| Name | Title | LinkedIn |
|------|-------|----------|
| [Name] | [Title] | [URL] |

## Business Intelligence
- Recent news: [Developments, funding, partnerships]
- Hiring signals: [Open roles and implied priorities]
- Tech stack: [Known tools/platforms]
- Current vendors: [Competitor solutions in use]

## Pain Points & Opportunities
| Pain Point | Impact | How We Help |
|------------|--------|-------------|
| [Pain point] | [Business impact] | [Solution mapping] |

## Lead Score: [X/100] - [Hot / Warm / Cold]
- Budget: [Assessment + reasoning]
- Authority: [Assessment + reasoning]
- Need: [Assessment + reasoning]
- Timeline: [Assessment + reasoning]

## Recommended Next Action
[Specific action with suggested timeline]
```

## Related Skills
- `proposal-writer` -- For drafting proposals after lead research is complete
- `follow-up-drafter` -- For follow-up emails after initial outreach
- `competitor-briefer` -- For competitive intelligence when the lead uses a rival product
- `crm-helper` -- For logging research findings and updating deal records
