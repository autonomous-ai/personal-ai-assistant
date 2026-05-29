---
name: note-taker
description: >
  Captures and organizes notes, meeting minutes, to-do lists, brainstorming sessions, and daily standups into structured formats.
  Use when the user says "take notes", "write this down", "create meeting minutes",
  "make a checklist", "capture action items", "jot this down", "summarize the meeting",
  "start a brainstorm", "log what we decided", or asks to record, organize, or structure any discussion or ideas.
---

# Note Taker

## Quick Start
Identify the note type (quick note, meeting notes, to-do, brainstorm, standup), structure the content with clear headings and bullet points, and always extract action items from meetings. Save files as `YYYY-MM-DD-[type]-[topic].md`.

## Workflow
1. Classify the note type: quick note, meeting notes, to-do list, brainstorm, or daily standup
2. Gather context: content to capture, participants, deadlines, priorities
3. Organize raw content into the appropriate structured template
4. Extract action items, decisions, and deadlines automatically from meeting content
5. Present formatted note for review; save to file if requested

## Examples

**Example 1: Meeting Notes**
Input: "Take notes for our sprint planning. Attendees: Alice, Bob, Carol. We decided to prioritize the auth refactor, Bob will handle it by Friday. Carol raised a blocker about the API rate limits."
Output:
Meeting Notes - Sprint Planning

Date: 2026-03-18
Participants: Alice, Bob, Carol

Key Topics:
- Auth refactor prioritization
- API rate limit blocker

Decisions:
- Auth refactor moved to top priority for this sprint

Action Items:
- [ ] Complete auth refactor -> Bob - Deadline: 2026-03-20
- [ ] Investigate API rate limit blocker -> Carol - Deadline: TBD

**Example 2: To-Do List**
Input: "Create a to-do list: finish the report (high, due Friday), update the dashboard (medium), fix login bug (high, due tomorrow)"
Output:
To-Do List - 2026-03-18

High Priority:
- [ ] Fix login bug - Deadline: 2026-03-19
- [ ] Finish the report - Deadline: 2026-03-20

Medium Priority:
- [ ] Update the dashboard

## Tools
- Use `Write` to save notes as markdown files with standardized naming
- Use `Read` to access existing notes or reference documents for context
- Use `Glob` to find related notes in the file system
- Use `Bash` to list or organize note files within a directory

## Error Handling
- If note type is unclear → ask user to specify format (quick note, meeting, to-do, brainstorm)
- If meeting content is too sparse → prompt for key topics, decisions, and action items
- If file with same name exists → ask whether to overwrite, append, or create with new name
- If content is unstructured → organize into best-matching template and confirm

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~notes | Save notes directly to Notion, Obsidian, or Apple Notes |
| ~~calendar | Link meeting notes to calendar events automatically |
| ~~email | Email meeting minutes and action items to participants |
| ~~drive | Store notes in Google Drive or shared team folders |

## Rules
- Meeting notes must include: date, participants, topics, decisions, and action items with assignees/deadlines
- To-do lists use checkboxes (`[ ]` / `[x]`) sorted by priority (high to low)
- Use bullet points, avoid long paragraphs -- keep notes scannable
- Save files as `YYYY-MM-DD-[type]-[topic].md`
- Never discard user-provided content; preserve original information when restructuring
- Daily standups use three sections: Done, Doing, Blockers

## Output Template
```
Meeting Notes - [Topic]

Date: [YYYY-MM-DD]
Participants: [list of attendees]

Key Topics:
- [Topic 1]
- [Topic 2]

Decisions:
- [Decision 1]
- [Decision 2]

Action Items:
- [ ] [Task description] -> [Assignee] - Deadline: [YYYY-MM-DD]
- [ ] [Task description] -> [Assignee] - Deadline: [YYYY-MM-DD]

Next Meeting: [date if applicable]
```

## Related Skills
- `gmail` -- For emailing meeting notes and action items to participants
- `calendar-helper` -- For scheduling follow-up meetings referenced in notes
- `document-summarizer` -- For condensing long transcripts before note extraction
