---
name: report-generator
description: >
  Generates structured operational reports including weekly, monthly, quarterly, annual, and ad-hoc incident reports with executive summaries, KPI tracking, trend analysis, and actionable recommendations.
  Use when the user says "create a report", "compile the data", "summarize these metrics",
  "track KPIs", "generate a weekly report", "write an incident report",
  "how did we perform this quarter", or "prepare a status update".
---

# Report Generator

## Quick Start
Produce executive-level operational reports with data-backed analysis and actionable recommendations. Determine the report type and period, collect and validate data, compute period-over-period comparisons, and deliver a structured report with an executive summary and specific action items.

## Workflow
1. Classify report type: weekly, monthly, quarterly, annual, or ad-hoc (incident/issue)
2. Confirm the reporting period (start/end dates) and comparison period
3. Identify data sources and required metrics/KPIs
4. Collect and validate data -- flag any gaps or inconsistencies
5. Compute period-over-period changes with directional indicators
6. Write the executive summary (2-3 sentences, most critical findings)
7. Populate metrics table, detailed analysis, achievements, challenges, and recommendations
8. Verify all numbers for internal consistency before delivering

## Examples

**Example 1: Weekly Report**
Input: "Generate a weekly ops report for March 9-15, 2026. We processed 1,250 orders (last week was 1,100), had 3 incidents (down from 5), and team utilization was 87%."
Output:
```
Weekly Report - 03/09/2026 to 03/15/2026
=======================================
Period: 03/09/2026 - 03/15/2026
Prepared By: Operations Team
Date Generated: 03/18/2026

EXECUTIVE SUMMARY
-----------------
Order volume increased 13.6% week-over-week to 1,250 units, while incidents decreased from 5 to 3. Team utilization remains strong at 87%.

KEY METRICS
-----------
| Metric           | This Week | Last Week | Change   | Trend    |
|------------------|-----------|-----------|----------|----------|
| Orders Processed | 1,250     | 1,100     | +150     | [UP]     |
| Incidents        | 3         | 5         | -2       | [DOWN]   |
| Team Utilization | 87%       | N/A       | N/A      | [STABLE] |

RECOMMENDATIONS & ACTION ITEMS
-------------------------------
| # | Action                              | Owner    | Deadline   | Priority |
|---|-------------------------------------|----------|------------|----------|
| 1 | Investigate order volume growth     | Ops Lead | 03/22/2026 | M        |
| 2 | Continue incident reduction efforts | SRE Team | Ongoing    | H        |

=======================================
Status: Draft
```

**Example 2: Incident Report**
Input: "Create an incident report for the warehouse system outage on March 14, 2026. It lasted 2 hours, affected order fulfillment, root cause was a database connection pool exhaustion."
Output:
```
Ad-hoc Report - Warehouse System Outage
=======================================
Period: 03/14/2026
Prepared By: [To be confirmed]
Date Generated: 03/18/2026

EXECUTIVE SUMMARY
-----------------
A 2-hour warehouse system outage on 03/14/2026 disrupted order fulfillment due to database connection pool exhaustion. Immediate remediation restored service; permanent fix is in progress.

INCIDENT DETAILS
-----------------
- Start: 03/14/2026, 10:15
- End: 03/14/2026, 12:15
- Duration: 2 hours
- Impact: Order fulfillment halted
- Root Cause: Database connection pool exhaustion

RECOMMENDATIONS & ACTION ITEMS
-------------------------------
| # | Action                          | Owner    | Deadline   | Priority |
|---|---------------------------------|----------|------------|----------|
| 1 | Increase connection pool limits | DBA Team | 03/21/2026 | H        |
| 2 | Add connection pool monitoring  | SRE Team | 03/28/2026 | H        |
| 3 | Document runbook for DB issues  | Ops Lead | 03/31/2026 | M        |

=======================================
Status: Draft
```

## Tools
- Use `Read` to load data files, prior reports, or KPI definitions
- Use `Write` to save the generated report to the specified output path
- Use `Grep` to search for historical data, prior-period values, or specific metrics across files
- Use `Glob` to locate data sources, previous report files, or templates in the workspace

## Error Handling
- If report type is not specified → present options (weekly, monthly, quarterly, annual, ad-hoc) and ask the user to choose
- If reporting period is ambiguous → ask for exact start and end dates
- If input data is incomplete → list missing data points, proceed with available data, and mark incomplete sections
- If prior-period data is unavailable → note the absence, present current-period data only, and recommend establishing a baseline
- If metrics show extreme anomalies (>50% change) → flag prominently and request user verification

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~project tracker | Pull project metrics, task completion rates, and milestone status |
| ~~inventory system | Access inventory data for supply chain and stock reports |
| ~~document management | Store reports and access historical report archives |
| ~~calendar | Reference reporting schedules and deadline tracking |

## Rules
- All data must include units and be compared against the prior period where possible
- Use directional indicators consistently: [UP] for increase, [DOWN] for decrease, [STABLE] for no significant change
- Analyze root causes for any metric that deviates significantly from expectations
- Executive summary: maximum 3 sentences focused on the most impactful findings
- Every action item must include: what, who is responsible, and deadline
- Never fabricate or estimate data; mark unavailable values as "N/A" with explanation
- Reports must be internally consistent -- totals must match the sum of components

## Output Template
```
[Report Type] Report - [Reporting Period]
=======================================
Period: [Start Date] - [End Date]
Prepared By: [Name/Role]
Date Generated: [MM/DD/YYYY]

EXECUTIVE SUMMARY
-----------------
[2-3 sentences highlighting the most important findings and their business impact.]

KEY METRICS
-----------
| Metric          | This Period | Last Period | Change     | Trend             |
|-----------------|-------------|-------------|------------|-------------------|
| [KPI Name]      | [Value]     | [Value]     | [+/- Val]  | [UP/DOWN/STABLE]  |

DETAILED ANALYSIS
-----------------
### [Metric/Topic 1]
[Analysis of performance, root cause for changes, contributing factors.]

ACHIEVEMENTS
------------
- [Key accomplishment 1]
- [Key accomplishment 2]

CHALLENGES
----------
- [Challenge 1]: [Impact and current mitigation]

RECOMMENDATIONS & ACTION ITEMS
-------------------------------
| # | Action                  | Owner        | Deadline    | Priority |
|---|-------------------------|--------------|-------------|----------|
| 1 | [Specific action]       | [Person]     | [Date]      | [H/M/L]  |

=======================================
Status: [Draft / Under Review / Final]
```

## Related Skills
- `document-formatter` -- For formatting reports into polished business documents
- `inventory-tracker` -- For pulling inventory data into operational reports
- `meeting-scheduler` -- For scheduling report review meetings
- `sop-creator` -- For documenting reporting processes as SOPs
