# How to Publish a Skill You Authored

When you've built a skill locally and want to share it with others.

---

## Step 1: Make sure the skill works locally

Your skill should be at `~/.claude/skills/skill-name/` with at least a `SKILL.md`:

```
skill-name/
├── SKILL.md              # Required: frontmatter + instructions
├── scripts/              # Optional: helper scripts
│   └── do-thing.sh
└── references/           # Optional: reference docs loaded on demand
    └── patterns.md
```

Test it by invoking `/skill-name` in Claude Code and verifying it works.

## Step 2: Check the SKILL.md follows the spec

**Required frontmatter:**
```yaml
---
name: skill-name          # lowercase, hyphens only, max 64 chars
description: What it does and when to use it. Be specific and pushy — include trigger phrases.
---
```

**Checklist:**
- [ ] `name` matches the directory name
- [ ] `description` includes what it does AND when to trigger (be generous with trigger phrases)
- [ ] No hardcoded local paths (like `/Users/stan/...`)
- [ ] SKILL.md is under 500 lines (move details to `references/`)
- [ ] Instructions are imperative ("Run this", "Check that"), not documentary ("Here's how to...")
- [ ] If scripts reference external tools, they either auto-install or document prerequisites

## Step 3: Copy to the skills repo

```bash
cp -r ~/.claude/skills/skill-name ~/dev/skills/skill-name
```

## Step 4: Replace the local copy with a symlink

```bash
rm -rf ~/.claude/skills/skill-name
ln -s ~/dev/skills/skill-name ~/.claude/skills/skill-name
```

From now on, editing the skill locally also edits the repo copy. No more syncing.

## Step 5: Verify the symlink works

```bash
ls -la ~/.claude/skills/skill-name
# Should show: skill-name -> /Users/stan/dev/skills/skill-name
```

Invoke `/skill-name` in Claude Code to confirm it still works.

## Step 6: Update the README

Edit `~/dev/skills/README.md` to add the new skill:

```markdown
### skill-name

One-line description of what it does.

\```bash
npx skills add stan-voo/skills@skill-name
\```
```

## Step 7: Commit and push

```bash
cd ~/dev/skills
git add skill-name/ README.md
git commit -m "Add skill-name: one-line description"
git push
```

## Step 8: Share

Give people the install command:
```bash
npx skills add stan-voo/skills@skill-name
```

Or for all skills at once:
```bash
npx skills add stan-voo/skills
```

---

## Adding more skills later

Since `~/.claude/skills/skill-name` is already a symlink to the repo, the workflow is:

1. Edit the skill (via `~/.claude/skills/skill-name/SKILL.md` or `~/dev/skills/skill-name/SKILL.md` — same file)
2. Test with `/skill-name`
3. `cd ~/dev/skills && git add -A && git commit -m "Update skill-name" && git push`

That's it. No copy step needed after the initial setup.

---

## Quality checklist before publishing

Run through these before pushing a new skill:

- [ ] **Description is pushy** — Claude tends to under-trigger skills. Include many trigger phrases.
- [ ] **No local paths** — nothing referencing `/Users/stan/` or machine-specific locations.
- [ ] **Scripts are portable** — use `#!/bin/bash`, check for dependencies, give helpful errors if missing.
- [ ] **References are under 300 lines each** — agents load these into context; keep them focused.
- [ ] **SKILL.md under 500 lines** — if longer, split into SKILL.md (workflow) + references/ (details).
- [ ] **Tested on a fresh invocation** — not just "it works because I know what it does" but "Claude can follow the instructions cold."

---

## File structure reference

```
~/dev/skills/                          # The GitHub repo (stan-voo/skills)
├── README.md                          # Lists all skills with install commands
├── LICENSE                            # MIT
├── docs/                              # These docs
├── export-session/                    # Skill 1
│   ├── SKILL.md
│   └── scripts/
├── ukrainian-native-editor/           # Skill 2
│   ├── SKILL.md
│   └── references/
└── next-skill/                        # Skill 3 (future)
    └── SKILL.md

~/.claude/skills/                      # Local skills directory (symlinks)
├── export-session -> ~/dev/skills/export-session
├── ukrainian-native-editor -> ~/dev/skills/ukrainian-native-editor
└── other-skill/                       # Skills not in the repo (private or installed)
```
