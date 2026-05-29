---
name: presentation-maker
description: >
  Creates structured presentation outlines, slide content, and speaker notes for business presentations.
  Use when the user says "create a presentation", "build slides", "prepare a pitch deck",
  "draft a talk outline", "make a slide deck", "help me with my keynote",
  "presentation for the board meeting", "I need slides for",
  or asks to create, structure, or improve any presentation or slide content.
---

# Presentation Maker

## Quick Start
Create structured slide decks with clear narratives. Determine the presentation type, audience, and key message, then generate slide-by-slide content with titles, bullet points, and speaker notes.

## Workflow
1. Identify presentation type: pitch deck, status update, training, proposal, quarterly review, conference talk
2. Confirm audience, time limit, and key message or goal
3. Create an outline with logical flow: opening hook → problem/context → main content → conclusion/CTA
4. Generate slide-by-slide content with titles, bullet points (max 5 per slide), and speaker notes
5. Suggest visual elements (charts, diagrams, icons) for data-heavy slides
6. Review for consistency in tone, flow, and slide count vs. time limit

## Examples

**Example 1: Status Update**
Input: "Create Q1 project progress report slides for the board of directors, 10 minutes"
Output:
```
PRESENTATION OUTLINE
====================
Title: Q1 Project Progress Report
Audience: Board of Directors
Duration: 10 minutes (~8 slides)
Tone: Formal, data-driven

Slide 1: Title Slide
- Q1 2026 Project Progress Report
- [Presenter Name] | [Date]
- [Company Logo]

Slide 2: Executive Summary
- Overall completion: [X]% on track
- Key wins this quarter
- Budget utilization: [X]% of allocated
Speaker Notes: Open with the headline number to set a positive tone.

Slide 3: Project Milestones
- Milestone 1: [Status] ✅
- Milestone 2: [Status] ✅
- Milestone 3: [Status] 🔄 In Progress
Visual: Timeline or Gantt chart

Slide 4: Key Metrics & KPIs
- [Metric 1]: [Value] vs Target
- [Metric 2]: [Value] vs Target
Visual: Bar chart comparing actual vs target

Slide 5: Challenges & Mitigations
- Challenge 1 → Mitigation action taken
- Challenge 2 → Planned resolution
Speaker Notes: Be transparent but solution-oriented.

Slide 6: Budget Overview
- Allocated: [Amount]
- Spent: [Amount]
- Forecast: [Amount]
Visual: Pie chart or waterfall chart

Slide 7: Q2 Priorities
- Priority 1 with expected outcome
- Priority 2 with expected outcome
- Priority 3 with expected outcome

Slide 8: Q&A
- Thank you
- Contact information
```

**Example 2: Pitch Deck**
Input: "Create a 5-minute investor pitch deck for a SaaS product"
Output: A 6-slide deck following: Problem → Solution → Market Size → Business Model → Traction → Ask.

## Tools
- Use `Read` to load data, reports, or reference materials for the presentation
- Use `Write` to save the presentation outline to a file
- Use `WebSearch` to research market data, statistics, or competitor info for content

## Error Handling
- If topic is too broad → ask user to narrow the focus or specify key points
- If time limit not specified → assume 10 minutes (~8-10 slides) and confirm
- If audience not specified → ask who will be viewing the presentation
- If data is needed but not provided → add placeholder markers and list what data to fill in

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~drive | Access reference documents and save presentation files to Google Drive |
| ~~search engine | Research market data, statistics, and competitor info for slide content |
| ~~notes | Pull key points from meeting notes to build presentation content |

## Rules
- Maximum 5 bullet points per slide — keep text minimal
- One key idea per slide
- Rule of thumb: 1-1.5 minutes per slide
- Always include speaker notes for content-heavy slides
- Suggest visual elements where data can replace text
- Title slides must be clear and descriptive (not generic)
- End with a clear call-to-action or next steps slide
- Use consistent formatting across all slides

## Output Template
```
PRESENTATION OUTLINE
====================
Title: [Presentation Title]
Audience: [Target Audience]
Duration: [X] minutes (~[N] slides)
Tone: [Formal / Casual / Technical / Inspirational]

Slide [N]: [Slide Title]
- [Bullet point 1]
- [Bullet point 2]
- [Bullet point 3]
Visual: [Suggested chart/image/diagram]
Speaker Notes: [Key talking points for this slide]

---
Preparation Notes:
- [Data or materials to gather before finalizing]
- [Design suggestions]
```

## Related Skills
- `document-summarizer` -- For condensing source materials into key points for slides
- `spreadsheet-helper` -- For extracting data and charts to include in presentations
- `web-search` -- For researching market data and statistics for presentation content
