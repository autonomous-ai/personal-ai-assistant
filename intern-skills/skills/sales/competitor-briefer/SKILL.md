---
name: competitor-briefer
description: >
  Creates competitive intelligence materials including battle cards, feature comparison tables,
  objection-handling scripts, and win/loss analyses for sales teams.
  Use when the user says "create a battle card", "how do we compare to X", "the prospect mentioned
  a competitor", "handle this objection about X", "prepare me for a competitive deal",
  "what are X's weaknesses", or "why do we lose to X".
---

# Competitor Briefer

## Quick Start
Name the competitor (and optionally their website URL). Specify what you need: battle card, comparison table, objection scripts, or win/loss post-mortem. The skill produces honest, fact-based competitive intelligence ready for sales conversations.

## Workflow
1. Identify the competitor(s) and determine if a single battle card or multi-competitor matrix is needed
2. Classify request type: full battle card, comparison table, objection scripts, win/loss post-mortem, or team training brief
3. Collect any known intelligence from the user and identify research gaps
4. Research competitor: positioning, pricing, features, recent developments, customer reviews
5. Build honest feature comparison across buyer-relevant dimensions
6. Map strengths (with proof points) and competitor advantages (with mitigation strategies)
7. Script objection responses using the ACKNOWLEDGE-REFRAME-PROVE-CTA framework
8. Design landmine questions that expose competitor weaknesses without disparagement
9. Compile win stories with deciding factors and quantified results

## Examples

**Example 1: Battle card**
Input: "Create a battle card for us vs. RivalSoft for our enterprise deals"
Output:
```
Battle Card: Us vs RivalSoft

## Competitor Overview
- Company: RivalSoft
- Founded: 2018
- Target Market: Mid-market and enterprise B2B SaaS
- Pricing Model: Per-seat, $45-120/user/month
- Key Differentiator: Legacy system integrations

## Feature Comparison
| Dimension | Us | RivalSoft | Advantage |
|-----------|-----|-----------|-----------|
| API integrations | 200+ native | 80+ native | Us |
| Onboarding time | 2 weeks | 6-8 weeks | Us |
| Legacy system support | Limited | Extensive | RivalSoft |
| Real-time analytics | Yes | Batch only | Us |
| Price (100 users) | $8,000/mo | $6,500/mo | RivalSoft |

## Our Strengths
1. 3x faster onboarding — validated by G2 reviews (avg 14 days vs 45 days)
2. Real-time analytics — Forrester Wave leader in data processing speed
3. 200+ native integrations — most in the category per industry report

## Their Strengths (with Mitigation)
1. Lower per-seat price → Mitigation: Calculate TCO including implementation time; our faster onboarding recovers the price difference in 60 days
2. Stronger legacy integrations → Mitigation: Position our modern API-first approach as future-proof; ask about their modernization roadmap

## Objection Handling
Objection: "RivalSoft is cheaper per seat."
- ACKNOWLEDGE: "You're right, their per-seat price is lower."
- REFRAME: "When our customers compared total cost of ownership including implementation, they found a different picture."
- PROVE: "Nextera Corp calculated that our 2-week onboarding saved $140K in productivity costs vs RivalSoft's 6-week process."
- CTA: "Want me to run a TCO comparison with your specific numbers?"

## Landmine Questions
- "How important is real-time data for your decision-making?" — Exposes RivalSoft's batch-only processing
- "What's your timeline for going live?" — Highlights our 2-week vs their 6-8 week onboarding

## Win/Loss Summary
- Wins: 18 | Losses: 7 | Win Rate: 72%
- Top reason we win: Faster time to value
- Top reason we lose: Price sensitivity in SMB deals
```

**Example 2: Objection handling prep**
Input: "A prospect says CloudNext has better AI features than us. Help me respond."
Output: A scripted ACKNOWLEDGE-REFRAME-PROVE-CTA response with specific proof points and a suggested next step.

## Tools
- Use `WebSearch` to research competitor products, pricing, reviews, and analyst reports
- Use `WebFetch` to pull competitor feature pages, pricing pages, or case studies
- Use `Read` to access internal battle cards, win/loss reports, or competitive files

## Error Handling
- If competitor is not specified → ask for the competitor name and ideally their website URL
- If competitive info is outdated or unverifiable → flag data points as "unverified" or "last confirmed [date]"
- If competitor operates in a different category → clarify overlap areas and scope comparison to relevant dimensions only
- If user wants a win/loss post-mortem but lacks details → provide a structured questionnaire to gather the data

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~CRM | Pull win/loss data and competitor mentions from deal records |
| ~~email | Search email threads for competitor objections raised by prospects |
| ~~calendar | Review upcoming meetings where competitive positioning is needed |
| ~~LinkedIn | Research competitor employees, company updates, and hiring signals |

## Rules
- Never badmouth or disparage competitors — focus on articulating your own differentiated value
- All competitive claims must be accurate and sourced — incorrect info destroys credibility
- Acknowledge competitor strengths honestly — pretending they have no advantages looks uninformed
- Always pair competitor advantages with mitigation strategies
- Objection responses must follow ACKNOWLEDGE-REFRAME-PROVE-CTA framework
- Battle cards should be refreshed monthly as competitor positioning changes

## Output Template
```
Battle Card: Us vs [Competitor Name]

## Competitor Overview
- Company: [Name]
- Founded: [Year]
- Target Market: [Segment]
- Pricing Model: [Model and range]
- Key Differentiator: [Their primary selling point]

## Feature Comparison
| Dimension | Us | [Competitor] | Advantage |
|-----------|-----|-------------|-----------|
| [Dimension] | [Our capability] | [Their capability] | [Us / Them / Parity] |

## Our Strengths
1. [Strength + proof point]
2. [Strength + proof point]

## Their Strengths (with Mitigation)
1. [Strength] → Mitigation: [How to handle]

## Objection Handling
Objection: "[Objection]"
- ACKNOWLEDGE: "[Validation]"
- REFRAME: "[Shift perspective]"
- PROVE: "[Evidence]"
- CTA: "[Next step]"

## Landmine Questions
- "[Question]" — Why it works: [Explanation]

## Win Stories
- [Client]: Chose us over [Competitor] because [factors] → Result: [Outcome]

## Win/Loss Summary
- Wins: [N] | Losses: [N] | Win Rate: [%]
- Top reason we win: [Reason]
- Top reason we lose: [Reason]
```

## Related Skills
- `lead-researcher` -- For researching prospects who use competing products
- `proposal-writer` -- For embedding competitive differentiators in proposals
- `follow-up-drafter` -- For follow-up emails that address competitive objections
- `crm-helper` -- For tracking win/loss reasons and competitor mentions in the pipeline
