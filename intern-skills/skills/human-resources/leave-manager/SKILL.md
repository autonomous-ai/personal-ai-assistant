---
name: leave-manager
description: >
  Manages employee leave requests, tracks balances, calculates entitlements, and maintains leave calendars.
  Use when the user says "process a leave request", "check leave balance", "how many PTO days do I have",
  "plan team coverage", "calculate leave entitlements", "submit time off",
  "who is out next week", or "approve this leave request".
---

# Leave Manager

## Quick Start
Process leave requests, track balances, and ensure compliance with FMLA, applicable state laws, and company policy leave entitlements. Maintain team coverage visibility and flag potential conflicts.

## Workflow
1. Identify action: submit request, check balance, approve/reject, plan coverage, calculate entitlements
2. Verify leave type: annual, sick, maternity/paternity, personal, unpaid, public holiday
3. Check employee's remaining balance for the leave type
4. Validate against team calendar for coverage conflicts
5. Process the request with proper documentation
6. Update balance and notify relevant parties

## Examples

**Example 1: Leave Request Processing**
Input: "Employee John Smith requests 3 days of PTO from 03/25-03/27/2026"
Output:
```
LEAVE REQUEST
=============
Employee:    John Smith
Employee ID: [ID]
Department:  [Department]
Request Date: 03/23/2026

REQUEST DETAILS
---------------
Leave Type:   PTO (Paid Time Off)
Period:       03/25/2026 — 03/27/2026 (3 working days)
Days Requested: 3

BALANCE CHECK
-------------
| Leave Type    | Entitlement | Used | Pending | Remaining |
|---------------|-------------|------|---------|-----------|
| PTO           | 15 days     | 4    | 3       | 8         |
| Sick Leave    | Per policy  | 1    | 0       | Per policy|
| Personal Leave| 3 days      | 0    | 0       | 3         |

Status: ✅ Sufficient balance (8 days remaining after this request)

COVERAGE CHECK
--------------
Team members on leave 03/25-03/27:
- Jane Doe: 03/25 (1 day)
- No other conflicts

Coverage: ✅ Adequate — 80% team available

APPROVAL WORKFLOW
-----------------
1. [ ] Direct Manager approval
2. [ ] HR confirmation
3. [ ] Calendar updated

RECOMMENDATION: Approve — sufficient balance and no coverage issues.
```

**Example 2: Entitlement Calculation**
Input: "Calculate leave entitlements for an employee with 8 years of tenure"
Output:
```
LEAVE ENTITLEMENT
=================
Per company policy and applicable federal/state law:

PTO: per company policy (typical 10-15 days/year; no federal mandate)
Tenure adjustments: varies by company policy
Employee tenure: 8 years → check company handbook for additional PTO accrual

Total PTO: per company policy
Federal holidays: 11 days/year (per 5 USC 6103)
FMLA: 12 weeks unpaid, job-protected leave (if eligible — 12+ months employed, 1,250+ hours worked, 50+ employees within 75 miles)
State paid family leave: check applicable state law (CA, NY, NJ, WA, and others offer paid programs)
```

## Tools
- Use `Read` to load leave records, team calendars, and policy files
- Use `Write` to save leave requests and updated balances
- Use `Grep` to search for employee records or overlapping leave dates
- Use `Bash` to calculate business days and entitlements

## Error Handling
- If leave balance is insufficient → reject with balance details and suggest alternatives
- If team coverage drops below 50% → flag as risk and suggest alternative dates
- If leave type not specified → ask employee to classify the leave type
- If dates include public holidays → exclude them from the working day count

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~HRIS | Pull employee records, tenure data, and leave balances automatically |
| ~~calendar | Check team availability and block leave dates on shared calendars |
| ~~document management | Access leave policy documents and approval forms |

## Rules
- PTO: per company policy (typical 10-15 days/year; no federal mandate); tenure-based accrual varies by company
- Federal holidays: 11 days/year (per 5 USC 6103)
- Sick leave per company policy and applicable state/local sick leave laws
- FMLA: 12 weeks unpaid, job-protected leave for qualifying events (birth/adoption, serious health condition, family member care); some states (CA, NY, NJ, WA) offer paid family leave
- Parental leave: FMLA 12 weeks unpaid (same entitlement for both parents); some companies offer separate paid parental leave
- Leave requests must be submitted at least 3 working days in advance (except emergencies)
- Always check team coverage before recommending approval
- Weekend days (Sat/Sun) are excluded from working day calculations
- Carry-over policy: per company rules (note if not specified)

## Output Template
```
LEAVE REQUEST
=============
Employee: [Name]
Department: [Department]

REQUEST DETAILS
---------------
Leave Type: [Type]
Period: [Start] — [End] ([N] working days)

BALANCE CHECK
-------------
| Leave Type | Entitlement | Used | Pending | Remaining |
|------------|-------------|------|---------|-----------|

COVERAGE CHECK
--------------
[Team availability during requested period]

RECOMMENDATION: [Approve / Reject / Pending — with rationale]
```

## Related Skills
- `policy-lookup` -- For referencing leave policies and entitlement rules
- `interview-scheduler` -- For checking interviewer availability against leave calendars
- `onboarding-checklist` -- For setting up leave entitlements during onboarding
- `performance-review` -- For factoring attendance into performance evaluations
