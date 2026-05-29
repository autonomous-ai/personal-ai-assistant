---
name: document-formatter
description: >
  Formats and structures office documents such as letters, meeting minutes, announcements, reports, and proposals.
  Use when the user says "format this document", "create an official letter", "write meeting minutes",
  "draft a memo", "format this report", "create a proposal template",
  "reformat this document", or "make this look professional".
---

# Document Formatter

## Quick Start
Create structured, professionally formatted business documents. Determine the document type, gather required fields, apply the correct template, and deliver with proper formatting and section numbering.

## Workflow
1. Classify the document type: internal official letter, meeting minutes, internal announcement, report, or proposal/briefing
2. Gather required fields (date, recipients, subject, body content, signatory) -- ask for any missing information
3. Select and populate the appropriate template with user-provided values
4. Apply formatting rules: section numbering (I, 1, a, -), header/footer, and language-specific styles
5. Verify spelling, grammar, and consistent formatting before delivering the final output

## Examples

**Example 1: Official Letter**
Input: "Format an official letter from the HR department to all employees about the new remote work policy effective April 1, 2026. Signed by Director James Anderson."
Output:
```
[Document Type]: Internal Official Letter
Date Created: 03/18/2026

---
[COMPANY NAME]

Ref: HR-2026/03-001
Date: 03/18/2026

To: All Employees
Subject: New Remote Work Policy

I. Purpose
   This letter announces the updated Remote Work Policy effective 04/01/2026.

1. Policy Summary
   a. Employees may work remotely up to 3 days per week.
   b. Requests must be submitted via the HR portal 48 hours in advance.

Signatory:
James Anderson
Director, Human Resources

[Page 1 of 1]
```

**Example 2: Meeting Minutes**
Input: "Create meeting minutes for the Q1 budget review held on March 15, 2026, attended by Finance and Ops teams."
Output:
```
[Document Type]: Meeting Minutes
Date Created: 03/15/2026

---
Meeting Minutes: Q1 Budget Review
Date/Time: 03/15/2026, 09:00 - 10:00
Location: Conference Room A
Attendees: Finance Team, Operations Team

I. Agenda Items
   1. Q1 spending overview
   2. Budget variance analysis
   3. Q2 allocation proposals

II. Discussion Notes
   [Content provided by user]

III. Action Items
   [Action items with owners and deadlines]

[Page 1 of 1]
```

## Tools
- Use `Read` to load reference documents or existing templates the user provides
- Use `Write` to save the generated document to a file path
- Use `Grep` to search for existing style guides or template files in the project
- Use `Glob` to locate related documents or assets in the workspace

## Error Handling
- If document type is not specified → ask the user to choose from: letter, meeting minutes, announcement, report, or proposal
- If required fields are missing (date, recipient, signatory) → list the missing fields and request them
- If format conversion is not possible with available tools → explain the limitation and suggest alternatives
- If content contains ambiguous or conflicting information → highlight the discrepancy and ask for clarification

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~document management | Access stored templates, letterheads, and style guides |
| ~~calendar | Pull meeting details for auto-populating meeting minutes |
| ~~project tracker | Link documents to projects and track document versions |

## Rules
- US business documents: Times New Roman 12pt, single or 1.15 line spacing, Letter (8.5×11 in) paper size
- Every document must include clear section numbering (I, 1, a, -) and consistent header/footer
- Always include a header (company name) and footer (page number)
- Use formal language for official and administrative documents -- no colloquial expressions
- Never fabricate data or statistics; use only information provided by the user

## Output Template
```
[Document Type]: [Title]
Date Created: [MM/DD/YYYY]
Pages: [N]

---

[HEADER: Company Name]

[Section I: ...]
[Section 1: ...]
  [a. ...]

[Formatted document content with proper structure, numbering, and spacing]

[FOOTER: Page X of Y]

---

Formatting Notes:
- Font: [Font name and size]
- Spacing: [Line spacing]
- Paper: [Paper size]
```

## Related Skills
- `meeting-scheduler` -- For scheduling meetings that produce documents like minutes
- `report-generator` -- For generating data-driven reports that need formatting
- `sop-creator` -- For creating structured Standard Operating Procedures
