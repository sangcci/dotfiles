[CmdletBinding()]
param(
    [switch]$SkipMouse
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$scriptRoot = $PSScriptRoot

Write-Host 'Applying Windows host configuration...' -ForegroundColor Cyan

& (Join-Path $scriptRoot 'scripts/confirm-winget.ps1')

if (-not $SkipMouse) {
    & (Join-Path $scriptRoot 'settings/mouse.ps1')
}

& (Join-Path $scriptRoot 'settings/ui.ps1')

Write-Host ''
Write-Host 'Windows host configuration completed.' -ForegroundColor Green
Write-Host 'Sign out and sign back in (or restart) to apply all UI settings.' -ForegroundColor Yellow
