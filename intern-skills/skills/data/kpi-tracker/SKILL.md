---
name: kpi-tracker
description: Defines, tracks, and reports on Key Performance Indicators (KPIs) with target vs actual comparisons and trend analysis. Use when the user asks to set up KPIs, track metrics, build a scorecard, review performance against targets, or create a dashboard summary. Trigger phrases include "track our KPIs", "build a scorecard", "how are we doing against targets", "set up metrics for the team", "create a performance dashboard", "are we hitting our goals", "show me our numbers this month".
---

# KPI Tracker

## Quick Start
Help define, track, and report on KPIs. Build scorecards with target vs actual comparisons, calculate achievement rates, identify trends, and flag underperforming metrics. Support both business and operational KPIs.

## Workflow
1. Identify KPI context: department, role, time period, strategic objectives
2. Define or confirm KPIs: metric name, formula, target, measurement frequency
3. Collect actual values from user-provided data
4. Calculate: achievement rate, variance, trend direction
5. Generate a scorecard with RAG status (Red/Amber/Green)
6. Highlight top performers and underperformers with recommended actions

## Examples

**Example 1: Monthly KPI Scorecard**
Input: "Create a March KPI scorecard for the sales department"
Output:
```
KPI SCORECARD
=============
Department: Sales
Period: March 2026
Report Date: 03/23/2026

| # | KPI                    | Target    | Actual    | Achievement | Trend | Status |
|---|------------------------|-----------|-----------|-------------|-------|--------|
| 1 | Revenue                | $2M       | $1.85M    | 92.5%       | ↗️    | 🟡     |
| 2 | New Customers          | 50        | 62        | 124.0%      | ↗️    | 🟢     |
| 3 | Conversion Rate        | 25%       | 22%       | 88.0%       | ↘️    | 🔴     |
| 4 | Avg Deal Size          | $40K      | $38K      | 95.0%       | →     | 🟡     |
| 5 | Customer Retention     | 90%       | 93%       | 103.3%      | ↗️    | 🟢     |

OVERALL SCORE: 100.6% (weighted average)

RAG LEGEND: 🟢 ≥100% | 🟡 80-99% | 🔴 <80%

TOP PERFORMERS:
- New Customers: 24% above target — strong outbound campaign results
- Customer Retention: 3.3% above target — upsell program effective

NEEDS ATTENTION:
- Conversion Rate: 12% below target and trending down
  → Recommended: Review sales funnel, identify drop-off stage
  → Action: Schedule pipeline review meeting

TREND ANALYSIS:
- Revenue trending upward despite lower conversion — larger deal sizes compensating
- New customer acquisition accelerating (Jan: 45, Feb: 53, Mar: 62)
```

**Example 2: Define KPIs for a New Team**
Input: "Help me set up KPIs for our customer support team"
Output: A structured KPI framework with 5-7 metrics, definitions, targets, and measurement methods.

## Tools
- Use `Read` to load performance data, reports, or previous scorecards
- Use `Write` to save KPI scorecards and reports to files
- Use `Bash` to calculate aggregations from data files
- Use `WebSearch` to research industry benchmarks for target-setting

## Error Handling
- If targets not defined → suggest industry benchmarks or ask for historical baseline
- If data is incomplete → calculate with available data and note gaps
- If KPI definitions are unclear → provide standard definitions and confirm with user
- If too many KPIs requested (>10) → recommend focusing on 5-7 most impactful

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~database | Pull actual KPI values directly from production databases in real time |
| ~~BI tool | Sync scorecards with BI dashboards and schedule automated KPI reports |
| ~~spreadsheet | Read targets and actuals from linked spreadsheets and write scorecards back |
| ~~data warehouse | Access historical data for multi-period trend analysis and benchmarking |

## Rules
- Use RAG status consistently: Green (≥100%), Amber (80-99%), Red (<80%)
- Always show target vs actual with achievement percentage
- Include trend direction: ↗️ improving, → stable, ↘️ declining
- KPIs must be SMART: Specific, Measurable, Achievable, Relevant, Time-bound
- Limit to 5-7 KPIs per scorecard for focus
- Weight KPIs by importance when calculating overall scores
- Always include recommended actions for underperforming metrics
- Currency defaults to USD; percentages to one decimal place

## Output Template
```
KPI SCORECARD
=============
Department: [Department Name]
Period: [Time Period]
Report Date: [MM/DD/YYYY]

| # | KPI | Target | Actual | Achievement | Trend | Status |
|---|-----|--------|--------|-------------|-------|--------|
| [N] | [Metric] | [Target] | [Actual] | [%] | [↗️/→/↘️] | [🟢/🟡/🔴] |

OVERALL SCORE: [Weighted average]%

TOP PERFORMERS:
- [KPI]: [Achievement detail and reason]

NEEDS ATTENTION:
- [KPI]: [Gap analysis and recommended action]

TREND ANALYSIS:
- [Multi-period trend observation]
```

## Related Skills
- **chart-generator** -- visualize KPI trends and scorecard data with charts and graphs
- **data-summarizer** -- analyze underlying datasets to explain why KPIs are over or under target
- **sql-helper** -- write queries to extract KPI actuals from databases
