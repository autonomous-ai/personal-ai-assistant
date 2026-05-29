---
name: color-palette
description: Creates, evaluates, adjusts, or extends color palettes for brands, products, and UIs with accessibility verification. Use when the user asks for a color palette, color scheme, theme colors, dark mode colors, contrast ratio checks, or brand color generation. Trigger phrases include "pick colors for my brand", "generate a color palette", "I need dark mode colors", "check this contrast ratio", "suggest a color scheme", "what colors go with this hex", "create theme colors for our app".
---

# Color Palette Generator

## Quick Start
Provide at least one base color (hex), brand personality keywords, or industry context. Optionally specify the color harmony type (complementary, analogous, triadic, split-complementary, monochromatic), whether you need dark mode, and any existing design system constraints. All generated colors include hex, RGB, and HSL values with WCAG contrast verification.

## Workflow
1. Determine the goal: new palette, modification, dark/light mode variation, or contrast audit
2. Gather context: brand personality, target audience, industry, existing brand colors
3. Select color harmony model based on the goal
4. Generate the palette: Primary, Secondary, Accent, Semantic colors (Success/Warning/Error/Info), Neutral scale (50-900)
5. Verify every foreground/background combination against WCAG AA (4.5:1 normal text, 3:1 large text)
6. Generate dark mode equivalents if requested (adjusted lightness/saturation, not simple inversion)
7. Compile the structured output with usage guidelines and contrast table

## Examples

**Example 1: New brand palette**
Input: "Create a color palette for a fintech startup. Primary color is #2563EB. Modern, trustworthy feel."
Output:
```
Color Palette: Fintech Brand

## Brand Colors
| Name      | Hex     | RGB           | HSL              | Usage                    |
|-----------|---------|---------------|------------------|--------------------------|
| Primary   | #2563EB | rgb(37,99,235)| hsl(217,84%,53%) | CTAs, links, key actions |
| Secondary | #0F172A | rgb(15,23,42) | hsl(222,47%,11%) | Headers, dark backgrounds|
| Accent    | #F59E0B | rgb(245,158,11)| hsl(38,92%,50%) | Highlights, badges       |

## Semantic Colors
| Name    | Hex     | Usage                       |
|---------|---------|-----------------------------|
| Success | #16A34A | Confirmations, positive     |
| Warning | #EAB308 | Caution, non-critical alerts |
| Error   | #DC2626 | Errors, destructive actions  |
| Info    | #0EA5E9 | Informational messages       |

## Contrast Check (WCAG AA)
| Foreground | Background | Ratio  | Result |
|------------|------------|--------|--------|
| #FFFFFF    | #2563EB    | 4.56:1 | AA     |
| #0F172A    | #FFFFFF    | 15.4:1 | AAA    |
| #FFFFFF    | #DC2626    | 4.63:1 | AA     |
```

**Example 2: Dark mode generation**
Input: "Generate dark mode colors from our existing light palette. Primary is #3B82F6."
Output:
```
Color Palette: Dark Mode Variant

## Dark Mode Equivalents
| Token          | Light Mode | Dark Mode  | Notes                        |
|----------------|------------|------------|------------------------------|
| Background     | #FFFFFF    | #0F172A    | Deep slate, not pure black   |
| Surface        | #F8FAFC    | #1E293B    | Elevated surfaces            |
| Primary        | #3B82F6    | #60A5FA    | Lightened for dark bg contrast|
| Primary Text   | #0F172A    | #F1F5F9    | High contrast on dark bg     |
| Secondary Text | #64748B    | #94A3B8    | Readable at 4.5:1 on dark   |
```

## Tools
- Use `Read` to load existing design system files, CSS custom properties, or theme configs
- Use `Grep` to search for existing color tokens or hex values in the codebase
- Use `Glob` to locate theme files, style tokens, or color configuration files

## Error Handling
- If no base color or brand direction is provided -> Ask for at least one primary color, personality keywords, or industry context
- If a user-provided color fails WCAG contrast -> Flag it, explain the failure, and suggest the closest accessible alternative
- If more than 7 main colors are requested -> Warn about consistency risks, recommend consolidation, but proceed if confirmed
- If dark mode is requested without a light palette -> Generate both together from provided base colors

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~design tool | Sync generated palettes directly into Figma, Sketch, or Adobe XD color styles |
| ~~asset management | Register new color tokens in the shared asset library for team-wide use |
| ~~project tracker | Log color decisions and palette changes as tracked design tasks |
| ~~brand guidelines | Auto-validate generated palettes against existing brand color specs |

## Rules
- WCAG AA minimum: 4.5:1 for normal text, 3:1 for large text and icons
- Never rely on color alone to convey information -- pair with icons, labels, or patterns
- Dark mode must adjust saturation and brightness, not simply invert colors
- Limit main palette to 5-7 colors for design consistency
- Always provide exact values (hex, RGB, HSL) -- no vague color names without values
- Semantic colors (success, warning, error, info) should be universally recognizable

## Output Template
```
Color Palette: [Project/Brand Name]

## Brand Colors
| Name | Hex | RGB | HSL | Usage |
|------|-----|-----|-----|-------|
| Primary   | #XXXXXX | rgb(X,X,X) | hsl(X,X%,X%) | [Usage] |
| Secondary | #XXXXXX | rgb(X,X,X) | hsl(X,X%,X%) | [Usage] |
| Accent    | #XXXXXX | rgb(X,X,X) | hsl(X,X%,X%) | [Usage] |

## Semantic Colors
| Name | Hex | Usage |
|------|-----|-------|
| Success | #XXXXXX | Positive actions, confirmations |
| Warning | #XXXXXX | Caution, non-critical alerts    |
| Error   | #XXXXXX | Errors, destructive actions     |
| Info    | #XXXXXX | Informational messages          |

## Neutral Scale
| Weight | Hex     | Usage            |
|--------|---------|------------------|
| 50     | #XXXXXX | Background       |
| 100    | #XXXXXX | Subtle background|
| 200    | #XXXXXX | Borders          |
| 300    | #XXXXXX | Disabled states  |
| 500    | #XXXXXX | Secondary text   |
| 700    | #XXXXXX | Primary text     |
| 900    | #XXXXXX | Headings         |

## Contrast Check (WCAG AA)
| Foreground | Background | Ratio | Result        |
|------------|------------|-------|---------------|
| [Color]    | [Color]    | [X]:1 | [AA/AAA/Fail] |

## Dark Mode Equivalents (if applicable)
| Token        | Light Mode | Dark Mode |
|--------------|------------|-----------|
| Background   | #XXXXXX    | #XXXXXX   |
| Surface      | #XXXXXX    | #XXXXXX   |
| Primary Text | #XXXXXX    | #XXXXXX   |
```

## Related Skills
- **brand-checker** -- verify that generated palettes align with brand guidelines
- **design-reviewer** -- use palette colors during design reviews to check contrast and consistency
- **wireframe-helper** -- apply palette colors to wireframes for higher-fidelity mockups
