---
name: ticket-responder
description: >
  Drafts professional, empathetic responses to customer support tickets. Classifies the issue type,
  assesses priority and sentiment, and recommends follow-up actions.
  Use when the user says "reply to this customer", "draft a response to this ticket",
  "handle this complaint", "respond to this support request", "what should I say to this customer",
  "help me answer this ticket", or "write a reply for this issue".
---

# Ticket Responder

## Quick Start
Analyze the customer's ticket, classify the issue, and draft a send-ready response with the right tone and a clear resolution path. Always address the customer's emotional state before jumping to the solution.

## Workflow
1. Parse the ticket to extract the core issue, emotional cues, and specific requests
2. Classify the ticket: Inquiry, Order Issue, Technical, Billing, Complaint, or Return/Exchange
3. Assess priority (Urgent / High / Normal / Low) and sentiment (Positive / Neutral / Negative / Angry)
4. Check for escalation signals: legal threats, multi-customer impact, security breach, repeated unresolved contacts
5. Select the response template based on classification:
   - **Apology + Solution**: Acknowledge, Apologize, Solve, Thank
   - **Information**: Greet, Answer, Offer more help
   - **Escalation**: Acknowledge, Inform escalation, Provide timeline
6. Draft the full response email with empathy, a specific solution, and realistic timelines
7. Determine follow-up actions, root cause, and whether escalation is needed

## Examples

**Example 1: Order complaint**
Input: "Customer says: 'I ordered a laptop 2 weeks ago and it still hasn't arrived. Order #4521. This is unacceptable.'"
Output:
```
Ticket Response

Type: Order Issue
Priority: High
Sentiment: Negative

---
Dear [Customer Name],

Thank you for reaching out, and I sincerely apologize for the delay with your order #4521. I completely understand your frustration — waiting two weeks without receiving your laptop is not the experience we want for you.

I've looked into your order and [specific finding]. To resolve this, I am [specific action, e.g., expediting a replacement shipment / initiating a trace with our carrier]. You can expect [specific timeline].

If you have any further questions, please don't hesitate to reach out. We appreciate your patience.

Warm regards,
[Agent Name]
---

Internal Notes:
- Root cause: Shipping delay — carrier investigation needed
- Follow-up: Confirm delivery within 3 business days
- Escalation: None
```

**Example 2: Billing inquiry**
Input: "Customer writes: 'I was charged twice for my subscription this month. Please fix this ASAP.'"
Output:
```
Ticket Response

Type: Billing
Priority: High
Sentiment: Negative

---
Dear [Customer Name],

Thank you for bringing this to our attention, and I'm sorry for the duplicate charge on your subscription. That should not have happened.

I've initiated a refund for the extra charge of [amount]. You should see this reflected in your account within 3-5 business days. I've also flagged your account to ensure this does not recur.

Please let me know if you have any other questions.

Best regards,
[Agent Name]
---

Internal Notes:
- Root cause: Duplicate payment processing — flag to billing team
- Follow-up: Verify refund posted within 5 business days
- Escalation: None
```

## Tools
- Use `Grep` to search for relevant policy documents or prior ticket templates
- Use `Read` to load knowledge base articles or SOPs related to the issue
- Use `WebSearch` to look up tracking information or external references if needed

## Error Handling
- If the ticket is ambiguous or missing key details → ask the user for clarification before drafting
- If the issue type cannot be classified → default to "Inquiry" and flag for manual review
- If escalation is required but no routing info is available → note the need and recommend the escalation helper skill
- If the customer's language is not English → draft the response in the detected language

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~helpdesk | Pull ticket history, customer details, and prior interactions directly |
| ~~CRM | Access customer account info, purchase history, and subscription status |
| ~~knowledge base | Search for relevant articles and SOPs to include in responses |
| ~~email | Send drafted responses directly to the customer |

## Rules
- Tone: friendly, professional, empathetic — never defensive or dismissive
- Always apologize first when the customer has a problem, even if fault is unconfirmed
- Provide specific solutions; never send generic filler responses
- Escalate immediately if: legal threats, multi-customer impact, or security breach
- Never expose internal processes, system names, or employee details to the customer
- Protect customer personal information in all outputs

## Output Template
```
Ticket Response

Type: [Inquiry / Order Issue / Technical / Billing / Complaint / Return-Exchange]
Priority: [Urgent / High / Normal / Low]
Sentiment: [Positive / Neutral / Negative / Angry]

---
[Full response email content, ready to send]
---

Internal Notes:
- Root cause: [Root cause if identified]
- Follow-up: [Follow-up action required]
- Escalation: [Escalation details if needed, otherwise "None"]
```

## Related Skills
- `faq-lookup` -- For finding standard answers to include in ticket responses
- `escalation-helper` -- For escalating tickets that exceed your authority or scope
- `knowledge-base` -- For looking up troubleshooting guides and product documentation
- `feedback-analyzer` -- For identifying patterns when similar tickets keep recurring
