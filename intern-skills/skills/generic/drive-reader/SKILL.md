---
name: drive-reader
description: >
  Browses, searches, and reads files and folders in Google Drive using the Drive API (read-only).
  Use when the user says "find my document", "list files in Drive", "open the Google Doc",
  "search Drive for", "what's in my shared folder", "who has access to this file",
  "read the report from Drive", "check my Google Drive",
  or wants to list files, search by name or content, read a Doc, or check file metadata and permissions.
---

# Drive Reader

## Quick Start
Search and retrieve Google Drive files via the Drive API using `files.list` and `files.get`. Support searching by name, MIME type, folder, and full-text content. Requires `https://www.googleapis.com/auth/drive.readonly` scope.

## Setup — Get Google Drive Access Token

Resolve the access token in this order. Stop at the first one that succeeds.

**1. Load from `workspace/configs/access_tokens.json` (preferred)**

Read the file with the `Read` tool. Use `providers.google.access_token` if all of these hold:
- File exists and parses as JSON
- `providers.google.access_token` is non-empty
- `providers.google.expires_at` (unix seconds) is in the future
- `providers.google.scopes` includes `drive.readonly` (or full URL `https://www.googleapis.com/auth/drive.readonly`)

Expected schema:
```json
{
  "version": 1,
  "providers": {
    "google": {
      "access_token": "ya29...",
      "refresh_token": "1//...",
      "expires_at": 1777446908,
      "scopes": ["drive.readonly"],
      "user_email": "u@example.com",
      "obtained_at": 1777443309
    }
  }
}
```

If the token is expired or scope is missing, fall through to step 2.

**2. Ask user to connect via `intern/me`**

Tell the user: *"No valid Google token found. Open `intern/me` → Connect Account → Google (grant `drive.readonly`), then re-run this skill."*

**3. Manual OAuth Playground (fallback only if user requests)**

1. Go to **Google OAuth Playground**: https://developers.google.com/oauthplayground
2. In the left panel, find and select scope: `https://www.googleapis.com/auth/drive.readonly`
3. Click **Authorize APIs** → sign in with the Google account that has the Drive files
4. Click **Exchange authorization code for tokens**
5. Copy the **Access token** and paste it back here

> **Note:** The access token expires after ~1 hour. On `401 Unauthorized`, re-check `workspace/configs/access_tokens.json`, then prompt the user to refresh via `intern/me` or repeat the OAuth Playground steps.

## Workflow
1. Determine the request: search by name, browse folder, read file content, or check file metadata/permissions
2. Build the Drive query string using `q` parameter operators (name contains, mimeType =, parents in, fullText contains)
3. Call `GET /drive/v3/files?q=<query>&fields=<fields>` to list matching files
4. For file content: export Google Docs/Sheets/Slides as plain text or fetch binary files
5. Present structured results with file name, type, owner, last modified, and sharing status

## Examples

**Example 1: Search files by name**
Input: "Find files named 'Q1 Report' in my Drive"
Output:
```
GOOGLE DRIVE SEARCH
====================
Query:   name contains 'Q1 Report'
Found:   3 files

1. Q1 Report 2026.docx
   Type:     Google Docs
   Owner:    john@example.com
   Modified: 03/24/2026 09:00 AM
   Location: My Drive / Reports / 2026

2. Q1 Report - Finance.xlsx
   Type:     Google Sheets
   Owner:    me@company.com
   Modified: 03/20/2026 03:15 PM
   Location: Shared with me / Finance Team

3. Q1 Report Presentation.pptx
   Type:     Google Slides
   Owner:    sarah@company.com
   Modified: 03/18/2026 11:00 AM
   Location: Shared with me / Marketing
```

**Example 2: List files in a folder**
Input: "List all files in the 'Projects' folder"
Output:
```
FOLDER: Projects (8 files)
===========================
Name                          | Type           | Modified
------------------------------|----------------|---------------------
Website Redesign Brief.docx   | Google Docs    | 03/23/2026 02:00 PM
Budget Tracker.xlsx            | Google Sheets  | 03/22/2026 10:30 AM
Wireframes v3.fig              | File           | 03/21/2026 04:45 PM
Meeting Notes - March.docx    | Google Docs    | 03/20/2026 09:15 AM
Project Timeline.xlsx          | Google Sheets  | 03/19/2026 01:00 PM
Assets/                        | Folder         | 03/18/2026 11:00 AM
Archive/                       | Folder         | 03/01/2026 08:00 AM
README.md                      | File           | 02/28/2026 03:00 PM
```

**Example 3: Read a Google Doc**
Input: "Read the content of 'Website Redesign Brief'"
Output:
```
DOCUMENT: Website Redesign Brief.docx
=======================================
Owner:    me@company.com
Modified: 03/23/2026 02:00 PM
Size:     4,200 words

--- CONTENT ---

Website Redesign Brief — Q2 2026

1. Objective
   Redesign the company website to improve conversion rate by 20%
   and reduce bounce rate by 15%.

2. Scope
   - Homepage
   - Product pages (8 pages)
   - Contact and About pages

[continues...]
```

## Tools
- Use `Read` to load `workspace/configs/access_tokens.json` and extract the Google access token
- Use `WebFetch` to call Drive API endpoints with the user's OAuth access token
- Use `Bash` with curl as fallback for API calls

## Error Handling
- If `workspace/configs/access_tokens.json` is missing or has no `providers.google` entry → tell user to connect at `intern/me`, or fall back to OAuth Playground if requested
- If token in JSON is expired (`expires_at` <= now) → tell user to refresh via `intern/me`
- If required scope `drive.readonly` not in `providers.google.scopes` → tell user to re-connect at `intern/me` granting Drive scope
- If `401 Unauthorized` from API → token expired/revoked; re-check JSON, then prompt re-auth via `intern/me`
- If `403 Forbidden` → scope not granted or file not accessible; check sharing settings
- If `404 Not Found` → file ID is invalid or file was deleted
- If file is binary (PDF, image) → return metadata only; note that binary content cannot be displayed inline
- If query returns 0 results → suggest checking spelling or broadening the search

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~drive | Browse, search, and read files in Google Drive via the Drive API |
| ~~email | Find files shared via email links and access Drive attachments |
| ~~notes | Save file summaries and metadata to your note-taking app |

## Rules
- Scope required: `https://www.googleapis.com/auth/drive.readonly`
- Base URL: `https://www.googleapis.com/drive/v3`
- Always include `Authorization: Bearer <access_token>` header
- Always request `fields=files(id,name,mimeType,owners,modifiedTime,parents,shared,size)` in list calls
- Export MIME types for reading: Google Docs → `text/plain`, Google Sheets → `text/csv`, Google Slides → `text/plain`
- Export endpoint: `GET /drive/v3/files/<id>/export?mimeType=<export_mime>`
- For binary files use: `GET /drive/v3/files/<id>?alt=media`
- Drive query operators: `name contains 'X'`, `'<folderId>' in parents`, `mimeType = 'X'`, `fullText contains 'X'`, `trashed = false`
- Common MIME types: `application/vnd.google-apps.document` (Docs), `application/vnd.google-apps.spreadsheet` (Sheets), `application/vnd.google-apps.folder` (Folder)
- Default to `trashed = false` in all queries

## Output Template
```
GOOGLE DRIVE SEARCH
====================
Query:   [query string]
Found:   [N] files

[N]. [File Name]
    Type:     [MIME type / app type]
    Owner:    [owner email]
    Modified: [MM/DD/YYYY HH:MM AM/PM]
    Location: [folder path]
```

## Related Skills
- `sheets-reader` -- For reading and querying data from Google Sheets found in Drive
- `document-summarizer` -- For summarizing documents retrieved from Google Drive
- `gmail` -- For finding email threads that reference Drive files
