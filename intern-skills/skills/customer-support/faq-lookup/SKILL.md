---
name: faq-lookup
description: >
  Finds, retrieves, or creates standardized answers to common customer questions from the FAQ database.
  Use when the user says "what's our policy on X", "find the FAQ for this", "do we have a canned
  response for X", "look up the answer to this question", "add a new FAQ entry",
  "what do we tell customers about X", or "update the FAQ for this topic".
---

# FAQ Lookup

## Quick Start
Search the FAQ database for the best matching answer to a customer question. Return a concise answer first, then a detailed explanation. If no match exists, draft a new FAQ entry.

## Workflow
1. Parse the incoming question to extract the core topic, keywords, and intent
2. Classify by category: Products, Orders, Payments, Account, Technical, or Policies
3. Determine the request type: lookup (find existing), creation (draft new), or update (modify existing)
4. Search FAQ entries using keyword matching and semantic similarity
5. Customize the answer with specifics from the user's scenario (product name, order details, dates)
6. Check freshness — flag entries older than 90 days as potentially outdated
7. Return the matched FAQ or draft a new entry if no match is found

## Examples

**Example 1: FAQ lookup**
Input: "What's our return policy for electronics?"
Output:
```
FAQ Match

Q: What is the return policy for electronics?

A (Short):
Electronics can be returned within 30 days of purchase with original packaging and receipt for a full refund.

A (Detailed):
Customers may return electronics within 30 days of the purchase date. The item must be in its original packaging with all accessories included. A valid receipt or order confirmation is required. Opened items may be subject to a 15% restocking fee. Defective items are exempt from the restocking fee and can be returned within 90 days.

Reference: /policies/returns-electronics.md
Category: Policies
Tags: returns, electronics, refund, restocking
Last Updated: 2026-02-15
Match Confidence: High
```

**Example 2: No FAQ match found**
Input: "Does our warranty cover water damage on the new X200 model?"
Output:
```
FAQ Match

Q: Does the warranty cover water damage on the X200 model?

A (Short):
No existing FAQ entry found for this question.

A (Detailed):
Based on available product documentation, the standard warranty for the X200 does not cover water damage, as it falls under accidental damage. However, customers with the Extended Protection Plan are covered. Recommend creating a new FAQ entry for this question.

Reference: /products/x200-warranty.md (partial match)
Category: Products
Tags: warranty, water-damage, x200, protection-plan
Last Updated: N/A (new entry recommended)
Match Confidence: Low
```

## Tools
- Use `Grep` to search across knowledge base files and documentation for matching FAQ content
- Use `Read` to load specific FAQ entries, policy documents, or product documentation
- Use `WebSearch` to verify current information when FAQ entries may be outdated

## Error Handling
- If the question is too vague → ask the user to rephrase or provide more context
- If multiple FAQ entries match → return the top 3 ranked by relevance for the user to select
- If the matched entry is older than 90 days → flag it for review and warn the information may be outdated
- If the question involves an uncovered topic → suggest creating a new category and draft the entry

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~helpdesk | Search ticket history for previously answered similar questions |
| ~~CRM | Pull customer-specific context to personalize FAQ answers |
| ~~knowledge base | Search and sync with the full internal knowledge base for deeper answers |
| ~~email | Send FAQ answers directly to customers via email |

## Rules
- FAQ answers must be concise and jargon-free; write for a general audience
- Each FAQ entry must have: question, short answer, detailed answer, category, tags, and reference link
- Tag all entries by category for searchability
- Track question frequency to prioritize which FAQs to create or update first
- Never include internal-only information in customer-facing FAQ answers

## Output Template
```
FAQ Match

Q: [Customer question]

A (Short):
[1-2 sentence direct answer]

A (Detailed):
[Full explanation with step-by-step instructions if applicable]

Reference: [Link or document reference]
Category: [Products / Orders / Payments / Account / Technical / Policies]
Tags: [tag1, tag2, tag3]
Last Updated: [YYYY-MM-DD]
Match Confidence: [High / Medium / Low]
```

## Related Skills
- `ticket-responder` -- For drafting full ticket responses that incorporate FAQ answers
- `knowledge-base` -- For deeper product documentation and troubleshooting guides
- `escalation-helper` -- For escalating when no FAQ covers the customer's issue
- `feedback-analyzer` -- For identifying frequent questions that need new FAQ entries
