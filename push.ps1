# Ultra-simple push script - Just run: .\push.ps1
# This will commit all changes and push to GitHub

$msg = if ($args[0]) { $args[0] } else { "Update: WepStore changes" }

Write-Host "🚀 Quick Push to GitHub" -ForegroundColor Cyan
Write-Host ""

# Try to use git from PATH or common locations
$git = $null
foreach ($path in @("git", "C:\Program Files\Git\bin\git.exe", "C:\Program Files\Git\cmd\git.exe")) {
    try {
        if ($path -eq "git") {
            $null = Get-Command git -ErrorAction Stop
            $git = "git"
            break
        } elseif (Test-Path $path) {
            $git = $path
            break
        }
    } catch { continue }
}

if (-not $git) {
    Write-Host "❌ Git not found. Please:" -ForegroundColor Red
    Write-Host "   1. Install Git: https://git-scm.com/download/win" -ForegroundColor Yellow
    Write-Host "   2. Or use GitHub Desktop to push" -ForegroundColor Yellow
    exit 1
}

# Stage, commit, and push
& $git add .
& $git commit -m $msg
& $git push origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ Pushed successfully!" -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "⚠️  Check if you need to set up remote or authenticate" -ForegroundColor Yellow
}


