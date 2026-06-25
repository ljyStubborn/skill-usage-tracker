#!/usr/bin/env bash
LOG="$HOME/.claude/skill-usage.jsonl"
SKILL=$(echo "$CLAUDE_TOOL_INPUT_JSON" | python3 -c "import sys,json; print(json.load(sys.stdin).get('skill','unknown'))" 2>/dev/null || echo "unknown")
printf '{"t":"%s","s":"%s","sid":"%s"}\n' "$(date -u +%Y-%m-%dT%H:%M:%SZ)" "$SKILL" "${CLAUDE_SESSION_ID:-unknown}" >> "$LOG"
