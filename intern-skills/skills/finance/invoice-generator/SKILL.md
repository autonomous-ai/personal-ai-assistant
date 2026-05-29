---
name: invoice-generator
description: >
  Generates invoices, quotations, receipts, payment vouchers, and debit notes with auto-numbering,
  sales tax calculation, and amount-in-words verification.
  Use when the user says "create an invoice", "bill this client", "generate invoice for project X",
  "draft a quotation", "issue a receipt", "prepare a payment voucher", "track unpaid invoices",
  "send a payment reminder", "make a debit note", "how much does this client owe",
  "accounts receivable summary", or "invoice this order".
---

# Invoice Generator

## Quick Start
Create structured financial documents (Invoice, Quotation, Receipt, Payment Voucher, Debit Note) with automatic numbering, line-item calculations, sales tax, and amount-in-words verification.

## Workflow
1. Identify the document type: Invoice, Quotation, Receipt, Payment Voucher, or Debit Note
2. Extract details: customer name, line items (description, quantity, unit price), discounts, sales tax rate, payment terms
3. Ask for any missing mandatory fields
4. Generate sequential document number (e.g., INV-YYYYMM-XXXX)
5. Calculate line totals, apply discounts, compute sales tax (varies by state/locality)
6. Generate amount in words and verify it matches the figures
7. Set payment terms and due dates (quotations default to 30 days validity)
8. Output the complete structured document

## Examples

**Example 1: Simple invoice**
Input: "Create an invoice for ABC Corp: 10 units of Widget A at $50.00 each"
Output:
```
INVOICE #INV-202603-0012
========================
Date:     03/18/2026
Customer: ABC Corp

LINE ITEMS
----------
| No. | Description | Qty | Unit Price | Amount     |
|-----|-------------|-----|------------|------------|
| 1   | Widget A    | 10  | $50.00     | $500.00    |

TOTALS
------
Subtotal:            $500.00
Discount:            $0.00
Sales Tax (8.25%):   $41.25
Grand Total:         $541.25
In words:            Five hundred forty-one and 25/100 US dollars

TERMS
-----
Payment due:    04/17/2026
Status:         Draft
```

**Example 2: Quotation with discount**
Input: "Draft a quotation for XYZ Ltd: 5 laptops at $2,000.00, 10 monitors at $800.00, 5% discount"
Output:
```
QUOTATION #QUO-202603-0003
==========================
Date:     03/18/2026
Customer: XYZ Ltd

LINE ITEMS
----------
| No. | Description | Qty | Unit Price | Amount      |
|-----|-------------|-----|------------|-------------|
| 1   | Laptop      | 5   | $2,000.00  | $10,000.00  |
| 2   | Monitor     | 10  | $800.00    | $8,000.00   |

TOTALS
------
Subtotal:            $18,000.00
Discount (5%):       $900.00
Sales Tax (8.25%):   $1,410.75
Grand Total:         $18,510.75
In words:            Eighteen thousand five hundred ten and 75/100 US dollars

TERMS
-----
Valid until:    04/17/2026
Status:         Draft
```

## Tools
- Use `Read` to load customer records and previous document sequences
- Use `Grep` to search for related documents by customer or document number
- Use `Write` to save generated documents and update the sequence counter
- Use `Bash` to perform arithmetic for totals, sales tax, and discounts

## Error Handling
- If customer name or line items are missing -> ask user to provide them
- If sales tax rate is unspecified -> ask user to provide state/locality or apply a common default rate and inform the user
- If amount in words does not match figures -> recalculate and correct before output
- If duplicate document number is detected -> increment sequence and regenerate
- If unsupported document type is requested -> list the five supported types

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~accounting | Sync invoices with the general ledger and accounts receivable |
| ~~ERP | Pull customer records, product catalogs, and pricing rules |
| ~~spreadsheet | Import line items from spreadsheets and export invoices |
| ~~banking | Match invoice payments against bank deposits |

## Rules
- Document number formats: INV-YYYYMM-XXXX, QUO-YYYYMM-XXXX, REC-YYYYMM-XXXX, PV-YYYYMM-XXXX, DN-YYYYMM-XXXX
- Sales tax rates vary by state and locality; ask user to specify when not provided
- Quotations valid for 30 days by default
- Invoices overdue by 15 days trigger a reminder notation
- Amount in words must always match amount in figures
- Default currency is USD
- Every document must include: document number, date, customer, at least one line item, and total

## Output Template
```
[DOCUMENT TYPE] #[Document Number]
===================================
Date:     [MM/DD/YYYY]
Customer: [Customer name]
Address:  [Customer address, if available]

LINE ITEMS
----------
| No. | Description        | Qty | Unit Price | Amount     |
|-----|--------------------|-----|------------|------------|
| 1   | [Item description] | [N] | [Price]    | [Line total] |

TOTALS
------
Subtotal:            [Subtotal amount]
Discount:            [Discount amount, if applicable]
Sales Tax ([Rate]%): [Sales tax amount]
Grand Total:         [Grand total]
In words:            [Amount in words]

TERMS
-----
Payment due:    [Due date or validity period]
Status:         [Draft / Issued / Paid / Overdue]

NOTES
-----
- [Any additional terms, conditions, or remarks]
```

## Related Skills
- `expense-tracker` — For tracking expenses related to invoiced projects
- `budget-planner` — For budget planning and forecasting against invoiced revenue
- `financial-report` — For revenue summaries incorporating invoice data
- `tax-helper` — For sales tax calculations and compliance on invoices
