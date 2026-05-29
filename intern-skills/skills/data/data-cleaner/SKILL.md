---
name: data-cleaner
description: Cleans, validates, and standardizes messy data by fixing formatting issues, removing duplicates, handling missing values, and normalizing inconsistent entries. Use when the user asks to clean up data, fix data quality issues, standardize formats, deduplicate records, or prepare data for analysis. Trigger phrases include "clean up this data", "fix the formatting in this file", "remove duplicates", "standardize these entries", "this data is messy", "prepare this data for analysis", "normalize these records".
---

# Data Cleaner

## Quick Start
Clean messy data by identifying and fixing quality issues: duplicates, missing values, inconsistent formats, outliers, and invalid entries. Provide step-by-step cleaning instructions or scripts for common tools (Excel, Python/pandas, SQL).

## Workflow
1. Profile the data: inspect format, column types, row count, sample values
2. Identify quality issues: missing values, duplicates, format inconsistencies, outliers, invalid data
3. Propose a cleaning plan with prioritized steps
4. Provide cleaning instructions or code for the user's preferred tool
5. Suggest validation checks to verify data quality after cleaning
6. Document all transformations applied

## Examples

**Example 1: CSV Data Cleanup**
Input: "The customer CSV file has data errors, help me fix it"
Output:
```
DATA QUALITY REPORT
===================
File: customers.csv
Records: 5,230 rows × 8 columns

ISSUES FOUND
-------------
| #  | Issue                    | Column       | Count | Severity |
|----|--------------------------|--------------|-------|----------|
| 1  | Duplicate rows           | (full row)   | 127   | HIGH     |
| 2  | Missing values           | phone        | 342   | Medium   |
| 3  | Missing values           | email        | 89    | Medium   |
| 4  | Inconsistent date format | created_date | 1,205 | HIGH     |
|    |   (MM/DD/YYYY vs DD/MM)  |              |       |          |
| 5  | Invalid email format     | email        | 45    | Medium   |
| 6  | Extra whitespace         | name         | 892   | Low      |
| 7  | Inconsistent casing      | city         | 318   | Low      |

CLEANING PLAN
-------------

Step 1: Remove exact duplicates
  Excel:  Data → Remove Duplicates (select all columns)
  Python: df = df.drop_duplicates()
  SQL:    DELETE FROM customers WHERE id NOT IN (
            SELECT MIN(id) FROM customers GROUP BY email, phone
          )

Step 2: Standardize date format → MM/DD/YYYY
  Excel:  =TEXT(DATEVALUE(A2), "MM/DD/YYYY")
  Python: df['created_date'] = pd.to_datetime(df['created_date'],
            dayfirst=False).dt.strftime('%m/%d/%Y')

Step 3: Fix email format issues
  Python: df['email'] = df['email'].str.strip().str.lower()
          invalid = df[~df['email'].str.match(r'^[\w.+-]+@[\w-]+\.[\w.]+$')]

Step 4: Trim whitespace and normalize casing
  Python: df['name'] = df['name'].str.strip().str.title()
          df['city'] = df['city'].str.strip().str.title()

Step 5: Handle missing values
  - phone: Flag for manual review (cannot auto-fill)
  - email: Flag for manual review

VALIDATION CHECKS (run after cleaning):
- assert df.duplicated().sum() == 0
- assert df['email'].str.contains('@').all()
- assert df['created_date'].str.match(r'\d{2}/\d{2}/\d{4}').all()
```

**Example 2: Quick Fix**
Input: "My phone number column has mixed formats: (555) 123-4567, +15551234567, 555-123-4567"
Output: A standardization script to normalize all phone numbers to a consistent format.

## Tools
- Use `Read` to load data files for inspection
- Use `Write` to save cleaning scripts or cleaned data
- Use `Bash` to run data processing commands
- Use `Grep` to identify patterns and inconsistencies in data

## Error Handling
- If file format is unsupported → suggest converting to CSV
- If dataset is too large → provide scripts instead of manual steps
- If cleaning rules conflict → ask user for priority order
- If data loss is possible → warn and suggest backup before cleaning

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~database | Connect to live databases to profile and clean data in place |
| ~~BI tool | Flag data quality issues that affect downstream dashboards and reports |
| ~~spreadsheet | Read messy data from linked spreadsheets and write cleaned results back |
| ~~data warehouse | Run cleaning transformations at scale on warehouse tables |

## Rules
- Always profile data quality before proposing fixes
- Provide solutions in multiple tools when possible (Excel, Python, SQL)
- Never delete data without user confirmation — flag for review instead
- Document every transformation for reproducibility
- Preserve original data — work on copies or add cleaned columns
- Validate data quality after each cleaning step
- Default date format: MM/DD/YYYY; default phone format: +1 (XXX) XXX-XXXX
- Sort issues by severity: HIGH → Medium → Low

## Output Template
```
DATA QUALITY REPORT
===================
File: [Filename]
Records: [Rows] × [Columns]

ISSUES FOUND
-------------
| # | Issue | Column | Count | Severity |
|---|-------|--------|-------|----------|
| [N] | [Description] | [Column] | [Count] | [HIGH/Medium/Low] |

CLEANING PLAN
-------------
Step [N]: [Action]
  Excel:  [Excel instructions]
  Python: [Python code]
  SQL:    [SQL query]

VALIDATION CHECKS:
- [Check to verify cleaning was successful]
```

## Related Skills
- **data-summarizer** -- summarize and analyze the cleaned dataset to extract insights
- **sql-helper** -- write SQL-based cleaning queries for database-hosted data
- **kpi-tracker** -- ensure clean data feeds accurate KPI scorecards
