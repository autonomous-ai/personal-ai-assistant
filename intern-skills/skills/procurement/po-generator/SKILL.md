---
name: po-generator
description: >
  Generates Purchase Orders (POs) with proper line items, pricing, terms, and approval workflows.
  Use when the user says "create a purchase order", "draft a PO", "order supplies from this vendor",
  "prepare a procurement request", "generate PO for office equipment", "submit a purchase requisition",
  "I need to buy these items from a vendor", "place an order with this supplier",
  "purchase request for IT hardware", "reorder office supplies",
  or "PO for the approved budget items".
---

# PO Generator

## Quick Start
Generate structured Purchase Orders with vendor details, line items, pricing, delivery terms, and approval requirements. Validate totals and flag orders requiring additional approval based on amount thresholds.

## Workflow
1. Gather PO details: vendor, requester, department, delivery date
2. Collect line items: item description, quantity, unit price, specifications
3. Calculate subtotals, taxes (sales tax, varies by state), and grand total
4. Determine approval level based on total amount
5. Generate the formatted PO document
6. Flag any items requiring special procurement procedures

## Examples

**Example 1: Standard PO**
Input: "Create a PO to purchase 50 office desk and chair sets from ABC Furniture Co., unit price $350/set"
Output:
```
PURCHASE ORDER
==============
PO Number: PO-2026-[AUTO]
Date: 03/23/2026
Status: Draft — Pending Approval

FROM (Buyer):
  Company: [Your Company Name]
  Department: [Department]
  Requester: [Name]

TO (Vendor):
  Company: ABC Furniture Co.
  Address: [Vendor Address]
  Contact: [Vendor Contact]

DELIVERY
--------
  Required Date: [MM/DD/YYYY]
  Location: [Delivery Address]
  Terms: [FOB / CIF / DAP]

LINE ITEMS
----------
| # | Description          | Qty | Unit Price     | Total           |
|---|----------------------|-----|----------------|-----------------|
| 1 | Office desk and chair set | 50  | $350.00        | $17,500.00      |
|---|----------------------|-----|----------------|-----------------|
|   | Subtotal             |     |                | $17,500.00      |
|   | Sales Tax (varies)   |     |                | [Based on state] |
|   | GRAND TOTAL          |     |                | [Subtotal + Tax] |

PAYMENT TERMS: Net 30 days upon delivery and inspection

APPROVAL REQUIRED:
- [x] Department Manager (≤$100,000)
- [ ] Finance Director (>$100,000)
- [ ] CEO (>$250,000)

NOTES:
- Warranty: [Specify warranty terms]
- Quality inspection required upon delivery
- Reference quote: [Quote number if available]

---
Prepared by: [Requester Name]
Date: 03/23/2026
```

**Example 2: Multi-Item PO**
Input: "Create a PO for IT equipment: 10 laptops at $800 each, 10 monitors at $300 each, 20 keyboards at $50 each"
Output: A multi-line PO with USD pricing, subtotals per line, and total with applicable taxes.

## Tools
- Use `Read` to load vendor quotes, price lists, or PO templates
- Use `Write` to save generated POs to files
- Use `Bash` to calculate totals and taxes

## Error Handling
- If vendor details are missing → create PO with placeholders and list required fields
- If unit price not specified → leave blank and flag for pricing confirmation
- If tax rate unclear → default to applicable state sales tax and note the assumption
- If delivery date not specified → flag as required before submission

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~ERP | Access vendor master data, product catalogs, and approval workflows |
| ~~vendor portal | Submit POs directly to vendor systems and track confirmations |
| ~~spreadsheet | Import line items from spreadsheets and export PO summaries |
| ~~email | Send generated POs to vendors for confirmation |

## Rules
- PO numbers follow format: PO-YYYY-[sequential]
- Default tax: Sales tax (varies by state); specify if different
- Approval thresholds: ≤$100,000 (Dept Manager), >$100,000 (Finance Director), >$250,000 (CEO)
- All amounts must show subtotal, tax, and grand total
- Always include: vendor details, line items, delivery terms, payment terms
- Currency defaults to USD
- Quantities must be positive whole numbers
- Flag items over $5,000 individually for asset tracking

## Output Template
```
PURCHASE ORDER
==============
PO Number: PO-[YYYY]-[NNN]
Date: [MM/DD/YYYY]
Status: Draft — Pending Approval

FROM (Buyer):
  [Buyer details]

TO (Vendor):
  [Vendor details]

LINE ITEMS
----------
| # | Description | Qty | Unit Price | Total |
|---|-------------|-----|------------|-------|
| [N] | [Item] | [Qty] | [Price] | [Total] |
|   | Subtotal    |     |            | [Amount] |
|   | Sales Tax ([%]) |     |            | [Amount] |
|   | GRAND TOTAL |     |            | [Amount] |

PAYMENT TERMS: [Terms]
APPROVAL REQUIRED: [Based on amount thresholds]
```

## Related Skills
- `vendor-evaluator` — For evaluating and selecting the vendor before generating a PO
- `price-comparator` — For comparing pricing across vendors before placing an order
- `supplier-tracker` — For tracking the supplier's delivery performance after PO issuance
