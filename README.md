# skill-usage-tracker

Track which Claude Code skills you use, how often, and when.

Every time Claude invokes a skill via the `Skill` tool, a PostToolUse hook logs it to `~/.claude/skill-usage.jsonl`. A Python CLI lets you query your history.

## Install

```bash
/plugin marketplace add <your-github-username>/skill-usage-tracker
/plugin install skill-usage-tracker@skill-usage-tracker
```

## Usage

```bash
# Overall summary
python3 ~/.claude/plugins/skill-usage-tracker/scripts/analyze-skill-usage summary

# Top 10 most-used skills
python3 ~/.claude/plugins/skill-usage-tracker/scripts/analyze-skill-usage top --limit 10

# History for a specific skill
python3 ~/.claude/plugins/skill-usage-tracker/scripts/analyze-skill-usage history --skill agent-reach

# Last 7 days
python3 ~/.claude/plugins/skill-usage-tracker/scripts/analyze-skill-usage recent --days 7
```

Or just ask Claude: **"show me my skill usage stats"** — the included skill handles it.

## How it works

| Component | What it does |
|---|---|
| `hooks/hooks.json` | Registers a PostToolUse hook that fires on every `Skill` tool call |
| `hooks/track-skill-usage.sh` | Bash hook (Linux/Mac): appends one JSON line to `~/.claude/skill-usage.jsonl` |
| `hooks/track-skill-usage.ps1` | PowerShell hook (Windows): same thing |
| `scripts/analyze-skill-usage` | Python3 CLI for querying the log |
| `skills/skill-usage-tracker/SKILL.md` | Teaches Claude to run the CLI and present results |

## Log format

Each line in `~/.claude/skill-usage.jsonl`:

```json
{"t":"2026-06-25T05:00:00Z","s":"agent-reach","sid":"abc123"}
```

`t` = ISO timestamp, `s` = skill name, `sid` = session ID.

## Requirements

- Claude Code with plugin support
- Python 3.6+ (for the analysis CLI)
- bash or PowerShell (for the hook)

## License

MIT
