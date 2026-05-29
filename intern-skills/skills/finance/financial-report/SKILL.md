---
name: financial-report
description: >
  Generates and analyzes financial reports including P&L statements, cash flow, balance sheets,
  dashboards, and variance analyses with period-over-period comparisons.
  Use when the user says "generate a P&L report", "show me the revenue summary", "profit and loss this quarter",
  "create a financial dashboard", "how are our margins trending", "cash flow analysis",
  "compare this month's financials to last month", "quarterly earnings summary",
  "balance sheet snapshot", "revenue vs expenses chart", or "year-end financial overview".
---

# Financial Report Generator

## Quick Start
Generate structured financial reports with period-over-period comparisons, material variance highlighting, trend analysis, and actionable recommendations. Supports P&L, Cash Flow, Balance Sheet, Dashboard, and Variance Analysis report types.

## Workflow
1. Identify the report type: P&L, Cash Flow, Balance Sheet, Financial Dashboard, or Variance Analysis
2. Determine reporting period: month, quarter, year, or custom range
3. Identify comparison basis: YoY, MoM, QoQ, or actual vs. budget
4. Load financial data for current and comparison periods
5. Calculate primary figures: revenue, expenses, profit margins, cash positions
6. Compute period-over-period changes (absolute and percentage)
7. Highlight material variances (>10% change)
8. Analyze trends and identify patterns (growth, cost creep, seasonal effects)
9. Compose analytical narrative and actionable recommendations
10. Assemble complete report with summary, detail, analysis, and recommendations

## Examples

**Example 1: Monthly P&L report**
Input: "Generate a P&L report for February 2026 vs January 2026"
Output:
```
FINANCIAL REPORT: P&L - February 2026
======================================

SUMMARY
-------
Revenue:      $850K (+6.3% vs. Jan 2026)
Expenses:     $620K (+8.8% vs. Jan 2026)
Net Profit:   $230K (Margin: 27.1%)

DETAIL
------
| Line Item           | Feb 2026 | Jan 2026 | Change   | Change % |
|---------------------|----------|----------|----------|----------|
| Product Revenue     | $600K    | $560K    | +$40K    | +7.1%   |
| Service Revenue     | $250K    | $240K    | +$10K    | +4.2%   |
| COGS                | $340K    | $300K    | +$40K    | +13.3%  |
| Staff Costs         | $180K    | $180K    | $0       | 0%      |
| Marketing           | $60K     | $50K     | +$10K    | +20.0%  |
| Operations          | $40K     | $40K     | $0       | 0%      |

MATERIAL VARIANCES (>10% change)
---------------------------------
- COGS: $340K vs. $300K (+13.3%) - Higher input costs
- Marketing: $60K vs. $50K (+20.0%) - Seasonal campaign spend

RECOMMENDATIONS
---------------
- Investigate COGS increase; negotiate supplier pricing
- Measure ROI on increased marketing spend
- Maintain current staffing efficiency
```

**Example 2: Quarterly dashboard**
Input: "Financial dashboard for Q1 2026"
Output:
```
FINANCIAL REPORT: Dashboard - Q1/2026
======================================

SUMMARY
-------
Revenue:      $2.4M (+12% vs. Q1/2025)
Expenses:     $1.75M (+9% vs. Q1/2025)
Net Profit:   $650K (Margin: 27.1%)
Cash Position: $1.2M

KEY METRICS
-----------
| KPI                  | Q1/2026 | Q1/2025 | Trend |
|----------------------|---------|---------|-------|
| Gross Margin         | 42%     | 40%     | +     |
| Operating Margin     | 27%     | 25%     | +     |
| Revenue Growth (YoY) | 12%     | 8%      | +     |
| Expense Ratio        | 73%     | 75%     | +     |

ANALYSIS
--------
Q1 2026 shows healthy growth with improving margins. Revenue growth
accelerated from 8% to 12% YoY driven by new product lines. Expense
ratio improved by 2 percentage points, indicating better cost control.

RECOMMENDATIONS
---------------
- Continue investment in high-margin product lines
- Set Q2 revenue target at $2.6M based on growth trajectory
```

## Tools
- Use `Read` to load financial data files, prior-period reports, and KPI references
- Use `Grep` to search for specific line items, accounts, or transactions
- Use `Bash` to run aggregations, percentage changes, margin computations, and trend analysis
- Use `Write` to save completed reports and dashboard snapshots

## Error Handling
- If report type is not specified -> present the five supported types and ask user to select
- If data for the requested period is unavailable -> offer to work with the closest available period or user-supplied figures
- If comparison period data is missing -> generate current-period report only, noting comparative analysis is unavailable
- If figures do not reconcile -> flag discrepancy, identify source, and resolve before output
- If an unsupported metric is requested -> attempt to derive from available data or explain what is needed

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~accounting | Pull real-time revenue, expense, and ledger data for reports |
| ~~ERP | Access consolidated financial data across business units |
| ~~spreadsheet | Import raw financial data and export formatted reports |
| ~~banking | Incorporate cash position and bank balances into reports |

## Rules
- All figures must be accurate and cross-checked; totals must reconcile
- Always include period-over-period comparison when comparison data is available
- Highlight any line item with >10% variance vs. comparison period
- Round to two decimal places for USD; note currency unit clearly
- Use abbreviated formats: thousands (K), millions (M), billions (B)
- Every report must include: summary, detail section, analysis, and recommendations
- Label one-time or non-recurring items separately from ongoing operations

## Output Template
```
FINANCIAL REPORT: [Report Type] - [Period]
===========================================

SUMMARY
-------
Revenue:      [Amount] ([+/- %] vs. [Comparison period])
Expenses:     [Amount] ([+/- %] vs. [Comparison period])
Net Profit:   [Amount] (Margin: [%])
Cash Position:[Amount] (if applicable)

DETAIL
------
| Line Item           | Current Period | Prior Period | Change     | Change % |
|---------------------|----------------|--------------|------------|----------|
| [Line item name]    | [Amount]       | [Amount]     | [+/- diff] | [%]     |
| TOTAL               | [Sum]          | [Sum]        | [Sum]      | [%]     |

MATERIAL VARIANCES (>10% change)
---------------------------------
- [Line item]: [Current] vs. [Prior] ([Change %]) - [Brief explanation]

ANALYSIS
--------
[Narrative explaining key trends, drivers, and notable patterns]

RECOMMENDATIONS
---------------
- [Actionable recommendation with rationale]
```

## Related Skills
- `budget-planner` — For budget context and variance analysis in reports
- `expense-tracker` — For detailed expense data feeding into financial reports
- `invoice-generator` — For revenue and accounts receivable data
- `tax-helper` — For tax impact analysis within financial reports
