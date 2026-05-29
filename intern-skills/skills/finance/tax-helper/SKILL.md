---
name: tax-helper
description: >
  Calculates US taxes (federal/state income tax, sales tax, corporate tax, excise tax), performs
  gross-to-net salary conversions, and provides filing checklists with legal citations.
  Use when the user says "calculate my taxes", "what's the sales tax on this", "gross to net salary",
  "when are taxes due", "what tax bracket am I in", "corporate tax rate", "help with tax filing",
  "how much do I owe the IRS", "estimate quarterly taxes", "tax deduction checklist",
  "withholding calculator", or "compare tax liability across states".
---

# Tax Helper

## Quick Start
Calculate US taxes step by step with legal citations. Supports federal/state income tax, sales tax, corporate tax, and excise tax. All results include a disclaimer recommending confirmation with a certified accountant or CPA.

## Workflow
1. Identify the tax type: federal income tax, state income tax, sales tax, corporate tax, or excise tax
2. Determine the task: calculation, regulation lookup, filing checklist, deadline reminder, or gross/net conversion
3. Extract inputs: income amount, revenue, filing status, number of dependents, state, period
4. Load applicable tax rates and legal references
5. For federal income tax: apply standard deduction ($14,600 single / $29,200 married filing jointly) and child tax credit ($2,000/child)
6. Perform step-by-step calculation showing all intermediate results
7. Cross-verify arithmetic accuracy
8. Cite legal basis for every rate and deduction
9. Include disclaimer and relevant deadline reminders

## Examples

**Example 1: Gross-to-net salary**
Input: "Convert $5,000/month gross salary to net, 1 dependent child, single filer"
Output:
```
TAX CALCULATION: Federal Income Tax - Gross to Net
====================================================

INPUT
-----
- Gross salary: $5,000/month ($60,000/year)
- Filing status: Single
- Dependents: 1 child

CALCULATION
-----------
Step 1: Social Security tax (6.2%)
       $5,000 x 6.2% = $310.00

Step 2: Medicare tax (1.45%)
       $5,000 x 1.45% = $72.50

Step 3: Total FICA deductions
       $310.00 + $72.50 = $382.50

Step 4: Standard deduction (annualized monthly)
       $14,600 / 12 = $1,216.67

Step 5: Taxable income (monthly)
       $5,000 - $382.50 - $1,216.67 = $3,400.83

Step 6: Federal income tax (progressive brackets, monthly estimate)
       $996.67 x 10% = $99.67
       $2,404.16 x 12% = $288.50
       Total federal tax = $388.17

Step 7: Child tax credit (monthly)
       $2,000 / 12 = $166.67

RESULT
------
Net salary:      $3,895.50/month
Total deductions: $1,104.50/month
Effective rate:   8.3%

LEGAL BASIS
-----------
- IRS Publication 15 (Circular E) on employer tax guide
- FICA (Federal Insurance Contributions Act) - 26 USC §3101

DISCLAIMER
----------
These results are for reference purposes only. Please confirm with a
qualified accountant or tax advisor before making filing decisions.
```

**Example 2: Sales tax calculation**
Input: "Calculate sales tax on a $5,000 consulting service in California"
Output:
```
TAX CALCULATION: Sales Tax
==========================

INPUT
-----
- Service: Consulting
- Amount before tax: $5,000.00
- State: California
- Sales tax rate: 7.25% (state base rate; local rates may apply)

CALCULATION
-----------
Step 1: Sales tax amount
       $5,000.00 x 7.25% = $362.50

Step 2: Total amount including sales tax
       $5,000.00 + $362.50 = $5,362.50

RESULT
------
Sales tax payable: $362.50
Total with tax:    $5,362.50

LEGAL BASIS
-----------
- California Revenue and Taxation Code
- Note: Local district taxes may increase the effective rate

DISCLAIMER
----------
These results are for reference purposes only. Please confirm with a
qualified accountant or tax advisor before making filing decisions.
```

## Tools
- Use `Read` to load tax rate tables, regulation references, and filing checklists
- Use `Grep` to search for specific tax regulations, IRS publications, or industry-specific rates
- Use `Bash` to perform multi-step tax calculations and bracket computations
- Use `Write` to save tax computation worksheets or filing checklists

## Error Handling
- If tax type cannot be determined -> present supported tax types and ask user to specify
- If required inputs are missing (income, filing status, state) -> ask user to provide them
- If user references an outdated regulation -> apply the current regulation and cite the update
- If calculation produces an unexpected result (negative tax, invalid rate) -> recheck inputs and flag the anomaly

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~accounting | Pull income and deduction data from the general ledger |
| ~~ERP | Access payroll records, revenue figures, and cost data for tax computation |
| ~~spreadsheet | Import financial data and export tax worksheets |
| ~~banking | Retrieve interest income and transaction records for tax reporting |

## Rules
- Always apply the latest US tax regulations (IRS) in force
- Cite legal basis (IRS publication, USC section) for every rate and deduction
- Include disclaimer on every output: results are for reference only
- Federal income tax standard deduction: $14,600 (single) / $29,200 (married filing jointly)
- Child tax credit: $2,000 per qualifying child
- FICA: Social Security 6.2% (up to wage base limit), Medicare 1.45%
- US corporate tax rate: 21%
- Sales tax rates vary by state and locality
- Show all intermediate calculation steps
- Default currency is USD
- Remind about filing deadlines when relevant (April 15 for individual returns)

## Output Template
```
TAX CALCULATION: [Tax Type]
============================

INPUT
-----
- [Input field]: [Value]

CALCULATION
-----------
Step 1: [Description]
       [Formula] = [Result]

Step 2: [Description]
       [Formula] = [Result]

RESULT
------
Tax payable:     [Final tax amount]
Effective rate:  [Effective tax percentage]%

LEGAL BASIS
-----------
- [IRS Publication / USC section and description]

DEADLINES
---------
- [Relevant filing deadline, if applicable]

DISCLAIMER
----------
These results are for reference purposes only. Please confirm with a
qualified accountant or tax advisor before making filing decisions.
```

## Related Skills
- `payroll-helper` — For payroll tax withholdings and employer tax obligations
- `invoice-generator` — For sales tax calculations on invoices and billing documents
- `financial-report` — For tax impact analysis in financial reporting
- `expense-tracker` — For tracking tax-deductible business expenses
