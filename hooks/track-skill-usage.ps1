$log = "$env:USERPROFILE\.claude\skill-usage.jsonl"
$data = $env:CLAUDE_TOOL_INPUT_JSON | ConvertFrom-Json
$entry = @{t=(Get-Date -Format "o"); s=$data.skill; sid=$env:CLAUDE_SESSION_ID} | ConvertTo-Json -Compress
Add-Content -Path $log -Value $entry
