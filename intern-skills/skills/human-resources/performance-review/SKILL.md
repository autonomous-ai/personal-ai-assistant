---
name: performance-review
description: >
  Helps write, structure, and consolidate performance reviews including self-assessments, manager evaluations, 360 feedback, goal setting, and development plans.
  Use when the user says "write a performance review", "set OKRs", "prepare for a review meeting",
  "consolidate feedback", "help with my self-assessment", "rate this employee",
  "create a development plan", or "draft a 360 review".
---

# Performance Review

## Quick Start
Create structured performance reviews using a weighted criteria model (Performance 60%, Competency 20%, Culture 20%) with a 5-point rating scale. All feedback must follow the SBI framework (Situation-Behavior-Impact) and be backed by specific evidence. Every review must include a development plan.

## Workflow
1. Determine the review stage: goal setting, mid-cycle check-in, self-review, manager review, 360 consolidation, or 1:1 preparation
2. Collect employee name, position, review period, goals/OKRs, and any existing feedback
3. Evaluate each criterion with evidence-based scoring:
   - Performance (60%): KPI/OKR completion, deliverable quality, measurable outcomes
   - Competency (20%): technical skills, problem-solving, communication
   - Culture (20%): teamwork, initiative, values alignment, leadership
4. Structure all feedback using SBI: Situation (when/where) → Behavior (what they did) → Impact (the result)
5. Assign overall rating: 5-Outstanding, 4-Exceeds, 3-Meets, 2-Below, 1-Needs Improvement
6. Build a development plan with 2-4 specific actions, owners, resources, and deadlines
7. If preparing for a 1:1, generate a structured discussion agenda

## Examples

**Example 1: Manager review**
Input: "Write a performance review for Tom Wilson, Software Engineer, for Q4 2025. He completed 4/5 OKRs, led the API migration project, but needs to improve documentation."
Output:
```
Performance Review: Tom Wilson
Review Period: Q4 2025
Position: Software Engineer - Engineering
Manager: [Manager Name]

Overall Rating: 4/5 - Exceeds Expectations

| Criteria    | Weight | Score | Feedback (SBI)                                              |
|-------------|--------|-------|-------------------------------------------------------------|
| Performance | 60%    | 4/5   | S: Q4 API migration B: Led design and delivery for 3 services I: Reduced response time by 35%, completed ahead of schedule |
| Competency  | 20%    | 4/5   | S: Sprint planning sessions B: Consistently proposed architecture improvements I: Team adopted 2 of 3 proposals |
| Culture     | 20%    | 3/5   | S: Cross-team collaboration B: Mentored 1 junior dev but limited documentation sharing I: Knowledge transfer gaps when he was on leave |

Key Strengths:
- API Migration Leadership: Delivered migration of 3 services 2 weeks early with 35% latency improvement
- Technical Initiative: Proposed and implemented caching strategy adopted by the platform team

Areas for Improvement:
- Documentation: S: During Q4 sprint reviews B: Submitted PRs with minimal documentation I: Onboarding new team members took 40% longer than expected

OKR/KPI Summary:
| Goal                          | Target       | Actual       | Status |
|-------------------------------|--------------|--------------|--------|
| Complete API migration        | 3 services   | 3 services   | Met    |
| Reduce response time          | 20%          | 35%          | Met    |
| Improve test coverage         | 80%          | 82%          | Met    |
| Document all new APIs         | 100%         | 60%          | Missed |
| Mentor junior engineers       | 2 mentees    | 1 mentee     | Missed |

Development Plan:
| Action                        | Owner | Resource              | Deadline   |
|-------------------------------|-------|-----------------------|------------|
| Complete API documentation backlog | Tom | Tech writing workshop | 2026-01-31 |
| Take on 2nd mentee           | Tom   | Engineering mentorship program | 2026-02-15 |
```

**Example 2: Self-assessment help**
Input: "Help me write my self-review for H2 2025. I'm a Product Manager."
Output: Guided self-review with SBI-structured achievements and honest improvement areas, pre-filled where the user provides data.

## Tools
- Use `Read` to access employee goal documents, prior review records, or OKR tracking files
- Use `Grep` to search for specific achievements or feedback across documents

## Error Handling
- If no goals or OKRs provided → ask the user to supply them, as scoring requires a baseline
- If feedback is vague (e.g., "did a good job") → prompt for specific examples following SBI format
- If asked to inflate or deflate a score without evidence → decline and explain ratings must be evidence-based
- If confidential information from other employees' reviews is requested → refuse and remind that review data is strictly confidential

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~HRIS | Pull employee records, job history, and prior review data |
| ~~document management | Access goal documents, OKR tracking sheets, and feedback forms |
| ~~calendar | Schedule review meetings and follow-up check-ins |

## Rules
- All feedback must be specific and evidence-based; no vague or generic statements
- Use the SBI framework (Situation → Behavior → Impact) for every feedback point
- Balance every review: include both strengths and improvement areas, even for top performers
- Development plans must include concrete actions, owners, and deadlines
- Ratings must be justified with evidence
- Keep all evaluation data strictly confidential
- Consider the entire review period to avoid recency bias

## Output Template
```
Performance Review: [Employee Name]
Review Period: [Q/H/Year]
Position: [Title] - [Department]
Manager: [Manager Name]

Overall Rating: [X/5] - [Rating Label]

| Criteria    | Weight | Score | Feedback (SBI)                           |
|-------------|--------|-------|------------------------------------------|
| Performance | 60%    | X/5   | S: [Situation] B: [Behavior] I: [Impact] |
| Competency  | 20%    | X/5   | S: [Situation] B: [Behavior] I: [Impact] |
| Culture     | 20%    | X/5   | S: [Situation] B: [Behavior] I: [Impact] |

Key Strengths:
- [Strength]: [Specific example with measurable outcome]

Areas for Improvement:
- [Area]: [Specific example with SBI feedback]

OKR/KPI Summary:
| Goal         | Target   | Actual   | Status       |
|--------------|----------|----------|--------------|
| [Goal 1]     | [Target] | [Actual] | [Met/Missed] |

Development Plan:
| Action              | Owner | Resource        | Deadline      |
|---------------------|-------|-----------------|---------------|
| [Development action] | [Who] | [Course/Mentor] | [YYYY-MM-DD]  |
```

## Related Skills
- `training-planner` -- For building training programs based on development plan outcomes
- `policy-lookup` -- For referencing review policies and evaluation criteria
- `leave-manager` -- For factoring leave periods into review assessments
