---
name: budget-planner
description: >
  Creates, adjusts, and analyzes budget plans with variance analysis, trend detection, and contingency reserves.
  Use when the user says "build a budget", "plan the budget for Q2", "review spending vs plan",
  "forecast next quarter's costs", "allocate funds across departments", "how much budget is left",
  "compare actual vs planned spending", "reallocate budget between departments",
  "annual budget template", "what's the variance this month", or "project budget breakdown".
---

# Budget Planner

## Quick Start
Build and analyze budget plans for any scope (company, department, project) and period (monthly, quarterly, yearly). Separates fixed from variable costs, applies contingency reserves, and flags categories approaching their limits.

## Workflow
1. Determine budget scope: company-wide, department, or project
2. Identify budget period: monthly, quarterly, or yearly
3. Classify request: new budget, mid-period adjustment, variance analysis, or forecast
4. Gather baseline data: historical spending, known commitments, planned initiatives
5. Separate fixed costs (rent, salaries) from variable costs (marketing, travel)
6. Calculate allocations per category based on historical trends and stated priorities
7. Apply 5-10% contingency reserve
8. For variance analysis: compute actual vs. planned with absolute and percentage differences
9. Flag any category exceeding 70% of monthly allocation
10. Output budget document with summary, detail, insights, and recommendations

## Examples

**Example 1: Quarterly department budget**
Input: "Create a Q2 2026 budget for the Marketing department, total $200K"
Output:
```
BUDGET PLAN: Q2/2026 - Marketing Department
============================================

SUMMARY
-------
Total Budget:        $200,000.00
Contingency (10%):   $20,000.00
Allocable Budget:    $180,000.00

DETAIL BY CATEGORY
------------------
| Category          | Type     | Planned      |
|-------------------|----------|--------------|
| Digital Ads       | Variable | $70,000.00   |
| Events            | Variable | $40,000.00   |
| Content Creation  | Variable | $30,000.00   |
| Staff Salaries    | Fixed    | $25,000.00   |
| Software/Tools    | Fixed    | $10,000.00   |
| Print Materials   | Variable | $5,000.00    |
| TOTAL             |          | $180,000.00  |

RECOMMENDATIONS
---------------
- Prioritize digital ads with measurable ROI tracking
- Reserve event budget for Q2 product launch
- Review tool subscriptions for cost optimization
```

**Example 2: Variance analysis**
Input: "Compare January actual spending vs budget for IT department"
Output:
```
BUDGET PLAN: Jan/2026 - IT Department (Variance Analysis)
==========================================================

DETAIL BY CATEGORY
------------------
| Category        | Type     | Planned     | Actual      | Variance    | % Used |
|-----------------|----------|-------------|-------------|-------------|--------|
| Cloud Services  | Variable | $15,000.00  | $18,200.00  | +$3,200.00  | 121%   |
| Staff Salaries  | Fixed    | $40,000.00  | $40,000.00  | $0.00       | 100%   |
| Equipment       | Variable | $10,000.00  | $6,500.00   | -$3,500.00  | 65%    |
| Software        | Fixed    | $8,000.00   | $8,000.00   | $0.00       | 100%   |
| TOTAL           |          | $73,000.00  | $72,700.00  | -$300.00    | 99.6%  |

WARNINGS
--------
- Cloud Services: 21% over budget - investigate usage spike

RECOMMENDATIONS
---------------
- Review cloud resource provisioning to reduce overspend
- Reallocate unused equipment budget to cover cloud costs
```

## Tools
- Use `Read` to load historical budget files and prior-period actuals
- Use `Grep` to search for department or category spending patterns
- Use `Write` to save new or updated budget plans
- Use `Bash` to run aggregation, variance, and trend calculations

## Error Handling
- If period or scope is not specified -> ask user to define period and scope
- If historical data is unavailable -> create budget from scratch using estimates, noting the absence of baseline
- If actual data is incomplete for variance analysis -> analyze available data and note gaps
- If category totals exceed stated budget -> highlight overage and suggest rebalancing

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~accounting | Pull actual spending data from the general ledger for variance analysis |
| ~~ERP | Access department cost centers, headcount plans, and committed spend |
| ~~spreadsheet | Import historical budgets and export new plans to spreadsheets |
| ~~banking | Incorporate real-time cash position into budget forecasts |

## Rules
- Always include a 5-10% contingency reserve
- Clearly distinguish fixed costs from variable costs
- Compare with the same prior-year period when data is available
- Trigger early warning when any category exceeds 70% of monthly budget
- Use abbreviated formats: thousands (K), millions (M), billions (B)
- Category totals must sum to the overall budget total
- Round to two decimal places for USD

## Output Template
```
BUDGET PLAN: [Period] - [Scope]
================================

SUMMARY
-------
Total Budget:        [Total amount]
Contingency Reserve: [Reserve amount] ([Reserve %]%)
Allocable Budget:    [Total minus reserve]

DETAIL BY CATEGORY
------------------
| Category         | Type     | Planned    | Actual     | Variance   | % Used |
|------------------|----------|------------|------------|------------|--------|
| [Category name]  | [Fixed/Variable] | [Amount] | [Amount] | [+/- diff] | [%] |
| TOTAL            |          | [Sum]      | [Sum]      | [Sum]      | [%]    |

INSIGHTS
--------
- [Key spending trends or patterns]

WARNINGS
--------
- [Categories approaching or exceeding budget threshold]

RECOMMENDATIONS
---------------
- [Actionable recommendation]
```

## Related Skills
- `expense-tracker` — For tracking actual expenses against the budget plan
- `financial-report` — For generating financial performance reports with budget context
- `invoice-generator` — For billing documents tied to budgeted projects
- `tax-helper` — For tax implications in budget planning
