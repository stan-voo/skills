# How to Fork and Publish Someone Else's Skill

When you find a tool you like but want to modify it, then share your version.

## Example: what we did with claude-code-transcripts

We found Simon Willison's `claude-code-transcripts` tool, wanted to add skill collapsing, forked it, modified it, wrapped it in a skill, and published.

---

## Step 1: Fork the original repo

```bash
gh repo fork owner/repo-name --clone --remote
```

This creates `stan-voo/repo-name` on GitHub and clones it locally. The `--remote` flag sets up `upstream` pointing to the original.

## Step 2: Make your changes

Edit the code, test it locally:

```bash
cd repo-name
# for Python projects:
uv run pytest
# test manually:
uv run the-tool --help
```

## Step 3: Push your fork

```bash
git checkout -b your-feature-branch
git add -A
git commit -m "Description of changes"
git push -u origin your-feature-branch
```

## Step 4: (Optional) Submit a PR to upstream

If you think the original author would want your changes:

```bash
gh pr create --repo owner/repo-name --title "Your change" --body "Description"
```

## Step 5: Create a skill that wraps your fork

Create a directory in your skills repo (`~/dev/skills/skill-name/`):

```
skill-name/
├── SKILL.md          # Instructions for Claude
└── scripts/          # Helper scripts (optional)
    └── run.sh
```

**Key rule: no hardcoded local paths in SKILL.md or scripts.** Use one of these patterns:

### Pattern A: uvx from GitHub (for Python tools)

Others get it automatically, no install step:
```bash
uvx --from "git+https://github.com/stan-voo/repo-name" tool-command args
```

### Pattern B: env var override for local dev

In your scripts, check for an env var first:
```bash
if [ -n "$TOOL_PATH" ]; then
    uv run --project "$TOOL_PATH" tool-command args
else
    uvx --from "git+https://github.com/stan-voo/repo-name" tool-command args
fi
```

Set the env var in `~/.claude/settings.json`:
```json
{
  "env": {
    "TOOL_PATH": "/Users/you/dev/repo-name"
  }
}
```

This way: you use your local copy for fast iteration, others auto-install from GitHub.

## Step 6: Symlink the skill so edits go to the repo

```bash
# Remove the copy in ~/.claude/skills/ if it exists
rm -rf ~/.claude/skills/skill-name

# Create symlink from your Claude skills dir to the repo
ln -s ~/dev/skills/skill-name ~/.claude/skills/skill-name
```

Now editing `~/.claude/skills/skill-name/SKILL.md` actually edits `~/dev/skills/skill-name/SKILL.md`.

## Step 7: Commit and push

```bash
cd ~/dev/skills
git add skill-name/
git commit -m "Add skill-name skill"
git push
```

## Step 8: Share

Others install with:
```bash
npx skills add stan-voo/skills@skill-name
```

---

## Updating your fork later

If the original repo gets updates you want:

```bash
cd ~/dev/repo-name
git fetch upstream
git merge upstream/main
git push
```

If there are conflicts, resolve them, then push.

## Summary

| What | Where |
|------|-------|
| Original tool | `owner/repo-name` on GitHub |
| Your fork (code) | `stan-voo/repo-name` on GitHub + `~/dev/repo-name` locally |
| Your skill (instructions) | `stan-voo/skills` repo, `skill-name/` directory |
| Local skill symlink | `~/.claude/skills/skill-name` → `~/dev/skills/skill-name` |
| Env var for local dev | `~/.claude/settings.json` → `"env": { "TOOL_PATH": "..." }` |
