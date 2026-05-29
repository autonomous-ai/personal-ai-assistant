---
name: inventory-tracker
description: >
  Tracks and manages office inventory, equipment, and assets including stock checks, allocations, retrievals, reorder requests, and audits.
  Use when the user says "check stock levels", "allocate equipment", "track this asset",
  "create a purchase order", "run an inventory audit", "what's in stock",
  "assign a laptop to", or "reorder office supplies".
---

# Inventory Tracker

## Quick Start
Manage office inventory and equipment with full audit trails. Perform stock checks, allocate/retrieve equipment, generate purchase orders, and run inventory audits. Every change is logged with timestamp, person, and reason.

## Workflow
1. Classify the operation: stock check, allocation, retrieval, reorder/purchase request, or audit
2. Identify target items by name, asset code, or category (office supplies, IT equipment, furniture)
3. Gather parameters: quantities, employee name (for allocation/retrieval), reason for change
4. Load current inventory data and cross-reference records
5. Execute the operation and log the change with timestamp, responsible person, and reason
6. Generate alerts for any items below 20% of minimum threshold
7. Deliver the structured report or confirmation

## Examples

**Example 1: Stock Check**
Input: "What's the current stock level for printer ink and A4 paper?"
Output:
```
Inventory Report
---------------------------------------
Date: 03/18/2026
Operation: Stock Check
Performed By: [Requestor]

Item Summary:
| Item            | Asset Code | In Stock | Minimum | Status |
|-----------------|------------|----------|---------|--------|
| Printer Ink     | SUP-0042   | 8        | 10      | LOW    |
| A4 Paper (ream) | SUP-0015   | 45       | 20      | OK     |

Alerts:
- Printer Ink: Current stock (8) is below minimum threshold (10). Recommended reorder: 20 units.
---------------------------------------
```

**Example 2: Equipment Allocation**
Input: "Allocate a MacBook Pro (asset MBP-0112) to new hire Michael Chen starting today."
Output:
```
Inventory Report
---------------------------------------
Date: 03/18/2026
Operation: Allocation
Performed By: IT Admin

Item Summary:
| Item        | Asset Code | In Stock | Minimum | Status |
|-------------|------------|----------|---------|--------|
| MacBook Pro | MBP-0112   | 4 → 3   | 5       | LOW    |

Change Log:
- 03/18/2026 09:00 | IT Admin | MacBook Pro (MBP-0112) | -1 | Allocated to Michael Chen (new hire onboarding)

Alerts:
- MacBook Pro: Current stock (3) is below minimum threshold (5). Recommended reorder: 5 units.
---------------------------------------
```

## Tools
- Use `Read` to load existing inventory records, asset registries, or threshold configuration files
- Use `Write` to save updated inventory records, purchase orders, or audit reports
- Use `Grep` to search for specific asset codes or item names across inventory logs
- Use `Glob` to locate inventory data files, templates, or historical audit reports

## Error Handling
- If the item does not exist in the registry → ask the user to confirm the name/code and offer to add it as a new entry
- If allocation is requested but stock is insufficient → notify the user and suggest placing a reorder first
- If a retrieval references an asset not allocated to the stated employee → flag the mismatch and request clarification
- If inventory data files are missing or unreadable → inform the user and offer to create a new baseline
- If the operation type is unclear → present available operations and ask the user to choose

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~inventory system | Sync with the central inventory management system for real-time stock data |
| ~~document management | Access purchase order templates and asset registry documents |
| ~~project tracker | Link equipment allocations to projects and track asset utilization |
| ~~calendar | Schedule inventory audits and reorder reminders |

## Rules
- Every piece of equipment must have a unique asset code; never create duplicates
- All allocations must include: employee name, date, asset code, and condition
- Trigger a low-stock alert when any item falls below 20% of its minimum threshold
- Every change must be logged with: timestamp, person responsible, item, quantity change, and reason
- Never delete historical records; all changes are append-only for audit purposes
- Monthly audits should compare physical counts against system records

## Output Template
```
Inventory Report
---------------------------------------
Date: [MM/DD/YYYY]
Operation: [Stock Check / Allocation / Retrieval / Reorder / Audit]
Performed By: [Name]

Item Summary:
| Item            | Asset Code | In Stock | Minimum | Status      |
|-----------------|------------|----------|---------|-------------|
| [Item Name]     | [Code]     | [Qty]    | [Min]   | [OK/LOW/OUT]|

Change Log:
- [Timestamp] | [Person] | [Item] | [Change: +/- Qty] | [Reason]

Alerts:
- [Item]: Current stock ([Qty]) is below minimum threshold ([Min]). Recommended reorder: [Qty].

Purchase Order (if applicable):
| Item            | Quantity | Est. Unit Cost | Est. Total |
|-----------------|----------|----------------|------------|
| [Item Name]     | [Qty]    | [Cost]         | [Total]    |
| GRAND TOTAL     |          |                | [Amount]   |
---------------------------------------
```

## Related Skills
- `report-generator` -- For generating inventory and asset reports
- `sop-creator` -- For documenting inventory management procedures
- `document-formatter` -- For formatting purchase orders and audit reports
- `travel-planner` -- For checking out travel equipment before trips
