---
name: sop-creator
description: >
  Creates Standard Operating Procedures (SOPs) with clear step-by-step instructions, roles, and quality checkpoints.
  Use when the user says "create an SOP", "document this process", "write a procedure",
  "standardize this workflow", "how do we formalize this process",
  "create step-by-step instructions", or "write an operations manual".
---

# SOP Creator

## Quick Start
Create structured SOPs with clear objectives, step-by-step procedures, roles and responsibilities, quality checkpoints, and exception handling. Follow a consistent template that ensures processes are repeatable and auditable.

## Workflow
1. Identify the process to document: what, why, who, when, where
2. Gather process details: steps, decision points, inputs, outputs, tools used
3. Define roles and responsibilities (RACI matrix if needed)
4. Write step-by-step procedures with numbered instructions
5. Add quality checkpoints, safety notes, and exception handling
6. Include a revision history and approval section

## Examples

**Example 1: Office Procedure SOP**
Input: "Create an SOP for receiving and processing purchase requests"
Output:
```
STANDARD OPERATING PROCEDURE
=============================
SOP #: SOP-OPS-[AUTO]
Title: Purchase Request Processing
Department: Operations / Procurement
Effective Date: 03/23/2026
Version: 1.0

1. PURPOSE
----------
Define the standard process for receiving, approving, and fulfilling
internal purchase requests to ensure timely procurement with proper
authorization and budget compliance.

2. SCOPE
--------
Applies to all departments submitting purchase requests for goods or
services with a value of $500 or above.

3. ROLES & RESPONSIBILITIES
----------------------------
| Role              | Responsibility                              |
|-------------------|---------------------------------------------|
| Requester         | Submit purchase request with specifications  |
| Department Manager| Review and approve within department budget  |
| Procurement Team  | Verify, source vendors, and process orders   |
| Finance           | Verify budget availability and process payment|
| Receiving         | Inspect and confirm delivery                 |

4. PROCEDURE
-------------
Step 1: REQUEST SUBMISSION
  1.1 Requester fills out Purchase Request Form (PRF)
  1.2 Include: item description, quantity, estimated cost, justification
  1.3 Attach specifications or reference documents if applicable
  1.4 Submit via [system/email] to Department Manager
  ⏱️ SLA: Submit at least 5 business days before needed date

Step 2: DEPARTMENT APPROVAL
  2.1 Department Manager reviews request against budget
  2.2 Verify business justification
  2.3 Approve, request modification, or reject with reason
  ✅ Checkpoint: Approved requests must have budget code assigned
  ⏱️ SLA: Approve/reject within 2 business days

Step 3: PROCUREMENT PROCESSING
  3.1 Procurement receives approved request
  3.2 Check existing inventory or contracts
  3.3 If new purchase needed: obtain 3 quotes for orders >$5,000
  3.4 Select vendor and generate Purchase Order
  3.5 Send PO to vendor for confirmation
  ✅ Checkpoint: PO must match approved request specifications
  ⏱️ SLA: Process within 3 business days

Step 4: DELIVERY & INSPECTION
  4.1 Receiving team inspects delivery against PO
  4.2 Check quantity, quality, and specifications
  4.3 Sign delivery receipt or report discrepancies
  4.4 Notify requester of delivery
  ✅ Checkpoint: Delivery matches PO specifications

Step 5: PAYMENT
  5.1 Finance receives delivery confirmation and vendor invoice
  5.2 Match invoice to PO and delivery receipt (3-way match)
  5.3 Process payment per agreed terms
  ✅ Checkpoint: 3-way match complete before payment

5. EXCEPTIONS
--------------
| Scenario                    | Action                              |
|-----------------------------|-------------------------------------|
| Urgent request (<5 days)    | Requires Director approval + email  |
| Amount >$25,000             | Requires Finance Director approval  |
| Single-source vendor        | Requires written justification      |
| Delivery discrepancy        | Hold payment, notify procurement    |

6. DOCUMENTS & FORMS
---------------------
- Purchase Request Form (PRF)
- Purchase Order (PO)
- Delivery Receipt
- Vendor Invoice

7. REVISION HISTORY
--------------------
| Version | Date       | Author    | Changes           |
|---------|------------|-----------|-------------------|
| 1.0     | 03/23/2026 | [Author]  | Initial release   |

APPROVED BY:
- Prepared: [Name, Title]
- Reviewed: [Name, Title]
- Approved: [Name, Title]
```

**Example 2: Quick SOP**
Input: "Write an SOP for handling incoming mail and packages"
Output: A shorter SOP with streamlined steps for a simpler process.

## Tools
- Use `Read` to load existing process documents or reference SOPs
- Use `Write` to save SOPs to files
- Use `Grep` to search for related procedures or forms
- Use `Glob` to find existing SOP files in the workspace

## Error Handling
- If process details are vague → ask clarifying questions about specific steps
- If roles are unclear → suggest a RACI matrix and confirm with user
- If process has too many exceptions → suggest simplifying the main flow
- If SOP references other documents → list them in the Documents section

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~document management | Access existing SOPs, templates, and version-controlled documents |
| ~~project tracker | Link SOPs to project workflows and track implementation |
| ~~inventory system | Reference inventory processes for supply chain SOPs |
| ~~calendar | Schedule SOP review dates and training sessions |

## Rules
- Every SOP must have: purpose, scope, roles, numbered procedures, and revision history
- Steps must be clear enough for someone new to follow without additional guidance
- Include SLA/timeframes for each major step
- Add quality checkpoints (✅) at critical decision points
- Exception handling must cover at least the top 3 most common exceptions
- Keep language simple and use active voice ("Submit the form" not "The form should be submitted")
- Version control: start at 1.0, increment for each revision
- SOPs must be reviewed at least annually
- Include approval signatures section

## Output Template
```
STANDARD OPERATING PROCEDURE
=============================
SOP #: SOP-[DEPT]-[NNN]
Title: [Procedure Title]
Department: [Department]
Effective Date: [MM/DD/YYYY]
Version: [X.X]

1. PURPOSE
2. SCOPE
3. ROLES & RESPONSIBILITIES
4. PROCEDURE (numbered steps with checkpoints)
5. EXCEPTIONS
6. DOCUMENTS & FORMS
7. REVISION HISTORY

APPROVED BY:
- Prepared / Reviewed / Approved
```

## Related Skills
- `document-formatter` -- For formatting SOPs into professional document layouts
- `report-generator` -- For generating compliance and audit reports tied to SOPs
- `inventory-tracker` -- For SOPs related to inventory and asset management
- `meeting-scheduler` -- For scheduling SOP review and training meetings
