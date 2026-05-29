---
name: sprint-planner
description: >
  Plans and organizes Agile sprints by selecting backlog items, calculating team capacity, and distributing workload.
  Use when the user says "plan a sprint", "groom the backlog", "estimate team capacity",
  "rebalance the sprint", "review carry-over items", "what can we fit in this sprint",
  "calculate our velocity", or "distribute the workload".
---

# Sprint Planner

## Quick Start
Plan sprints by pulling prioritized backlog items into a sprint backlog based on team capacity. Default sprint is 2 weeks. Always maintain a 20% capacity buffer for unplanned work and enforce a WIP limit of 3 in-progress tasks per person.

## Workflow
1. Determine planning context: new sprint kickoff, mid-sprint rebalancing, or backlog grooming
2. Identify sprint parameters: sprint number, duration, start/end dates
3. Gather team availability (accounting for PTO, holidays, meeting overhead)
4. Review carry-over items from the previous sprint and re-evaluate priority
5. Calculate team capacity: Available hours = (Working days x 8h) - Leave - Meeting overhead, then apply 0.7 velocity factor
6. Rank backlog items by business value and urgency
7. Pull tasks into the sprint until reaching 80% capacity threshold
8. Assign tasks by skill match and workload balance
9. Define a clear, measurable sprint goal
10. Flag risks: overallocation, skill gaps, heavy dependencies, carry-over debt

## Examples

**Example 1: New sprint planning**
Input: "Plan sprint 5 for our team. 2-week sprint starting March 18. Team: Alice (full), Bob (3 days PTO), Carol (full)."
Output:
```
Sprint Planning - Sprint 5
18/03/2026 -> 01/04/2026 (10 working days)
Sprint Goal: Complete user authentication module and begin payment integration

Team Capacity:
| Member | Available Days | Available Points | Allocated Points | Remaining |
|--------|---------------|-----------------|-----------------|-----------|
| Alice  | 10            | 14 pts          | 11 pts          | 3 pts     |
| Bob    | 7             | 10 pts          | 8 pts           | 2 pts     |
| Carol  | 10            | 14 pts          | 12 pts          | 2 pts     |
| TOTAL  | 27            | 38 pts          | 31 pts          | 7 pts     |

Sprint Backlog:
| # | Task | Story Points | Assignee | Priority | Dependencies |
|---|------|-------------|----------|----------|-------------|
| 1 | Auth API endpoints | 5 | Alice | Critical | - |
| 2 | Login UI | 3 | Carol | High | #1 |
| 3 | Payment SDK setup | 5 | Bob | High | - |
| 4 | Session management | 3 | Alice | High | #1 |
| 5 | Unit tests for auth | 3 | Carol | Medium | #1, #4 |

Capacity Utilization: 31/38 points (82% of available capacity)
Buffer Remaining: 7 points (18%)

Risks & Flags:
- Bob's reduced availability may impact payment SDK delivery
- Tasks #2 and #5 depend on #1; any delay to auth API cascades
```

**Example 2: Mid-sprint rebalancing**
Input: "Alice is sick for the rest of the sprint. Redistribute her 8 remaining points."
Output:
```
Sprint 5 - Rebalance

Redistributed from Alice:
| Task | Points | New Assignee | Rationale |
|------|--------|-------------|-----------|
| Session management | 3 | Bob | Backend skill match |
| Auth bugfixes | 5 | Carol | Familiar with auth module |

Updated Capacity:
| Member | Remaining Capacity | New Allocation | Status |
|--------|-------------------|----------------|--------|
| Bob    | 2 pts → -1 pts    | Over by 1 pt   | At risk |
| Carol  | 2 pts → -3 pts    | Over by 3 pts  | At risk |

Risks & Flags:
- Both Bob and Carol are now over capacity; recommend deferring 1 low-priority task
```

## Tools
- Use `Read` to load backlog data, team rosters, previous sprint reports, and velocity history
- Use `Grep` to search for carry-over tasks, unresolved blockers, or dependency references
- Use `Write` to persist the finalized sprint backlog and capacity plan
- Use `Bash` to run capacity calculation scripts or export sprint plans

## Error Handling
- If team availability data is missing -> ask the user or assume full availability with a warning
- If backlog items lack story point estimates -> prompt the user or use historical averages
- If capacity is exceeded -> warn and suggest lower-priority tasks to defer
- If carry-over exceeds 30% of the new sprint -> flag a velocity concern and recommend a retrospective
- If no sprint goal is provided -> draft a suggested goal from the highest-priority items

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~project tracker | Pull backlog items, story points, and velocity history from the PM tool |
| ~~calendar | Check team availability, PTO, and holidays for capacity planning |
| ~~CI/CD | Link sprint deliverables to deployment pipelines and release schedules |
| ~~docs | Access sprint retrospective notes and planning documents |

## Rules
- Default sprint length: 2 weeks (10 working days)
- Never fill to 100% capacity; maintain 20% buffer for unplanned work
- WIP limit: max 3 in-progress tasks per person
- Carry-over tasks must have priority re-evaluated before inclusion
- Sprint goal must be clear, specific, and measurable
- Every sprint task must have a story point estimate and an assignee
- Dependencies between tasks must be explicitly documented

## Output Template
```
Sprint Planning - Sprint [N]
[Start date] -> [End date] ([N] working days)
Sprint Goal: [Clear, measurable goal statement]

Team Capacity:
| Member | Available Days | Available Points | Allocated Points | Remaining |
|--------|---------------|-----------------|-----------------|-----------|
| [Name] | [Days] | [X] pts | [Y] pts | [Z] pts |
| TOTAL  | [Days] | [X] pts | [Y] pts | [Z] pts |

Sprint Backlog:
| # | Task | Story Points | Assignee | Priority | Dependencies |
|---|------|-------------|----------|----------|-------------|
| 1 | [Task title] | [Pts] | [Person] | [Critical/High/Medium/Low] | [Task #] |

Capacity Utilization: [Y]/[X] points ([%] of available capacity)
Buffer Remaining: [Z] points ([%])

Carry-Over from Sprint [N-1]:
| Task | Original Points | Re-evaluated Priority | Decision |
|------|----------------|----------------------|----------|
| [Task] | [Pts] | [Priority] | [Include/Defer/Split] |

Risks & Flags:
- [Risk or concern identified during planning]
```

## Related Skills
- `task-tracker` -- For tracking individual task progress within the sprint
- `standup-helper` -- For daily standup updates during the sprint
- `risk-assessor` -- For assessing risks that may impact sprint delivery
- `timeline-generator` -- For generating project-level timelines across sprints
