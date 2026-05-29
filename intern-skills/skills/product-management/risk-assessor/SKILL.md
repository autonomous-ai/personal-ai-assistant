---
name: risk-assessor
description: >
  Identifies, scores, and creates mitigation plans for project risks using a Likelihood x Impact matrix.
  Use when the user says "assess project risks", "build a risk register", "evaluate this threat",
  "review existing risks", "create a risk report", "what could go wrong",
  "score this risk", or "we have a new risk to track".
---

# Risk Assessor

## Quick Start
Identify and score project risks using a Likelihood (1-4) x Impact (1-4) matrix producing scores from 1 to 16. Classify severity as Critical (12-16), High (8-11), Medium (4-7), or Low (1-3). Top 5 risks always get both a mitigation plan and a contingency plan. Risks scoring 9+ require immediate stakeholder escalation.

## Workflow
1. Determine assessment context: initial identification, new issue analysis, periodic review, or stakeholder report
2. Gather project scope, timeline, team, and technology stack
3. Load existing risk register if available
4. Identify risks and classify into categories: Technical, Resource, Schedule, Scope, External
5. Score each risk: Likelihood (1-4) x Impact (1-4)
6. Rank by score descending
7. For top 5 risks, develop mitigation plans, contingency plans, and early warning triggers
8. Assign an owner to each risk
9. Flag any risk scoring 9+ for stakeholder escalation

## Examples

**Example 1: Initial project risk assessment**
Input: "Assess risks for our new payment integration project. 3-person team, 6-week timeline, using a third-party payment SDK we haven't used before."
Output:
```
Risk Register - Payment Integration
Last Updated: 03/18/2026
Assessment Type: Initial
Total Risks: 5 | Critical: 1 | High: 2 | Medium: 1 | Low: 1

Risk Register:
| # | Risk | Category | Likelihood | Impact | Score | Severity | Owner | Status |
|---|------|----------|-----------|--------|-------|----------|-------|--------|
| 1 | Third-party SDK has undocumented limitations | Technical | 3 | 4 | 12 | Critical | Alice | Open |
| 2 | Single developer knows payment domain | Resource | 3 | 3 | 9 | High | Bob | Open |
| 3 | 6-week timeline leaves no room for delays | Schedule | 3 | 3 | 9 | High | PM | Open |
| 4 | Payment compliance requirements unclear | Scope | 2 | 3 | 6 | Medium | Carol | Open |
| 5 | SDK vendor support response time | External | 2 | 2 | 4 | Low | Alice | Open |

Top Risk Detail Cards:

Risk #1: Third-party SDK limitations - Score: 12 Critical
- Category: Technical
- Description: The payment SDK is new to the team and may have undocumented constraints
- Root Cause: No prior experience with this SDK; limited community documentation
- Mitigation Plan: Allocate week 1 for SDK spike/proof-of-concept before committing to architecture
- Contingency Plan: Identify backup SDK; maintain abstraction layer to allow swap
- Early Warning Triggers: Spike reveals missing features or poor documentation quality
- Owner: Alice
- Review Date: 03/25/2026

Escalation Required:
- Risk #1 (Score 12): SDK limitations could derail architecture
- Risk #2 (Score 9): Single point of failure on payment domain knowledge
- Risk #3 (Score 9): Tight timeline with no slack

Next Review Date: 04/01/2026
```

**Example 2: Evaluate a single new risk**
Input: "Our lead developer just gave 2 weeks notice. Assess this risk for Project Atlas."
Output:
```
Risk Register - Project Atlas (Update)
Last Updated: 03/18/2026
Assessment Type: Incident-Triggered

New Risk Added:
| # | Risk | Category | Likelihood | Impact | Score | Severity | Owner | Status |
|---|------|----------|-----------|--------|-------|----------|-------|--------|
| 6 | Lead developer departing in 2 weeks | Resource | 4 | 4 | 16 | Critical | PM | Open |

Risk #6: Lead developer departure - Score: 16 Critical
- Category: Resource
- Description: Lead developer has given 2-week notice; holds critical project knowledge
- Root Cause: Employee resignation
- Mitigation Plan: Immediate knowledge transfer sessions; pair programming for remaining 2 weeks; document all undocumented architecture decisions
- Contingency Plan: Redistribute work among remaining team; consider contractor backfill; re-scope timeline if needed
- Early Warning Triggers: Knowledge transfer sessions not happening; documentation not being produced
- Owner: PM
- Review Date: 03/20/2026

Escalation Required:
- Risk #6 (Score 16): IMMEDIATE stakeholder attention required
```

## Tools
- Use `Read` to load existing risk registers, project plans, retrospective notes, and incident history
- Use `Grep` to search for risk indicators, blocker mentions, or dependency warnings across project files
- Use `Write` to persist the updated risk register and mitigation plans
- Use `Bash` to run analysis scripts or export risk reports

## Error Handling
- If no existing risk register is found -> create a new one from scratch
- If a risk lacks detail to score -> ask the user to clarify likelihood and impact
- If no risk owner is specified -> prompt the user to assign ownership
- If all risks score below 4 -> advise low risk profile but recommend periodic re-evaluation
- If any risk scores 12+ -> immediately flag for stakeholder escalation

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~project tracker | Pull project status, blockers, and dependency data for risk identification |
| ~~CI/CD | Monitor build failures and deployment issues as technical risk indicators |
| ~~docs | Access past risk registers, retrospective notes, and incident reports |
| ~~calendar | Schedule risk review meetings and set escalation reminders |

## Rules
- Every risk must be scored: Likelihood (1-4) x Impact (1-4)
- Top 5 risks must have both a mitigation plan and a contingency plan
- Risks scoring 9+ must be escalated to stakeholders immediately
- Every risk must have a designated owner
- Risk register must be reviewed at least once per sprint
- Materialized risks move to the issue tracker with full context
- Top risks must have defined early warning triggers
- Consistent categories: Technical, Resource, Schedule, Scope, External

## Output Template
```
Risk Register - [Project Name]
Last Updated: [MM/DD/YYYY]
Assessment Type: [Initial / Periodic Review / Incident-Triggered]
Total Risks: [N] | Critical: [N] | High: [N] | Medium: [N] | Low: [N]

Risk Assessment Matrix:
Impact ->        Low(1)     Medium(2)    High(3)     Critical(4)
Likelihood:
  High(4)        4           8           12           16
  Medium(3)      3           6            9           12
  Low(2)         2           4            6            8
  Very Low(1)    1           2            3            4

Risk Register:
| # | Risk | Category | Likelihood | Impact | Score | Severity | Owner | Status |
|---|------|----------|-----------|--------|-------|----------|-------|--------|
| 1 | [Risk description] | [Category] | [1-4] | [1-4] | [Score] | [Severity] | [Person] | [Open/Mitigating/Closed] |

Top Risk Detail Cards:

Risk #1: [Risk Title] - Score: [Score] [Severity]
- Category: [Technical/Resource/Schedule/Scope/External]
- Description: [Detailed risk description]
- Root Cause: [What causes this risk]
- Mitigation Plan: [Actions to reduce likelihood or impact]
- Contingency Plan: [Response if the risk materializes]
- Early Warning Triggers: [Signs that this risk is about to occur]
- Owner: [Person responsible]
- Review Date: [Next review date]

Escalation Required:
- [Risks with score >= 9 needing immediate stakeholder attention]

Next Review Date: [Date]
```

## Related Skills
- `task-tracker` -- For tracking tasks related to risk mitigation actions
- `sprint-planner` -- For factoring risks into sprint capacity planning
- `timeline-generator` -- For adjusting timelines when risks materialize
- `standup-helper` -- For surfacing active risks and blockers during daily standups
