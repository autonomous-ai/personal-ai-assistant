---
name: follow-up-drafter
description: >
  Drafts value-driven follow-up emails for sales touchpoints including post-meeting recaps,
  post-demo highlights, proposal follow-ups, re-engagement messages, and closed-deal thank-yous.
  Use when the user says "write a follow-up", "draft a recap email", "check in with this prospect",
  "re-engage this lead", "they haven't replied yet", "send a thank you after the deal",
  "follow up on my proposal", or "nudge this prospect".
---

# Follow-up Drafter

## Quick Start
Describe the context: what happened (meeting, demo, proposal), who the prospect is, and which follow-up attempt this is. The skill drafts a personalized, value-adding email with a single clear call to action.

## Workflow
1. Identify the triggering event: post-meeting, post-demo, post-proposal, re-engagement, or post-close thank you
2. Determine the follow-up attempt number (enforce Rule of 3: max 3 per touchpoint)
3. Gather conversation history: topics discussed, action items, objections, commitments
4. Select the matching template and inject personalization (name, company, pain points, features shown)
5. Attach a value-add element: case study, industry article, demo recording, or ROI data
6. Craft subject line (use "Re: [original subject]" for ongoing threads)
7. Write the email: context reminder (1 sentence) + value-add content + single CTA
8. Recommend send timing (Tue-Thu, 9-11 AM in prospect's timezone)
9. Schedule next follow-up or recommend moving to nurture sequence

## Examples

**Example 1: Post-meeting follow-up**
Input: "Follow up with David Park at Zenith Labs after our demo yesterday. He was interested in the API integrations and asked about SOC 2 compliance."
Output:
```
Follow-up Email

Context: Post-demo
Attempt: #1 of 3
Recommended Send Time: Tuesday, 19/03/2026, 9:30 AM PST

---

Subject: Re: Zenith Labs x [Your Company] — API Integration Demo

Hi David,

Thanks for your time yesterday — great conversation about how our API integrations can streamline Zenith's data pipeline.

You asked about SOC 2 compliance, so I wanted to share our compliance overview doc (attached) which covers our full security posture including SOC 2 Type II certification.

I also pulled a quick case study from MediTrack, a similar biotech company that cut their integration time by 60% using our API suite — thought it might be relevant as you evaluate options.

Would a 20-minute call on Thursday work to walk through your specific integration requirements?

Best,
[Your Name]

---

Value-Add Included: SOC 2 compliance doc + MediTrack case study
Call to Action: 20-minute technical call Thursday
Next Follow-up: 24/03/2026 — share ROI calculator if no response
Deal Stage: Qualified → Proposal Sent
```

**Example 2: Third attempt on a proposal**
Input: "This is my 3rd follow-up on the proposal I sent to Lisa at Orbit Media. Still no response."
Output:
```
Follow-up Email

Context: Post-proposal
Attempt: #3 of 3 (Final)
Recommended Send Time: Wednesday, 19/03/2026, 10:00 AM EST

---

Subject: Re: Orbit Media Proposal — Quick Question

Hi Lisa,

I understand things get busy — just wanted to share a quick win from a recent client in your space: Pixel Agency reduced their campaign turnaround by 45% in the first quarter after onboarding.

If the timing isn't right, no pressure at all. I'll keep you in the loop on product updates that might be relevant down the road.

Is this still on your radar, or should I check back in a few months?

Best,
[Your Name]

---

Value-Add Included: Pixel Agency case study
Call to Action: Confirm interest or defer
Next Follow-up: Move to nurture sequence (quarterly check-in)
Deal Stage: Proposal Sent
```

## Tools
- Use `Read` to access meeting notes, prior email threads, proposal docs, or CRM exports
- Use `WebSearch` to find relevant case studies, articles, or prospect company news for value-add content
- Use `WebFetch` to pull specific articles or resources to reference in the follow-up

## Error Handling
- If follow-up context is unclear → ask for the triggering event and key details from the interaction
- If attempt number is unknown → ask how many times they have already followed up
- If prospect response history is unavailable → draft a general follow-up and flag that more context improves personalization
- If user requests a 4th follow-up on the same touchpoint → advise against it and offer to draft a nurture email instead

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~CRM | Pull deal context, last activity, and contact details for personalization |
| ~~email | Access prior email threads and send drafts directly |
| ~~calendar | Check prospect availability and suggest meeting times in the CTA |
| ~~LinkedIn | Reference recent prospect activity or shared connections in the email |

## Rules
- **Rule of 3**: Max 3 follow-ups per touchpoint; after 3 unanswered, move to nurture
- Every follow-up must add tangible value — "just checking in" is never acceptable
- Use reply-thread subject lines ("Re: [original]") for ongoing conversations
- Optimal send timing: Tuesday through Thursday, 9:00-11:00 AM in prospect's timezone
- Each email must contain exactly one clear call to action
- Tone: professional, warm, respectful of prospect's time — never guilt-trip or use manipulative urgency
- Post-close thank-yous must confirm onboarding next steps

## Output Template
```
Follow-up Email

Context: [Post-meeting / Post-demo / Post-proposal / Re-engage / Thank you]
Attempt: [#N of 3]
Recommended Send Time: [Day, Date, Time in prospect's timezone]

---

Subject: [Subject line]

[Email body]

---

Value-Add Included: [Case study / Article / Demo recording / ROI data]
Call to Action: [Specific action requested]
Next Follow-up: [Date and approach, or "Move to nurture"]
Deal Stage: [Current pipeline stage]
```

## Related Skills
- `proposal-writer` -- For drafting the proposal that triggers a follow-up sequence
- `lead-researcher` -- For researching the prospect to add value in follow-ups
- `crm-helper` -- For logging follow-up activity and updating deal stages
- `competitor-briefer` -- For competitive talking points to include in re-engagement emails
