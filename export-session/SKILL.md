---
name: export-session
description: Export the current Claude Code session to a browsable HTML transcript. Use this skill whenever the user asks to "export session", "save transcript", "export this conversation", "share session", "create HTML export", "save this chat", or wants to share what happened in a session. Also use when the user mentions "transcript", "session HTML", or wants to review a past session. Uses a custom fork that collapses skill content blocks for readability.
---

# Export Session

Convert the current Claude Code session into a paginated, mobile-friendly HTML transcript. Skill content blocks are automatically collapsed so the export stays readable.

## Prerequisites

Requires `uv` (Python package manager). The export tool is fetched automatically on first run from `stan-voo/claude-code-transcripts`.

## Step 1: Find the session file

Run the helper script to locate the current session:

```bash
SKILL_DIR="$(dirname "$(readlink -f ~/.claude/skills/export-session/SKILL.md 2>/dev/null || echo ~/.claude/skills/export-session/SKILL.md)")"
bash "$SKILL_DIR/scripts/find-session.sh"
```

This returns the path to the most recently modified `.jsonl` file for the current project.

## Step 2: Export to HTML

Pick an output directory (default: `downloads/session-YYYY-MM-DD` in the project root) and run:

```bash
bash "$SKILL_DIR/scripts/export.sh" <SESSION_FILE> <OUTPUT_DIR>
```

## Step 3: Open in browser

```bash
open <OUTPUT_DIR>/index.html
```

## Sharing via Gist

To create a GitHub Gist for sharing (requires `gh` CLI):

```bash
uvx --from "git+https://github.com/stan-voo/claude-code-transcripts" claude-code-transcripts json <SESSION_FILE> --gist
```

## For developers

Set `TRANSCRIPT_TOOL_PATH` to use a local clone instead of fetching from GitHub:

```bash
export TRANSCRIPT_TOOL_PATH=/path/to/claude-code-transcripts
```

## Notes

- Based on a [custom fork](https://github.com/stan-voo/claude-code-transcripts) of `simonw/claude-code-transcripts` ([PR #90](https://github.com/simonw/claude-code-transcripts/pull/90))
- Collapses skill definition blocks (SKILL.md injections) into expandable `<details>` elements
- Output includes an index page with timeline + paginated conversation pages (5 prompts per page)
