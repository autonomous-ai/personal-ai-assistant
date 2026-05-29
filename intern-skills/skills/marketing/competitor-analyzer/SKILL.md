---
name: competitor-analyzer
description: >
  Conducts competitive intelligence analysis including landscape overviews, feature comparisons,
  SWOT assessments, and strategic positioning reviews.
  Use when the user says "analyze our competitors", "do a competitive analysis", "how do we stack up
  against X", "SWOT analysis for our market", "what are competitors doing",
  "benchmark us against the competition", or "help me differentiate from X".
---

# Competitor Analyzer

## Quick Start
Analyze competitors objectively across product, pricing, marketing, and brand dimensions. Every finding must connect to a strategic decision -- no data without a "so what" and "now what."

## Workflow
1. Determine scope: full landscape overview, single competitor deep-dive, feature/pricing comparison, marketing strategy analysis, or SWOT assessment.
2. Collect the user's product/company info, competitors to analyze, industry, and the most important comparison dimensions.
3. Classify competitors: direct (same product, same market), indirect (different product, same need), or potential future (adjacent market).
4. Build a side-by-side comparison matrix across selected dimensions.
5. Perform SWOT analysis for the user's position relative to the market.
6. Identify gaps: where competitors are strong (threats) and where the user is strong (advantages to amplify).
7. Deliver prioritized recommendations: quick wins vs. strategic investments.

## Examples

**Example 1: Competitive landscape**
Input: "Analyze our project management tool vs. Asana, Monday.com, and Notion for the small business segment"
Output:
```
Competitor Analysis: Project Management Software (SMB Segment)
Date: March 18, 2026
Scope: Full landscape -- 3 competitors

Competitive Landscape:
|                 | Us (TaskFlow)  | Asana          | Monday.com     | Notion         |
|-----------------|----------------|----------------|----------------|----------------|
| Product         | Simple PM      | Full PM suite  | Visual PM + CRM| All-in-one workspace |
| Pricing         | $8/user/mo     | $10.99/user/mo | $9/user/mo     | $8/user/mo     |
| UX/Design       | 8/10           | 7/10           | 9/10           | 8/10           |
| Integrations    | 40+            | 200+           | 200+           | 100+           |
| SMB Fit         | High           | Medium         | High           | Medium         |
| Marketing       | Minimal        | Aggressive     | Aggressive     | Content-led    |

SWOT Analysis (TaskFlow vs. Market):
| Strengths                          | Weaknesses                         |
|------------------------------------|------------------------------------|
| Simplest onboarding (5 min setup)  | Low brand awareness                |
| Lowest price point                 | Small integration ecosystem        |
| Purpose-built for SMB              | No mobile app yet                  |

| Opportunities                      | Threats                            |
|------------------------------------|------------------------------------|
| SMBs overwhelmed by Asana/Monday complexity | Monday.com aggressively targeting SMB |
| No leader owns "simple PM" positioning | Notion expanding PM features      |

Key Insights:
1. Monday.com's visual UX is the benchmark -- their drag-and-drop experience drives word-of-mouth. Invest in UX polish.
2. "Simplicity" is an unowned position in this market. Asana and Monday compete on features; we can win on ease-of-use.
3. Integration gap is the biggest churn risk -- SMBs need Slack, Google Workspace, and QuickBooks at minimum.

Recommendations (by priority):
1. [QUICK WIN] Launch "5-Minute Setup" marketing campaign highlighting simplicity vs. competitor complexity -- Impact: differentiates positioning immediately
2. [STRATEGIC] Build top 10 integrations (Slack, Google, QuickBooks, Zapier) -- Impact: removes #1 objection in sales calls
3. [STRATEGIC] Ship mobile app MVP -- Impact: table stakes; blocks a growing churn vector
4. [MONITOR] Track Notion's PM feature releases quarterly -- they could become a direct threat within 12 months

Next Review: June 2026
```

**Example 2: Quick competitor comparison**
Input: "How does Mailchimp compare to ConvertKit for creator newsletters?"
Output:
```
Competitor Analysis: Email Platforms for Creator Newsletters
Date: March 18, 2026
Scope: Head-to-head comparison

|                  | Mailchimp             | ConvertKit            |
|------------------|-----------------------|-----------------------|
| Target user      | SMBs + e-commerce     | Creators + bloggers   |
| Free tier        | 500 contacts          | 10,000 subscribers    |
| Paid pricing     | From $13/mo           | From $15/mo           |
| Email builder    | Drag-and-drop (rich)  | Minimal (text-focused)|
| Automations      | Advanced              | Advanced              |
| Landing pages    | Yes                   | Yes                   |
| Commerce         | Strong (Shopify, WooCommerce) | Basic (digital products) |
| Creator features | Weak                  | Strong (paid newsletters, tip jars) |

Verdict: ConvertKit wins for pure newsletter creators. Mailchimp wins if you also run e-commerce. ConvertKit's generous free tier (10K subs) and creator-specific monetization tools make it the better fit for individual creators focused on audience growth.
```

## Tools
- Use `WebSearch` to research competitor products, pricing, campaigns, press releases, and reviews.
- Use `WebFetch` to retrieve and analyze competitor websites and landing pages.
- Use `Read` to load existing competitive intelligence documents or feature comparisons.
- Use `Write` to save completed analysis reports to a file.

## Error Handling
- If no competitors are named --> ask: "Which competitors should I analyze? If unsure, I can help identify the top 3-5 in your space."
- If user's own product is not described --> ask for a brief description so the comparison has a baseline.
- If data on a competitor is limited --> mark estimates as such and note confidence levels. Never present assumptions as facts.
- If scope is too broad --> recommend focusing on 3-5 competitors across 2-3 strategically important dimensions first.

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~analytics | Compare your traffic and engagement metrics against competitor benchmarks |
| ~~social media | Monitor competitor social presence, posting frequency, and engagement |
| ~~CMS | Audit your own content positioning relative to competitor pages |
| ~~email marketing | Analyze competitor email campaigns via inbox monitoring tools |

## Rules
- Objectivity is paramount -- present competitor strengths honestly.
- Distinguish clearly between direct, indirect, and potential future competitors.
- Note the analysis date and recommend a quarterly refresh cycle.
- Focus on actionable insights over exhaustive data -- every finding must connect to a decision.
- Always conclude with specific "We should..." recommendations, not just observations.
- Never recommend unethical practices (scraping proprietary data, impersonating competitors).
- When data is estimated, state the confidence level explicitly.
- Prioritize recommendations by effort vs. impact.

## Output Template
```
Competitor Analysis: [Industry/Market]
Date: [Analysis date]
Scope: [Full landscape / Deep-dive / Feature comparison]

Competitive Landscape:
|                 | Us          | Competitor A | Competitor B | Competitor C |
|-----------------|-------------|--------------|--------------|--------------|
| Product         | [Note]      | [Note]       | [Note]       | [Note]       |
| Pricing         | [Range]     | [Range]      | [Range]      | [Range]      |
| UX/Design       | [Score]     | [Score]      | [Score]      | [Score]      |
| Marketing       | [Assessment]| [Assessment] | [Assessment] | [Assessment] |
| Digital Presence| [Assessment]| [Assessment] | [Assessment] | [Assessment] |

SWOT Analysis (Us vs. Market):
| Strengths              | Weaknesses             |
|------------------------|------------------------|
| [S1]                   | [W1]                   |
| [S2]                   | [W2]                   |

| Opportunities          | Threats                |
|------------------------|------------------------|
| [O1]                   | [T1]                   |
| [O2]                   | [T2]                   |

Key Insights:
1. [What they do well that we should learn from]
2. [Gap we can exploit for differentiation]
3. [Emerging threat to monitor]

Recommendations (by priority):
1. [QUICK WIN] [Action] - Impact: [Expected outcome]
2. [STRATEGIC] [Action] - Impact: [Expected outcome]
3. [MONITOR] [Action] - Impact: [Expected outcome]

Next Review: [Suggested date]
```

## Related Skills
- `seo-optimizer` -- For analyzing competitor SEO strategies and keyword gaps
- `content-writer` -- For creating differentiated content based on competitive insights
- `campaign-tracker` -- For benchmarking campaign performance against competitor activity
- `social-media-planner` -- For developing social strategies informed by competitor analysis
