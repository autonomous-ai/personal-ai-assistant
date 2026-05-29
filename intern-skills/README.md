# Autonomous Intern — Onboarding Skill Spec

## Overview

A self-contained OpenClaw skill that runs on every Intern device. It handles first-time user onboarding (role detection → skill installation) and ongoing skill auto-updates via a cronjob.

---

## Architecture

```
workspace/skills/autonomous-intern-onboarding/
├── SKILL.md          ← Skill definition (trigger rules, flow, cronjob setup)
└── onboarding.json   ← Local state (installed role, version, timestamp)
```

### Remote Skill Repository (GitHub)

```
https://raw.githubusercontent.com/autonomous-ai/intern-skills/main/
├── version.txt                             ← Global version string (e.g. "1.0.3")
├── manifest.json                           ← Role → skills mapping
├── skills_zip/
│   ├── generic.zip                         ← Skills installed for ALL users
│   ├── developer.zip                       ← Developer-specific skills
│   ├── marketing.zip                       ← Marketing-specific skills
│   ├── designer.zip                        ← Designer-specific skills
│   ├── sales.zip                           ← Sales-specific skills
│   └── ops.zip                             ← Operations-specific skills
│   └── ...
```

Each `.zip` contains N sub-skill folders:
```
developer.zip
├── github-integration/SKILL.md
├── code-review/SKILL.md
├── terminal-helper/SKILL.md
└── ...
```

### manifest.json Example

```json
{
  "version": "1.0.3",
  "roles": {
    "developer": {
      "label": "Software Developer / Engineer",
      "keywords": ["developer", "engineer", "programmer", "coder", "devops", "sre", "backend", "frontend", "fullstack"],
      "skills_zip": "developer.zip",
      "description": "Code review, GitHub, terminal, debugging tools"
    },
    "marketing": {
      "label": "Marketing / Growth",
      "keywords": ["marketing", "growth", "seo", "content", "social media", "ads", "copywriter"],
      "skills_zip": "marketing.zip",
      "description": "Analytics, email campaigns, SEO, content tools"
    },
    "designer": {
      "label": "Designer / Creative",
      "keywords": ["designer", "ui", "ux", "graphic", "creative", "figma", "photoshop"],
      "skills_zip": "designer.zip",
      "description": "Image tools, design review, asset management"
    },
    "sales": {
      "label": "Sales / Business Development",
      "keywords": ["sales", "business", "account", "crm", "lead"],
      "skills_zip": "sales.zip",
      "description": "CRM integration, email outreach, lead research"
    },
    "ops": {
      "label": "Operations / Admin",
      "keywords": ["operations", "admin", "hr", "finance", "accounting", "office"],
      "skills_zip": "ops.zip",
      "description": "Scheduling, document management, workflow automation"
    }
  },
  "generic_zip": "generic.zip"
}
```

---

## Onboarding Flow

### Trigger
- Every session start → skill checks `onboarding.json`
- If `onboarding.json` doesn't exist or `installed_role` is empty → trigger onboarding

### Step 1: Greet & Ask Role

```
👋 Welcome to Autonomous Intern! I'm your AI assistant.

To set things up for you, what's your role or job?
Examples: Developer, Marketing, Designer, Sales, Operations

Just type your role or describe what you do!
```

### Step 2: Match Role

- Parse user response against `manifest.json` keywords
- If confident match → proceed to Step 3
- If ambiguous → present options:
  ```
  I found a few possible matches:
  1. Software Developer — Code review, GitHub, terminal tools
  2. DevOps / SRE — Infrastructure, monitoring, deployment tools
  
  Which one fits best? (or describe more)
  ```
- If no match → ask user to clarify, suggest available roles

### Step 3: Install Skills

1. Download `skills_zip/generic.zip` → extract to `workspace/skills/`
2. Download `skills_zip/{role}.zip` → extract to `workspace/skills/`
3. Save state to `onboarding.json`:
   ```json
   {
     "installed_role": "developer",
     "installed_version": "1.0.3",
     "installed_at": "2026-03-18T06:30:00Z",
     "generic_installed": true,
     "skills": ["github-integration", "code-review", "terminal-helper"]
   }
   ```
4. Confirm to user:
   ```
   ✅ All set! I've installed these skills for you:
   
   📦 Generic: web-search, calendar, file-manager
   🛠️ Developer: github-integration, code-review, terminal-helper
   
   You can change your role anytime by saying "change my role".
   ```

### Step 4: Role Change (User-Initiated)

- User says "change my role" / "switch role" / "I'm now in marketing"
- Skill detects intent → asks to confirm
- On confirm:
  1. Remove old role-specific skills (keep generic)
  2. Download new role zip → extract
  3. Update `onboarding.json`
  4. Confirm to user

---

## Auto-Update Cronjob

### Setup (by SKILL.md)

SKILL.md instructs OpenClaw to create a cronjob on first run:

- **Schedule:** Every 6 hours (or configurable)
- **Action:** Check remote `version.txt`
- **Logic:**
  1. Fetch `version.txt` from CDN
  2. Compare with `onboarding.json.installed_version`
  3. If newer:
     - Download `skills_zip/generic.zip` → overwrite existing generic skills
     - Download `skills_zip/{installed_role}.zip` → overwrite existing role skills
     - Update `onboarding.json.installed_version`
     - Notify user: "🔄 Skills updated to version X.Y.Z"
  4. If same → do nothing

### Version Strategy

- `version.txt` contains a single semver string
- Any version bump triggers full re-download of applicable zips
- Skills are overwritten (not merged) to ensure clean state

---

## State File: onboarding.json

```json
{
  "installed_role": "developer",
  "installed_version": "1.0.3",
  "installed_at": "2026-03-18T06:30:00Z",
  "updated_at": "2026-03-20T12:00:00Z",
  "generic_installed": true,
  "skills": [
    "web-search",
    "calendar", 
    "file-manager",
    "github-integration",
    "code-review",
    "terminal-helper"
  ],
  "update_cronjob_id": "abc-123-def"
}
```

---

## Edge Cases

| Case | Behavior |
|------|----------|
| No internet during onboarding | Retry on next session, inform user |
| Zip download fails | Retry 3x, then notify user + skip |
| User gives gibberish role | Ask again, max 3 attempts, then install generic only |
| Multiple users on same device | Last onboarded role wins (single-user device) |
| Skill conflicts (same name) | Role-specific overwrites generic if same folder name |
| User wants no skills | "skip" keyword → install generic only, mark onboarded |

---

## Implementation Notes

- **GitHub raw URL** is configurable in SKILL.md (default: `https://raw.githubusercontent.com/autonomous-ai/intern-skills/main/`)
- **Zip files** are at `skills_zip/*.zip` in the repo (fetched via `{base_url}/skills_zip/{role}.zip`)
- **Zip extraction** target: the skills directory where this skill is installed (resolved via `{baseDir}/../`)
- **Skill removal** on role change: delete folders listed in `onboarding.json.skills` that came from old role zip
- **Manifest cache**: cache `manifest.json` locally, refresh on version change
- **No firmware dependency**: skills update independently from intern-server OTA

---

## TODO

- [x] Define CDN URL / repo location — using GitHub raw URLs from this repo
- [x] Create initial role → skills mapping (which skills go in which zip)
- [x] Write the actual SKILL.md content for the onboarding skill
- [x] Build generic skills pack
- [x] Build role-specific skills packs
- [ ] Test onboarding flow end-to-end on staging device
