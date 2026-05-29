---
name: clause-extractor
description: >
  Extracts and categorizes specific clauses from contracts and legal documents for comparison or analysis.
  Use when the user says "extract the termination clause", "find the liability section",
  "compare payment terms across these contracts", "pull out all indemnification clauses",
  "build a clause library", "what does the SLA say in each vendor contract",
  "side-by-side clause comparison", "pull the confidentiality section from each agreement",
  "which contracts have auto-renewal clauses", "compile all warranty terms",
  or "compare penalty clauses across vendors".
---

# Clause Extractor

## Quick Start
Extract, categorize, and compare specific clauses from legal documents. Useful for building clause libraries, comparing terms across vendors, or identifying standard vs. non-standard provisions.

## Workflow
1. Identify the target clauses: termination, liability, payment, confidentiality, IP, indemnification, SLA, etc.
2. Read the document(s) provided
3. Locate and extract each target clause with its exact wording
4. Categorize by clause type and label as standard/non-standard/aggressive
5. If comparing multiple documents, create a side-by-side comparison
6. Summarize findings with recommendations

## Examples

**Example 1: Extract Key Clauses**
Input: "Extract all payment and termination clauses from this vendor contract"
Output:
```
CLAUSE EXTRACTION
=================
Document: Vendor Service Agreement — ABC Corp
Date Extracted: 03/23/2026

PAYMENT CLAUSES
---------------
Clause 4.1 — Payment Terms:
  "Client shall pay all invoices within thirty (30) days of receipt.
   Late payments shall accrue interest at 1.5% per month."
  📋 Category: Payment Terms
  🏷️ Assessment: Standard — 30-day net is typical

Clause 4.3 — Price Adjustment:
  "Provider reserves the right to adjust pricing with sixty (60) days
   written notice. Continued use constitutes acceptance of new pricing."
  📋 Category: Price Escalation
  🏷️ Assessment: Non-standard — no cap on increases, acceptance by inaction

TERMINATION CLAUSES
-------------------
Clause 8.1 — Termination for Convenience:
  "Either party may terminate with ninety (90) days written notice."
  📋 Category: Convenience Termination
  🏷️ Assessment: Standard — mutual right, reasonable notice period

Clause 8.3 — Effect of Termination:
  "Upon termination, Client shall pay all outstanding fees and return
   all Provider materials. Provider shall retain all data for 90 days."
  📋 Category: Post-Termination
  🏷️ Assessment: Review needed — data retention clause may conflict with
   data protection requirements

SUMMARY
-------
Total clauses extracted: 4
Standard: 2 | Non-standard: 1 | Needs review: 1

⚠️ Flag: Clause 4.3 allows unlimited price increases with passive acceptance.
   Recommend negotiating a price cap or active consent requirement.
```

**Example 2: Multi-Contract Comparison**
Input: "Compare the SLA clauses across these 3 vendor proposals"
Output:
```
CLAUSE COMPARISON
=================
Clause Type: Service Level Agreement (SLA)

| Term           | Vendor A       | Vendor B       | Vendor C       |
|----------------|----------------|----------------|----------------|
| Uptime         | 99.9%          | 99.5%          | 99.95%         |
| Measurement    | Monthly        | Quarterly      | Monthly        |
| Credits        | 10% per 0.1%  | 5% per 0.5%   | 15% per 0.1%  |
| Max Credit     | 30% monthly    | 10% quarterly  | 100% monthly   |
| Exclusions     | Maintenance    | Maintenance+3rd| Maintenance    |
| Response Time  | 1hr critical   | 4hr critical   | 30min critical |

RECOMMENDATION: Vendor C offers the strongest SLA terms with highest
uptime guarantee and most generous credit structure.
```

## Tools
- Use `Read` to load contracts and legal documents
- Use `Grep` to search for specific clause keywords across documents
- Use `Write` to save extracted clauses or comparison reports
- Use `Glob` to find multiple contract files in a directory

## Error Handling
- If clause type not specified → ask which clauses to extract or offer common categories
- If clause is ambiguous or poorly defined → extract as-is and flag for review
- If document format prevents clean extraction → note formatting issues
- If clause references external documents → note the dependency

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~document management | Access contracts and legal documents from centralized storage |
| ~~contract system | Pull clause data from contract lifecycle management platforms |
| ~~email | Extract clauses from contracts shared as email attachments |
| ~~compliance database | Tag extracted clauses against regulatory compliance requirements |

## Rules
- Always preserve the exact original wording when extracting clauses
- Label each clause with: section reference, category, and standard/non-standard assessment
- For comparisons, use tabular format for easy scanning
- Flag any clause that deviates significantly from industry standards
- Note cross-references between clauses (e.g., termination triggers payment obligations)
- Include the document source and extraction date for traceability
- Never modify or paraphrase clause language without clearly marking it as a summary

## Output Template
```
CLAUSE EXTRACTION
=================
Document: [Document title]
Date Extracted: [MM/DD/YYYY]

[CLAUSE TYPE]
-------------
Clause [X.X] — [Clause Title]:
  "[Exact clause text]"
  📋 Category: [Category]
  🏷️ Assessment: [Standard / Non-standard / Aggressive]

SUMMARY
-------
Total clauses extracted: [N]
Standard: [N] | Non-standard: [N] | Needs review: [N]

⚠️ [Key flags or recommendations]
```

## Related Skills
- `contract-reviewer` — For full contract reviews beyond individual clause extraction
- `legal-summarizer` — For plain-language summaries of extracted clauses
- `compliance-checker` — For checking extracted clauses against regulatory standards
- `nda-drafter` — For drafting NDA clauses based on extracted best practices
