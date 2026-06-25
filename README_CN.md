# skill-usage-tracker

追踪 Claude Code 调用了哪些 skill、多少次、什么时候。

每次 Claude 通过 `Skill` 工具调用 skill 时，PostToolUse hook 会把一条记录追加到 `~/.claude/skill-usage.jsonl`。附带一个 Python CLI 查询历史数据。

## 安装

```bash
/plugin marketplace add ljyStubborn/skill-usage-tracker
/plugin install skill-usage-tracker@skill-usage-tracker
```

## 使用

```bash
# 总体概览
python ~/.claude/plugins/skill-usage-tracker/scripts/analyze-skill-usage summary

# Top 10 最常用的 skill
python ~/.claude/plugins/skill-usage-tracker/scripts/analyze-skill-usage top --limit 10

# 某个 skill 的调用历史
python ~/.claude/plugins/skill-usage-tracker/scripts/analyze-skill-usage history --skill agent-reach

# 最近 7 天汇总
python ~/.claude/plugins/skill-usage-tracker/scripts/analyze-skill-usage recent --days 7
```

或者直接问 Claude：**"我的 skill 使用情况"** — 内置的 skill 会自动处理。

## 工作原理

| 组件 | 作用 |
|---|---|
| `hooks/hooks.json` | 注册 PostToolUse hook，每次 `Skill` 工具调用时触发 |
| `hooks/track-skill-usage.sh` | Bash 版 hook（Linux/Mac）：追加一行 JSON 到 `~/.claude/skill-usage.jsonl` |
| `hooks/track-skill-usage.ps1` | PowerShell 版 hook（Windows）：同上 |
| `scripts/analyze-skill-usage` | Python3 CLI，用于查询日志 |
| `skills/skill-usage-tracker/SKILL.md` | 教 Claude 如何运行 CLI 并展示结果 |

## 日志格式

`~/.claude/skill-usage.jsonl` 中每行一条：

```json
{"time":"2026-06-25T05:00:00Z","skill":"agent-reach","session":"abc123"}
```

`time` = ISO 时间戳，`skill` = skill 名称，`session` = 会话 ID。

## 依赖

- 支持插件的 Claude Code
- Python 3.6+（分析工具用）
- bash 或 PowerShell（hook 用）

## 许可证

MIT
