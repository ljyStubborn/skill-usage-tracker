$log = "$env:USERPROFILE\.claude\skill-usage.jsonl"
$data = $env:CLAUDE_TOOL_INPUT_JSON | ConvertFrom-Json
$entry = @{time=(Get-Date -Format "o"); skill=$data.skill; session=$env:CLAUDE_SESSION_ID} | ConvertTo-Json -Compress
Add-Content -Path $log -Value $entry
