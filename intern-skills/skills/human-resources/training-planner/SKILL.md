---
name: training-planner
description: >
  Plans and organizes employee training programs, tracks learning progress, and manages training schedules.
  Use when the user says "create a training plan", "schedule a workshop", "track employee development",
  "design an onboarding curriculum", "plan a learning program", "upskill the team",
  "what training does this employee need", or "build a development roadmap".
---

# Training Planner

## Quick Start
Design structured training programs with clear learning objectives, schedules, resource requirements, and progress tracking. Support individual development plans and team-wide training initiatives.

## Workflow
1. Identify training need: skills gap, new hire onboarding, compliance, career development, team upskilling
2. Define learning objectives and success criteria
3. Design the training structure: modules, duration, format (online/offline/blended)
4. Create a schedule with resources and facilitators
5. Set up progress tracking and assessment methods
6. Estimate budget and logistics requirements

## Examples

**Example 1: Team Training Plan**
Input: "Create an advanced Excel training plan for the accounting department, 10 people"
Output:
```
TRAINING PLAN
=============
Program: Advanced Excel for Accounting
Department: Accounting
Participants: 10
Duration: 4 weeks (8 sessions)
Format: Blended (4 offline + 4 online practice)

LEARNING OBJECTIVES
-------------------
By completion, participants will be able to:
1. Build complex financial models with nested formulas
2. Create dynamic dashboards with pivot tables and charts
3. Automate repetitive tasks with basic VBA macros
4. Use advanced functions: INDEX-MATCH, SUMIFS, array formulas

SCHEDULE
--------
| Week | Session | Topic                          | Format  | Duration |
|------|---------|--------------------------------|---------|----------|
| 1    | 1       | Advanced Formulas & Functions  | Offline | 2 hrs    |
| 1    | 2       | Practice: Financial Calculations| Online  | 1.5 hrs  |
| 2    | 3       | Pivot Tables & Data Analysis   | Offline | 2 hrs    |
| 2    | 4       | Practice: Building Dashboards  | Online  | 1.5 hrs  |
| 3    | 5       | VBA Macros Introduction        | Offline | 2 hrs    |
| 3    | 6       | Practice: Automating Reports   | Online  | 1.5 hrs  |
| 4    | 7       | Power Query & Data Integration | Offline | 2 hrs    |
| 4    | 8       | Final Project & Assessment     | Online  | 2 hrs    |

RESOURCES NEEDED
----------------
- Trainer: Excel specialist (internal/external)
- Room: Training room with 10 PCs (offline sessions)
- Software: Microsoft 365 licenses
- Materials: Practice datasets, exercise workbooks

ASSESSMENT
----------
- Weekly quizzes (20%)
- Practice exercises (30%)
- Final project: Build a departmental dashboard (50%)
- Pass threshold: 70%

BUDGET ESTIMATE
---------------
| Item              | Cost            |
|-------------------|-----------------|
| External Trainer  | $3,000          |
| Materials         | $500            |
| Room & Equipment  | Internal        |
| Certificates      | $100            |
| TOTAL             | $3,600          |
```

**Example 2: Individual Development Plan**
Input: "Create a 6-month development plan for a junior developer transitioning to team lead"
Output: A phased plan with skill-building modules, mentoring schedule, and milestone checkpoints.

## Tools
- Use `Read` to load training materials, competency frameworks, or employee records
- Use `Write` to save training plans and schedules
- Use `WebSearch` to find training resources, courses, or certification programs
- Use `Bash` to calculate schedules and durations

## Error Handling
- If skill gaps not specified → suggest a skills assessment first
- If budget not provided → estimate and flag for approval
- If trainer availability unknown → create schedule with placeholder and note dependency
- If timeline is too aggressive → suggest phased approach with priorities

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~HRIS | Pull employee skills profiles, competency gaps, and training history |
| ~~calendar | Schedule training sessions and check participant availability |
| ~~document management | Access training materials, curricula, and certification records |
| ~~ATS | Identify skill gaps from hiring trends to inform training priorities |

## Rules
- Every training plan must include: objectives, schedule, resources, assessment, and budget
- Learning objectives should be measurable and specific (use action verbs: build, create, analyze)
- Maximum 2 hours per session for optimal attention and retention
- Include practice time — minimum 40% hands-on vs theory
- Track attendance and completion rates
- Assessment must have a clear pass/fail threshold
- Budget estimates should include all costs: trainer, materials, venue, certificates
- Suggest follow-up or refresher sessions for complex topics

## Output Template
```
TRAINING PLAN
=============
Program: [Program Name]
Department: [Department]
Participants: [Number]
Duration: [Total Duration]
Format: [Online / Offline / Blended]

LEARNING OBJECTIVES
-------------------
1. [Measurable objective with action verb]

SCHEDULE
--------
| Week | Session | Topic | Format | Duration |
|------|---------|-------|--------|----------|

RESOURCES NEEDED
----------------
- [Resource type and details]

ASSESSMENT
----------
- [Assessment method and weighting]

BUDGET ESTIMATE
---------------
| Item | Cost |
|------|------|
| TOTAL | [Amount] |
```

## Related Skills
- `onboarding-checklist` -- For incorporating training into new hire onboarding
- `performance-review` -- For identifying training needs from performance reviews
- `policy-lookup` -- For referencing mandatory compliance training requirements
