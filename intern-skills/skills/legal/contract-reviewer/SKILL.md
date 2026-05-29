---
name: contract-reviewer
description: >
  Reviews business contracts for key terms, risks, obligations, and compliance issues.
  Use when the user says "review this contract", "check agreement terms", "identify risky clauses",
  "compare contract versions", "is this contract fair", "what are the key terms",
  "flag any issues in this agreement", "what should I watch out for in this deal",
  "summarize the obligations in this contract", "red flags in this vendor agreement",
  or "side-by-side contract comparison".
---

# Contract Reviewer

## Quick Start
Review contracts by identifying key terms, obligations, risks, and missing clauses. Highlight unfavorable terms and suggest improvements. Never provide legal advice — flag items for legal counsel review.

## Workflow
1. Identify contract type: employment, service agreement, NDA, vendor, lease, partnership, SLA
2. Read the full contract document
3. Extract key terms: parties, duration, payment, termination, liability, confidentiality, IP ownership
4. Identify risk areas: one-sided clauses, unlimited liability, auto-renewal traps, broad non-compete
5. Check for missing standard clauses: force majeure, dispute resolution, data protection
6. Generate a structured review with risk ratings (High/Medium/Low)

## Examples

**Example 1: Service Agreement Review**
Input: "Review this service agreement with our IT vendor"
Output:
```
CONTRACT REVIEW
===============
Type: Service Agreement
Parties: [Company] ↔ [IT Vendor]
Effective Date: 04/01/2026
Duration: 24 months, auto-renewal

KEY TERMS
---------
| Term              | Details                           | Risk    |
|-------------------|-----------------------------------|---------|
| Payment           | Monthly, net 30 days              | Low     |
| SLA Uptime        | 99.5% guaranteed                  | Medium  |
| Liability Cap     | Not specified                     | HIGH    |
| Termination       | 90 days notice, no early exit fee | Low     |
| Auto-Renewal      | 12-month auto-renewal             | Medium  |
| IP Ownership      | Vendor retains all IP             | HIGH    |
| Data Protection   | Not addressed                     | HIGH    |

RISK SUMMARY
-------------
HIGH RISK:
1. No liability cap — company exposed to unlimited damages
2. Vendor retains all IP — including customizations built for your use case
3. No data protection clause — non-compliant with CCPA/GDPR

MEDIUM RISK:
4. 99.5% SLA is below industry standard (99.9%)
5. Auto-renewal locks in 12 months without renegotiation

MISSING CLAUSES:
- Force majeure
- Data processing agreement (DPA)
- Escrow for source code
- Change management procedure

RECOMMENDATIONS:
1. Add a liability cap (suggest: 12 months of fees)
2. Negotiate IP ownership for custom developments
3. Add a data protection / DPA clause
4. Request 99.9% SLA with service credits
5. Change auto-renewal to require mutual written consent

⚠️ Recommend legal counsel review before signing.
```

**Example 2: Quick Comparison**
Input: "Compare these two versions of the lease agreement and highlight changes"
Output: A side-by-side comparison of modified clauses with risk impact assessment.

## Tools
- Use `Read` to load contract documents and reference files
- Use `Grep` to search for specific clauses or terms within contracts
- Use `Write` to save the review report to a file

## Error Handling
- If contract is incomplete or missing pages → note the gaps and review available content
- If contract type is unclear → ask user to specify the nature of the agreement
- If terms are ambiguous → flag them as needing clarification from the counterparty
- If user asks for legal advice → clarify that this is a review aid, not legal counsel

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~document management | Pull contracts from centralized document repositories |
| ~~contract system | Access contract templates, version history, and approval workflows |
| ~~email | Retrieve contracts received as email attachments |
| ~~compliance database | Cross-reference clauses against regulatory requirements |

## Rules
- NEVER provide legal advice — always recommend professional legal counsel for final decisions
- Flag all one-sided or unusual clauses explicitly
- Rate every key term as High/Medium/Low risk
- Always check for these standard clauses: liability cap, termination, confidentiality, IP, data protection, force majeure, dispute resolution
- Preserve original contract language when quoting clauses
- Compare against industry-standard terms when assessing fairness
- Note jurisdiction and governing law if specified

## Output Template
```
CONTRACT REVIEW
===============
Type: [Contract Type]
Parties: [Party A] ↔ [Party B]
Effective Date: [Date]
Duration: [Term length and renewal conditions]

KEY TERMS
---------
| Term | Details | Risk |
|------|---------|------|
| [Term] | [Details] | [High/Medium/Low] |

RISK SUMMARY
-------------
HIGH RISK:
- [Issue with explanation]

MEDIUM RISK:
- [Issue with explanation]

MISSING CLAUSES:
- [Standard clause not found in contract]

RECOMMENDATIONS:
1. [Actionable suggestion]

⚠️ Recommend legal counsel review before signing.
```

## Related Skills
- `clause-extractor` — For extracting and comparing specific clauses across contracts
- `nda-drafter` — For drafting or reviewing NDA-specific agreements
- `compliance-checker` — For checking contracts against regulatory requirements
- `legal-summarizer` — For plain-language summaries of complex contract terms
