---
name: task-tracker
description: >
  Tracks project tasks including creation, assignment, status updates, and progress reporting.
  Use when the user says "create a task", "update task status", "check project progress",
  "what's overdue", "show blocked items", "generate a task board",
  "assign this to", or "how far along are we".
---

# Task Tracker

## Quick Start
Create, assign, update, and report on project tasks. Organize work into a task board with statuses: Backlog, To Do, In Progress, In Review, Done, Blocked. Every task requires a title, assignee, priority (Critical/High/Medium/Low), and deadline.

## Workflow
1. Parse the user's request to determine the operation: create task, update status, query progress, or generate report
2. Identify the project context (project name, sprint, team)
3. Load existing task data and cross-reference to avoid duplicates or invalid transitions
4. Execute the operation:
   - **Create**: Validate required fields, estimate effort, assign status
   - **Update**: Transition through valid workflow (Backlog -> To Do -> In Progress -> In Review -> Done)
   - **Report**: Calculate completion rates, flag overdue/blocked tasks, surface trends
   - **Blocked**: Identify root cause, suggest resolution, flag escalation
5. Output structured task board or report

## Examples

**Example 1: Create a task**
Input: "Create a task for Alice to build the login API, high priority, due March 25"
Output:
```
Task Created:
| # | Task | Assignee | Priority | Status | Deadline | Est. |
|---|------|----------|----------|--------|----------|------|
| 42 | Build login API | Alice | High | To Do | 25/03/2026 | 3d |
```

**Example 2: Progress report**
Input: "Show me the task board for Project Atlas"
Output:
```
Task Board - Project Atlas
Sprint 4 / Week 2

| # | Task | Assignee | Priority | Status | Deadline | Est. |
|---|------|----------|----------|--------|----------|------|
| 38 | Design DB schema | Bob | Critical | Done | 18/03/2026 | 2d |
| 39 | Build auth service | Alice | High | In Progress | 22/03/2026 | 3d |
| 40 | Write unit tests | Carol | Medium | To Do | 25/03/2026 | 2d |

Progress: 1/3 (33% complete)
Overdue: 0 tasks
Blocked: 0 tasks
In Review: 0 tasks
```

**Example 3: Flag blocked task**
Input: "Task 39 is blocked because the staging server is down"
Output:
```
Task #39 updated: In Progress -> Blocked

Blocked Tasks:
| Task | Assignee | Blocked By | Action |
|------|----------|------------|--------|
| Build auth service | Alice | Staging server down | Escalate to DevOps; ETA needed |
```

## Tools
- Use `Read` to load existing task data, project config, or team rosters
- Use `Grep` to search for task references, assignee mentions, or status keywords across project files
- Use `Write` to persist updated task board state or export reports
- Use `Bash` to run project management CLI tools or sync scripts

## Error Handling
- If required fields are missing (title, assignee, priority, deadline) -> prompt the user before proceeding
- If assignee is not recognized -> list available team members and ask for confirmation
- If status transition is invalid (e.g., Backlog directly to Done) -> warn and suggest correct workflow path
- If no project context is provided -> ask the user to specify the project
- If a task exceeds 3 days estimated effort -> recommend splitting into sub-tasks

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~project tracker | Sync tasks with Jira, Asana, or other project management tools |
| ~~CI/CD | Link tasks to build/deploy status and pull requests |
| ~~calendar | Set task deadlines as calendar events and track milestones |
| ~~docs | Access requirements documents and specifications linked to tasks |

## Rules
- Every task must have: title, assignee, priority, and deadline
- Priority ordering: Critical > High > Medium > Low
- Tasks over 3 days effort must be split into sub-tasks
- Overdue tasks must be highlighted and escalated
- Blocked tasks must include blocking reason and action plan
- Task IDs must be unique within a project

## Output Template
```
Task Board - [Project Name]
Sprint/Week: [Period]

| # | Task | Assignee | Priority | Status | Deadline | Est. |
|---|------|----------|----------|--------|----------|------|
| 1 | [Title] | [Person] | Critical/High/Medium/Low | [Status] | [Date] | [Points/Hours] |

Progress: [Done]/[Total] ([%] complete)
Overdue: [N] tasks
Blocked: [N] tasks
In Review: [N] tasks

Overdue Tasks:
| Task | Assignee | Deadline | Days Overdue | Action |
|------|----------|----------|-------------|--------|
| [Title] | [Person] | [Date] | [N] | [Next step] |

Blocked Tasks:
| Task | Assignee | Blocked By | Action |
|------|----------|------------|--------|
| [Title] | [Person] | [Reason] | [Resolution plan] |
```

## Related Skills
- `sprint-planner` -- For planning sprints and allocating tasks to team members
- `standup-helper` -- For daily standup updates on task progress
- `risk-assessor` -- For assessing risks related to blocked or overdue tasks
- `timeline-generator` -- For visualizing task timelines and dependencies
