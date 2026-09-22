# Screenshot a local HTML file (or a URL) into a 4:3 PNG for the hub card.
# Usage:  powershell -ExecutionPolicy Bypass -File tools\capture.ps1 -Target work\01-example\index.html -Out thumbs\01-example.png
# Uses Edge or Chrome that is already installed. No extra install needed.
param(
  [Parameter(Mandatory = $true)][string]$Target,
  [Parameter(Mandatory = $true)][string]$Out,
  [int]$Width = 1200,
  [int]$Height = 900
)

$candidates = @(
  "$env:ProgramFiles(x86)\Microsoft\Edge\Application\msedge.exe",
  "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe",
  "$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe",
  "$env:ProgramFiles\Google\Chrome\Application\chrome.exe",
  "${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe",
  "$env:LOCALAPPDATA\Google\Chrome\Application\chrome.exe"
)
$browser = $candidates | Where-Object { Test-Path $_ } | Select-Object -First 1
if (-not $browser) { Write-Error "Edge or Chrome not found."; exit 1 }

if (Test-Path $Target) {
  $uri = "file:///" + ((Resolve-Path $Target).Path -replace '\\', '/')
} else {
  $uri = $Target
}

$outDir = Split-Path -Parent $Out
if ($outDir -and -not (Test-Path $outDir)) { New-Item -ItemType Directory -Force $outDir | Out-Null }
$outFull = Join-Path (Get-Location) $Out
if ([System.IO.Path]::IsPathRooted($Out)) { $outFull = $Out }

& $browser --headless=new --disable-gpu --hide-scrollbars --no-first-run --no-default-browser-check `
  --virtual-time-budget=4000 --window-size="$Width,$Height" --screenshot="$outFull" $uri 2>$null | Out-Null

if (Test-Path $outFull) { Write-Output "saved: $outFull" } else { Write-Error "screenshot failed"; exit 1 }
