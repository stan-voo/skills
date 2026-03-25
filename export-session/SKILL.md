---
name: export-session
description: Export the current Claude Code session to a browsable HTML transcript. Use this skill whenever the user asks to "export session", "save transcript", "export this conversation", "share session", "create HTML export", "save this chat", or wants to share what happened in a session. Also use when the user mentions "transcript", "session HTML", or wants to review a past session. Uses a custom fork that collapses skill content blocks for readability.
---

# Export Session

Convert the current Claude Code session into a paginated, mobile-friendly HTML transcript. Skill content blocks are automatically collapsed so the export stays readable.

## Step 1: Find the session file

Run the helper script to locate the current session:

```bash
bash ~/.claude/skills/export-session/scripts/find-session.sh
```

This returns the path to the most recently modified `.jsonl` file for the current project.

## Step 2: Export to HTML

Pick an output directory (default: `downloads/session-YYYY-MM-DD` in the project root) and run:

```bash
bash ~/.claude/skills/export-session/scripts/export.sh <SESSION_FILE> <OUTPUT_DIR>
```

## Step 3: Open in browser

```bash
open <OUTPUT_DIR>/index.html
```

## Sharing Options

To create a GitHub Gist for sharing (requires `gh` CLI):

```bash
uv run --project /Users/stan/dev/pkm-iv/claude-code-transcripts claude-code-transcripts json <SESSION_FILE> --gist
```

This uploads the transcript and returns a shareable preview URL.

## Notes

- The tool is a custom fork of `simonw/claude-code-transcripts` at `/Users/stan/dev/pkm-iv/claude-code-transcripts`
- It automatically collapses skill definition blocks (SKILL.md injections) into expandable `<details>` elements
- Output includes an index page with a timeline of all prompts, plus paginated conversation pages (5 prompts per page)
- The `--gist` flag creates a public gist viewable via gisthost.github.io
