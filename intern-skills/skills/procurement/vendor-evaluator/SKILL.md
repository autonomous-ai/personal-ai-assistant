---
name: vendor-evaluator
description: >
  Evaluates and compares vendors based on pricing, quality, reliability, and compliance criteria
  using a weighted scoring model.
  Use when the user says "evaluate this vendor", "compare these suppliers", "rate vendor proposals",
  "which vendor should we choose", "score these bids", "vendor performance review",
  "assess supplier reliability", "rank these vendors", "vendor scorecard",
  "due diligence on this supplier", or "is this vendor worth renewing".
---

# Vendor Evaluator

## Quick Start
Evaluate vendors using a structured scoring model across key criteria: pricing, quality, delivery, reliability, compliance, and support. Produce ranked comparisons with clear recommendations.

## Workflow
1. Identify evaluation context: new vendor selection, renewal assessment, or vendor performance review
2. Define evaluation criteria and weights (or use defaults)
3. Gather vendor information: proposals, quotes, references, past performance
4. Score each vendor on each criterion (1-10 scale)
5. Calculate weighted scores and rank vendors
6. Provide a recommendation with rationale and risk notes

## Examples

**Example 1: Vendor Comparison**
Input: "Compare these 3 office supply vendors and pick the best one"
Output:
```
VENDOR EVALUATION
=================
Category: Office Supplies
Evaluation Date: 03/23/2026
Evaluator: [User]

CRITERIA & WEIGHTS
------------------
| Criteria        | Weight |
|-----------------|--------|
| Pricing         | 30%    |
| Product Quality | 25%    |
| Delivery Speed  | 20%    |
| Customer Support| 15%    |
| Payment Terms   | 10%    |

VENDOR SCORECARD
----------------
| Criteria         | Weight | Vendor A | Vendor B | Vendor C |
|------------------|--------|----------|----------|----------|
| Pricing          | 30%    | 8/10     | 9/10     | 6/10     |
| Product Quality  | 25%    | 7/10     | 6/10     | 9/10     |
| Delivery Speed   | 20%    | 9/10     | 7/10     | 8/10     |
| Customer Support | 15%    | 7/10     | 8/10     | 8/10     |
| Payment Terms    | 10%    | 8/10     | 6/10     | 7/10     |
|                  |        |          |          |          |
| WEIGHTED SCORE   | 100%   | 7.85     | 7.45     | 7.55     |
| RANK             |        | #1       | #3       | #2       |

RECOMMENDATION: Vendor A
Rationale: Best overall balance of pricing and delivery speed. While Vendor C
has higher quality, Vendor A's pricing advantage (30% weight) and fastest
delivery make it the strongest choice for office supplies.

RISK NOTES:
- Vendor A: Slightly lower quality score — request sample order first
- Vendor B: Slowest delivery — may cause issues for urgent orders
- Vendor C: Highest pricing — 25% above Vendor A on comparable items
```

**Example 2: Single Vendor Assessment**
Input: "Evaluate this IT vendor for a 2-year contract"
Output: A detailed single-vendor scorecard with pass/fail recommendation.

## Tools
- Use `Read` to load vendor proposals, quotes, or performance data
- Use `Write` to save evaluation reports
- Use `WebSearch` to research vendor reputation and reviews
- Use `Bash` to calculate weighted scores from data files

## Error Handling
- If vendor information is incomplete → note gaps and score only available criteria
- If criteria weights not specified → use default weights and confirm with user
- If scores are subjective → ask user to provide ratings or evidence
- If vendors are too close in score → highlight differentiating factors

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~ERP | Access vendor master data, purchase history, and performance records |
| ~~vendor portal | Pull vendor proposals, certifications, and compliance documents |
| ~~spreadsheet | Import evaluation criteria and export scorecard reports |
| ~~email | Retrieve vendor quotes and correspondence for evaluation |

## Rules
- Use a 1-10 scoring scale consistently across all vendors
- All scores must be justified with specific evidence or rationale
- Default criteria weights: Price 30%, Quality 25%, Delivery 20%, Support 15%, Terms 10%
- Always include risk notes for each vendor
- Flag any vendor with a score below 5 on any criterion as a concern
- For tied scores, recommend based on the highest-weighted criterion
- Include both quantitative scores and qualitative observations
- Currency comparisons in USD unless otherwise specified

## Output Template
```
VENDOR EVALUATION
=================
Category: [Product/Service Category]
Evaluation Date: [MM/DD/YYYY]

VENDOR SCORECARD
----------------
| Criteria | Weight | Vendor A | Vendor B | ... |
|----------|--------|----------|----------|-----|
| [Criterion] | [%] | [X/10] | [X/10] | ... |
| WEIGHTED SCORE | 100% | [Score] | [Score] | ... |
| RANK | | [#N] | [#N] | ... |

RECOMMENDATION: [Vendor Name]
Rationale: [1-2 sentence justification]

RISK NOTES:
- [Vendor]: [Specific risk or concern]
```

## Related Skills
- `bid-analyzer` — For detailed bid evaluation with technical and financial scoring
- `price-comparator` — For in-depth pricing and total cost of ownership comparisons
- `supplier-tracker` — For tracking vendor performance after selection
- `po-generator` — For generating purchase orders with the selected vendor
