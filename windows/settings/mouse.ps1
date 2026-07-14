Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# Disable "Enhance pointer precision" (Windows mouse acceleration) for the current user.
$mouseKey = 'HKCU:\Control Panel\Mouse'

Set-ItemProperty -Path $mouseKey -Name 'MouseSpeed' -Value '0'
Set-ItemProperty -Path $mouseKey -Name 'MouseThreshold1' -Value '0'
Set-ItemProperty -Path $mouseKey -Name 'MouseThreshold2' -Value '0'

Write-Host 'Mouse acceleration has been disabled for the current user.' -ForegroundColor Green
