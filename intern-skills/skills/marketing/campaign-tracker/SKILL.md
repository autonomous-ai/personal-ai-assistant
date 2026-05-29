---
name: campaign-tracker
description: >
  Analyzes marketing campaign performance, calculates KPIs, compares A/B test results, and provides
  budget optimization recommendations.
  Use when the user says "how did our campaign perform", "calculate the ROI", "compare these A/B results",
  "what's our ROAS", "analyze ad performance", "where should I allocate budget",
  "generate a marketing report", or "which channel is performing best".
---

# Campaign Tracker

## Quick Start
Analyze campaign data and generate performance reports with actionable recommendations. Always track the full funnel (impressions > clicks > conversions > revenue) and tie every metric to a business decision.

## Workflow
1. Determine the need: new campaign setup, active campaign monitoring, post-campaign report, A/B test comparison, or budget reallocation.
2. Collect campaign name, objective, channels, budget, timeline, and available performance data.
3. Map to the correct KPI framework per channel (Paid Ads, Email, Social, SEO/Content).
4. Calculate all derived metrics (CTR, CPA, ROAS, ROI) and compute variance vs. targets.
5. Break down performance by channel or ad set. Identify top and bottom performers.
6. If A/B variants exist, evaluate statistical significance and declare a winner.
7. Generate 2-3 key insights and specific recommendations with expected impact.

## Examples

**Example 1: Post-campaign report**
Input: "Here's our Q1 campaign data: Google Ads spent $5,000 (120K impressions, 3,600 clicks, 180 conversions, $27,000 revenue). Meta Ads spent $3,000 (200K impressions, 2,800 clicks, 84 conversions, $10,080 revenue). Goal was 300 total conversions."
Output:
```
Campaign Report: Q1 Digital Advertising
Period: Jan 1 - Mar 31, 2026
Objective: Conversion
Budget: $8,000 / $8,000 (100% spent)

Performance Overview:
| Metric        | Target  | Actual  | Variance  |
|---------------|---------|---------|-----------|
| Impressions   | --      | 320,000 | --        |
| Clicks        | --      | 6,400   | --        |
| CTR           | --      | 2.0%    | --        |
| Conversions   | 300     | 264     | -12.0%    |
| CPA           | $26.67  | $30.30  | +13.6%    |
| Revenue       | --      | $37,080 | --        |
| ROAS          | --      | 4.64x   | --        |
| ROI           | --      | 363.5%  | --        |

Channel Breakdown:
| Channel    | Spend  | Impressions | Clicks | Conv | CPA    | ROAS  |
|------------|--------|-------------|--------|------|--------|-------|
| Google Ads | $5,000 | 120,000     | 3,600  | 180  | $27.78 | 5.40x |
| Meta Ads   | $3,000 | 200,000     | 2,800  | 84   | $35.71 | 3.36x |

Key Insights:
1. Google Ads outperforms Meta on every efficiency metric -- 5.40x ROAS vs. 3.36x, CPA $8 lower.
2. Missed conversion target by 12%. Meta's low conversion rate (3.0% vs. Google's 5.0%) is the primary drag.
3. Overall ROAS of 4.64x is strong. The campaign is profitable; the issue is volume, not efficiency.

Recommendations:
1. Shift $1,000 from Meta to Google Ads -- Expected impact: ~36 additional conversions at $27.78 CPA, closing the gap on the 300 target.
2. Audit Meta ad creatives and landing page experience -- 3.0% conversion rate suggests a disconnect between ad promise and landing page.
3. Test lookalike audiences on Meta based on Google Ads converter profiles -- Expected impact: improve Meta conversion rate by 1-2 percentage points.

Next Steps:
- Reallocate Q2 budget with 70/30 Google/Meta split (was 62/38)
- A/B test 2 new Meta ad creatives by April 15
- Set up cross-platform conversion tracking to unify attribution
```

**Example 2: A/B test evaluation**
Input: "We ran an A/B test on email subject lines. Version A: 'Your order is waiting' -- 12,000 sends, 2,640 opens, 396 clicks. Version B: 'Don't miss out: 24hrs left' -- 12,000 sends, 3,120 opens, 312 clicks."
Output:
```
A/B Test Report: Email Subject Line

| Metric     | Version A             | Version B                 | Winner |
|------------|-----------------------|---------------------------|--------|
| Sends      | 12,000                | 12,000                    | --     |
| Opens      | 2,640 (22.0%)         | 3,120 (26.0%)             | B      |
| Clicks     | 396 (3.3% of sends)   | 312 (2.6% of sends)       | A      |
| Click/Open | 15.0%                 | 10.0%                     | A      |

Verdict: Split -- depends on your objective.
- If goal is awareness/opens: Version B wins (+4pp open rate).
- If goal is clicks/conversions: Version A wins (+0.7pp CTR, +27% more clicks).

Recommendation: Use Version A. Opens are a vanity metric; clicks drive revenue. Version A generated 27% more clicks despite fewer opens, indicating higher-quality engagement.
```

## Tools
- Use `Read` to load campaign data files, CSV exports, or previous reports.
- Use `Write` to save completed reports to a file.
- Use `WebSearch` to look up industry benchmarks when the user lacks historical baselines.

## Error Handling
- If no campaign data is provided --> ask: "Please share the campaign metrics (impressions, clicks, conversions, spend, revenue) so I can build the analysis."
- If campaign objective is unclear --> ask: "What is the primary goal -- awareness, engagement, conversions, or retention?"
- If data is incomplete --> analyze what is available and note which metrics cannot be calculated.
- If user expects live dashboard data --> clarify this skill analyzes provided data; recommend platform-native dashboards for real-time monitoring.

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~analytics | Pull real-time campaign metrics from Google Analytics, Mixpanel, etc. |
| ~~social media | Fetch platform-native ad performance data (Meta Ads, LinkedIn Ads) |
| ~~CMS | Track landing page conversion rates tied to campaigns |
| ~~email marketing | Pull email campaign open rates, click rates, and revenue attribution |

## Rules
- All campaign links must use UTM parameters -- flag any that do not.
- Track the full funnel: impressions > clicks > conversions > revenue. Never report vanity metrics alone.
- Benchmarking must compare against same period last year or stated industry average -- never without context.
- Attribution model must be explicitly stated and consistent within a report.
- Every metric must have an interpretation -- no data without a "so what."
- Budget reallocation recommendations must include rationale and expected impact.
- Round percentages to one decimal place, currency to two decimal places.

## Output Template
```
Campaign Report: [Campaign Name]
Period: [Start Date] - [End Date]
Objective: [Awareness / Engagement / Conversion / Retention]
Budget: [Spent] / [Total Allocated]

Performance Overview:
| Metric        | Target  | Actual  | Variance |
|---------------|---------|---------|----------|
| Impressions   | [N]     | [N]     | [+/- %]  |
| Clicks        | [N]     | [N]     | [+/- %]  |
| CTR           | [%]     | [%]     | [+/- pp] |
| Conversions   | [N]     | [N]     | [+/- %]  |
| CPA           | [$]     | [$]     | [+/- %]  |
| Revenue       | [$]     | [$]     | [+/- %]  |
| ROAS          | [X]     | [X]     | [+/- %]  |
| ROI           | [%]     | [%]     | [+/- pp] |

Channel Breakdown:
| Channel   | Spend | Impressions | Clicks | Conv | CPA  | ROAS |
|-----------|-------|-------------|--------|------|------|------|
| [Channel] | [$]   | [N]         | [N]    | [N]  | [$]  | [X]  |

Key Insights:
1. [What is working and why]
2. [What is underperforming and why]
3. [Notable pattern or anomaly]

Recommendations:
1. [Action] - Expected impact: [description]
2. [Action] - Expected impact: [description]
3. [Action] - Expected impact: [description]

Next Steps:
- [Immediate action items with owner and deadline]
```

## Related Skills
- `social-media-planner` -- For planning social campaigns that feed into tracking
- `content-writer` -- For creating ad copy and content based on performance insights
- `seo-optimizer` -- For correlating organic traffic impact alongside paid campaigns
- `competitor-analyzer` -- For benchmarking campaign performance against competitors
