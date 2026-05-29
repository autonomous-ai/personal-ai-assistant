---
name: social-media-planner
description: >
  Creates social media content calendars, generates post ideas, and develops platform-specific strategies.
  Use when the user says "plan my social media for this week", "create a content calendar",
  "give me post ideas for Instagram", "what should I post on LinkedIn", "build a posting schedule",
  "plan a hashtag strategy", or "help me with TikTok content".
---

# Social Media Planner

## Quick Start
Build social media content plans tailored to specific platforms. Apply the 80/20 rule (80% value, 20% promotional) and distribute content across four pillars: Educational (30%), Entertaining (25%), Promotional (25%), Engagement (20%).

## Workflow
1. Determine scope: full calendar, post ideation, platform strategy, or campaign social plan.
2. Collect brand, industry, audience, platforms, timeframe, and any upcoming events or launches.
3. Apply platform-specific best practices for format, frequency, and posting times.
4. Generate post ideas across the four content pillars.
5. Build the calendar with day, platform, pillar, content idea, format, and post time.
6. Draft captions, visual direction, hashtags, and CTAs for each entry.

## Examples

**Example 1: Weekly calendar**
Input: "Create a one-week Instagram content calendar for a fitness coaching business"
Output:
```
Social Media Calendar - Week of March 18-24, 2026

Goal: Increase engagement rate to 4%+ and drive DMs for coaching inquiries
Platforms: Instagram
Audience: Women 25-40 interested in strength training and healthy lifestyle

Content Calendar:
| Day | Pillar       | Content Idea                          | Format   | Time     |
|-----|--------------|---------------------------------------|----------|----------|
| Mon | Educational  | 3 common squat mistakes (with fixes)  | Reel     | 7:00 AM  |
| Tue | Engagement   | "What's your go-to post-workout meal?" | Story poll | 12:00 PM |
| Wed | Entertaining | Coach's meal prep fails compilation    | Reel     | 6:00 PM  |
| Thu | Educational  | How to progressive overload (carousel) | Carousel | 7:00 AM  |
| Fri | Promotional  | Client transformation + testimonial    | Post     | 12:00 PM |
| Sat | Engagement   | "This or That" workout edition         | Story    | 10:00 AM |
| Sun | Entertaining | Sunday reset routine (aesthetic vlog)  | Reel     | 5:00 PM  |

Post Details:
Mon - Reel - 3 Common Squat Mistakes
  Caption: "Stop doing this. Seriously. I see these 3 squat mistakes every single day in the gym, and they're killing your gains (and maybe your knees). Swipe to fix them today. Save this for your next leg day."
  Visual: Split-screen before/after form correction, text overlays on each mistake
  Hashtags: #SquatForm #LegDay #FitnessTips #StrengthTraining #GymTok #PersonalTrainer
  CTA: Save this + tag your gym buddy

Pillar Distribution:
- Educational: 29%
- Entertaining: 29%
- Promotional: 14%
- Engagement: 28%
```

**Example 2: Post ideation**
Input: "Give me 5 LinkedIn post ideas for a B2B SaaS startup"
Output:
```
LinkedIn Post Ideas - B2B SaaS Startup

1. [Educational] "We analyzed 1,000 customer support tickets. Here are the 3 patterns no one talks about."
   Format: Text post with numbered list. End with a question to drive comments.

2. [Entertaining] "Month 1 vs. Month 12 of running a SaaS startup" (expectation vs. reality)
   Format: Text post, relatable humor. Drives shares and follows.

3. [Promotional] "We just shipped [feature]. Here's why it took 4 months instead of 4 weeks."
   Format: Long-form text, behind-the-scenes transparency. Builds trust.

4. [Engagement] "Hot take: Most B2B onboarding is broken. Agree or disagree?"
   Format: Short provocative post. Drives comments and debate.

5. [Educational] "The exact cold email template that got us our first 10 enterprise clients"
   Format: Text with screenshot/document. High save and share potential.
```

## Tools
- Use `WebSearch` to research trending topics, viral formats, hashtags, and competitor activity.
- Use `Read` to load existing calendars, brand guidelines, or campaign briefs.
- Use `Write` to save the finalized content calendar to a file.

## Error Handling
- If platforms are not specified --> ask: "Which platforms should I plan for? (e.g., Instagram, TikTok, LinkedIn, Facebook, Twitter/X)"
- If brand or industry is unclear --> ask for a brief brand description and target audience first.
- If timeframe is not specified --> default to one week and note the assumption.
- If user wants real-time analytics --> clarify this skill creates plans; suggest campaign-tracker for performance data.

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~analytics | Pull engagement metrics to optimize posting times and formats |
| ~~social media | Publish scheduled posts directly to platforms |
| ~~CMS | Cross-link social posts to blog content and landing pages |
| ~~email marketing | Coordinate social campaigns with email send schedules |

## Rules
- 80/20 rule: 80% value content, 20% promotional.
- Every post must include a CTA, even a soft one (e.g., "What do you think?" or "Save for later").
- Hashtag guidelines: 3-5 for Facebook, 15-30 for Instagram, 3-5 for TikTok, 1-3 for LinkedIn.
- Content must be platform-native -- never repost identical content across platforms without adaptation.
- Posting times should be adjusted to the audience's timezone when known.
- Suggest A/B testing for high-stakes posts.
- Flag holidays or events that require culturally sensitive handling.

## Output Template
```
Social Media Calendar - [Week/Month] [Date Range]

Goal: [Primary objective]
Platforms: [List of platforms]
Audience: [Target audience summary]

Content Calendar:
| Day | Platform  | Pillar       | Content Idea           | Format   | Time     |
|-----|-----------|--------------|------------------------|----------|----------|
| Mon | [Platform]| [Pillar]     | [Brief idea]           | [Format] | [Time]   |
| Tue | [Platform]| [Pillar]     | [Brief idea]           | [Format] | [Time]   |
| Wed | [Platform]| [Pillar]     | [Brief idea]           | [Format] | [Time]   |
| Thu | [Platform]| [Pillar]     | [Brief idea]           | [Format] | [Time]   |
| Fri | [Platform]| [Pillar]     | [Brief idea]           | [Format] | [Time]   |
| Sat | [Platform]| [Pillar]     | [Brief idea]           | [Format] | [Time]   |
| Sun | [Platform]| [Pillar]     | [Brief idea]           | [Format] | [Time]   |

Post Details:
[Day] - [Platform] - [Content Idea]
  Caption: [Full caption text]
  Visual: [Direction for designer]
  Hashtags: [Hashtag list]
  CTA: [Specific call-to-action]

Pillar Distribution:
- Educational: [X]%
- Entertaining: [X]%
- Promotional: [X]%
- Engagement: [X]%
```

## Related Skills
- `content-writer` -- For drafting the full copy for each planned post
- `campaign-tracker` -- For measuring social campaign performance after execution
- `competitor-analyzer` -- For analyzing competitor social strategies and viral content
- `seo-optimizer` -- For aligning social content with SEO keyword strategies
