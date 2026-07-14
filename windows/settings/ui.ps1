Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Set-CurrentUserDword {
    param(
        [Parameter(Mandatory)]
        [string]$Path,

        [Parameter(Mandatory)]
        [string]$Name,

        [Parameter(Mandatory)]
        [int]$Value
    )

    New-Item -Path $Path -Force | Out-Null
    New-ItemProperty -Path $Path -Name $Name -PropertyType DWord -Value $Value -Force | Out-Null
}

# Make file extensions visible in File Explorer.
$explorerAdvanced = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
Set-CurrentUserDword -Path $explorerAdvanced -Name 'HideFileExt' -Value 0

# Remove Task View and Widgets from the taskbar. This hides them; it does not uninstall packages.
Set-CurrentUserDword -Path $explorerAdvanced -Name 'ShowTaskViewButton' -Value 0
Set-CurrentUserDword -Path $explorerAdvanced -Name 'TaskbarDa' -Value 0

# Reduce Start menu noise and prevent web suggestions in its search results.
Set-CurrentUserDword -Path $explorerAdvanced -Name 'Start_IrisRecommendations' -Value 0
Set-CurrentUserDword -Path 'HKCU:\Software\Policies\Microsoft\Windows\Explorer' -Name 'DisableSearchBoxSuggestions' -Value 1

# Restore the classic Windows context menu. The empty InprocServer32 default value is intentional.
$classId = 'HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32'
New-Item -Path $classId -Force | Out-Null
Set-Item -Path $classId -Value ''

# Disable minimize/maximize window animations.
New-Item -Path 'HKCU:\Control Panel\Desktop\WindowMetrics' -Force | Out-Null
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\WindowMetrics' -Name 'MinAnimate' -Value '0'

Write-Host 'Windows UI preferences have been applied for the current user.' -ForegroundColor Green
Write-Host 'Sign out and sign back in (or restart) to refresh Explorer and apply every change.' -ForegroundColor Yellow
