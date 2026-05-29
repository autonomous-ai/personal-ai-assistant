---
name: git-helper
description: >
  Helps with Git operations, conflict resolution, commit messages, and branching workflows.
  Use when the user says "help me with git", "resolve merge conflict", "undo my commit",
  "rebase vs merge", "write a commit message", "fix my git history",
  "create a branch", or "how do I push my changes".
---

# Git Helper

## Quick Start
Assess the current repository state, construct the right Git commands, explain each step in plain language, and warn about any destructive operations before executing.

## Workflow
1. Determine what the user needs: a specific command, conflict resolution, commit message help, error troubleshooting, or workflow guidance
2. Check the current Git state (branch, uncommitted changes, remote tracking) using `git status` and `git log`
3. Construct the command sequence, explain each step, flag any destructive operations, and provide a rollback plan

## Examples

**Example 1: Undo last commit but keep changes**
Input: "I want to undo my last commit but keep the changes"
Output:
```
## Commands
Step 1: Soft reset to undo the commit, keeping changes staged
$ git reset --soft HEAD~1

## Expected Result
Your last commit is undone. All changes from that commit are now in the staging area, ready to be re-committed.

## Rollback
If you need to restore the commit:
$ git reflog
$ git reset --soft <commit-hash>
```

**Example 2: Resolve merge conflict**
Input: "I have merge conflicts after pulling from main"
Output:
```
## Commands
Step 1: See which files have conflicts
$ git status

Step 2: Open each conflicted file, look for conflict markers (<<<<<<<, =======, >>>>>>>), and choose the correct code

Step 3: After resolving all conflicts, stage the fixed files
$ git add <resolved-files>

Step 4: Complete the merge
$ git commit

## Warning
Do NOT use `git commit -m` here -- Git will auto-generate a merge commit message. Just run `git commit` and accept or edit the default message.
```

**Example 3: Create a feature branch from latest main**
Input: "How do I start a new feature branch?"
Output:
```
## Commands
Step 1: Fetch latest changes from remote
$ git fetch origin

Step 2: Create and switch to a new branch from origin/main
$ git checkout -b feat/your-feature-name origin/main

## Expected Result
You are now on a new branch `feat/your-feature-name` based on the latest `main`.
```

## Tools
- Use `Bash` with `git status`, `git log`, `git diff` to assess repository state
- Use `Read` to inspect conflicting files and identify conflict markers
- Use `Grep` to search for conflict markers (`<<<<<<<`) across the repository

## Error Handling
- If the Git error message is unclear → ask for the full terminal output
- If the user is on a detached HEAD → explain the situation and guide them to safety first
- If destructive commands are requested (force push, hard reset) → confirm intent and explain consequences before executing
- If merge conflicts are present → walk through each file systematically

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~code repository | Access remote branches, PRs/MRs, and repository metadata directly |
| ~CI/CD | Check pipeline status before merging and trigger builds after push |
| ~issue tracker | Auto-link commits and branches to issue tickets |

## Rules
- Never use `--force` push without explicit user confirmation
- Never skip pre-commit hooks (`--no-verify`) unless the user explicitly requests it
- Always suggest a rollback plan for destructive operations
- Commit messages should follow Conventional Commits: `<type>(<scope>): <description>`
- Branch names should be lowercase kebab-case with type prefix (feat/, fix/, refactor/, chore/)

## Output Template
```
## Task
[What the user needs to accomplish]

## Commands
Step 1: [Description]
$ [git command]

Step 2: [Description]
$ [git command]

## Expected Result
[What the user should see after running the commands]

## Warning (if applicable)
[Risks or destructive operations]

## Rollback (if applicable)
$ [Command to undo if something goes wrong]
```

## Related Skills
- `code-reviewer` — Review code changes before committing or merging
- `debug-assistant` — Diagnose issues introduced by recent commits or merges
