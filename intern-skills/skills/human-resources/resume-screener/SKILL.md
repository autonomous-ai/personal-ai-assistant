---
name: resume-screener
description: >
  Screens and evaluates candidate resumes against job descriptions, providing scored assessments with strengths, concerns, and recommendations.
  Use when the user says "review this CV", "screen this resume", "is this candidate a good fit",
  "shortlist these applicants", "compare these candidates", "evaluate this resume",
  "check resume fit for a role", or "rank these applicants".
---

# Resume Screener

## Quick Start
Evaluate candidate resumes against a job description using a weighted scoring model. Always require a JD before screening. Assessments must be evidence-based and bias-free.

## Workflow
1. Determine request type: single evaluation, batch screening, or candidate comparison
2. Collect the job description and identify must-have skills, nice-to-have skills, and experience requirements
3. Parse the resume for work history, skills, education, certifications, and projects
4. Score each criterion using the weighted model (Must-haves 40%, Experience 25%, Education 15%, Nice-to-haves 10%, Presentation 10%)
5. Identify green flags (career progression, measurable outcomes, direct skill matches) and red flags (unexplained gaps > 6 months, very short tenures, inflated claims)
6. Generate 3-5 targeted interview questions based on gaps or claims worth exploring
7. Deliver a Pass / Consider / Reject recommendation with rationale

## Examples

**Example 1: Single resume screen**
Input: "Screen this resume for our Senior Backend Engineer role. JD attached."
Output:
```
CV Evaluation: Jane Smith
Position: Senior Backend Engineer
Overall Score: 7.4/10 (weighted)

| Criteria         | Weight | Score | Comments                                    |
|------------------|--------|-------|---------------------------------------------|
| Must-have Skills | 40%    | 8/10  | Strong Go and PostgreSQL; lacks Kubernetes   |
| Experience       | 25%    | 7/10  | 5 years backend, but no distributed systems  |
| Education        | 15%    | 8/10  | CS degree from accredited university         |
| Nice-to-have     | 10%    | 6/10  | Has Redis experience; no GraphQL             |
| Presentation     | 10%    | 7/10  | Clean layout, some bullet points lack metrics|

Strengths:
- 5 years of Go experience with measurable throughput improvements (40% latency reduction)

Points of Concern:
- No Kubernetes experience listed despite it being a must-have

Suggested Interview Questions:
1. Can you describe your experience with container orchestration or deployment pipelines?
2. Tell me about the latency reduction project -- what was your specific contribution?
3. How have you handled distributed system failures in production?

Recommendation: Consider -- Strong backend fundamentals but missing Kubernetes experience; worth exploring in interview.
```

**Example 2: Batch comparison**
Input: "Compare these 3 resumes for the Product Manager role and rank them."
Output: A unified ranking table followed by individual breakdowns for each candidate.

## Tools
- Use `Read` to ingest CV/resume files provided by the user
- Use `Grep` to search for specific skills or keywords within large resume documents
- Use `WebSearch` to verify certifications or company backgrounds when credibility is in question

## Error Handling
- If no JD or hiring criteria provided → ask the user to supply the job description before proceeding
- If the CV is unreadable or empty → inform the user and request a different format
- If asked to evaluate based on protected characteristics (age, gender, ethnicity) → decline and explain assessments are skills-based only

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~ATS | Pull candidate profiles and application status directly |
| ~~HRIS | Cross-reference employee records for internal candidates |
| ~~document management | Access stored resumes and job descriptions from the document repository |

## Rules
- Zero tolerance for bias based on gender, age, ethnicity, disability, or institution prestige
- All scores must cite specific evidence from the CV
- Red flags must be noted but never used as automatic disqualifiers
- Always suggest tailored interview questions tied to CV content
- For batch comparisons, present a unified ranking table before individual breakdowns
- Maintain confidentiality of all candidate information

## Output Template
```
CV Evaluation: [Candidate Name]
Position: [Position Title]
Overall Score: [X/10] (weighted)

| Criteria         | Weight | Score | Comments                 |
|------------------|--------|-------|--------------------------|
| Must-have Skills | 40%    | X/10  | [Evidence-based comment]  |
| Experience       | 25%    | X/10  | [Evidence-based comment]  |
| Education        | 15%    | X/10  | [Evidence-based comment]  |
| Nice-to-have     | 10%    | X/10  | [Evidence-based comment]  |
| Presentation     | 10%    | X/10  | [Evidence-based comment]  |

Strengths:
- [Strength with specific evidence from CV]

Points of Concern:
- [Concern with specific evidence from CV]

Suggested Interview Questions:
1. [Question targeting a specific CV claim or gap]
2. [Question targeting a specific CV claim or gap]
3. [Question targeting a specific CV claim or gap]

Recommendation: [Pass / Consider / Reject] -- [One-sentence rationale]
```

## Related Skills
- `interview-scheduler` -- For scheduling interviews with shortlisted candidates
- `onboarding-checklist` -- For onboarding after a hire decision is made
- `performance-review` -- For evaluating the employee after they are hired
