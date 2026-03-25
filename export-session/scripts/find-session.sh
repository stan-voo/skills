#!/bin/bash
# Find the most recent session JSONL file for the current project
# Usage: ./find-session.sh [project-dir]
# If no project-dir given, uses current working directory

PROJECT_DIR="${1:-$PWD}"
ENCODED=$(echo "$PROJECT_DIR" | tr '/' '-' | sed 's/^-//')
SESSION_DIR="$HOME/.claude/projects/$ENCODED"

if [ ! -d "$SESSION_DIR" ]; then
    echo "Error: No session directory found at $SESSION_DIR" >&2
    exit 1
fi

LATEST=$(ls -t "$SESSION_DIR"/*.jsonl 2>/dev/null | head -1)

if [ -z "$LATEST" ]; then
    echo "Error: No .jsonl session files found in $SESSION_DIR" >&2
    exit 1
fi

echo "$LATEST"
