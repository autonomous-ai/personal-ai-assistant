---
name: exa-web-search
description: >
  Search the web for current information using Exa.ai neural search engine.
  Use when the user says "search for", "look up", "find information about", "research",
  "what is the latest", "current news about", "deep search", "find companies that",
  "semantic search", "find similar pages to", "neural search for",
  or when you need up-to-date data that may not be in your training data.
---

# Exa Web Search

Search the web using Exa.ai via the Autonomous proxy endpoint.

## How to Use

Use the `exec` tool to call the search script:

```bash
./workspace/skills/exa-web-search/search.sh '{"query": "YOUR_SEARCH_QUERY", "num_results": 5, "type": "auto", "include_summary": true}'
```

## Workflow

1. Determine the search query from the user's request
2. Call the endpoint using `exec` with `curl` as shown above
3. Parse the JSON response
4. Synthesize the results into a clear, well-structured answer with citations
5. If results are insufficient, refine the query and search again (max 3 searches per request)

## Request Fields

| Field | Type | Required | Default | Description |
|-------|------|----------|---------|-------------|
| query | string | yes | - | The search query |
| num_results | int | no | 5 | Number of results (1-10) |
| type | string | no | "auto" | Search type: "auto", "neural", "keyword" |
| include_domains | string[] | no | [] | Only search these domains |
| exclude_domains | string[] | no | [] | Exclude these domains |
| include_text | bool | no | false | Include full page text (uses more context) |
| include_summary | bool | no | false | Include AI-generated summary per result |

## Response Format

```json
{
  "results": [
    {
      "title": "Page Title",
      "url": "https://example.com/article",
      "highlights": ["Relevant excerpt..."],
      "summary": "AI-generated summary of the page"
    }
  ]
}
```

## Best Practices

- Use `include_summary: true` for quick overviews — avoids loading full text into context
- Use `include_text: true` only when you need detailed content from pages
- Use `type: "neural"` for semantic/conceptual searches ("companies doing X")
- Use `type: "keyword"` for exact-match searches ("error code ABC123")
- Keep `num_results` between 3-5 to balance coverage vs context size
- Always cite sources with URLs when presenting results to the user
- For multi-step research, start broad then narrow with domain filters

## Error Handling

- **401**: Missing API key — ensure x-api-key header is set
- **429**: Rate limit reached — inform the user their plan limit is reached
- **502**: Exa API error — retry once, then inform the user search is temporarily unavailable

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~search engine | Combine Exa neural search with traditional keyword search for broader coverage |
| ~~notes | Save research findings and source links directly to your notes |
| ~~drive | Store detailed research reports in Google Drive for team sharing |

## Rules
- Always cite sources with URLs when presenting results to the user
- Maximum 3 search refinements per request to avoid excessive API calls
- Prefer `include_summary: true` over `include_text: true` to conserve context window
- For multi-step research, start broad then narrow with domain filters
- Never fabricate information when no results are found

## Related Skills
- `web-search` -- For traditional keyword-based web searches when neural search is not ideal
- `document-summarizer` -- For condensing lengthy articles found through Exa search
- `translator` -- For translating search results in foreign languages
