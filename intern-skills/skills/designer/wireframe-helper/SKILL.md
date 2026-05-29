---
name: wireframe-helper
description: Creates text-based wireframes with ASCII layouts, annotations, responsive adaptations, and user flow context. Use when the user asks for a wireframe, page layout, UI structure, lo-fi mockup, or wants to visualize a page structure before high-fidelity design. Trigger phrases include "wireframe this page", "sketch out a layout", "what should this screen look like", "create a lo-fi mockup", "plan the UI structure", "draw me a page layout", "how should we lay out this feature".
---

# Wireframe Helper

## Quick Start
Describe the page or feature you need wireframed. Specify the target viewport (mobile, tablet, desktop), key content elements, and primary user action. The output is an annotated ASCII wireframe with responsive notes and user flow context.

## Workflow
1. Identify the page/feature, target viewport(s), and fidelity level needed
2. Gather requirements: page purpose, target users, key content, primary CTAs, constraints
3. Select the layout pattern: F-pattern (content), Z-pattern (landing page), card grid (listings), split screen (comparison), single column (mobile/long-form)
4. Create the ASCII wireframe starting with mobile viewport
5. Annotate interactions, behavior, and content requirements for each element
6. Map the user flow: how users arrive at and leave this page
7. Optionally propose 2-3 layout alternatives with rationale

## Examples

**Example 1: Landing page wireframe**
Input: "Wireframe a SaaS landing page with hero, features, pricing, and CTA"
Output:
```
Wireframe: SaaS Landing Page
Viewport: Mobile

## Layout
+----------------------------------+
|  [Logo]            [Menu Icon]   |
+----------------------------------+
|                                  |
|     Headline (max 8 words)       |
|     Subheadline (1-2 lines)      |
|                                  |
|     [=== Get Started CTA ===]    |
|                                  |
|     (Hero illustration)          |
|                                  |
+----------------------------------+
|     "Why Choose Us"              |
|                                  |
|  +----------------------------+  |
|  | (icon)  Feature 1 title    |  |
|  | Short description          |  |
|  +----------------------------+  |
|  +----------------------------+  |
|  | (icon)  Feature 2 title    |  |
|  | Short description          |  |
|  +----------------------------+  |
|  +----------------------------+  |
|  | (icon)  Feature 3 title    |  |
|  | Short description          |  |
|  +----------------------------+  |
+----------------------------------+
|     Pricing Plans                |
|  +--------+ +--------+ +------+  |
|  | Free   | | Pro    | | Team |  |
|  | $0/mo  | | $19/mo | | $49  |  |
|  | [List] | | [List] | | [List]| |
|  | [CTA]  | | [CTA]  | | [CTA]| |
|  +--------+ +--------+ +------+  |
+----------------------------------+
|  Footer: Links | Legal | Social  |
+----------------------------------+

## Annotations
1. Hero CTA: Primary action, full-width on mobile, centered on desktop
2. Features: Stack vertically on mobile, 3-column grid on desktop
3. Pricing cards: Horizontal scroll on mobile, side-by-side on desktop
4. Nav menu: Hamburger on mobile, horizontal links on desktop

## Responsive Adaptations
- Mobile: Single column, stacked cards, hamburger nav
- Tablet: 2-column feature grid, visible nav links
- Desktop: 3-column features and pricing, full nav bar

## User Flow
Search/Ad -> Landing Page -> [Get Started CTA] -> Sign Up Page
```

**Example 2: Dashboard wireframe**
Input: "Quick wireframe for an admin dashboard with stats and recent orders table"
Output:
```
Wireframe: Admin Dashboard
Viewport: Desktop

## Layout
+----------+-------------------------------------------+
| Sidebar  |  Welcome, [User]              [Notifications] |
|          |-------------------------------------------|
| [Logo]   |  +--------+ +--------+ +--------+ +--------+ |
| Dashboard|  | Revenue | | Orders | | Users  | | Conv.  | |
| Orders   |  | $12.4K  | | 284    | | 1,203  | | 3.2%   | |
| Products |  +--------+ +--------+ +--------+ +--------+ |
| Users    |                                           |
| Settings |  Recent Orders                    [View All]  |
|          |  +---------------------------------------+|
|          |  | # | Customer | Amount | Status | Date  ||
|          |  |---|----------|--------|--------|-------||
|          |  | 1 | Jane D.  | $89    | Shipped| 03/18 ||
|          |  | 2 | John S.  | $124   | Pending| 03/17 ||
|          |  +---------------------------------------+|
+----------+-------------------------------------------+

## Annotations
1. Sidebar: Collapsible on tablet, hidden (hamburger) on mobile
2. Stat cards: 4-column on desktop, 2x2 grid on tablet, stacked on mobile
3. Orders table: Horizontal scroll on mobile, hide low-priority columns
```

## Tools
- Use `Read` to load existing page templates, component libraries, or navigation structures
- Use `Grep` to search for existing layout patterns or route definitions in the codebase
- Use `Glob` to locate related design files or existing wireframes

## Error Handling
- If page purpose or content is unclear -> Ask the user to describe the page goal, target user, and 3-5 most important content elements
- If no target viewport is specified -> Default to mobile-first with responsive annotations for tablet and desktop
- If the layout conflicts with existing project patterns -> Flag the inconsistency and let the user decide
- If content is too complex for a single wireframe -> Break into multiple screens with navigation annotations

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~design tool | Export wireframes as starting frames in Figma, Sketch, or Adobe XD |
| ~~asset management | Pull existing components and icons from the asset library into wireframes |
| ~~project tracker | Link wireframes to user stories and track design progress |
| ~~brand guidelines | Apply brand layout grids and spacing rules to wireframe structures |

## Rules
- Mobile-first: always wireframe mobile viewport first, then scale up
- Content-first: use realistic content descriptions, not generic "Lorem ipsum" placeholders
- Above the fold: key message and primary CTA must be visible without scrolling
- Visual hierarchy: size and position communicate importance -- larger and higher means more important
- Consistency: identical content types must use identical layout patterns across the app
- Annotate every interactive element with its behavior (tap, click, hover, swipe)
- Wireframes are disposable -- optimize for speed and clarity, not visual polish

## Output Template
```
Wireframe: [Page Name]
Viewport: [Mobile / Tablet / Desktop]

## Layout
[ASCII wireframe using box-drawing characters]

## Annotations
1. [Element]: [Behavior / interaction / content notes]
2. [Element]: [Behavior / interaction / content notes]

## Responsive Adaptations
- Mobile: [Layout changes]
- Tablet: [Layout changes]
- Desktop: [Layout changes]

## User Flow
[Previous Page] -> [Action] -> [This Page] -> [Action] -> [Next Page]

## Layout Alternatives (if applicable)
### Option A: [Name]
[Brief description and rationale]

### Option B: [Name]
[Brief description and rationale]
```

## Related Skills
- **design-reviewer** -- review the wireframe for usability, accessibility, and design system adherence
- **color-palette** -- apply a color palette to elevate wireframes toward higher fidelity
- **asset-organizer** -- source existing assets and components to populate wireframe elements
