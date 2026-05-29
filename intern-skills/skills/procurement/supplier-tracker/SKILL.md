---
name: supplier-tracker
description: >
  Tracks supplier information, contract status, delivery performance, and renewal dates in a structured
  format. Use when the user says "add a new supplier", "check contract expiry dates",
  "track delivery performance", "update vendor records", "which contracts are expiring soon",
  "supplier performance report", "maintain our vendor database",
  or "show me the supplier renewal calendar".
---

# Supplier Tracker

## Quick Start
Maintain a structured supplier database with contract details, performance metrics, and upcoming renewals. Track delivery reliability, quality scores, and flag contracts approaching expiration.

## Workflow
1. Determine action: add supplier, update record, check status, review performance, list renewals
2. Gather or update supplier details: company info, contracts, contacts, performance data
3. Calculate performance metrics: on-time delivery rate, quality score, response time
4. Flag upcoming contract renewals (30/60/90 day warnings)
5. Generate the requested view: single supplier profile, renewal calendar, or performance summary

## Examples

**Example 1: Supplier Profile**
Input: "Add a new supplier: Minh Phat Office Equipment Co., Ltd."
Output:
```
SUPPLIER PROFILE
================
Status: ✅ Active

COMPANY INFORMATION
-------------------
Company Name:   Minh Phat Office Equipment Co., Ltd.
Tax ID:         [Tax ID - to be provided]
Address:        [Address - to be provided]
Category:       Office Equipment & Supplies
Primary Contact: [Name - to be provided]
Phone:          [Phone - to be provided]
Email:          [Email - to be provided]

CONTRACT DETAILS
----------------
Contract #:     [To be assigned]
Start Date:     [MM/DD/YYYY]
End Date:       [MM/DD/YYYY]
Value:          [Contract value]
Payment Terms:  [Net 30 / COD / etc.]
Auto-Renewal:   [Yes / No]

PERFORMANCE (No history yet)
-----------------------------
| Metric             | Score  | Rating |
|--------------------|--------|--------|
| On-Time Delivery   | —      | N/A    |
| Quality Score      | —      | N/A    |
| Response Time      | —      | N/A    |
| Overall Rating     | —      | N/A    |

⚠️ MISSING INFORMATION:
- [ ] Tax ID
- [ ] Address
- [ ] Primary contact details
- [ ] Contract terms and value
```

**Example 2: Renewal Calendar**
Input: "Show me which supplier contracts are expiring in the next 90 days"
Output:
```
CONTRACT RENEWAL CALENDAR
=========================
Period: 03/23/2026 — 06/21/2026

| Supplier         | Contract # | Expiry     | Days Left | Action Needed |
|------------------|-----------|------------|-----------|---------------|
| ABC Supplies     | SUP-001   | 04/15/2026 | 23 days   | 🔴 Urgent     |
| XYZ Logistics    | SUP-005   | 04/30/2026 | 38 days   | 🟡 Review     |
| Tech Solutions   | SUP-012   | 06/15/2026 | 84 days   | 🟢 Plan       |

ACTIONS:
🔴 ≤30 days: Initiate renewal or replacement immediately
🟡 31-60 days: Begin review and negotiation
🟢 61-90 days: Add to planning pipeline
```

## Tools
- Use `Read` to load supplier data files and contract documents
- Use `Write` to save supplier profiles and reports
- Use `Grep` to search for specific supplier information
- Use `Glob` to find contract files in the workspace

## Error Handling
- If supplier information is incomplete → create profile with placeholders and list missing fields
- If performance data is unavailable → mark as N/A and note data collection needed
- If contract dates are missing → flag as critical missing information
- If duplicate supplier detected → warn and suggest merging records

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~ERP | Access vendor master data, purchase history, and contract records |
| ~~vendor portal | Pull supplier certifications, compliance documents, and delivery updates |
| ~~spreadsheet | Import supplier lists and export performance reports |
| ~~email | Retrieve supplier correspondence and delivery notifications |

## Rules
- Every supplier must have: company name, category, contract dates, and primary contact
- Flag contracts expiring within 30 days as urgent (🔴)
- Performance ratings: Excellent (≥90%), Good (75-89%), Fair (60-74%), Poor (<60%)
- Track at minimum: on-time delivery, quality score, response time
- Supplier categories: Office Supplies, IT/Technology, Logistics, Services, Raw Materials, Other
- Always include a checklist of missing required information
- Date format: MM/DD/YYYY
- Contract values in USD unless otherwise specified

## Output Template
```
SUPPLIER PROFILE
================
Status: [✅ Active / ⚠️ Pending / ❌ Inactive]

COMPANY INFORMATION
-------------------
[Supplier details]

CONTRACT DETAILS
----------------
[Contract terms and dates]

PERFORMANCE
-----------
| Metric | Score | Rating |
|--------|-------|--------|
| [Metric] | [%] | [Rating] |

⚠️ MISSING INFORMATION:
- [ ] [Required field not yet provided]
```

## Related Skills
- `vendor-evaluator` — For scoring and comparing vendors tracked in the supplier database
- `po-generator` — For generating purchase orders with tracked suppliers
- `bid-analyzer` — For evaluating new bids from tracked or prospective suppliers
