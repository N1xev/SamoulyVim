param()

Write-Host @"
 ██╗ ██╗     ██╗   ██╗██╗███╗   ███╗   
████████╗    ██║   ██║██║████╗ ████║   
╚██╔═██╔╝    ██║   ██║██║██╔████╔██║   
████████╗    ╚██╗ ██╔╝██║██║╚██╔╝██║   
╚██╔═██╔╝     ╚████╔╝ ██║██║ ╚═╝ ██║██╗
 ╚═╝ ╚═╝       ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝
"@ -ForegroundColor Blue

Write-Host "[START] SamoulyVim Dependency Installer for Windows" -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan

$ErrorActionPreference = "Stop"

$pmCommand = $null
if (Get-Command winget -ErrorAction SilentlyContinue) {
    $pmCommand = "winget install --silent"
    Write-Host "[OK] Detected winget package manager" -ForegroundColor Green
} elseif (Get-Command choco -ErrorAction SilentlyContinue) {
    $pmCommand = "choco install -y"
    Write-Host "[OK] Detected Chocolatey package manager" -ForegroundColor Green
} else {
    Write-Host "[ERROR] No package manager found. Please install winget or Chocolatey." -ForegroundColor Red
    exit 1
}

Write-Host "[PKG] Installing external tools: opencode, ripgrep, fd..." -ForegroundColor Yellow
$externalTools = @("opencode", "ripgrep", "fd")
foreach ($tool in $externalTools) {
    try {
        Invoke-Expression "$pmCommand $tool" | Out-Null
        Write-Host "  [OK] $tool installed" -ForegroundColor Green
    } catch {
        Write-Host "  [ERROR] Failed to install $tool. Please install manually." -ForegroundColor Red
    }
}

$languages = @{
    "Go" = "Go.Go"
    "Rust" = "Rustlang.Rust"
    "Node.js" = "OpenJS.NodeJS"
    "Python" = "Python.Python.3"
}

$selected = @()
Write-Host "[TOOLS] Select languages to install:" -ForegroundColor Magenta
foreach ($lang in $languages.Keys) {
    $choice = Read-Host "  Install $lang? (y/n)"
    if ($choice -match "^[Yy]$") {
        $selected += $lang
    }
}

if ($selected.Count -eq 0) {
    Write-Host "[WARN] No languages selected. Exiting." -ForegroundColor Yellow
    exit 0
}

Write-Host "[PKG] Installing selected languages..." -ForegroundColor Yellow
foreach ($sel in $selected) {
    $pkg = $languages[$sel]
    try {
        Write-Host "  Installing $pkg..." -ForegroundColor Blue
        Invoke-Expression "$pmCommand $pkg" | Out-Null
        Write-Host "  [OK] $sel installed" -ForegroundColor Green
    } catch {
        Write-Host "  [ERROR] Failed to install $sel. Please install manually." -ForegroundColor Red
    }
}

Write-Host "[DONE] Installation complete! Restart your terminal." -ForegroundColor Green
