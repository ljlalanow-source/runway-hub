# Screenshot a local HTML file (or a URL) into a PNG for the hub card, optionally cropping a fixed region.
# Usage:
#   powershell -ExecutionPolicy Bypass -File tools\capture.ps1 -Target work\02-x\index.html -Out thumbs\02-x.png
#   Profile card (fixed angle, hero only, 3:2):
#   powershell -ExecutionPolicy Bypass -File tools\capture.ps1 -Target work\01-profile\index.html -Out thumbs\01-profile.png -Width 960 -Height 640 -CropX 24 -CropY 100 -CropW 720 -CropH 480
# Uses Edge or Chrome that is already installed. No extra install needed.
param(
  [Parameter(Mandatory = $true)][string]$Target,
  [Parameter(Mandatory = $true)][string]$Out,
  [int]$Width = 1200,
  [int]$Height = 800,
  [int]$CropX = -1, [int]$CropY = -1, [int]$CropW = 0, [int]$CropH = 0
)

$candidates = @(
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

if (-not (Test-Path $outFull)) { Write-Error "screenshot failed"; exit 1 }

# Optional crop (System.Drawing, built into Windows)
if ($CropW -gt 0 -and $CropH -gt 0) {
  Add-Type -AssemblyName System.Drawing
  $src = [System.Drawing.Image]::FromFile($outFull)
  $x = [Math]::Max(0, $CropX); $y = [Math]::Max(0, $CropY)
  $w = [Math]::Min($CropW, $src.Width - $x); $h = [Math]::Min($CropH, $src.Height - $y)
  $rect = New-Object System.Drawing.Rectangle $x, $y, $w, $h
  $bmp = New-Object System.Drawing.Bitmap $w, $h
  $g = [System.Drawing.Graphics]::FromImage($bmp)
  $g.DrawImage($src, (New-Object System.Drawing.Rectangle 0, 0, $w, $h), $rect, [System.Drawing.GraphicsUnit]::Pixel)
  $g.Dispose(); $src.Dispose()
  $bmp.Save($outFull, [System.Drawing.Imaging.ImageFormat]::Png); $bmp.Dispose()
}

Write-Output "saved: $outFull"
