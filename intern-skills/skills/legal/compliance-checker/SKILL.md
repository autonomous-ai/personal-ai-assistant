---
name: compliance-checker
description: >
  Checks business processes, documents, and policies against regulatory requirements and internal standards.
  Use when the user says "check compliance with GDPR", "are we CCPA compliant", "audit preparation checklist",
  "does this policy meet HIPAA requirements", "SOX compliance review", "ISO 27001 gap analysis",
  "check if our process meets labor law", "regulatory requirements for this",
  "compliance gap analysis", "are we meeting data privacy rules",
  "pre-audit readiness check", or "what regulations apply to our industry".
---

# Compliance Checker

## Quick Start
Evaluate business processes and documents against regulatory frameworks and internal policies. Identify gaps, flag non-compliance risks, and suggest remediation steps. Always specify which regulation or standard is being checked against.

## Workflow
1. Identify the compliance framework: GDPR, CCPA/CPRA, HIPAA, SOX, labor law, ISO 27001, SOC 2, industry-specific regulations
2. Determine what is being evaluated: a document, process, policy, or system
3. Map requirements from the framework to the subject being evaluated
4. Check each requirement: compliant, partially compliant, non-compliant, or not applicable
5. Assign risk levels to non-compliant items
6. Provide remediation recommendations with priority ranking

## Examples

**Example 1: Data Privacy Check**
Input: "Check if our customer data collection process complies with CCPA"
Output:
```
COMPLIANCE CHECK
================
Framework: CCPA (California Consumer Privacy Act)
Subject: Customer data collection process
Date: 03/23/2026

ASSESSMENT
----------
| # | Requirement                    | Status         | Risk   |
|---|--------------------------------|----------------|--------|
| 1 | Privacy notice at collection   | ✅ Compliant    | —      |
| 2 | Purpose specification          | ⚠️ Partial     | Medium |
| 3 | Data minimization              | ❌ Non-compliant| HIGH   |
| 4 | Storage limitation             | ⚠️ Partial     | Medium |
| 5 | Right to know / access         | ❌ Non-compliant| HIGH   |
| 6 | Data breach notification       | ✅ Compliant    | —      |
| 7 | Opt-out of sale/sharing        | ❌ Non-compliant| HIGH   |
| 8 | Non-discrimination             | ✅ Compliant    | —      |

Score: 3/8 fully compliant (37.5%)

HIGH RISK ITEMS:
1. Data minimization: Collecting 12 fields when only 5 are needed for stated purpose
2. Right to know: No self-service portal for consumers to view/delete their data
3. Opt-out mechanism: No "Do Not Sell or Share My Personal Information" link on website

REMEDIATION PLAN:
| Priority | Action                                  | Deadline   |
|----------|-----------------------------------------|------------|
| P0       | Reduce data fields to minimum necessary | Immediate  |
| P0       | Implement consumer rights request process | 30 days    |
| P1       | Add "Do Not Sell or Share" opt-out link | 60 days    |
| P2       | Update privacy policy with specific purposes | 30 days |
| P2       | Define data retention schedule          | 45 days    |
```

**Example 2: Labor Law Check**
Input: "Check if our employee handbook complies with US labor law"
Output: A section-by-section review of the handbook against FLSA, FMLA, ADA, OSHA, Title VII, and state-specific requirements.

## Tools
- Use `Read` to load policy documents, handbooks, or process descriptions
- Use `WebSearch` to verify current regulatory requirements and recent updates
- Use `Write` to save compliance reports to files
- Use `Grep` to search for specific terms or clauses in documents

## Error Handling
- If compliance framework not specified → ask which regulations or standards to check against
- If document is incomplete → note gaps and assess only available content
- If regulation has recently changed → flag that requirements may need re-verification
- If assessment requires domain expertise beyond scope → recommend specialist consultation

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~document management | Access policies, handbooks, and process documents for review |
| ~~contract system | Check contract terms against regulatory compliance requirements |
| ~~email | Retrieve audit correspondence and compliance notifications |
| ~~compliance database | Cross-reference against up-to-date regulatory frameworks |

## Rules
- Always specify which version/date of the regulation is being referenced
- Never claim a process is "fully compliant" — use "appears compliant based on available information"
- Flag items requiring specialist legal or regulatory review
- Prioritize remediation actions by risk level (P0 = immediate, P1 = 30 days, P2 = 60 days)
- Include both the requirement and the evidence (or lack of) for each assessment
- Note that compliance is a point-in-time assessment and requires ongoing monitoring
- Keep assessment objective — note assumptions clearly

## Output Template
```
COMPLIANCE CHECK
================
Framework: [Regulation/Standard name and version]
Subject: [What is being evaluated]
Date: [Assessment date]

ASSESSMENT
----------
| # | Requirement | Status | Risk |
|---|-------------|--------|------|
| [N] | [Requirement] | [✅/⚠️/❌] | [High/Medium/Low/—] |

Score: [X/Y] fully compliant ([Z]%)

HIGH RISK ITEMS:
1. [Non-compliant item with specific evidence]

REMEDIATION PLAN:
| Priority | Action | Deadline |
|----------|--------|----------|
| [P0/P1/P2] | [Specific action] | [Timeline] |

---
Note: This assessment is based on available information and does not constitute legal advice.
Recommend specialist review for high-risk items.
```

## Related Skills
- `contract-reviewer` — For reviewing contracts flagged during compliance checks
- `legal-summarizer` — For summarizing regulations being checked against
- `clause-extractor` — For extracting compliance-relevant clauses from contracts
- `nda-drafter` — For drafting NDAs that meet data protection compliance requirements
