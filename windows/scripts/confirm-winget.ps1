Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$winget = Get-Command winget.exe -ErrorAction SilentlyContinue

if (-not $winget) {
    Write-Warning 'winget was not found. Install or update App Installer from the Microsoft Store before adding packages.'
    return
}

$version = & winget.exe --version
Write-Host "winget is available: $version" -ForegroundColor Green
