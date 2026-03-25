#!/bin/bash
# Export a Claude Code session to HTML
# Usage: ./export.sh <session-file> <output-dir>
# Requires: uv
# Set TRANSCRIPT_TOOL_PATH to use a local dev copy instead of the installed tool.

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

# Use local dev copy if set, otherwise use installed tool
if [ -n "$TRANSCRIPT_TOOL_PATH" ]; then
    uv run --project "$TRANSCRIPT_TOOL_PATH" claude-code-transcripts json "$SESSION_FILE" -o "$OUTPUT_DIR"
else
    uvx --from "git+https://github.com/stan-voo/claude-code-transcripts" claude-code-transcripts json "$SESSION_FILE" -o "$OUTPUT_DIR"
fi
