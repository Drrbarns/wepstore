# Simple script to push WepStore to GitHub
# Repository: https://github.com/Drrbarns/wepstore.git

$repoUrl = "https://github.com/Drrbarns/wepstore.git"

Write-Host "Pushing WepStore to GitHub..." -ForegroundColor Cyan
Write-Host "Repository: $repoUrl" -ForegroundColor Yellow
Write-Host ""

# Try to find Git
$gitPath = $null
if (Test-Path "C:\Program Files\Git\bin\git.exe") {
    $gitPath = "C:\Program Files\Git\bin\git.exe"
} elseif (Test-Path "C:\Program Files (x86)\Git\bin\git.exe") {
    $gitPath = "C:\Program Files (x86)\Git\bin\git.exe"
} else {
    # Try to use git from PATH
    try {
        $null = Get-Command git -ErrorAction Stop
        $gitPath = "git"
    } catch {
        Write-Host "ERROR: Git is not installed or not in PATH" -ForegroundColor Red
        Write-Host "Please install Git from: https://git-scm.com/download/win" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "After installing Git, run these commands manually:" -ForegroundColor Cyan
        Write-Host "  git init" -ForegroundColor White
        Write-Host "  git add ." -ForegroundColor White
        Write-Host "  git commit -m `"Initial commit: WepStore website`"" -ForegroundColor White
        Write-Host "  git branch -M main" -ForegroundColor White
        Write-Host "  git remote add origin $repoUrl" -ForegroundColor White
        Write-Host "  git push -u origin main" -ForegroundColor White
        exit 1
    }
}

Write-Host "Using Git: $gitPath" -ForegroundColor Green
Write-Host ""

# Initialize repository if needed
if (-not (Test-Path ".git")) {
    Write-Host "Initializing Git repository..." -ForegroundColor Yellow
    & $gitPath init
}

# Add all files
Write-Host "Staging all files..." -ForegroundColor Yellow
& $gitPath add .

# Commit
Write-Host "Committing changes..." -ForegroundColor Yellow
& $gitPath commit -m "Initial commit: WepStore website with all pages, features, and team updates"

# Set main branch
Write-Host "Setting main branch..." -ForegroundColor Yellow
& $gitPath branch -M main

# Check if remote exists
$remoteCheck = & $gitPath remote get-url origin 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "Adding remote repository..." -ForegroundColor Yellow
    & $gitPath remote add origin $repoUrl
} else {
    Write-Host "Remote already exists. Updating..." -ForegroundColor Yellow
    & $gitPath remote set-url origin $repoUrl
}

# Push to GitHub
Write-Host ""
Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
Write-Host "You may be prompted for your GitHub credentials." -ForegroundColor Cyan
& $gitPath push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "Successfully pushed to GitHub! 🎉" -ForegroundColor Green
    Write-Host "View your repository at: $repoUrl" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "Push failed. Please check:" -ForegroundColor Red
    Write-Host "1. Your GitHub credentials are correct" -ForegroundColor Yellow
    Write-Host "2. You have access to the repository" -ForegroundColor Yellow
    Write-Host "3. Your internet connection is working" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "You may need to authenticate. Try:" -ForegroundColor Cyan
    Write-Host "  - Using a Personal Access Token instead of password" -ForegroundColor White
    Write-Host "  - Setting up SSH keys" -ForegroundColor White
}

