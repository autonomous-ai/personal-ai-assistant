---
name: interview-scheduler
description: >
  Schedules, reschedules, and coordinates interviews between candidates and interviewers, including drafting confirmations and preparing scorecards.
  Use when the user says "book an interview", "schedule a candidate", "find available interview slots",
  "reschedule the interview", "coordinate a panel interview", "set up a phone screen",
  "when can we interview this person", or "prepare interview scorecard".
---

# Interview Scheduler

## Quick Start
Coordinate interviews by matching candidate and interviewer availability within business hours. Always confirm round type to determine duration, prepare a scorecard for interviewers, and draft a confirmation email for the candidate.

## Workflow
1. Determine request type: new scheduling, reschedule, or panel coordination
2. Collect candidate name, position, round type, required interviewers, and time constraints
3. Classify round type for duration: phone screen (30 min), technical (60-90 min), culture fit (45 min), final/panel (60-90 min)
4. Identify 2-3 available slots within business hours (9:00 AM - 5:30 PM), ensuring a minimum 2 business-day gap between rounds
5. Lock the selected slot and generate calendar invite details with meeting link or room
6. Prepare an interviewer scorecard tailored to the round type
7. Draft candidate confirmation email with date, time, duration, location, interviewer names, and preparation tips
8. Set reminders at T-1 day and T-1 hour for interviewers, T-1 day for the candidate

## Examples

**Example 1: Schedule a technical interview**
Input: "Schedule a technical interview for Sarah Chen for the Frontend Engineer role. Interviewer is Mark Lee. She's available Tuesday or Wednesday afternoon."
Output:
```
Interview Schedule

Candidate: Sarah Chen
Position: Frontend Engineer
Round: Round 2 - Technical

Date & Time: 2026-03-24, 14:00 - 15:30 (90 min)
Location: Google Meet link (to be generated)
Interviewer(s): Mark Lee, Senior Frontend Engineer

Confirmation Email: Drafted
Scorecard: Prepared (React, TypeScript, system design)
Reminders: Scheduled at T-1 day and T-1 hour

Preparation Notes for Candidate:
- Review the job description and prepare to discuss past frontend projects
- Be ready for a live coding exercise focused on React and TypeScript

Interviewer Briefing:
- Candidate summary: 3 years React experience, strong TypeScript, contributed to open-source UI library
- Focus areas: Component architecture, state management approach, problem-solving under constraints
```

**Example 2: Reschedule**
Input: "Mark Lee can't make Tuesday. Reschedule Sarah's interview to Thursday."
Output: Updated schedule with the new date, re-sent confirmation drafts, and adjusted reminders.

## Tools
- Use `Read` to review candidate profiles or job descriptions for scorecard preparation
- Use `Grep` to search for interviewer availability data or past interview notes

## Error Handling
- If candidate or interviewer availability not provided → ask the user to supply available time slots
- If requested time is outside business hours (before 9:00 AM or after 5:30 PM) → warn and suggest the nearest valid slot
- If gap between rounds is less than 2 business days → flag the conflict and recommend an adjusted date
- If an interviewer is double-booked → identify the conflict and propose alternative interviewers or time slots

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~calendar | Check interviewer and candidate availability in real time |
| ~~ATS | Pull candidate profiles, application stage, and interview history |
| ~~HRIS | Look up interviewer details, titles, and reporting structure |

## Rules
- Never schedule interviews before 9:00 AM or after 5:30 PM local time
- Maintain a minimum 2 business-day gap between consecutive rounds for the same candidate
- Duration rules are strict per round type
- A scorecard must be shared with the interviewer before the session
- Always provide the candidate with preparation instructions relevant to the round type
- Panel interviews require all interviewers to confirm availability before finalizing

## Output Template
```
Interview Schedule

Candidate: [Name]
Position: [Position Title]
Round: [Round Number] - [Type]

Date & Time: [YYYY-MM-DD, HH:MM - HH:MM] ([Duration])
Location: [Room Name / Video Link]
Interviewer(s): [Name(s) and Title(s)]

Confirmation Email: [Drafted / Sent / Pending]
Scorecard: [Prepared / Pending]
Reminders: [Scheduled at T-1 day and T-1 hour]

Preparation Notes for Candidate:
- [Tip 1 relevant to round type]
- [Tip 2 relevant to round type]

Interviewer Briefing:
- Candidate summary: [Key highlights from CV]
- Focus areas: [What to evaluate in this round]
```

## Related Skills
- `resume-screener` -- For screening candidates before scheduling interviews
- `onboarding-checklist` -- For onboarding after a successful interview process
- `leave-manager` -- For checking interviewer availability against leave calendars
