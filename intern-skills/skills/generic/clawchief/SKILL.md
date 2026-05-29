---
name: clawchief
description: >
  Helps set up, customize, and operate a Clawchief-style founder / chief-of-staff operating system
  for OpenClaw. Use when the user wants to install Clawchief, migrate versions, connect Todoist,
  run Google Workspace workflows via helper scripts, define "source-of-truth" policies (priorities,
  auto-resolution, meeting notes, location-awareness), or set up heartbeat/cron routines.
---

# Clawchief

## Quick Start
Treat Clawchief as an operating model, not a single prompt: keep **live task state** in Todoist, keep **policies** in `clawchief/*.md`, keep **environment details** in `workspace/TOOLS.md`, and keep **recurring orchestration** in `workspace/HEARTBEAT.md` + deterministic cron jobs. Start from install docs, then customize a few high-leverage files before adding complexity.

## Workflow
1. Confirm the goal: install, migrate, customize, or run a daily/weekly routine
2. Inventory the current state:
   - OpenClaw install location (e.g. `~/.openclaw/`)
   - Whether Todoist is the live task system (v3+ expectation)
   - Whether Google workflows run through `gws`-backed helper scripts
   - Whether `clawchief/` policy files exist and are customized
3. Execute the appropriate path:
   - **Install path**:
     - Follow `INSTALL-WITH-OPENCLAW.md` then `SETUP-GWS.md`
     - Copy skills into `~/.openclaw/skills/`
     - Copy `clawchief/` and `workspace/` into `~/.openclaw/workspace/`
     - Add `TODOIST_API_TOKEN` to env or `~/.openclaw/.env`
     - Create cron jobs from `cron/jobs.template.json`
   - **Migrate path (v2 → v3)**:
     - Move canonical live task state to Todoist (stop using `clawchief/tasks.md`)
     - Route Google actions through helper scripts (stop using raw `gog` instructions)
     - Adopt the shared task-system contract as the stable interface for task operations
   - **Customize path** (do these first):
     - `workspace/TOOLS.md` (accounts, calendars, identifiers, environment)
     - `clawchief/priority-map.md` (what “matters” and how to rank work)
     - `clawchief/auto-resolver.md` (what gets auto-closed, deferred, escalated)
     - `clawchief/meeting-notes.md` (how to ingest notes into tasks/knowledge)
4. Run the routine (keep it deterministic):
   - Daily: ingest signals → curate Todoist → execute top priorities → compile lessons
   - Weekly: review priority map, clean up task system, refine resolver rules
5. Compile durable learnings:
   - Promote repeated decisions into `clawchief/*.md` policy files
   - Keep prompts short; keep behavior in skills/policies/scripts

## Examples

**Example 1: Install checklist**
Input: "Set up clawchief for my OpenClaw install. I use Todoist + Gmail + Google Calendar."
Output:
- Install docs: follow `INSTALL-WITH-OPENCLAW.md`, then `SETUP-GWS.md`
- Files to copy:
  - Skills → `~/.openclaw/skills/`
  - `clawchief/` + `workspace/` → `~/.openclaw/workspace/`
- Configure:
  - Set `TODOIST_API_TOKEN` in env or `~/.openclaw/.env`
  - Fill placeholders in `workspace/TOOLS.md` (accounts/calendars/projects)
- Orchestration:
  - Create cron jobs from `cron/jobs.template.json`
  - Verify `workspace/HEARTBEAT.md` matches your routine

**Example 2: Daily task prep (Todoist-first)**
Input: "Do a clawchief-style daily task prep for today. I'm traveling and only have 3 hours."
Output:
Today’s constraints:
- Location: traveling (low context switching, short sessions)
- Time budget: 3 hours

Plan:
- Pull Todoist tasks due/overdue + top priority projects
- Select 1 “must win” outcome + 2 supporting tasks
- Defer/decline anything that violates the resolver rules
- If travel context blocks execution, create a location-appropriate alternative task set

**Example 3: Migrate from v2**
Input: "I used clawchief v2 with `clawchief/tasks.md`. Help me migrate."
Output:
Migration actions:
- Stop treating `clawchief/tasks.md` as canonical live state
- Import or recreate live tasks in Todoist, using a consistent contract (labels/fields)
- Replace raw Google commands with `gws` helper scripts for Gmail/Calendar/Sheets
- Update routines and cron prompts to reference Todoist + helper scripts

## Tools
- Use `Read` to inspect existing Clawchief policy files and workspace templates
- Use `Glob` to locate `clawchief/` and `workspace/` files in the user’s environment
- Use `Write` to draft or update policy files and templates (keep them short and stable)
- Use `WebSearch` / `WebFetch` to pull the latest upstream docs when needed

## Error Handling
- If OpenClaw workspace paths differ → locate with `Glob` and proceed using the discovered structure
- If Todoist token is missing → stop live-task operations and provide a minimal token setup checklist
- If routines drift into “chat-only” behavior → move decisions into `clawchief/*.md` and keep prompts thin
- If migration is ambiguous → inventory which parts are in Todoist vs markdown, then choose the v3 model

## Rules
- Prefer **one canonical live task system** (Todoist) over duplicate markdown task state
- Separate concerns: priorities, resolution policy, meeting notes, location constraints, and knowledge compilation
- Keep cron prompts short and deterministic; encode logic in skills/policies/scripts
- Never invent tool outputs (emails, calendar events, Todoist changes) without explicit connector/tool access
- Respond in the user’s language, but keep file names and key terms exact as in the repo

## Output Template
```
## Clawchief Action: [Install | Migrate | Customize | Routine]

**Goal:** [one sentence]
**Current state:** [what exists today]
**Target state:** [what “done” looks like]

### Actions
- [ ] ...
- [ ] ...

### Files to touch
- `workspace/TOOLS.md`: ...
- `clawchief/priority-map.md`: ...
- `clawchief/auto-resolver.md`: ...
- `workspace/HEARTBEAT.md`: ...

### Verification
- [How to confirm it works]
```
