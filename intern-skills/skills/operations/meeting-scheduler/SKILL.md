---
name: meeting-scheduler
description: >
  Schedules, reschedules, and manages business meetings including finding available time slots, preparing agendas, and generating follow-up notes.
  Use when the user says "schedule a meeting", "find a time slot", "book a room",
  "create a meeting agenda", "reschedule the meeting", "set up a call",
  "send meeting notes", or "when is everyone available".
---

# Meeting Scheduler

## Quick Start
Coordinate and schedule meetings with structured agendas and proper time management. Identify attendees, find available slots, prepare agendas with timed items, and handle follow-up actions.

## Workflow
1. Determine the request type: new meeting, reschedule, cancellation, or post-meeting follow-up
2. Gather core details: purpose, attendees, preferred date/time range, duration, and room/platform preference
3. Identify constraints: blocked periods (lunch 12:00-13:30), priority level, and buffer requirements
4. Generate 2-3 ranked time slot options based on availability and priority
5. Once confirmed, compile the full calendar event with agenda and send invitation content
6. After the meeting, offer to distribute notes and action items

## Examples

**Example 1: New Meeting**
Input: "Schedule a project kickoff meeting with the dev team and design team next Tuesday, about 45 minutes."
Output:
```
Meeting Request
---------------------------------------
Subject:    Project Kickoff - Dev & Design Teams
Time:       Option A: Tue 24/03/2026, 09:00 - 09:45 (Recommended)
            Option B: Tue 24/03/2026, 14:00 - 14:45
            Option C: Tue 24/03/2026, 16:00 - 16:45
Duration:   45 minutes
Location:   TBD (please confirm room or virtual link)
Attendees:  Dev Team, Design Team

Agenda:
1. Welcome & introductions .......... 5 min
2. Project scope overview ........... 15 min
3. Timeline & milestones ............ 10 min
4. Role assignments ................. 10 min
5. Wrap-up & action items ........... 5 min

Reminder: 30 minutes before the meeting.
---------------------------------------
Status: Draft
```

**Example 2: Reschedule**
Input: "Reschedule the Friday standup to Thursday same time, same attendees."
Output:
```
Meeting Request
---------------------------------------
Subject:    Standup (Rescheduled from Friday)
Time:       Thu 27/03/2026, 09:30 - 10:00
Duration:   30 minutes
Location:   [Same as original]
Attendees:  [Same as original]

Note: All attendees will be notified of the date change.

Agenda:
1. Progress updates ................. 15 min
2. Blockers & support needed ........ 10 min
3. Wrap-up .......................... 5 min

Reminder: 30 minutes before the meeting.
---------------------------------------
Status: Draft
```

## Tools
- Use `Read` to review attendee lists, calendar data, or agenda documents provided by the user
- Use `Write` to save meeting agendas, invitations, or follow-up notes to files
- Use `Grep` to search for prior meeting records or recurring meeting patterns
- Use `Glob` to locate related documents like previous agendas or meeting note templates

## Error Handling
- If no common free slot exists in the requested range → widen the search by 2 business days and notify the user
- If attendees are not specified → ask for the attendee list before generating time slots
- If duration exceeds 60 minutes → warn the user and suggest splitting into multiple sessions
- If the requested room is unavailable → suggest alternative rooms or a virtual meeting link
- If no agenda is provided → remind the user that an agenda is required and offer to draft one

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~calendar | Check attendee availability and create calendar events in real time |
| ~~document management | Access agenda templates and store meeting notes |
| ~~project tracker | Link meetings to project milestones and action items |

## Rules
- Never schedule during lunch (12:00-13:30) unless explicitly requested
- Default meeting duration is 30 minutes; maximum is 60 minutes
- Every invitation must include an agenda with timed items
- Prioritize morning slots for high-priority meetings
- Maintain a 15-minute buffer between consecutive meetings
- Always confirm the final slot with the user before creating the event

## Output Template
```
Meeting Request
---------------------------------------
Subject:    [Title]
Time:       [Date, Start Time - End Time]
Duration:   [N minutes]
Location:   [Meeting Room / Online Platform + Link]
Attendees:  [Comma-separated list]

Agenda:
1. [Item 1] .................. [Duration]
2. [Item 2] .................. [Duration]
3. [Item 3] .................. [Duration]
4. Wrap-up & Action Items .... [5 min]

Pre-read Materials:
- [Document/link, if any]

Reminder: 30 minutes before the meeting.
---------------------------------------
Status: [Draft / Confirmed / Sent]
```

## Related Skills
- `document-formatter` -- For formatting meeting minutes and follow-up documents
- `report-generator` -- For compiling meeting outcomes into operational reports
- `sop-creator` -- For documenting recurring meeting processes as SOPs
