---
name: sheets-reader
description: >
  Reads, queries, and summarizes data from Google Sheets using the Sheets API (read-only).
  Use when the user says "read my spreadsheet", "get data from Google Sheets",
  "look up a value in the sheet", "what's in cell A1", "show me the sales data",
  "list sheets in this workbook", "find Bob's row", "pull data from Sheets",
  or wants to read cell values, get a range, summarize a spreadsheet, find a row, or extract data for analysis.
---

# Sheets Reader

## Quick Start
Fetch data from Google Sheets via the Sheets API using `spreadsheets.values.get` and `spreadsheets.get`. Supports reading single cells, named ranges, full sheets, and multiple ranges in one request. Requires `https://www.googleapis.com/auth/spreadsheets.readonly` scope.

## Setup — Get Google Sheets Access Token

Resolve the access token in this order. Stop at the first one that succeeds.

**1. Load from `workspace/configs/access_tokens.json` (preferred)**

Read the file with the `Read` tool. Use `providers.google.access_token` if all of these hold:
- File exists and parses as JSON
- `providers.google.access_token` is non-empty
- `providers.google.expires_at` (unix seconds) is in the future
- `providers.google.scopes` includes `spreadsheets.readonly` (or full URL `https://www.googleapis.com/auth/spreadsheets.readonly`)

Expected schema:
```json
{
  "version": 1,
  "providers": {
    "google": {
      "access_token": "ya29...",
      "refresh_token": "1//...",
      "expires_at": 1777446908,
      "scopes": ["spreadsheets.readonly"],
      "user_email": "u@example.com",
      "obtained_at": 1777443309
    }
  }
}
```

If the token is expired or scope is missing, fall through to step 2.

**2. Ask user to connect via `intern/me`**

Tell the user: *"No valid Google token found. Open `intern/me` → Connect Account → Google (grant `spreadsheets.readonly`), then re-run this skill."*

**3. Manual OAuth Playground (fallback only if user requests)**

1. Go to **Google OAuth Playground**: https://developers.google.com/oauthplayground
2. In the left panel, find and select scope: `https://www.googleapis.com/auth/spreadsheets.readonly`
3. Click **Authorize APIs** → sign in with the Google account that has access to the spreadsheet
4. Click **Exchange authorization code for tokens**
5. Copy the **Access token** and paste it back here

> **Note:** The access token expires after ~1 hour. On `401 Unauthorized`, re-check `workspace/configs/access_tokens.json`, then prompt the user to refresh via `intern/me` or repeat the OAuth Playground steps.

## Workflow
1. Identify the spreadsheet (by URL, ID, or name) and the target range or sheet name
2. Extract the spreadsheet ID from the URL: `https://docs.google.com/spreadsheets/d/<SPREADSHEET_ID>/edit`
3. Call `GET /v4/spreadsheets/<id>/values/<range>` for data, or `GET /v4/spreadsheets/<id>` for metadata
4. Parse the returned `values` 2D array — first row is typically the header
5. Present data as a formatted table, summary, or filtered results based on the user's request

## Examples

**Example 1: Read a sheet range**
Input: "Read the Q1 Sales data from my spreadsheet https://docs.google.com/spreadsheets/d/1BxiM..."
Output:
```
SPREADSHEET: Q1 Sales Tracker
==============================
Sheet:  Sales Data
Range:  A1:E6
Rows:   5 (+ 1 header)

| Rep          | Region    | Q1 Target | Q1 Actual | Attainment |
|--------------|-----------|-----------|-----------|------------|
| Alice Brown  | Northeast | $120,000  | $134,500  | 112%       |
| Bob Smith    | Southeast | $95,000   | $88,200   | 92.8%      |
| Carol Davis  | Midwest   | $110,000  | $115,000  | 104.5%     |
| Dan Lee      | West      | $130,000  | $141,200  | 108.6%     |
| Eva Martinez | Southwest | $85,000   | $79,400   | 93.4%      |

Summary: 3 of 5 reps hit target (60%). Top performer: Alice Brown (112%).
```

**Example 2: Find a row by key**
Input: "Find Bob Smith's row in the sales sheet"
Output:
```
LOOKUP RESULT
==============
Sheet:   Sales Data
Search:  "Bob Smith" in column A

Row 3:
  Rep:        Bob Smith
  Region:     Southeast
  Q1 Target:  $95,000
  Q1 Actual:  $88,200
  Attainment: 92.8%
```

**Example 3: List all sheets in a workbook**
Input: "What sheets are in this spreadsheet?"
Output:
```
SPREADSHEET METADATA
=====================
Title:  Q1 Sales Tracker
ID:     1BxiMVs0XRA5nFMdKvBdBZjgmUUqptlbs74OgVE2upms

Sheets (4 total):
1. Sales Data         (rows: 52, cols: 8)
2. Pipeline           (rows: 120, cols: 12)
3. Team Summary       (rows: 6, cols: 5)
4. Charts             (rows: 1, cols: 1)
```

## Tools
- Use `Read` to load `workspace/configs/access_tokens.json` and extract the Google access token
- Use `WebFetch` to call Sheets API endpoints with the user's OAuth access token
- Use `Bash` with curl as fallback for API calls

## Error Handling
- If `workspace/configs/access_tokens.json` is missing or has no `providers.google` entry → tell user to connect at `intern/me`, or fall back to OAuth Playground if requested
- If token in JSON is expired (`expires_at` <= now) → tell user to refresh via `intern/me`
- If required scope `spreadsheets.readonly` not in `providers.google.scopes` → tell user to re-connect at `intern/me` granting Sheets scope
- If spreadsheet URL or ID not provided → ask the user to paste the Google Sheets URL
- If `401 Unauthorized` from API → token expired/revoked; re-check JSON, then prompt re-auth via `intern/me`
- If `403 Forbidden` → scope not granted or spreadsheet not shared; verify `spreadsheets.readonly` scope and file permissions
- If `404 Not Found` → spreadsheet ID is invalid or file was deleted
- If range is invalid → call `GET /v4/spreadsheets/<id>` to list valid sheet names, then ask user to confirm the range
- If values array is empty → sheet or range is empty; confirm with user

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~drive | Discover and access spreadsheets stored in Google Drive |
| ~~email | Email spreadsheet data summaries and reports to teammates |
| ~~notes | Save key data insights and table snapshots to notes |

## Rules
- Scope required: `https://www.googleapis.com/auth/spreadsheets.readonly`
- Base URL: `https://sheets.googleapis.com/v4/spreadsheets`
- Always include `Authorization: Bearer <access_token>` header
- Spreadsheet ID is extracted from the URL between `/d/` and `/edit`
- Range format: `SheetName!A1:Z100` or just `A1:Z100` (defaults to first sheet)
- Use `valueRenderOption=FORMATTED_VALUE` to get display values (with currency symbols, percentages, etc.)
- Use `GET /v4/spreadsheets/<id>?includeGridData=false` for metadata (sheet names, row/col counts)
- For batch reads use `batchGet?ranges=Sheet1!A1:B10&ranges=Sheet2!A1:C5`
- Treat first row as headers when presenting tabular data unless user specifies otherwise
- Max cells per read: 10,000,000 — paginate or narrow range for large sheets

## Output Template
```
SPREADSHEET: [Title]
=====================
Sheet:  [Sheet name]
Range:  [A1 notation]
Rows:   [N] (+ 1 header)

| [Col 1] | [Col 2] | [Col 3] |
|---------|---------|---------|
| [val]   | [val]   | [val]   |

Summary: [Key insight or row count]
```

## Related Skills
- `spreadsheet-helper` -- For writing formulas and structuring data in spreadsheets
- `drive-reader` -- For browsing Google Drive to find spreadsheets
- `document-summarizer` -- For summarizing large datasets or exported spreadsheet reports
