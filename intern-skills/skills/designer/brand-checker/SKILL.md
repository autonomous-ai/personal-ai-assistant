---
name: brand-checker
description: Audits designs and materials against brand guidelines for logo usage, color accuracy, typography, imagery, and tone of voice compliance. Use when the user asks for a brand check, brand audit, brand consistency review, or wants to verify materials are on-brand before publication. Trigger phrases include "is this on-brand", "check this against our brand guidelines", "audit this for brand consistency", "does this match our brand", "review this material before we publish", "verify the logo usage", "are we using the right colors and fonts".
---

# Brand Checker

## Quick Start
Provide the material to check (design, screenshot, copy, or description) and the brand guidelines (document, link, or key specs). The audit covers logo usage, color accuracy, typography, imagery style, tone of voice, iconography, and layout/grid compliance, producing a scored report with actionable fixes.

## Workflow
1. Identify the material type (UI design, marketing collateral, social post, email, presentation, print)
2. Locate and load brand guidelines (from repo, user-provided, or requested)
3. Define audit scope based on material type: logo, colors, typography, imagery, tone, layout, iconography
4. Compare each brand element in the material against guideline specifications
5. Classify violations by severity: Critical (logo), High (color/typography), Medium (imagery/tone), Low (spacing)
6. Calculate brand consistency score (0-100) weighted by element importance
7. Generate remediation plan with exact correct values for each violation

## Examples

**Example 1: UI design brand check**
Input: "Check this settings page against our brand guidelines. Primary color is #1E40AF, font is Inter."
Output:
```
Brand Consistency Check

## Material: UI Design - Settings Page
## Date: 2026-03-18
## Guidelines Version: Brand Guide v2.1

## Brand Consistency Score: 72/100

## Element Audit
| Element    | Status | Expected       | Found          | Severity | Fix                          |
|------------|--------|----------------|----------------|----------|------------------------------|
| Logo       | Pass   | Primary mark   | Primary mark   | -        | -                            |
| Colors     | Fail   | #1E40AF        | #2563EB        | High     | Replace with #1E40AF         |
| Typography | Fail   | Inter Medium   | Inter Regular  | High     | Change weight to 500 (Medium)|
| Imagery    | Pass   | Flat style     | Flat style     | -        | -                            |
| Iconography| Fail   | 1.5px stroke   | 2px stroke     | Medium   | Reduce icon stroke to 1.5px  |
| Layout     | Pass   | 8px grid       | 8px grid       | -        | -                            |

## Critical Violations
(none)

## Recurring Patterns
- Color deviation: #2563EB used instead of #1E40AF in 4 locations -> Update color token in theme config

## Verdict: Needs Fixes
```

**Example 2: Marketing email brand check**
Input: "Is this promotional email on-brand? We use Poppins for headings and our brand red is #DC2626."
Output:
```
Brand Consistency Check

## Material: Marketing Email - Spring Promo
## Date: 2026-03-18

## Brand Consistency Score: 58/100

## Element Audit
| Element       | Status | Expected           | Found            | Severity | Fix                              |
|---------------|--------|--------------------|------------------|----------|----------------------------------|
| Logo          | Fail   | Min 120px width    | 80px width       | Critical | Increase logo to min 120px       |
| Colors        | Fail   | #DC2626            | #EF4444          | High     | Replace with #DC2626             |
| Typography    | Fail   | Poppins SemiBold   | Arial Bold       | High     | Use Poppins 600 (web font fallback ok)|
| Tone of Voice | Fail   | Professional, warm | Overly casual    | Medium   | Revise "Hey!" to "Hello,"       |

## Critical Violations
- Logo displayed below minimum size (80px vs 120px required) -> Resize to at least 120px width

## Verdict: Off-Brand
```

## Tools
- Use `Read` to load brand guideline documents, style guides, or brand book files
- Use `Grep` to search for color values, font declarations, and brand tokens in the codebase
- Use `Glob` to locate brand assets (logos, fonts, brand config files)
- Use `Bash` to check image dimensions for logo minimum size compliance

## Error Handling
- If brand guidelines are not available -> Ask the user to provide them; cannot audit without a reference standard
- If the submitted material is unclear or low-resolution -> Request a higher-quality version or ask about specific elements to check
- If brand guidelines are outdated or conflicting -> Flag the discrepancy, note which version was used, recommend a guidelines review
- If a violation might be intentional creative deviation -> Flag it, note the possibility, recommend confirming with the brand owner

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~design tool | Pull design files from Figma, Sketch, or Adobe XD for automated brand auditing |
| ~~asset management | Cross-check materials against approved brand assets in the DAM |
| ~~project tracker | Create tickets for brand violations and track remediation |
| ~~brand guidelines | Auto-load the latest brand guidelines document as the audit reference |

## Rules
- Brand guidelines are the single source of truth -- no exceptions unless approved by the brand owner
- Logo violations are always highest priority -- incorrect logo usage directly undermines brand identity
- Minor color variations must still be flagged -- consistency requires exact values, not approximations
- Check digital materials against RGB/Hex specs; check print materials against CMYK/Pantone specs
- Recurring violations should trigger a recommendation for team training or guideline updates
- Never approve a material with critical violations, regardless of timeline pressure
- Tone of voice checks apply to all user-facing copy, not just marketing materials

## Output Template
```
Brand Consistency Check

## Material: [Material type - Name/Description]
## Date: [YYYY-MM-DD]
## Guidelines Version: [Version or date of brand guidelines used]

## Brand Consistency Score: [X/100]

## Element Audit
| Element       | Status     | Expected         | Found            | Severity              | Fix            |
|---------------|------------|------------------|------------------|-----------------------|----------------|
| Logo          | [Pass/Fail]| [Guideline spec] | [What was found] | [Critical/High/Med/Low]| [Specific fix] |
| Colors        | [Pass/Fail]| [Guideline spec] | [What was found] | [Critical/High/Med/Low]| [Specific fix] |
| Typography    | [Pass/Fail]| [Guideline spec] | [What was found] | [Critical/High/Med/Low]| [Specific fix] |
| Imagery       | [Pass/Fail]| [Guideline spec] | [What was found] | [Critical/High/Med/Low]| [Specific fix] |
| Tone of Voice | [Pass/Fail]| [Guideline spec] | [What was found] | [Critical/High/Med/Low]| [Specific fix] |
| Iconography   | [Pass/Fail]| [Guideline spec] | [What was found] | [Critical/High/Med/Low]| [Specific fix] |
| Layout/Grid   | [Pass/Fail]| [Guideline spec] | [What was found] | [Critical/High/Med/Low]| [Specific fix] |

## Critical Violations
- [Violation with exact location and required fix]

## Recurring Patterns
- [Pattern with process improvement recommendation]

## Verdict: [On-Brand / Needs Fixes / Off-Brand]
```

## Related Skills
- **color-palette** -- generate or fix color palettes that comply with brand specifications
- **design-reviewer** -- combine brand checks with full UX and accessibility reviews
- **asset-organizer** -- ensure brand assets are properly cataloged and up to date
