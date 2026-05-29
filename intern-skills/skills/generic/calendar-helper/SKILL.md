---
name: calendar-helper
description: >
  Helps create, edit, view, and manage calendar events, meetings, reminders, and scheduling.
  Use when the user says "schedule a meeting", "book a call", "check my calendar",
  "what's on my schedule", "set a reminder", "find a free slot", "move my meeting",
  "when is my next meeting", "block time for focus", "cancel the 3pm",
  "am I free on Thursday", or mentions scheduling, checking availability, or managing appointments and deadlines.
---

# Calendar Helper

## Quick Start
Determine the calendar action (create, edit, delete, view, find slots), gather required details, and always confirm timezone. Propose multiple time slot options for new meetings.

## Workflow
1. Identify the action: create, edit, delete, view schedule, or find available slots
2. Collect required details: title, date/time, duration, participants, location, timezone
3. Check for conflicts against known schedule context
4. Present event details or slot options for user confirmation before finalizing
5. Format all times with explicit timezone indication

## Examples

**Example 1: Create Event**
Input: "Schedule a team standup every weekday at 9 AM starting next Monday"
Output:
New Recurring Event: Team Standup

Time: Monday, 03/23/2026 at 9:00 AM (GMT+7)
Duration: 30 minutes
Recurrence: Weekdays (Mon-Fri)
Reminder: 10 minutes before

Status: Pending Confirmation
Shall I finalize this event?

**Example 2: Find Slots**
Input: "Find a 1-hour slot for a meeting with the design team this Thursday"
Output:
Available slots for Thursday, 03/19/2026:

1. 10:00 AM - 11:00 AM (GMT+7) - Morning, no conflicts
2. 2:00 PM - 3:00 PM (GMT+7) - After lunch, clear window
3. 4:00 PM - 5:00 PM (GMT+7) - Late afternoon

Which slot works best?

## Tools
- Use `Read` to access existing calendar files or schedule data
- Use `Bash` to execute date/time calculations or generate calendar exports
- Use `Write` to save calendar entries or event files

## Error Handling
- If timezone is unclear → ask the user to confirm before proceeding
- If scheduling conflict detected → alert user, suggest alternatives
- If required info missing (title, time, date) → prompt for missing details
- If referenced event not found → list similar events and ask to clarify

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~calendar | Sync events directly with Google Calendar, Outlook, or Apple Calendar |
| ~~email | Send meeting invitations and event updates to participants |
| ~~notes | Attach meeting agendas or capture notes linked to calendar events |
| ~~search engine | Look up venue details, time zones, or public holiday schedules |

## Rules
- Always confirm timezone if not explicitly stated
- Suggest 2-3 time slot options for new meetings
- Format times clearly: "Tuesday, 03/18/2026 at 2:00 PM (GMT+7)"
- For recurring events, state the recurrence pattern explicitly
- Never delete or modify events without explicit user confirmation

## Output Template
```
[Action Type]: [Event Title]

Time: [Day, MM/DD/YYYY at HH:MM AM/PM (Timezone)]
Duration: [length]
Location: [if applicable]
Participants: [if applicable]
Reminder: [how long before the event]
Recurrence: [if applicable]

Status: [Confirmed / Pending Confirmation / Conflict Detected]
```

## Related Skills
- `gmail` -- For finding meeting-related emails/RSVPs and sending invitations or follow-ups
- `note-taker` -- For capturing meeting agendas and action items
