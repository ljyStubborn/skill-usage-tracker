---
name: skill-usage-tracker
description: Show skill usage stats. Trigger when user asks about skill usage, which skills they use most, how often a skill was called, or wants a usage report.
---

# skill-usage-tracker

Analyze the user's Claude Code skill invocation history from `~/.claude/skill-usage.jsonl`.

## Quick Reference

| User intent | Action |
|---|---|
| Overall stats / how many times | `python3 scripts/analyze-skill-usage summary` |
| Top N most used | `python3 scripts/analyze-skill-usage top --limit N` |
| History for one skill | `python3 scripts/analyze-skill-usage history --skill NAME` |
| Last N days | `python3 scripts/analyze-skill-usage recent --days N` |

The script is at `${CLAUDE_PLUGIN_ROOT}/scripts/analyze-skill-usage`. If `CLAUDE_PLUGIN_ROOT` is unavailable, find it with:
```bash
find ~/.claude/plugins -name "analyze-skill-usage" 2>/dev/null | head -1
```

## Workflow

1. Run the appropriate command above.
2. Present results in a clean table or summary — no raw JSON.
3. If the log is empty, tell the user the hook may not be active yet and point them to the README.

## Common Mistakes

- Don't read `~/.claude/skill-usage.jsonl` directly with Read tool — use the analysis script, it handles malformed lines.
- Don't guess skill names — use `summary` first to see what's actually logged.
- If the file doesn't exist, the hook hasn't fired yet; don't report an error, just say "no data yet."
