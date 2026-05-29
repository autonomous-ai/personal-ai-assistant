---
name: standup-helper
description: >
  Helps prepare, capture, and summarize daily standup meetings using the Done/Today/Blockers format.
  Use when the user says "prepare my standup", "capture standup notes", "compile the standup summary",
  "track blockers", "what did the team do yesterday", "prep for daily scrum",
  "escalate this blocker", or "write my standup update".
---

# Standup Helper

## Quick Start
Facilitate daily standups using the three-question format: Done, Today, Blockers. Keep each person's update to 3-5 bullet points. Track blockers with owner, age, and next action. Escalate blockers older than 3 days.

## Workflow
1. Determine standup mode: preparing a personal update, capturing team notes, or compiling a summary
2. Identify sprint context (sprint number, day within sprint, sprint goal)
3. Load previous standup notes to track continuity and flag slippage
4. Organize updates into Done/Today/Blockers format
5. Cross-reference blockers against previous standups to update age counts
6. Flag items from yesterday's "Today" list that did not appear in today's "Done"
7. Move detailed discussion topics to the Parking Lot
8. Generate compiled standup summary

## Examples

**Example 1: Personal standup prep**
Input: "Help me prep my standup. Yesterday I finished the login API and reviewed Bob's PR. Today I'll start session management and fix the auth bug. I'm blocked on the staging deploy."
Output:
```
Daily Standup - 03/18/2026
Sprint 5 - Day 3/10

Alice
Done:
- Completed login API implementation
- Reviewed Bob's PR (#142)
Today:
- Start session management feature
- Fix auth token refresh bug
Blockers:
- Staging deployment pipeline failing (Day 1) -> Need DevOps to investigate
```

**Example 2: Full team summary**
Input: "Compile standup notes for the team: Alice did login API, today auth bug, blocked on staging. Bob did payment SDK research, today start integration. Carol did nothing yesterday (sick), today resume unit tests."
Output:
```
Daily Standup - 03/18/2026
Sprint 5 - Day 3/10
Sprint Goal: Complete user authentication module

---

Alice
Done:
- Completed login API implementation
Today:
- Fix auth token refresh bug
Blockers:
- Staging deployment pipeline failing (Day 1) -> Escalate to DevOps

---

Bob
Done:
- Researched payment SDK options
Today:
- Begin payment SDK integration
Blockers:
- None

---

Carol
Done:
- (Out sick yesterday)
Today:
- Resume unit tests for auth module
Blockers:
- None

---

Blockers Summary:
| # | Blocker | Owner | Age (days) | Action | Target Date |
|---|---------|-------|-----------|--------|-------------|
| 1 | Staging deploy pipeline failing | Alice / DevOps | 1 | DevOps to investigate | 03/19/2026 |

Parking Lot (topics for follow-up):
- Payment SDK vendor decision -> Scheduled with Bob and PM on 03/19

Absent / No Update:
- None
```

## Tools
- Use `Read` to load previous standup notes, sprint info, and blocker tracking files
- Use `Grep` to search for unresolved blockers or task status updates across project docs
- Use `Write` to persist the standup summary and updated blocker tracker
- Use `Bash` to send standup summaries via communication tools or export to PM platforms

## Error Handling
- If a team member's update is missing -> note them as absent and flag for follow-up
- If a blocker has no assigned owner -> prompt the user to assign ownership
- If a blocker has no action plan -> require at minimum a next step and target date
- If standup content is excessive -> suggest splitting into focused standup and follow-up discussion
- If no sprint context is provided -> ask the user or omit sprint fields with a note

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~project tracker | Pull task status and recent activity for automated standup prep |
| ~~calendar | Check meeting schedules and team availability for standup timing |
| ~~CI/CD | Surface build/deploy status as discussion items |
| ~~docs | Access previous standup notes and blocker history |

## Rules
- Each person's update: 3-5 bullet points max (about 2 minutes of speaking time)
- Detailed discussions go to the Parking Lot for separate follow-ups
- Every blocker must have: owner, age (days), and concrete next action
- Blockers older than 3 days must be escalated to the PM or team lead
- The three standup questions are non-negotiable: Done, Today, Blockers
- Increment blocker age for unresolved items carried from previous standups

## Output Template
```
Daily Standup - [Date MM/DD/YYYY]
Sprint [N] - Day [X/10]
Sprint Goal: [Current sprint goal]

---

[Team Member Name]
Done:
- [Completed item]
Today:
- [Planned item]
Blockers:
- [Blocker description, if any]

---

Blockers Summary:
| # | Blocker | Owner | Age (days) | Action | Target Date |
|---|---------|-------|-----------|--------|-------------|
| 1 | [Issue description] | [Person] | [N] | [Next step] | [Date] |

Parking Lot (topics for follow-up):
- [Topic] -> Scheduled with [Person] on [Date/Time]

Absent / No Update:
- [Team member name] - [Reason if known]
```

## Related Skills
- `task-tracker` -- For updating task statuses discussed during standup
- `sprint-planner` -- For context on sprint goals and capacity during standup
- `risk-assessor` -- For escalating blockers identified during standup as formal risks
- `timeline-generator` -- For checking project timeline impact of reported delays
