---
name: escalation-helper
description: >
  Guides the escalation of support tickets to higher authority or specialized teams with proper
  documentation, routing, and customer communication.
  Use when the user says "escalate this ticket", "the customer wants a manager",
  "this is beyond my authority", "we've breached SLA on this", "how do I escalate this",
  "route this to a supervisor", "this needs senior approval", or "this customer is threatening legal action".
---

# Escalation Helper

## Quick Start
Assess the situation, determine the correct escalation level, compile full context so the customer never repeats themselves, and draft both the internal escalation brief and the customer notification.

## Workflow
1. Review the ticket history, customer sentiment, and resolution attempts so far
2. Classify the escalation level:
   - **L1 to L2**: Agent to Senior Agent — complex technical issues
   - **L2 to L3**: Senior Agent to Team Lead — special approvals (large refunds, policy exceptions)
   - **L3 to L4**: Team Lead to Manager — serious complaints, PR risk
   - **Emergency**: Direct to C-level — data breach, legal action, media coverage
3. Identify the trigger: authority limit, customer request, systemic issue, SLA breach, or legal/security concern
4. Compile the escalation package: full ticket history, actions taken, outcomes, and relevant account data
5. Route to the correct team or individual based on issue type and severity
6. Draft the customer notification with realistic timeline expectations
7. Set the follow-up schedule: every 2 hours for urgent, every 24 hours for normal

## Examples

**Example 1: Refund beyond agent authority**
Input: "Customer is requesting a $500 refund for a defective product. My limit is $100. They've already contacted us 3 times about this."
Output:
```
Escalation Request

Ticket: #[Ticket ID]
Customer: [Customer Name]
Severity: L2-L3
Category: Billing / Refund
SLA Status: Within SLA

Context:
Customer received a defective product and is requesting a $500 refund. They have contacted support 3 times without resolution. Sentiment is negative and frustration is escalating due to repeated contacts.

Actions Already Taken:
- Contact 1 — Troubleshooting attempted, issue confirmed as hardware defect
- Contact 2 — Offered replacement, customer insisted on refund
- Contact 3 — Agent unable to process refund above $100 limit

Escalation Reason:
Refund amount ($500) exceeds L2 agent authority limit ($100). Repeated contacts increase churn risk.

What Is Needed:
- Approval for $500 refund or alternative resolution with Team Lead authority

Route To:
- Team/Person: CS Team Lead — Refunds & Exceptions
- Expected Response: Within 4 hours

Follow-Up Schedule:
- Next check-in: [Today + 4 hours]
- Interval: Every 4h until resolved

Customer Communication Draft:
"Dear [Customer Name], thank you for your patience. I've escalated your refund request to our senior team for expedited review. You can expect an update within 4 hours. We're committed to resolving this for you."
```

**Example 2: Legal threat**
Input: "Customer is threatening legal action over a data privacy issue. They say their personal info was exposed."
Output:
```
Escalation Request

Ticket: #[Ticket ID]
Customer: [Customer Name]
Severity: Emergency
Category: Security / Data Privacy
SLA Status: Immediate action required

Context:
Customer reports that their personal information was exposed and is threatening legal action. This is a potential data breach requiring emergency protocol.

Actions Already Taken:
- Initial report received, no investigation yet

Escalation Reason:
Potential data breach with legal implications. Customer has explicitly threatened legal action.

What Is Needed:
- Immediate security team investigation
- Legal team notification
- Customer data exposure assessment

Route To:
- Team/Person: Security Team + Legal Department + VP of Customer Operations
- Expected Response: Within 1 hour

Follow-Up Schedule:
- Next check-in: [Now + 1 hour]
- Interval: Every 1h until contained

Customer Communication Draft:
"Dear [Customer Name], we take data privacy extremely seriously. Your report has been escalated to our security and leadership teams for immediate investigation. A senior representative will contact you within 1 hour with an update. We appreciate you bringing this to our attention."
```

## Tools
- Use `Grep` to search ticket history and prior escalation records for similar cases
- Use `Read` to load escalation SOPs, routing matrices, and authority-level documentation
- Use `WebSearch` to check for known system outages or external issues that may be related

## Error Handling
- If the ticket lacks sufficient context → list missing information and ask the user to provide it before proceeding
- If the appropriate escalation target is unclear → recommend the most likely team and flag for the user to confirm
- If the customer is in immediate distress → flag for emergency protocol and recommend immediate human intervention
- If the SLA has already been breached → note the breach duration and recommend an expedited path

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~helpdesk | Pull full ticket history and auto-route to the correct team |
| ~~CRM | Access customer account details, lifetime value, and prior escalations |
| ~~knowledge base | Check SOPs for escalation procedures and authority limits |
| ~~email | Send escalation notifications to internal teams and customer updates |

## Rules
- Never make the customer explain their issue again; always transfer full context
- Every escalation must include: reason, severity level, expected resolution time, and full context summary
- Communicate realistic timelines; do not overpromise resolution speed
- All L3+ escalations require a post-mortem review after resolution
- Document every escalation for trend analysis and process improvement
- Never expose internal escalation levels or team structures to the customer

## Output Template
```
Escalation Request

Ticket: #[Ticket ID]
Customer: [Customer Name]
Severity: [L1-L2 / L2-L3 / L3-L4 / Emergency]
Category: [Issue type]
SLA Status: [Within SLA / Breached — by how long]

Context:
[Summary of the issue, customer sentiment, and full handling history]

Actions Already Taken:
- [Action 1] — Result: [Outcome]
- [Action 2] — Result: [Outcome]

Escalation Reason:
[Specific reason this needs escalation]

What Is Needed:
- [Specific request or decision needed from the higher level]

Route To:
- Team/Person: [Target team or individual]
- Expected Response: [Timeline]

Follow-Up Schedule:
- Next check-in: [Date/time]
- Interval: [Every 1h / Every 2h / Every 4h / Every 24h]

Customer Communication Draft:
[Draft message to send to the customer about the escalation]
```

## Related Skills
- `ticket-responder` -- For drafting the initial response before escalation is needed
- `faq-lookup` -- For checking if a standard answer exists before escalating
- `knowledge-base` -- For reviewing SOPs and escalation procedures
- `feedback-analyzer` -- For tracking escalation trends and identifying systemic issues
