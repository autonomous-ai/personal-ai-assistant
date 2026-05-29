---
name: web-search
description: >
  Searches the web for information, facts, news, and comparisons.
  Use when the user says "search for", "look up", "Google this", "what's the latest on",
  "find me info about", "fact-check this", "compare X vs Y", "how much does X cost",
  "what's the weather", "is it true that", or when a question requires up-to-date data
  like prices, weather, events, or news.
---

# Web Search

## Quick Start
Formulate focused search queries based on the user's information need. Cross-reference multiple sources for accuracy. Always cite sources with URLs.

## Workflow
1. Classify the request: factual lookup, real-time data, comparison, fact-check, or deep research
2. Formulate up to 3 distinct search queries tailored to the category
3. Execute searches, aggregate results, and cross-reference for consistency
4. Synthesize findings into a concise answer with source attribution
5. If results conflict, present all perspectives transparently

## Examples

**Example 1: Factual Lookup**
Input: "What is the current US GDP?"
Output:
The US GDP is approximately $28.8 trillion as of 2024, making it the largest economy in the world.

Sources:
- Bureau of Economic Analysis: https://www.bea.gov/data/gdp/gross-domestic-product
- World Bank: https://data.worldbank.org/country/united-states

**Example 2: Comparison**
Input: "Compare PostgreSQL vs MySQL for a new web app"
Output:
| Feature | PostgreSQL | MySQL |
|---|---|---|
| ACID compliance | Full | Full (InnoDB) |
| JSON support | Native JSONB | Basic JSON |
| Replication | Streaming + logical | Built-in |
| Best for | Complex queries, analytics | Simple reads, high throughput |

Sources:
- DB-Engines: https://db-engines.com/en/system/MySQL%3BPostgreSQL
- PostgreSQL Docs: https://www.postgresql.org/docs/

## Tools
- Use `WebSearch` to execute queries and retrieve results
- Use `WebFetch` to load full page content when snippets are insufficient
- Use `Read` to access local files the user references as research context

## Error Handling
- If no results found → inform the user honestly, suggest alternative search terms
- If results conflict → present all perspectives with source attribution
- If query is too vague → ask a clarifying question before searching
- If a URL is unreachable → note it as unavailable, rely on other sources

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~search engine | Access Google, Bing, or DuckDuckGo for real-time web results |
| ~~notes | Save research findings directly to your note-taking app |
| ~~email | Email search results and summaries to yourself or teammates |

## Rules
- Prioritize reliable sources: official sites, peer-reviewed publications, reputable news
- Never fabricate information when no results are found
- Always cite sources with URLs
- Respond in the language the user is using
- Keep answers concise; provide depth only when explicitly requested
- Maximum 3 search queries per request

## Output Template
```
[Answer Summary]

Details:
- [Key point 1 with context]
- [Key point 2 with context]
- [Key point 3 if applicable]

Sources:
- [Source title 1]: [url1]
- [Source title 2]: [url2]
```

## Related Skills
- `exa-web-search` -- For deep semantic search using Exa.ai neural search engine
- `document-summarizer` -- For summarizing lengthy articles found during research
- `translator` -- For translating foreign-language search results
