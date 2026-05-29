---
name: knowledge-base
description: >
  Searches, retrieves, creates, or updates articles in the internal knowledge base covering product
  docs, troubleshooting guides, SOPs, and policies.
  Use when the user says "look up the procedure for X", "find the documentation on X",
  "how do we troubleshoot X", "create a KB article for this", "update the guide for X",
  "is there a doc for this", "search the knowledge base", or "write a handling guide for this issue".
---

# Knowledge Base

## Quick Start
Search the internal knowledge base for the best matching article. If no match exists, draft a new article following the standard format. Flag outdated content for review.

## Workflow
1. Determine the request type: search for an existing article, create a new one, or update an existing one
2. Extract search parameters: keywords, product names, error codes, issue descriptions, or category filters
3. Classify by KB section:
   - **Product Docs**: Specifications, features, compatibility, release notes
   - **How-to Guides**: Step-by-step instructions for end users
   - **Troubleshooting**: Problem, cause, and solution articles
   - **SOP**: Internal procedures for the CS team
   - **Policies**: Returns, warranty, refunds, privacy, terms of service
4. Search and rank results by keyword match strength, article freshness, and usage frequency
5. For lookups: return the article with related articles noted
6. For new articles: draft using the appropriate template with all required fields
7. For updates: show current content alongside proposed changes
8. Flag any article older than 90 days for review

## Examples

**Example 1: Troubleshooting lookup**
Input: "How do we handle the E-4012 error on the X200 printer?"
Output:
```
Knowledge Base Result

Title: Resolving E-4012 Paper Feed Error on X200 Series
Category: Troubleshooting
Tags: x200, e-4012, paper-feed, printer, hardware
Last Updated: 2026-02-20
Relevance: High

Problem:
X200 printer displays error code E-4012, indicating a paper feed mechanism failure. The printer stops all jobs and the paper tray light blinks red.

Cause:
Paper feed rollers are worn or debris is obstructing the feed path. Most common after 50,000+ pages or in dusty environments.

Solution:
1. Power off the printer and unplug it
2. Open the rear access panel (release lever on the left side)
3. Remove any jammed paper carefully — pull in the direction of the paper path
4. Clean the feed rollers with a lint-free cloth dampened with isopropyl alcohol
5. Inspect rollers for wear — if visibly smooth or cracked, order replacement (part #XR-412)
6. Close the panel, power on, and run a test print
7. If error persists after roller replacement, escalate to hardware support (L2)

Notes:
- Do NOT use compressed air — it pushes debris further into the mechanism
- Replacement rollers ship within 2 business days under warranty

Related Articles:
- X200 General Troubleshooting Guide
- How to Order Replacement Parts Under Warranty

Article Status: Current
```

**Example 2: New article creation**
Input: "We just resolved a new issue — customers on the v4.1 app can't reset passwords if they have special characters in their email. Can you draft a KB article?"
Output:
```
Knowledge Base Result

Title: Password Reset Failure for Emails with Special Characters (App v4.1)
Category: Troubleshooting
Tags: password-reset, special-characters, app-v4.1, authentication, bug
Last Updated: 2026-03-18
Relevance: N/A (New Article)

Problem:
Customers using app version 4.1 cannot complete the password reset flow if their email address contains special characters (e.g., +, !, or %). The reset email is never sent and no error message is displayed.

Cause:
The v4.1 update introduced a new email validation regex that incorrectly rejects RFC-5322 compliant special characters. Bug tracked in JIRA-8834.

Solution:
1. Confirm the customer's email contains special characters
2. Ask the customer to use the web portal (portal.example.com/reset) as a workaround — the web version is not affected
3. If the customer cannot access the web portal, manually trigger a password reset from the admin panel: Admin > Users > Search > Reset Password
4. Inform the customer that a fix is scheduled for v4.1.1 (ETA: next release cycle)

Notes:
- Affected characters: + ! % & ' / = ? ^ ` { | } ~
- Web portal workaround is the preferred first step
- Fix confirmed for v4.1.1 — update this article when the patch ships

Related Articles:
- Password Reset Standard Procedure
- Known Issues: App v4.1 Release Notes

Article Status: Current
```

## Tools
- Use `Grep` to search across knowledge base files and documentation directories for matching content
- Use `Read` to load specific KB articles, SOP documents, product manuals, or policy files
- Use `Glob` to find all articles within a specific category or matching a naming pattern
- Use `WebSearch` to verify technical information or check for updated product specifications

## Error Handling
- If no matching article is found → inform the user, suggest partial matches, and recommend creating a new article
- If multiple articles match with similar relevance → return the top 3 ranked results for the user to select
- If the matched article is older than 90 days → display it with a prominent warning that content may be outdated
- If the user wants to create an article but provides insufficient info → list required fields and ask for the missing details
- If conflicting information exists across articles → flag the conflict and recommend a review

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~helpdesk | Link KB articles directly to ticket responses and resolution workflows |
| ~~CRM | Surface relevant KB articles based on the customer's product or plan |
| ~~knowledge base | Sync with external KB platforms (Confluence, Notion, Zendesk Guide) |
| ~~email | Share KB articles with customers directly via email |

## Rules
- Every KB article must include: title, category, tags, author, created date, and last-updated date
- Troubleshooting articles must follow the Problem, Cause, Solution format
- How-to guides must include numbered step-by-step instructions
- Write all articles so they are self-contained; no tribal knowledge required
- Never include customer personal data in KB articles; use anonymized examples
- When a new case is resolved that is not covered, always draft a new article

## Output Template
```
Knowledge Base Result

Title: [Article title]
Category: [Product Docs / How-to Guide / Troubleshooting / SOP / Policy]
Tags: [tag1, tag2, tag3]
Last Updated: [YYYY-MM-DD]
Relevance: [High / Medium / Low]

Problem:
[Clear description of the problem or topic]

Cause:
[Root cause analysis — for troubleshooting articles]

Solution:
1. [Step 1]
2. [Step 2]
3. [Step 3]

Notes:
- [Important caveats, edge cases, or additional context]

Related Articles:
- [Related article title 1]
- [Related article title 2]

Article Status: [Current / Needs Review / Outdated]
```

## Related Skills
- `ticket-responder` -- For using KB articles when drafting ticket responses
- `faq-lookup` -- For finding quick FAQ answers before diving into full KB articles
- `escalation-helper` -- For reviewing SOPs and escalation procedures stored in the KB
- `feedback-analyzer` -- For identifying gaps in the KB based on customer feedback trends
