#!/usr/bin/env bash
LOG="$HOME/.claude/skill-usage.jsonl"
PY=$( (python3 -c "" 2>/dev/null && echo "python3") || (python -c "" 2>/dev/null && echo "python") || echo "python3")
SKILL=$(echo "$CLAUDE_TOOL_INPUT_JSON" | $PY -c "import sys,json; print(json.load(sys.stdin).get('skill','unknown'))" 2>/dev/null || echo "unknown")
printf '{"time":"%s","skill":"%s","session":"%s"}\n' "$(date -u +%Y-%m-%dT%H:%M:%SZ)" "$SKILL" "${CLAUDE_SESSION_ID:-unknown}" >> "$LOG"
