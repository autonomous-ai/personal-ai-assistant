---
name: sql-helper
description: Writes, explains, optimizes, and debugs SQL queries for common databases. Use when the user asks to write a SQL query, fix a query error, optimize slow queries, or explain what a query does. Trigger phrases include "help me write a query", "my SQL is broken", "this query is too slow", "how do I join these tables", "write me a SELECT statement", "explain this SQL", "I need a database query for...".
---

# SQL Helper

## Quick Start
Write, explain, optimize, and debug SQL queries. Support MySQL, PostgreSQL, SQL Server, and SQLite syntax. Always clarify the database engine when syntax differs. Prioritize readable, performant queries.

## Workflow
1. Understand the goal: data retrieval, aggregation, join, update, or schema design
2. Confirm the database engine if syntax-sensitive (MySQL vs PostgreSQL vs SQL Server)
3. Gather table structure: column names, types, relationships
4. Write the query with proper formatting and aliases
5. Explain each part of the query
6. Suggest indexes or optimizations if applicable

## Examples

**Example 1: Aggregation Query**
Input: "Write a query to calculate total revenue by month from the orders table, for 2026 only"
Output:
```
SQL QUERY
=========
Task: Monthly revenue for 2026
Engine: MySQL (compatible with PostgreSQL)

SELECT
    YEAR(order_date)                    AS year,
    MONTH(order_date)                   AS month,
    COUNT(*)                            AS total_orders,
    SUM(total_amount)                   AS revenue,
    AVG(total_amount)                   AS avg_order_value
FROM orders
WHERE order_date >= '2026-01-01'
  AND order_date < '2027-01-01'
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

EXPLANATION
-----------
- WHERE: Filters to 2026 using range comparison (index-friendly, avoids YEAR() on column)
- GROUP BY: Groups rows by year and month
- SUM/COUNT/AVG: Calculates revenue, order count, and average order value
- ORDER BY: Sorts chronologically

PERFORMANCE TIP:
- Ensure index on: orders(order_date)
- Range filter (>= and <) is more efficient than YEAR(order_date) = 2026
```

**Example 2: Debug a Query**
Input: "This query is slow, can you optimize it?"
```sql
SELECT * FROM orders o
JOIN customers c ON c.id = o.customer_id
WHERE YEAR(o.created_at) = 2026
```
Output:
```
OPTIMIZATION
============
Issues Found:
1. SELECT * — fetching all columns when likely only a few are needed
2. YEAR(o.created_at) — function on column prevents index usage
3. Missing index hint

Optimized Query:
SELECT
    o.id,
    o.total_amount,
    o.created_at,
    c.name,
    c.email
FROM orders o
JOIN customers c ON c.id = o.customer_id
WHERE o.created_at >= '2026-01-01'
  AND o.created_at < '2027-01-01';

Recommended Indexes:
- CREATE INDEX idx_orders_created_at ON orders(created_at);
- CREATE INDEX idx_orders_customer_id ON orders(customer_id);

Expected Improvement: 5-10x faster on large tables (>100K rows)
```

## Tools
- Use `Read` to load SQL files or schema definitions
- Use `Write` to save queries to .sql files
- Use `Grep` to search for table or column references in the codebase

## Error Handling
- If table structure is unknown → ask for schema or column names
- If database engine not specified → default to MySQL and note syntax differences
- If query has syntax errors → identify and fix with explanation
- If query logic seems wrong → flag potential issues before executing

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~database | Run queries directly against live databases and return real results |
| ~~BI tool | Export query output into dashboards and scheduled reports |
| ~~spreadsheet | Pull table schemas from linked spreadsheets or push query results to sheets |
| ~~data warehouse | Access warehouse catalog, table metadata, and execution plans for optimization |

## Rules
- Always format queries with proper indentation and uppercase keywords
- Use explicit column names — never SELECT * in production queries
- Prefer JOIN syntax over subqueries where possible for readability
- Always suggest relevant indexes for WHERE and JOIN columns
- Use parameterized queries (placeholders) when values come from user input — never concatenate
- Explain the query logic in plain language
- Note engine-specific syntax differences when relevant (e.g., LIMIT vs TOP)
- For UPDATE/DELETE queries, always suggest testing with SELECT first

## Output Template
```
SQL QUERY
=========
Task: [What the query does]
Engine: [MySQL / PostgreSQL / SQL Server / SQLite]

[Formatted SQL query]

EXPLANATION
-----------
- [Line-by-line or section explanation]

PERFORMANCE TIP:
- [Index suggestions or optimization notes]
```

## Related Skills
- **data-summarizer** -- after querying data, summarize and analyze the results for insights
- **data-cleaner** -- clean and standardize messy data before or after SQL operations
- **chart-generator** -- visualize query results with charts and graphs
