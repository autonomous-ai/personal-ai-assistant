---
name: spreadsheet-helper
description: >
  Assists with spreadsheet formulas, data organization, pivot table design, and data cleanup for Excel and Google Sheets.
  Use when the user says "write a formula", "help with VLOOKUP", "create a pivot table",
  "clean up my spreadsheet", "conditional formatting", "how to sum by category",
  "fix my Excel formula", "Google Sheets function for", "sort and filter my data",
  or asks about formulas, cell references, data formatting, or any spreadsheet-related task.
---

# Spreadsheet Helper

## Quick Start
Help users write formulas, structure data, design pivot tables, and clean up spreadsheet data. Support both Excel and Google Sheets syntax. Always clarify which platform when syntax differs.

## Workflow
1. Identify the task: formula writing, data cleanup, pivot table design, conditional formatting, or data structuring
2. Confirm the spreadsheet platform (Excel vs Google Sheets) if syntax-sensitive
3. Understand the data layout: column headers, data types, row count
4. Provide the solution with step-by-step explanation
5. Offer alternative approaches when applicable (e.g., XLOOKUP vs VLOOKUP)

## Examples

**Example 1: Formula**
Input: "Write a formula to sum revenue by month from column B (date) and column D (amount)"
Output:
```
FORMULA SOLUTION
================
Task: Sum revenue by month
Platform: Excel / Google Sheets (compatible)

Formula (place in target cell):
=SUMPRODUCT((MONTH(B2:B1000)=1)*(YEAR(B2:B1000)=2026)*D2:D1000)

For all months at once, use this in a summary table:
- Cell with month number in F2 (1-12), year in G2:
=SUMPRODUCT((MONTH($B$2:$B$1000)=F2)*(YEAR($B$2:$B$1000)=G2)*$D$2:$D$1000)

Alternative (Google Sheets):
=QUERY(B2:D1000, "SELECT MONTH(B)+1, SUM(D) GROUP BY MONTH(B)+1 LABEL MONTH(B)+1 'Month', SUM(D) 'Total Revenue'")

Explanation:
- SUMPRODUCT multiplies arrays and sums results without needing Ctrl+Shift+Enter
- MONTH() extracts month number from date in column B
- Adjust range B2:B1000 to match your actual data range
```

**Example 2: Data Cleanup**
Input: "I have duplicate rows and inconsistent date formats in my sheet, how to fix?"
Output:
```
DATA CLEANUP GUIDE
==================

Step 1: Remove Duplicates
- Excel: Data tab → Remove Duplicates → Select columns to check
- Google Sheets: Data → Data cleanup → Remove duplicates
- Formula approach: =UNIQUE(A2:F1000) to extract unique rows

Step 2: Standardize Date Formats
- Select the date column → Format Cells → Date → Choose MM/DD/YYYY
- For text-to-date conversion:
  Excel: =DATEVALUE(A2)
  Google Sheets: =DATEVALUE(A2) or =TO_DATE(A2)
- If dates are mixed formats (01/03/2026 vs Mar 1, 2026):
  =TEXT(A2, "MM/DD/YYYY") to standardize output

Step 3: Verify
- Sort by date column to spot remaining inconsistencies
- Use conditional formatting to highlight blanks or errors
```

## Tools
- Use `Read` to load CSV or spreadsheet-related files the user provides
- Use `Write` to save formula references or cleaned data to files
- Use `Bash` to process CSV data with command-line tools when needed

## Error Handling
- If platform not specified → provide both Excel and Google Sheets syntax
- If data layout is unclear → ask user to describe column headers and sample rows
- If formula returns an error → explain common causes (#N/A, #REF!, #VALUE!) and fixes
- If data range is unknown → use a generous range and note to adjust

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~drive | Access and read spreadsheets stored in Google Drive |
| ~~email | Email formatted spreadsheet reports or data summaries |
| ~~search engine | Look up formula syntax, function documentation, and best practices |

## Rules
- Always explain what each part of a formula does
- Use absolute references ($) where appropriate and explain why
- Prefer modern functions (XLOOKUP over VLOOKUP, FILTER over helper columns)
- Note platform differences when Excel and Google Sheets syntax diverge
- For large datasets (>10,000 rows), suggest performance-optimized approaches
- Currency formatting defaults to USD unless specified
- Always warn about common pitfalls (date format locale, number-as-text issues)

## Output Template
```
[FORMULA/GUIDE] SOLUTION
=========================
Task: [What the user needs]
Platform: [Excel / Google Sheets / Both]

[Solution with formulas or step-by-step instructions]

Explanation:
- [What each component does]

Alternative Approach:
- [Simpler or more advanced option if applicable]

Common Pitfalls:
- [Things to watch out for]
```

## Related Skills
- `sheets-reader` -- For reading live data from Google Sheets via the Sheets API
- `document-summarizer` -- For summarizing data insights from large spreadsheets
- `presentation-maker` -- For turning spreadsheet data into presentation slides
