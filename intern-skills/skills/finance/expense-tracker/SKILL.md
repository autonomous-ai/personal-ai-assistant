---
name: expense-tracker
description: >
  Tracks and categorizes business expenses, calculates budget impact, and flags overspending.
  Use when the user says "log an expense", "record this purchase", "how much have we spent on marketing",
  "check my reimbursement status", "review spending by category", "reconcile costs against budget",
  "flag overspending in operations", "submit expense report", "categorize these receipts",
  "track project costs", "what's our burn rate", or "expense breakdown by department".
---

# Expense Tracker

## Quick Start
Record, categorize, and monitor business expenses against budgets. Validate documentation, detect duplicates, and alert when spending approaches category limits.

## Workflow
1. Parse expense details from user input: item, amount, date, category, department, project
2. Classify into a category: Operations, HR, Marketing, IT, Travel, or Other
3. Ask for any missing required fields (amount, date, category)
4. Check for duplicate entries in existing records
5. Calculate budget impact: cumulative spend, remaining budget, percentage used
6. Flag expenses over $500 for manager approval
7. Generate alerts if spending reaches 80%+ of category budget
8. Output structured expense record with budget status

## Examples

**Example 1: Recording an office expense**
Input: "Log $625.00 for new office chairs, Operations department, March 15"
Output:
```
EXPENSE RECORD
==============
Date:          03/15/2026
Category:      Operations
Department:    Operations
Amount:        $625.00
Description:   New office chairs
Documentation: Not yet available
Approval:      Required (>$500)

BUDGET STATUS (Operations)
==========================
Spent this period:   $4,520.00
Total budget:        $10,000.00
Remaining:           $5,480.00
Usage:               45.2%
Alert:               None
```

**Example 2: Near-budget warning**
Input: "Record $400.00 for Google Ads campaign, Marketing dept"
Output:
```
EXPENSE RECORD
==============
Date:          03/18/2026
Category:      Marketing
Department:    Marketing
Amount:        $400.00
Description:   Google Ads campaign
Documentation: Not yet available
Approval:      Not required

BUDGET STATUS (Marketing)
==========================
Spent this period:   $4,200.00
Total budget:        $5,000.00
Remaining:           $800.00
Usage:               84.0%
Alert:               Warning: approaching limit (>80%)
```

## Tools
- Use `Read` to load budget files and historical expense data
- Use `Grep` to search for duplicate or related expense entries
- Use `Write` to persist new expense records and update running totals
- Use `Bash` to run calculations on aggregated expense data

## Error Handling
- If required fields are missing (amount, date, category) -> ask user to provide them
- If expense category is unclear -> present the category list and ask user to choose
- If budget data is unavailable -> record the expense but note budget comparison is not possible
- If duplicate entry is detected -> warn user and ask for confirmation before recording

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~accounting | Pull transactions and categorized ledger entries directly |
| ~~ERP | Access department budgets and cost center mappings |
| ~~spreadsheet | Import/export expense data from spreadsheets |
| ~~banking | Reconcile expenses against bank transaction feeds |

## Rules
- All expenses must reference supporting documents (invoices, receipts)
- Alert when spending reaches 80% of category budget
- Default currency is USD
- Expenses over $500 require manager approval notation
- Every expense must be tied to a category, department, and date
- Round to two decimal places

## Output Template
```
EXPENSE RECORD
==============
Date:          [MM/DD/YYYY]
Category:      [Expense category]
Department:    [Department name]
Amount:        [Amount in USD]
Description:   [Detailed description]
Documentation: [Available / Not yet available]
Approval:      [Required / Not required]

BUDGET STATUS ([Category])
==========================
Spent this period:   [Cumulative amount]
Total budget:        [Allocated budget]
Remaining:           [Remaining amount]
Usage:               [Percentage used]%
Alert:               [None / Warning: approaching limit / Over budget]

NOTES
=====
- [Any additional observations, warnings, or required actions]
```

## Related Skills
- `budget-planner` — For building and adjusting budgets that expenses are tracked against
- `invoice-generator` — For generating invoices related to billable expenses
- `financial-report` — For producing spending summaries and financial performance reports
- `payroll-helper` — For payroll-related expense calculations
