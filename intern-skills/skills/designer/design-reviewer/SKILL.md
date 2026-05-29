---
name: design-reviewer
description: Reviews UI/UX designs for consistency, usability, accessibility, and design system adherence. Use when the user asks for design feedback, a UX review, a design audit, an accessibility check, or wants a mockup reviewed before development handoff. Trigger phrases include "review this design", "check my mockup", "is this accessible", "give me feedback on this UI", "audit this page for usability", "does this follow our design system", "look at this before I hand it off to dev".
---

# Design Reviewer

## Quick Start
Provide a design artifact (screenshot, mockup description, or wireframe) and optionally specify the target platform, design system, and review scope. The review covers visual consistency, layout, typography, color, spacing, interaction states, accessibility (WCAG 2.1 AA), and responsive behavior.

## Workflow
1. Identify the design artifact and determine review scope (full audit, accessibility-only, consistency check)
2. Gather context: target platform, design system, brand guidelines, page purpose
3. Perform first-pass overview of visual hierarchy and general usability
4. Inspect each UI element: grid alignment, 8px spacing, font sizes, contrast ratios, hover/active/focus states, touch targets (min 44x44px)
5. Trace user journey for flow and consistency against the design system
6. Audit WCAG 2.1 AA compliance: contrast (4.5:1 text, 3:1 large text/icons), readability, keyboard navigation
7. Categorize findings by severity and compile the structured report

## Examples

**Example 1: Full design review**
Input: "Review this login page mockup for our mobile app. We use Material Design 3."
Output:
```
Design Review

## Overview
Clean, minimal login page. Visual hierarchy is strong with clear CTA placement. A few spacing and accessibility issues need attention.

## Findings

### Must Fix
- **Password field**: Missing visible error state for invalid input -> Add red border + inline error message below field
- **"Sign In" button**: Contrast ratio 3.2:1 on light background -> Darken button to #1A73E8 for 4.6:1 ratio

### Should Fix
- **Social login buttons**: Inconsistent icon sizes (20px vs 24px) -> Standardize to 24px per MD3 specs
- **Spacing**: 12px gap between form fields breaks 8px grid -> Use 16px gap

### Nice to Have
- **Forgot password link**: Consider increasing touch target from 32px to 44px height

## Accessibility
- Contrast ratio: Fail - CTA button at 3.2:1 (needs 4.5:1)
- Touch targets: Fail - "Forgot password" link at 32px height
- Text readability: Pass - 16px body text, 1.5 line height
- Keyboard navigation: Pass - logical tab order

## What Works Well
- Clear visual hierarchy with prominent CTA
- Generous whitespace improves scannability
- Consistent use of MD3 typography scale

## Verdict: Needs Revision
```

**Example 2: Accessibility-only review**
Input: "Check this dashboard for WCAG compliance"
Output:
```
Design Review

## Overview
Accessibility-focused audit of the analytics dashboard.

## Findings

### Must Fix
- **Chart legends**: Color-only differentiation -> Add patterns or labels alongside colors
- **Data table headers**: Missing visual distinction -> Add bold weight and bottom border

### Should Fix
- **Tooltip text**: 11px font size below minimum -> Increase to 12px minimum

## Accessibility
- Contrast ratio: Pass - all text above 4.5:1
- Touch targets: Pass - all interactive elements >= 44px
- Text readability: Fail - tooltip text at 11px
- Keyboard navigation: Fail - chart elements not keyboard-accessible

## Verdict: Needs Revision
```

## Tools
- Use `Read` to load design system docs, brand guidelines, or previous review reports
- Use `Grep` to search for existing component implementations or style tokens in the codebase
- Use `Glob` to locate related design files or style guides

## Error Handling
- If no design artifact is provided -> Ask the user to share a screenshot, mockup description, or design file
- If design system or brand guidelines are unknown -> Proceed with WCAG 2.1 AA and general best practices, noting the absence of a reference system
- If review scope is ambiguous -> Default to a full audit covering all categories
- If target platform is unspecified -> Ask the user to clarify before reviewing

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~design tool | Pull design files directly from Figma, Sketch, or Adobe XD for review |
| ~~asset management | Cross-reference reviewed elements against the approved asset library |
| ~~project tracker | Create tickets for review findings and track fix progress |
| ~~brand guidelines | Auto-load brand specs to verify compliance during review |

## Rules
- Use constructive language: "Consider..." or "This could be improved by..." instead of "This is wrong"
- Always explain WHY a change is recommended, citing UX principles or accessibility standards
- Categorize all findings by severity: Must Fix, Should Fix, Nice to Have
- Acknowledge good design decisions, not just problems
- WCAG 2.1 AA is the minimum standard; flag AAA opportunities where feasible
- Never approve a design with critical accessibility violations

## Output Template
```
Design Review

## Overview
[General impressions and overall quality assessment]

## Findings

### Must Fix
- **[Element]**: [Issue] -> [Suggestion with rationale]

### Should Fix
- **[Element]**: [Issue] -> [Suggestion with rationale]

### Nice to Have
- **[Element]**: [Suggestion for enhancement]

## Accessibility
- Contrast ratio: [Pass/Fail with specific values]
- Touch targets: [Pass/Fail with measurements]
- Text readability: [Pass/Fail with details]
- Keyboard navigation: [Pass/Fail]

## What Works Well
- [Positive feedback with specific callouts]

## Verdict: [Approved / Needs Revision / Major Revision Required]
```

## Related Skills
- **brand-checker** -- audit materials against brand guidelines for logo, color, and typography compliance
- **color-palette** -- verify and fix color contrast issues flagged during review
- **wireframe-helper** -- create revised wireframes when layout changes are recommended
