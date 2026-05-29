---
name: onboarding-checklist
description: >
  Creates, customizes, and tracks onboarding checklists for new employees covering pre-arrival through the first month.
  Use when the user says "prepare for a new hire", "set up onboarding", "create a first-day plan",
  "track onboarding progress", "what do we need before the new employee starts",
  "new joiner checklist", or "onboard this person".
---

# Onboarding Checklist

## Quick Start
Generate a phased onboarding checklist (Pre-arrival, Day 1, Week 1, Month 1) with clear ownership and deadlines derived from the start date. Customize items by department and ensure every new hire has an assigned buddy.

## Workflow
1. Determine if this is a new checklist, an update to an existing one, or a progress check
2. Collect new hire name, position, department, start date, manager name, and any special requirements (remote setup, visa docs, specific tool access)
3. Add department-specific items (e.g., Engineering: repo access, dev environment; Marketing: CMS, brand guidelines; Sales: CRM, territory assignment)
4. Generate the four-phase checklist with ownership (HR, IT, Manager, Buddy) and deadlines (T-7, T-5, T-3, T-1, Day 1, Week 1, Month 1)
5. Confirm buddy assignment; if not specified, flag it as a required action for the manager
6. Draft a welcome email for the new hire and a team notification
7. Set follow-up check-ins at end of Week 1 and end of Month 1

## Examples

**Example 1: Engineering new hire**
Input: "Create an onboarding checklist for Alex Park, joining as a Backend Engineer on April 1st. Manager is Lisa Wong."
Output:
```
Onboarding Checklist: Alex Park
Position: Backend Engineer - Engineering
Start Date: 2026-04-01
Manager: Lisa Wong
Buddy: [TBD -- Manager to assign by 2026-03-28]

Progress: 0/18 items completed (0%)

--- Pre-arrival (T-7 to T-1) ---
Owner    | Item                                    | Deadline    | Status
HR       | Prepare employment contract              | 2026-03-25  | [ ]
IT       | Set up laptop and dev environment        | 2026-03-27  | [ ]
IT       | Create email, Slack, Jira, GitHub access | 2026-03-27  | [ ]
HR       | Prepare desk/access card                 | 2026-03-28  | [ ]
Manager  | Notify team about new joiner             | 2026-03-28  | [ ]
HR       | Send welcome email to Alex               | 2026-03-31  | [ ]

--- Day 1 ---
Owner    | Item                                    | Status
HR       | Welcome and office tour                  | [ ]
IT       | Hand over equipment and verify accounts  | [ ]
Manager  | Introduce team and buddy                 | [ ]
Buddy    | Walk through internal processes and repos | [ ]
Team     | Welcome lunch                            | [ ]

--- Week 1 (Days 2-5) ---
Owner    | Item                                    | Status
Manager  | Product/service and codebase walkthrough | [ ]
IT       | Verify all tools and access are working  | [ ]
Manager  | 1:1 meeting to align on goals            | [ ]
Employee | Read internal handbook and policies       | [ ]

--- Month 1 (Weeks 2-4) ---
Owner    | Item                                    | Status
Manager  | Set probation goals                      | [ ]
Manager  | Weekly 1:1 check-ins                     | [ ]
HR       | Two-way feedback session at end of month | [ ]
```

**Example 2: Track progress**
Input: "Update Alex Park's onboarding -- IT setup and contract are done."
Output: Updated checklist with those items marked complete and revised progress count.

## Tools
- Use `Read` to review department-specific onboarding documents or policy files
- Use `Grep` to search for existing onboarding templates or past onboarding records

## Error Handling
- If start date not provided → ask for it, as all deadlines depend on this date
- If department unknown → generate the standard checklist and flag department-specific items as "TBD -- confirm department"
- If buddy not assigned → add a highlighted action item for the manager to assign one at least 3 days before the start date
- If start date is less than 7 days away → flag urgent items and prioritize the critical path (IT setup, accounts, contract)

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~HRIS | Pull new hire details, department info, and manager assignments |
| ~~calendar | Schedule orientation meetings and check-in reminders |
| ~~document management | Access onboarding templates, policy documents, and handbooks |

## Rules
- The checklist must be sent to both the manager and HR at least 7 days before the start date
- Every new hire must have an assigned buddy from the same team
- Department-specific tool access must be included
- Follow-up reminders must be set for items not completed by their deadline
- The checklist must cover all four phases: Pre-arrival, Day 1, Week 1, Month 1

## Output Template
```
Onboarding Checklist: [New Employee Name]
Position: [Position Title] - [Department]
Start Date: [YYYY-MM-DD]
Manager: [Manager Name]
Buddy: [Buddy Name]

Progress: [X/Y] items completed ([Z%])

--- Pre-arrival (T-7 to T-1) ---
Owner    | Item                                    | Deadline   | Status
HR       | Prepare employment contract              | [T-7]      | [ ]
IT       | Set up laptop and equipment              | [T-5]      | [ ]
IT       | Create email and accounts                | [T-5]      | [ ]
HR       | Prepare desk and access card             | [T-3]      | [ ]
Manager  | Notify team about new joiner             | [T-3]      | [ ]
HR       | Send welcome email to new hire           | [T-1]      | [ ]
[Department-specific items]

--- Day 1 ---
Owner    | Item                                    | Status
HR       | Welcome and office tour                  | [ ]
IT       | Hand over equipment and accounts         | [ ]
Manager  | Introduce team and buddy                 | [ ]
Buddy    | Walk through internal processes           | [ ]
Team     | Welcome lunch                            | [ ]

--- Week 1 (Days 2-5) ---
Owner    | Item                                    | Status
Manager  | Product/service training                 | [ ]
IT       | Verify all tools and access are working  | [ ]
Manager  | 1:1 meeting to align on goals            | [ ]
Employee | Read internal handbook and policies       | [ ]
[Department-specific items]

--- Month 1 (Weeks 2-4) ---
Owner    | Item                                    | Status
Manager  | Set probation goals                      | [ ]
Manager  | Weekly 1:1 check-ins                     | [ ]
HR       | Two-way feedback session at end of month | [ ]
```

## Related Skills
- `interview-scheduler` -- For scheduling interviews before the hire decision
- `training-planner` -- For planning training programs during onboarding
- `policy-lookup` -- For looking up policies relevant to the new hire
- `leave-manager` -- For setting up leave entitlements for the new employee
