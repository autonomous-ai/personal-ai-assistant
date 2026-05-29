---
name: asset-organizer
description: Organizes, catalogs, audits, and renames design assets following consistent naming conventions and directory structures. Use when the user asks to organize assets, audit file naming, prepare assets for handoff, create an asset inventory, or set up a design file structure. Trigger phrases include "organize my assets", "rename these files", "audit our icon library", "set up a folder structure for design", "prepare assets for handoff", "catalog these images", "our assets are a mess".
---

# Asset Organizer

## Quick Start
Provide the root path to your assets folder or describe the assets you need organized. Specify the project type (web, mobile, cross-platform) and any existing naming conventions. The organizer will scan, audit, and produce a reorganization plan with a structured catalog.

## Workflow
1. Scan the asset directory for all files (SVG, PNG, JPG, WebP, PDF, etc.) and detect current naming patterns
2. Gather context: project type, target platforms, existing conventions
3. Audit assets for naming violations, missing density exports, oversized files (>1MB), format issues, and orphaned/unused files
4. Generate a reorganization plan mapping current paths to recommended paths
5. Build a structured asset catalog with metadata
6. Produce prioritized recommendations for fixes and optimizations

## Examples

**Example 1: Audit an assets folder**
Input: "Organize the assets in /src/assets. It's a React web app."
Output:
```
Asset Catalog: React Web App

## Summary
- Total assets: 47
- Icons: 28 | Illustrations: 8 | Photos: 6 | Logos: 5
- Formats: SVG: 30 | PNG: 12 | JPG: 5
- Last updated: 2026-03-18

## Directory Structure
assets/
  icons/
    outline/
    filled/
  illustrations/
    hero/
    spot/
    empty-state/
  photos/
    product/
    lifestyle/
  logos/
    primary/
    icon/

## Issues Found
| Severity | Issue                          | File(s)              | Recommended Fix                  |
|----------|--------------------------------|----------------------|----------------------------------|
| High     | PascalCase naming              | ArrowRight.svg, etc. | Rename to icon-arrow-right-24.svg|
| High     | PNG used for simple icons      | close.png, menu.png  | Convert to SVG for scalability   |
| Medium   | Missing @2x exports            | 6 PNG files          | Generate @2x and @3x variants   |
| Low      | 3 files exceed 1MB             | hero-*.png           | Compress or convert to WebP      |

## Optimization Opportunities
- 2 raster files that should be converted to SVG
- 6 assets missing @2x/@3x density exports
- 3 files exceeding 1MB that need compression
```

**Example 2: Define naming convention**
Input: "What naming convention should we use for our icon library?"
Output:
```
Naming Convention

Pattern: [category]-[name]-[variant]-[size].[ext]

Examples:
- icon-arrow-right-24.svg
- icon-arrow-right-filled-24.svg
- icon-search-outline-16.svg
- icon-close-24.svg

Rules:
- Lowercase, kebab-case, English only
- Category prefix: icon, illustration, photo, logo
- Size suffix for icons (16, 20, 24, 32, 48)
- Variant descriptor: outline, filled, colored
- Format: SVG for all icons and logos
```

## Tools
- Use `Glob` to scan for asset files by extension (*.svg, *.png, *.jpg, *.webp, *.pdf)
- Use `Read` to inspect asset metadata or existing naming convention documentation
- Use `Grep` to search for asset references in code (imports, src attributes, CSS url() values)
- Use `Bash` to list directory structures, check file sizes, and count assets

## Error Handling
- If no asset directory is specified -> Ask for the root path to the assets folder
- If the directory is empty or has no recognized asset files -> Report the finding and ask to confirm the correct path
- If naming conventions conflict with an existing team standard -> Present both options with tradeoffs, let the user decide
- If assets are referenced in code but missing from the directory -> Flag as broken references with file paths and code locations

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~design tool | Scan and organize assets directly within Figma, Sketch, or Adobe XD projects |
| ~~asset management | Sync catalog with a centralized DAM system and enforce naming conventions |
| ~~project tracker | Create tickets for asset issues and track cleanup progress |
| ~~brand guidelines | Cross-reference assets against approved brand marks and imagery standards |

## Rules
- File names must be lowercase, kebab-case, English only
- Naming pattern: `[category]-[name]-[variant]-[size].[ext]`
- Use SVG for icons and logos (scalable, small file size)
- Use PNG for complex raster graphics with @2x and @3x density exports
- Use WebP for web-optimized exports
- Never delete assets without user confirmation -- only recommend removal
- Flag unused assets for removal on a quarterly basis

## Output Template
```
Asset Catalog: [Project Name]

## Summary
- Total assets: [N]
- Icons: [N] | Illustrations: [N] | Photos: [N] | Logos: [N]
- Formats: SVG: [N] | PNG: [N] | JPG: [N] | WebP: [N] | Other: [N]
- Last updated: [Date]

## Directory Structure
[Recommended directory tree]

## Naming Convention
Pattern: [category]-[name]-[variant]-[size].[ext]
Examples:
- icon-arrow-right-24.svg
- hero-homepage-desktop.png
- logo-primary-color.svg

## Issues Found
| Severity | Issue | File(s) | Recommended Fix |
|----------|-------|---------|-----------------|
| High     | [Issue] | [File paths] | [Fix] |
| Medium   | [Issue] | [File paths] | [Fix] |
| Low      | [Issue] | [File paths] | [Fix] |

## Optimization Opportunities
- [N] files exceeding 1MB that need compression
- [N] raster files that should be converted to SVG
- [N] assets missing @2x/@3x density exports
```

## Related Skills
- **brand-checker** -- verify organized assets comply with brand guidelines
- **design-reviewer** -- review designs that reference the organized asset library
- **wireframe-helper** -- use cataloged assets when building wireframes and layouts
