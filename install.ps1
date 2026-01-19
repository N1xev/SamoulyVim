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

Write-Host "[REPO] Setting up SamoulyVim config..." -ForegroundColor Magenta

$ConfigDir = "$env:LOCALAPPDATA\nvim"
$RepoUrl = "https://github.com/N1xev/SamoulyVim.git"

if (Test-Path $ConfigDir) {
    Write-Host "[WARN] Config directory $ConfigDir already exists." -ForegroundColor Yellow
    $BackupChoice = Read-Host "Do you want to create a backup? (y/n)"
    if ($BackupChoice -match "^[Yy]$") {
        $BackupDir = "${ConfigDir}_backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
        Write-Host "  Creating backup to $BackupDir..." -ForegroundColor Blue
        Copy-Item -Path $ConfigDir -Destination $BackupDir -Recurse -Force
        if ($?) {
            Write-Host "  [OK] Backup created" -ForegroundColor Green
        } else {
            Write-Host "  [ERROR] Failed to create backup" -ForegroundColor Red
            exit 1
        }
    }
    if (Test-Path "$ConfigDir\.git") {
        Write-Host "  Updating existing repo..." -ForegroundColor Blue
        Push-Location $ConfigDir
        git pull
        if ($?) {
            Pop-Location
        } else {
            Write-Host "  [ERROR] Failed to update repo" -ForegroundColor Red
            Pop-Location
            exit 1
        }
    } else {
        Write-Host "  Removing existing directory and cloning..." -ForegroundColor Blue
        Remove-Item -Path $ConfigDir -Recurse -Force
        git clone $RepoUrl $ConfigDir
        if (-not $?) {
            Write-Host "  [ERROR] Failed to clone repo" -ForegroundColor Red
            exit 1
        }
    }
} else {
    Write-Host "  Cloning SamoulyVim..." -ForegroundColor Blue
    git clone $RepoUrl $ConfigDir
    if (-not $?) {
        Write-Host "  [ERROR] Failed to clone repo" -ForegroundColor Red
        exit 1
    }
}

Write-Host "[DONE] SamoulyVim config ready! Run 'nvim' to start." -ForegroundColor Green
