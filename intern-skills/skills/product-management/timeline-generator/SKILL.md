---
name: timeline-generator
description: >
  Generates project timelines with phases, milestones, dependencies, critical path analysis, and Gantt-style visualizations.
  Use when the user says "create a project timeline", "estimate delivery dates", "build a roadmap",
  "identify the critical path", "adjust the schedule", "when will this be done",
  "show me the Gantt chart", or "what's the project schedule".
---

# Timeline Generator

## Quick Start
Build project timelines by sequencing tasks and phases with dependencies, calculating the critical path, and adding 20% buffers at each phase level. Show both buffered and unbuffered end dates. Identify resource bottlenecks and parallel work streams.

## Workflow
1. Determine context: new full timeline, adjustment to existing schedule, or delivery date estimation
2. Gather inputs: tasks/phases, effort estimates, team size, skill requirements, constraints
3. Identify dependencies between tasks (finish-to-start by default)
4. Note fixed dates: hard deadlines, external milestones, blackout periods
5. Load existing project data and historical velocity if available
6. Calculate start/end dates respecting dependencies and resource availability
7. Add 20% buffer at each phase level
8. Calculate critical path (longest dependent chain = minimum project duration)
9. Set milestones at key checkpoints tied to measurable deliverables
10. Detect resource bottlenecks and flag single points of failure
11. Generate Gantt-style timeline with supporting detail tables

## Examples

**Example 1: New project timeline**
Input: "Create a timeline for our mobile app MVP. Phases: Design (5 days), Backend API (10 days), Frontend (8 days, needs design done), Testing (5 days, needs backend and frontend), Launch (2 days). Team: 2 devs, 1 designer. Start March 18."
Output:
```
Project Timeline - Mobile App MVP
Duration: 18/03/2026 -> 06/05/2026 (7 weeks including buffers)
Unbuffered Duration: 18/03/2026 -> 28/04/2026 (6 weeks)
Team Size: 3 people

Milestones:
| # | Milestone | Deliverable | Target Date | Dependencies |
|---|-----------|------------|-------------|-------------|
| M1 | Design Complete | Approved mockups & specs | 25/03/2026 | - |
| M2 | API Ready | All endpoints deployed to staging | 11/04/2026 | - |
| M3 | Feature Complete | Frontend integrated with API | 22/04/2026 | M1, M2 |
| M4 | QA Passed | All test cases passing | 30/04/2026 | M3 |
| M5 | Launch | App live in store | 06/05/2026 | M4 |

Timeline (Gantt View):
Week 1      |======          | Design (5d + 1d buffer)
Week 1-3    |  ============  | Backend API (10d + 2d buffer) [parallel]
Week 2-4    |    ==========  | Frontend (8d + 2d buffer) <- Design
Week 4-5    |          ======| Testing (5d + 1d buffer) <- Backend + Frontend
Week 6      |            ====| Launch (2d + 1d buffer) <- Testing
             M1    M2   M3  M4  M5

Critical Path:
Design -> Frontend -> Testing -> Launch
Critical Path Duration: 20 days unbuffered (4 weeks)

Phase Details:
| Phase | Effort | Buffer | Total | Start | End | Resources | Dependencies |
|-------|--------|--------|-------|-------|-----|-----------|-------------|
| Design | 5d | 1d | 6d | 18/03 | 25/03 | Designer | - |
| Backend API | 10d | 2d | 12d | 18/03 | 03/04 | Dev 1 | - |
| Frontend | 8d | 2d | 10d | 26/03 | 08/04 | Dev 2 | Design |
| Testing | 5d | 1d | 6d | 09/04 | 16/04 | Dev 1 + Dev 2 | Backend, Frontend |
| Launch | 2d | 1d | 3d | 17/04 | 21/04 | All | Testing |

Resource Allocation:
| Resource | Design | Backend | Frontend | Testing | Launch | Utilization |
|----------|--------|---------|----------|---------|--------|-------------|
| Designer | Lead | - | Support | - | - | 40% |
| Dev 1 | - | Lead | - | Lead | Support | 85% |
| Dev 2 | - | - | Lead | Support | Support | 70% |

Risks to Timeline:
- Designer is single point of failure for Design phase; any absence delays Frontend and critical path
- Backend and Frontend converge at Testing; delay in either pushes launch date
```

**Example 2: Deadline feasibility check**
Input: "Can we deliver the payment feature by April 1? Tasks: API design (3d), implementation (8d), testing (4d), all sequential. One developer."
Output:
```
Project Timeline - Payment Feature
Requested Deadline: 01/04/2026
Start Date: 18/03/2026

Phase Details:
| Phase | Effort | Buffer | Total | Start | End |
|-------|--------|--------|-------|-------|-----|
| API Design | 3d | 1d | 4d | 18/03 | 23/03 |
| Implementation | 8d | 2d | 10d | 24/03 | 04/04 |
| Testing | 4d | 1d | 5d | 07/04 | 11/04 |

Unbuffered End Date: 04/04/2026 (3 days late)
Buffered End Date: 11/04/2026 (10 days late)

DEADLINE NOT FEASIBLE

Critical Path: API Design -> Implementation -> Testing (all sequential, 15 days unbuffered)

Options to meet April 1 deadline:
1. Add a second developer: parallelize implementation to save ~4 days
2. Reduce scope: cut testing to 2 days (higher risk)
3. Start earlier: begin API design by March 13 to fit buffered schedule
4. Extend deadline: request April 11 to include full buffers
```

## Tools
- Use `Read` to load existing project plans, task lists, resource calendars, and prior timelines
- Use `Grep` to search for task dependencies, milestone references, or deadline mentions
- Use `Write` to persist the generated timeline, milestone schedule, and critical path analysis
- Use `Bash` to run scheduling calculations or generate visual representations

## Error Handling
- If effort estimates are missing -> ask the user or use T-shirt sizing defaults (S=2d, M=5d, L=10d, XL=20d) with a warning
- If dependencies are unclear or circular -> flag the conflict and ask for clarification
- If team size or resource data is not provided -> ask or assume single-person team with accuracy warning
- If calculated end date exceeds deadline -> highlight the gap, show critical path, suggest scope/resource/deadline adjustments
- If no milestones are defined -> auto-generate at phase boundaries and ask for confirmation

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~project tracker | Pull task data, dependencies, and completion status for timeline accuracy |
| ~~calendar | Check team availability and block milestone dates |
| ~~CI/CD | Link release milestones to deployment schedules |
| ~~docs | Access project plans, requirements, and scope documents |

## Rules
- Every phase must include a 20% buffer on its estimated duration
- Milestones must be tied to specific, measurable deliverables
- All dependencies must be explicitly stated (finish-to-start by default)
- Critical path tasks must be clearly highlighted
- Resource bottlenecks (single points of failure) must be flagged
- Parallel work streams must be identified wherever dependencies allow
- Show both buffered and unbuffered end dates for transparency

## Output Template
```
Project Timeline - [Project Name]
Duration: [Start Date] -> [End Date (buffered)] ([N weeks] including buffers)
Unbuffered Duration: [Start Date] -> [End Date (unbuffered)] ([N weeks])
Team Size: [N people]

Milestones:
| # | Milestone | Deliverable | Target Date | Dependencies |
|---|-----------|------------|-------------|-------------|
| M1 | [Milestone name] | [Specific deliverable] | [Date] | [Prerequisites] |

Timeline (Gantt View):
Week 1-2   |========        | Phase 1: [Name] (Est: [N]d + Buffer: [N]d)
Week 3     |    ====        | Phase 2: [Name] <- depends on Phase 1
Week 3-4   |      ========  | Phase 3: [Name] (parallel with Phase 2)
Week 5     |        ========| Phase 4: [Name] <- depends on Phase 2 & 3
            M1         M2   M3

Critical Path:
[Phase X] -> [Phase Y] -> [Phase Z]
Critical Path Duration: [N weeks] (unbuffered)

Phase Details:
| Phase | Effort | Buffer | Total | Start | End | Resources | Dependencies |
|-------|--------|--------|-------|-------|-----|-----------|-------------|
| [Name] | [N days] | [N days] | [N days] | [Date] | [Date] | [Names] | [Phase #] |

Resource Allocation:
| Resource | Phase 1 | Phase 2 | Phase 3 | Phase 4 | Utilization |
|----------|---------|---------|---------|---------|-------------|
| [Name] | [Role] | - | [Role] | [Role] | [%] |

Risks to Timeline:
- [Risk description and potential impact on delivery date]
```

## Related Skills
- `sprint-planner` -- For planning individual sprints within the project timeline
- `task-tracker` -- For tracking task-level progress against the timeline
- `risk-assessor` -- For assessing risks that could delay the timeline
- `standup-helper` -- For daily progress updates that feed timeline tracking
