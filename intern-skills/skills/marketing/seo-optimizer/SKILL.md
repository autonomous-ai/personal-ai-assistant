---
name: seo-optimizer
description: >
  Performs SEO audits, keyword research, on-page optimization, and technical SEO reviews.
  Use when the user says "optimize this page for SEO", "do keyword research for X",
  "audit our blog post", "why is our traffic dropping", "improve our search rankings",
  "check the meta tags", "find keywords for X", or "analyze our SERP performance".
---

# SEO Optimizer

## Quick Start
Analyze and optimize web content for search engines. Prioritize search intent over keyword tricks. Provide specific, actionable recommendations scored by impact.

## Workflow
1. Determine the request type: keyword research, on-page audit, content optimization, technical SEO check, or SERP analysis.
2. Collect the target keyword or URL, business niche, and any available performance data.
3. Perform keyword analysis: primary keyword, 3-5 secondary keywords, 2-3 long-tail variations, and search intent classification.
4. Audit on-page factors: title tag, meta description, headings, URL, images, internal/external links.
5. Check content quality: keyword density (1-2%), depth vs. SERP competitors, readability.
6. Flag technical issues: page speed, mobile responsiveness, schema markup, Core Web Vitals.
7. Prioritize findings as Critical, Important, or Nice-to-have.

## Examples

**Example 1: On-page audit**
Input: "Audit the SEO for our blog post at https://example.com/remote-work-tips"
Output:
```
SEO Analysis

Target Keyword:
  Primary: remote work tips (Volume: 12,100, Difficulty: Medium)
  Secondary: work from home productivity, remote team management, home office setup
  Long-tail: remote work tips for new managers, best remote work practices 2026
  Search Intent: Informational

On-Page Score: 62/100
| Factor           | Status | Recommendation                              |
|------------------|--------|---------------------------------------------|
| Title tag        | Fail   | Add keyword to front: "Remote Work Tips: 10 Proven..." (currently 72 chars, trim to 58) |
| Meta description | Fail   | Missing entirely. Add: "Discover 10 remote work tips..." (155 chars with CTA) |
| Headings (H1-H6) | Pass  | Good hierarchy. Add keyword variant to one H2. |
| URL structure    | Pass   | Clean and keyword-rich.                     |
| Content quality  | Fail   | 600 words -- too thin. Top 3 SERP results average 1,800 words. |
| Internal links   | Fail   | Only 1 found. Add 3-4 links to related articles. |
| External links   | Pass   | 2 authoritative sources cited.              |
| Image alt text   | Fail   | 3 of 5 images missing alt text.            |

Technical Flags:
- Page speed: 3.2s LCP (needs improvement, target <2.5s)
- Mobile-friendly: Pass
- Schema markup: Missing Article schema -- add for rich snippet eligibility

Prioritized Recommendations:
1. [CRITICAL] Add meta description and fix title tag -- expected CTR uplift of 15-25%
2. [CRITICAL] Expand content to 1,500+ words with deeper subtopics -- thin content is the #1 ranking blocker
3. [IMPORTANT] Add Article schema markup for rich snippet eligibility
4. [NICE-TO-HAVE] Optimize LCP by compressing hero image

Suggested Meta Tags:
  Title: Remote Work Tips: 10 Proven Strategies for Productive Teams
  Description: Discover 10 remote work tips that help teams stay productive and connected. Practical strategies from companies that made remote work succeed.
```

**Example 2: Keyword research**
Input: "Find keywords for a SaaS project management tool targeting small businesses"
Output:
```
SEO Analysis

Target Keyword:
  Primary: project management software small business (Volume: 4,400, Difficulty: Hard)
  Secondary: small business project management, team task management tool, simple project tracker, project planning software
  Long-tail: best project management tool for small teams, free project management software for startups, easy project management app for non-technical teams
  Search Intent: Commercial

Keyword Cluster Map:
| Cluster              | Keywords                          | Content Type     | Priority |
|----------------------|-----------------------------------|------------------|----------|
| Core product         | project management software...    | Landing page     | High     |
| Comparison           | [tool] vs [competitor]            | Comparison posts | High     |
| How-to               | how to manage projects in...      | Blog posts       | Medium   |
| Use-case             | project management for agencies   | Landing pages    | Medium   |

Recommendations:
1. [CRITICAL] Create a dedicated landing page targeting "project management software small business"
2. [IMPORTANT] Write 3 comparison posts ([Your Tool] vs Asana/Monday/Trello for small teams)
3. [IMPORTANT] Build a how-to blog cluster around long-tail keywords
```

## Tools
- Use `WebSearch` to analyze current SERP results and evaluate competitor page structures.
- Use `WebFetch` to retrieve and analyze the HTML structure of target URLs.
- Use `Read` to load existing content files or SEO documents.
- Use `Write` to save audit reports to a file.

## Error Handling
- If no keyword or URL is provided --> ask: "What keyword or page URL would you like me to optimize for?"
- If user expects real-time ranking data --> clarify that recommendations are based on best practices, not live crawl data.
- If request covers multiple pages/keywords --> scope to one primary target and offer to address others next.
- If content does not exist yet --> shift to keyword research and content planning instead of auditing.

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~analytics | Pull organic traffic data, bounce rates, and conversion metrics |
| ~~social media | Cross-reference social engagement with organic search performance |
| ~~CMS | Apply meta tag and content changes directly in the CMS |
| ~~email marketing | Identify high-performing email content topics to target for SEO |

## Rules
- Search intent is the top priority -- understand what searchers expect before recommending changes.
- Keyword density of 1-2% is sufficient. Never recommend keyword stuffing.
- Content must deliver genuine value to readers, not just satisfy bots.
- Mobile-first: always consider responsive design and Core Web Vitals.
- One primary keyword per page -- avoid cannibalizing other pages.
- All suggestions must be specific and actionable, not generic.
- Distinguish between on-page, off-page, and technical factors.
- Recommend content freshness updates -- it is a ranking signal.

## Output Template
```
SEO Analysis

Target Keyword:
  Primary: [Keyword] (Volume: [N], Difficulty: [Easy/Medium/Hard])
  Secondary: [Keyword 2], [Keyword 3], [Keyword 4]
  Long-tail: [Long-tail keyword 1], [Long-tail keyword 2]
  Search Intent: [Informational / Navigational / Transactional / Commercial]

On-Page Score: [X/100]
| Factor           | Status      | Recommendation               |
|------------------|-------------|------------------------------|
| Title tag        | [Pass/Fail] | [Specific suggestion]        |
| Meta description | [Pass/Fail] | [Specific suggestion]        |
| Headings (H1-H6)| [Pass/Fail] | [Specific suggestion]        |
| URL structure    | [Pass/Fail] | [Specific suggestion]        |
| Content quality  | [Pass/Fail] | [Specific suggestion]        |
| Internal links   | [Pass/Fail] | [Specific suggestion]        |
| External links   | [Pass/Fail] | [Specific suggestion]        |
| Image alt text   | [Pass/Fail] | [Specific suggestion]        |

Technical Flags:
- Page speed: [Assessment]
- Mobile-friendly: [Assessment]
- Schema markup: [Assessment]

Prioritized Recommendations:
1. [CRITICAL] [Action with expected impact]
2. [IMPORTANT] [Action with expected impact]
3. [NICE-TO-HAVE] [Action with expected impact]

Suggested Meta Tags:
  Title: [Optimized title, 50-60 chars]
  Description: [Optimized description, 150-160 chars]
```

## Related Skills
- `content-writer` -- For creating SEO-optimized content based on keyword research
- `competitor-analyzer` -- For analyzing competitor SEO strategies and keyword gaps
- `campaign-tracker` -- For measuring the impact of SEO changes on traffic and conversions
- `social-media-planner` -- For amplifying SEO content through social distribution
