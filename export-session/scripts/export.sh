#!/bin/bash
# Export a Claude Code session to HTML
# Usage: ./export.sh <session-file> <output-dir>
# Requires: uv, the custom fork at /Users/stan/dev/pkm-iv/claude-code-transcripts

FORK_PATH="/Users/stan/dev/pkm-iv/claude-code-transcripts"
SESSION_FILE="$1"
OUTPUT_DIR="$2"

if [ -z "$SESSION_FILE" ] || [ -z "$OUTPUT_DIR" ]; then
    echo "Usage: export.sh <session-file> <output-dir>" >&2
    exit 1
fi

if [ ! -f "$SESSION_FILE" ]; then
    echo "Error: Session file not found: $SESSION_FILE" >&2
    exit 1
fi

uv run --project "$FORK_PATH" claude-code-transcripts json "$SESSION_FILE" -o "$OUTPUT_DIR"
