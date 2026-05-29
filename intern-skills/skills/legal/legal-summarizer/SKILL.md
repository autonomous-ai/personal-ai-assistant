---
name: legal-summarizer
description: >
  Summarizes legal documents, regulations, and policies into plain-language overviews with key
  obligations and deadlines.
  Use when the user says "summarize this contract", "explain this law in simple terms",
  "what does this regulation mean", "break down this policy for me", "TL;DR of this legal document",
  "what are my obligations under this agreement", "explain this clause in plain English",
  "what does this terms of service say", "simplify this legal jargon",
  "key takeaways from this regulation", or "plain-language version of this policy".
---

# Legal Summarizer

## Quick Start
Convert complex legal documents into clear, structured plain-language summaries. Extract key obligations, rights, deadlines, and penalties. Always note that summaries are for informational purposes, not legal advice.

## Workflow
1. Identify document type: law/regulation, contract, court ruling, policy, terms of service, legal memo
2. Read the full document or specified sections
3. Extract: purpose, scope, key definitions, obligations, rights, penalties, deadlines, exemptions
4. Organize into a structured plain-language summary
5. Highlight critical dates, monetary thresholds, and compliance requirements
6. Note areas of ambiguity or sections requiring legal interpretation

## Examples

**Example 1: Regulation Summary**
Input: "Summarize the CCPA (California Consumer Privacy Act)"
Output:
```
LEGAL SUMMARY
=============
Document: CCPA — California Consumer Privacy Act (California Civil Code §1798.100 et seq.)
Signed: 06/28/2018 | Effective: 01/01/2020 | Amended by CPRA: 01/01/2023
Issuer: State of California / California Legislature

PURPOSE:
Establishes comprehensive consumer privacy rights for California residents,
covering collection, use, sharing, and sale of personal information by businesses.

KEY DEFINITIONS:
- Personal Information: Information that identifies, relates to, or could be linked to a consumer or household
- Sensitive Personal Information: SSN, financial accounts, precise geolocation, race/ethnicity, biometrics, health data, etc.
- Business: For-profit entity meeting revenue/data thresholds that collects consumers' personal information
- Service Provider: Entity that processes personal information on behalf of a business

KEY OBLIGATIONS:
1. Right to Know: Consumers can request what personal information is collected and how it is used
2. Right to Delete: Consumers can request deletion of their personal information
3. Right to Opt-Out: Consumers can opt out of the sale or sharing of their personal information
4. Non-Discrimination: Businesses cannot discriminate against consumers who exercise their CCPA rights
5. Privacy Notice: Must provide a clear, conspicuous privacy policy at or before the point of collection
6. Data Security: Must implement reasonable security procedures and practices

PENALTIES:
- Civil penalties up to $2,500 per violation or $7,500 per intentional violation,
  enforced by the California Attorney General / California Privacy Protection Agency
- Private right of action for data breaches: $100–$750 per consumer per incident

IMPORTANT DEADLINES:
- CCPA effective 01/01/2020; CPRA amendments effective 01/01/2023
- Businesses must respond to consumer requests within 45 days

WHO THIS AFFECTS:
Businesses that collect personal information of California residents and meet
one or more thresholds: $25M+ annual revenue, buy/sell/share data of 100,000+
consumers/households, or derive 50%+ of revenue from selling/sharing personal information.

---
⚠️ This is a plain-language summary for informational purposes only.
Consult legal counsel for specific compliance guidance.
```

**Example 2: Terms of Service Summary**
Input: "Summarize this SaaS terms of service — what should I watch out for?"
Output: A summary highlighting user obligations, liability limitations, data handling, and cancellation terms.

## Tools
- Use `Read` to load legal documents and policy files
- Use `WebSearch` to find the latest version of laws or regulations
- Use `Write` to save summaries to files
- Use `Grep` to search for specific terms or sections within documents

## Error Handling
- If document is in legal language that is ambiguous → flag specific ambiguities
- If document references other laws → note the references and summarize if accessible
- If only partial document provided → summarize available content and note what is missing
- If user asks for legal interpretation → clarify this is a summary, not legal advice

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~document management | Pull legal documents and policies from centralized repositories |
| ~~contract system | Access contracts and amendments for summarization |
| ~~email | Retrieve legal correspondence and regulatory notices |
| ~~compliance database | Cross-reference summarized obligations against compliance tracking |

## Rules
- NEVER provide legal advice or legal interpretation — summaries are informational only
- Use plain language — replace legal jargon with everyday terms (add original term in parentheses)
- Always include: purpose, key obligations, penalties, and important deadlines
- Note the effective date and any transition periods
- Flag sections that are ambiguous or require professional interpretation
- Preserve accuracy — do not oversimplify to the point of losing meaning
- Include original legal references (article numbers, section numbers) for verification

## Output Template
```
LEGAL SUMMARY
=============
Document: [Full title and reference number]
Issued: [Date] | Effective: [Date]
Issuer: [Issuing authority]

PURPOSE:
[1-2 sentence plain-language explanation of what this document is about]

KEY DEFINITIONS:
- [Term]: [Plain-language definition]

KEY OBLIGATIONS:
1. [Obligation with plain-language explanation]

PENALTIES:
- [Consequences for non-compliance]

IMPORTANT DEADLINES:
- [Date]: [What must be done by this date]

WHO THIS AFFECTS:
[Who needs to comply with this document]

---
⚠️ This is a plain-language summary for informational purposes only.
Consult legal counsel for specific guidance.
```

## Related Skills
- `contract-reviewer` — For detailed risk analysis of contracts beyond summaries
- `compliance-checker` — For checking compliance with summarized regulations
- `clause-extractor` — For extracting specific clauses referenced in summaries
- `nda-drafter` — For drafting agreements based on summarized requirements
