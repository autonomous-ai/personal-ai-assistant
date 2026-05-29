---
name: feedback-analyzer
description: >
  Analyzes customer feedback to extract sentiment, identify themes, detect trends, and generate
  actionable insight reports.
  Use when the user says "analyze these reviews", "what are customers saying about X",
  "run a sentiment analysis", "summarize the NPS comments", "identify pain points from feedback",
  "produce a feedback report", "what are the top complaints", or "show me survey trends".
---

# Feedback Analyzer

## Quick Start
Take customer feedback data (reviews, surveys, NPS comments, tickets), classify each entry by sentiment and topic, identify trends and anomalies, and produce an actionable report with concrete recommendations.

## Workflow
1. Collect and parse the feedback data (reviews, survey responses, NPS comments, support tickets)
2. Classify each entry across five dimensions:
   - **Sentiment**: Positive / Neutral / Negative (score -1.0 to +1.0)
   - **Topic**: Product, Delivery, Customer Service, Pricing, UX, Other
   - **Intent**: Praise, Complaint, Suggestion, Question
   - **Urgency**: Needs immediate action / Monitor / Informational
   - **Impact**: Single customer / Multiple customers / System-wide
3. Detect anomalies: spikes in negative sentiment, new complaint topics, unusual volume changes
4. Group similar feedback by topic and sentiment to identify recurring themes
5. Compare current trends against previous periods
6. Extract the 3-5 most significant insights with supporting data
7. Formulate a concrete recommendation for each insight

## Examples

**Example 1: Batch review analysis**
Input: "Analyze these 50 customer reviews from last month for our mobile app."
Output:
```
Feedback Analysis Report
Period: 2026-02-01 to 2026-02-28
Total Feedback Analyzed: 50

Sentiment Overview
- Positive: 22 (44%)
- Neutral: 13 (26%)
- Negative: 15 (30%)
- Average Sentiment Score: +0.12
- NPS Score: 18 (vs previous period: -7)

Top Themes
| Rank | Theme           | Count | Avg Sentiment | Trend vs Prior Period |
|------|-----------------|-------|---------------|----------------------|
| 1    | App crashes     | 14    | -0.72         | Declining            |
| 2    | UI design       | 11    | +0.45         | Improving            |
| 3    | Checkout speed  | 9     | -0.38         | Stable               |

Key Insights
1. App crashes surged 40% vs January, concentrated on Android 14 devices (12 of 14 reports)
2. UI redesign received positive reception — sentiment up +0.30 from prior period
3. Checkout complaints persist despite no change in volume, indicating an unresolved bottleneck

Anomalies Detected
- Crash reports spiked after the Feb 10 update (v3.2.1), suggesting a regression

Recommendations
| Priority | Action                           | Expected Impact | Related Insight |
|----------|----------------------------------|-----------------|-----------------|
| 1        | Hotfix for Android 14 crash      | High            | Insight #1      |
| 2        | Investigate checkout bottleneck  | Medium          | Insight #3      |

Overall Assessment:
Customer satisfaction is declining, driven primarily by app stability issues on Android. Immediate hotfix for v3.2.1 is the highest-priority action to reverse the NPS drop.
```

**Example 2: Small dataset**
Input: "We got 5 survey responses this week. Can you analyze them?"
Output:
```
Feedback Analysis Report
Period: 2026-03-10 to 2026-03-16
Total Feedback Analyzed: 5

Note: Dataset is below the recommended minimum of 10 entries. Results are qualitative rather than statistically significant.

Sentiment Overview
- Positive: 2 (40%)
- Neutral: 1 (20%)
- Negative: 2 (40%)
- Average Sentiment Score: -0.05

Key Insights
1. Two negative responses both mention delayed shipping — potential emerging issue
2. Positive responses cite helpful support agents — team performance is strong

Recommendations
| Priority | Action                              | Expected Impact | Related Insight |
|----------|-------------------------------------|-----------------|-----------------|
| 1        | Monitor shipping delays next week   | Medium          | Insight #1      |

Overall Assessment:
Insufficient data for trend analysis. Recommend continued monitoring and revisiting when sample size reaches 20+.
```

## Tools
- Use `Grep` to search through feedback files, review databases, or survey exports for patterns
- Use `Read` to load feedback data files, previous analysis reports, or benchmark documents
- Use `WebSearch` to check for external factors (industry trends, competitor issues) influencing sentiment

## Error Handling
- If the dataset has fewer than 10 entries → provide qualitative analysis and note the limitation
- If feedback contains mixed languages → analyze each language group separately
- If sentiment is ambiguous (sarcasm, mixed signals) → flag as "Ambiguous" and exclude from quantitative metrics
- If no clear trends emerge → report the absence of trends and recommend continued monitoring

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~helpdesk | Pull ticket data and customer satisfaction scores for analysis |
| ~~CRM | Correlate feedback with customer segments, lifetime value, and churn risk |
| ~~knowledge base | Identify KB gaps based on recurring complaint topics |
| ~~email | Access survey responses and direct customer feedback emails |

## Rules
- Analyze objectively; never cherry-pick only positive or only negative feedback
- Always quantify findings with percentages and counts, not vague terms like "many" or "some"
- Every insight must be paired with an actionable recommendation
- Highlight anomalies prominently: sentiment spikes, new complaint topics, sudden drops
- Protect customer personal information; anonymize data before presenting
- Compare against previous periods to show trend direction

## Output Template
```
Feedback Analysis Report
Period: [Start Date] to [End Date]
Total Feedback Analyzed: [N]

Sentiment Overview
- Positive: [N] ([%])
- Neutral: [N] ([%])
- Negative: [N] ([%])
- Average Sentiment Score: [Score from -1.0 to +1.0]
- NPS Score: [Score] (vs previous period: [change])

Top Themes
| Rank | Theme       | Count | Avg Sentiment | Trend vs Prior Period |
|------|-------------|-------|---------------|----------------------|
| 1    | [Topic]     | [N]   | [Score]       | [Improving/Stable/Declining] |
| 2    | [Topic]     | [N]   | [Score]       | [Improving/Stable/Declining] |
| 3    | [Topic]     | [N]   | [Score]       | [Improving/Stable/Declining] |

Key Insights
1. [Insight supported by specific data]
2. [Insight supported by specific data]
3. [Insight supported by specific data]

Anomalies Detected
- [Anomaly description and data evidence]

Recommendations
| Priority | Action                  | Expected Impact | Related Insight |
|----------|-------------------------|-----------------|-----------------|
| 1        | [Specific action]       | [High/Med/Low]  | Insight #[N]    |
| 2        | [Specific action]       | [High/Med/Low]  | Insight #[N]    |

Overall Assessment:
[1-2 sentence summary of customer satisfaction trajectory and recommended focus areas]
```

## Related Skills
- `ticket-responder` -- For addressing individual issues uncovered by feedback analysis
- `escalation-helper` -- For escalating systemic issues identified in feedback trends
- `knowledge-base` -- For creating or updating KB articles based on common feedback themes
- `faq-lookup` -- For updating FAQ entries when feedback reveals recurring questions
