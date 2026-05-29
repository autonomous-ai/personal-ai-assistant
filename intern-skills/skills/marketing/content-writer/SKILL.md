---
name: content-writer
description: >
  Writes marketing content such as blog posts, social media captions, ad copy, landing pages,
  newsletters, and product descriptions.
  Use when the user says "write a blog post about X", "draft some ad copy", "create a landing page",
  "write a caption for this", "help me with headlines", "draft a newsletter",
  "write product descriptions", or "I need copy for X".
---

# Content Writer

## Quick Start
Create marketing content using the AIDA framework (Attention > Interest > Desire > Action). Always confirm the content type, target audience, tone, and CTA before drafting.

## Workflow
1. Identify the content type (blog, caption, ad copy, landing page, newsletter, product description), audience, tone, and constraints (word count, keywords, platform).
2. Ask clarifying questions if audience, tone, or CTA is missing.
3. Outline the piece: hook > body > CTA.
4. Draft using AIDA. Write for scanners: headings, bullets, short paragraphs. Lead with a strong hook.
5. Optimize for SEO keywords (if applicable) and readability.
6. Provide 2-3 alternative headlines/hooks for A/B testing.

## Examples

**Example 1: Blog post request**
Input: "Write a blog post about remote work productivity tips for startup founders"
Output:
```
Content Draft

Type: Blog post
Audience: Startup founders / early-stage CEOs
Tone: Professional yet approachable
Goal: Drive organic traffic + newsletter signups

---
# 7 Remote Work Hacks That Helped Me Scale a 50-Person Startup

The alarm goes off at 6 AM, and your commute is twelve steps to the kitchen...

[800-1500 word article with H2 sections, bullet points, and data references]
---

Stats:
- Words: 1,200
- Readability: Grade 8
- SEO keywords: remote work productivity, startup founder tips, async communication
- CTA: Subscribe to our weekly founder newsletter

Variations:
1. "Why the Best Startup Founders Ditched the Office (And Never Looked Back)"
2. "Remote Work Isn't the Problem -- Your Systems Are"
3. "The Founder's Guide to Building a Productive Remote Team"
```

**Example 2: Social caption**
Input: "Write an Instagram caption for our new coffee blend launch"
Output:
```
Content Draft

Type: Social caption
Audience: Coffee enthusiasts, 25-40
Tone: Casual, energetic
Goal: Drive product page visits

---
Your morning routine just got an upgrade.

Introducing Daybreak Blend -- single-origin Ethiopian beans, medium roast, notes of blueberry and dark chocolate.

We spent 6 months sourcing, tasting, and perfecting this one. The result? A cup that actually lives up to the hype.

Available now. Link in bio.
---

Stats:
- Words: 52
- CTA: Link in bio
- Hashtags: #NewBlend #CoffeeLover #SingleOrigin #Daybreak #SpecialtyCoffee

Variations:
1. "We tasted 47 beans to find the one. Meet Daybreak."
2. "Dark chocolate. Blueberry. Your new favorite morning."
3. "6 months in the making. One sip and you'll know why."
```

## Tools
- Use `WebSearch` to research trending topics, competitor content, and industry stats.
- Use `Read` to load brand guidelines, style guides, or previous drafts.
- Use `Write` to save finalized content to a file.

## Error Handling
- If target audience is missing --> ask: "Who is this content for? (e.g., age group, role, industry, pain points)"
- If content type is ambiguous --> present supported types and ask user to confirm.
- If tone is not specified --> default to professional-yet-approachable and note the assumption.
- If topic is outside marketing scope --> clarify and suggest an appropriate skill.

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~analytics | Pull traffic data and top-performing content for inspiration |
| ~~social media | Publish drafts directly to social platforms |
| ~~CMS | Create and update blog posts or landing pages in the CMS |
| ~~email marketing | Push newsletter drafts into the email platform for sending |

## Rules
- Every piece must have exactly one clear CTA.
- Apply AIDA: Attention > Interest > Desire > Action.
- Write for scanners: headings, bullets, short paragraphs.
- Strong hook in the first sentence is mandatory.
- Keyword usage must feel natural -- never keyword-stuff.
- 80/20 rule for social: 80% value, 20% promotional.
- Never fabricate statistics or data points.
- Avoid jargon unless audience is confirmed domain experts.

## Output Template
```
Content Draft

Type: [Content type]
Audience: [Target audience]
Tone: [Tone of voice]
Goal: [Purpose / conversion objective]

---
[Content body with headings, bullets, short paragraphs]
---

Stats:
- Words: [Word count]
- Readability: [Grade level]
- SEO keywords: [Keywords used]
- CTA: [The specific call-to-action]

Variations:
1. [Alternative headline/hook A]
2. [Alternative headline/hook B]
3. [Alternative headline/hook C]
```

## Related Skills
- `seo-optimizer` -- For optimizing content for search engines after drafting
- `social-media-planner` -- For scheduling and distributing social content
- `campaign-tracker` -- For measuring content performance after publication
- `competitor-analyzer` -- For researching competitor content strategies before writing
