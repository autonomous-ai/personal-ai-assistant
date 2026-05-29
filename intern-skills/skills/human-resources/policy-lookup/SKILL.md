---
name: policy-lookup
description: >
  Looks up and explains company HR policies, benefits, leave entitlements, and internal processes with cited sources.
  Use when the user says "what is the policy on", "how many leave days do I get", "what are the benefits",
  "work-from-home rules", "dress code policy", "disciplinary procedure",
  "explain the company policy", or "where can I find the handbook".
---

# Policy Lookup

## Quick Start
Answer policy questions by retrieving the relevant provision from official documents, providing a plain-language summary, and citing the exact source. Distinguish mandatory rules from recommendations. Never infer or improvise policy content.

## Workflow
1. Identify the policy area: leave, benefits, work arrangements, evaluations, discipline, or other
2. Determine the user's context (role, employment type, tenure, location) if relevant to applicability
3. Classify query type: factual lookup, process guidance, eligibility check, or clarification
4. Retrieve the exact provisions from official policy sources
5. Provide a concise summary followed by detailed provisions, marking each as MANDATORY or RECOMMENDED
6. Include step-by-step process instructions if the query involves a procedure
7. Cite the policy name, version, and last-updated date

## Examples

**Example 1: Leave entitlement**
Input: "How many annual leave days do I get? I'm a full-time employee with 3 years of tenure."
Output:
```
Policy: Annual Leave Entitlement
Source: Employee Handbook, Version 3.2, Last Updated 2025-11-01
Applies to: All full-time employees

Summary:
Full-time employees with 1-5 years of tenure receive 15 days of annual leave per calendar year. Unused days may be carried over up to a maximum of 5 days into the next year.

Details:
- Base entitlement: 15 days/year for 1-5 years tenure [MANDATORY]
- Carry-over: Maximum 5 unused days to next year, must be used by March 31 [MANDATORY]
- Advance booking: Leave requests of 3+ consecutive days require 2 weeks notice [RECOMMENDED]

Process:
1. Submit leave request via HR Portal > Time Off > Annual Leave
2. Manager approves within 3 business days
3. HR confirms and updates leave balance

Related Policies:
- Sick Leave Policy -- for medical absences
- Work From Home Policy -- for remote work arrangements

Contact: hr-support@company.com
```

**Example 2: Process guidance**
Input: "How do I request to work from home?"
Output: Step-by-step process with form references, approval chain, and policy constraints.

## Tools
- Use `Read` to access internal policy documents and employee handbooks
- Use `Grep` to search across policy files for specific terms or provisions

## Error Handling
- If policy not found in available documents → inform the user and recommend contacting HR directly
- If policy is ambiguous or has conflicting provisions → present both interpretations and advise seeking HR clarification
- If query involves legal advice (wrongful termination, discrimination claims) → clarify this is policy guidance only and recommend consulting the legal team
- If user's employment type or location makes a policy inapplicable → explain why and point to the correct policy

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~document management | Access policy documents, employee handbooks, and benefit guides directly |
| ~~HRIS | Pull employee-specific data to determine policy applicability |
| ~~ATS | Reference hiring policies and offer letter terms |

## Rules
- Only answer based on official, documented policies -- never infer or improvise
- Always cite the source: policy name, version, and last-updated date
- Clearly distinguish mandatory rules from recommendations in every response
- Flag recent policy changes and note effective dates
- Keep answers layered: summary first, then full provisions
- Maintain strict confidentiality
- When in doubt, direct the user to the appropriate HR representative

## Output Template
```
Policy: [Policy Name]
Source: [Document Name], Version [X.X], Last Updated [YYYY-MM-DD]
Applies to: [All employees / Specific group]

Summary:
[2-3 sentence plain-language summary]

Details:
- [Provision 1]: [Explanation] [MANDATORY / RECOMMENDED]
- [Provision 2]: [Explanation] [MANDATORY / RECOMMENDED]

Process (if applicable):
1. [Step 1 with system/form reference]
2. [Step 2]
3. [Step 3]

Related Policies:
- [Related Policy 1] -- [Brief relevance note]

Contact: [HR representative name/email for further questions]
```

## Related Skills
- `leave-manager` -- For processing leave requests after looking up entitlements
- `onboarding-checklist` -- For referencing onboarding-related policies
- `performance-review` -- For referencing evaluation criteria and review policies
- `training-planner` -- For mandatory compliance training requirements
