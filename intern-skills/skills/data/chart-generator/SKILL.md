---
name: chart-generator
description: Generates chart specifications, data visualization recommendations, and chart code snippets for common charting libraries. Use when the user asks to create a chart, graph, visualization, or dashboard component from data. Trigger phrases include "make me a chart", "visualize this data", "I need a graph for", "create a bar chart", "plot this as a line chart", "build a dashboard chart", "show me this data visually".
---

# Chart Generator

## Quick Start
Design data visualizations by recommending the right chart type, generating chart configurations, and producing code snippets for popular libraries (Chart.js, ECharts, Google Sheets, Excel). Start with data understanding, then match to the best visual format.

## Workflow
1. Understand the data: dimensions, measures, data types, row count
2. Identify the goal: comparison, trend, distribution, composition, relationship
3. Recommend the best chart type for the goal
4. Generate chart configuration or code snippet for the user's preferred library
5. Include formatting: labels, colors, legends, axis titles
6. Suggest improvements for clarity and readability

## Examples

**Example 1: Revenue Trend Chart**
Input: "Create a monthly revenue chart from this data: Jan: 500M, Feb: 620M, Mar: 580M, Apr: 710M"
Output:
```
CHART RECOMMENDATION
====================
Goal: Show trend over time
Chart Type: Line chart with data markers
Library: Chart.js

{
  type: 'line',
  data: {
    labels: ['Jan', 'Feb', 'Mar', 'Apr'],
    datasets: [{
      label: 'Revenue ($M)',
      data: [500, 620, 580, 710],
      borderColor: '#2563eb',
      backgroundColor: 'rgba(37, 99, 235, 0.1)',
      fill: true,
      tension: 0.3,
      pointRadius: 5,
      pointBackgroundColor: '#2563eb'
    }]
  },
  options: {
    plugins: {
      title: { display: true, text: 'Monthly Revenue Q1-Q2 2026' },
      legend: { display: false }
    },
    scales: {
      y: {
        beginAtZero: true,
        title: { display: true, text: 'Revenue ($M)' }
      }
    }
  }
}

Key Insight: Revenue grew 42% from Jan to Apr despite a dip in March.
Suggestion: Add a target line to show performance vs goal.
```

**Example 2: Category Comparison**
Input: "Create a chart comparing sales by region: North 35%, Central 25%, South 40%"
Output: A horizontal bar chart or donut chart configuration with proper labels and colors.

## Tools
- Use `Read` to load data files for visualization
- Use `Write` to save chart configurations or code to files
- Use `Bash` to process or aggregate data before charting

## Error Handling
- If data format is unclear → ask for sample rows or column descriptions
- If chart library not specified → default to Chart.js and note alternatives
- If too many categories (>10) → suggest grouping or filtering top N
- If data has missing values → note the gaps and suggest handling approach

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~database | Pull live data directly from databases to generate up-to-date charts |
| ~~BI tool | Embed generated chart configs into dashboards and scheduled visual reports |
| ~~spreadsheet | Read chart data from linked spreadsheets and export configs back |
| ~~data warehouse | Access aggregated warehouse tables for large-scale visualizations |

## Rules
- Always recommend the chart type before generating code
- Match chart type to analytical goal: line (trend), bar (comparison), pie (composition), scatter (relationship)
- Maximum 7 colors in a single chart for readability
- Always include axis labels, title, and legend
- Use colorblind-friendly palettes by default
- For pie/donut charts, limit to 6 segments (group rest as "Other")
- Provide the code snippet ready to copy-paste
- Note data insights visible in the chart

## Output Template
```
CHART RECOMMENDATION
====================
Goal: [Comparison / Trend / Distribution / Composition / Relationship]
Chart Type: [Recommended chart type]
Library: [Chart.js / ECharts / Google Sheets / Excel]

[Chart configuration or code snippet]

Key Insight: [What the chart reveals]
Suggestion: [Improvement or additional visualization]
```

## Related Skills
- **data-summarizer** -- analyze and summarize the dataset before choosing the right chart
- **kpi-tracker** -- pair charts with KPI scorecards for performance dashboards
- **sql-helper** -- write queries to extract and shape the data for visualization
