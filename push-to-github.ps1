# PowerShell script to push WepStore to GitHub
# Make sure you have:
# 1. Git installed
# 2. A GitHub repository created
# 3. Your GitHub repository URL ready

Write-Host "WepStore - GitHub Push Script" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""

# Check if Git is installed
try {
    $gitVersion = git --version
    Write-Host "Git found: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "ERROR: Git is not installed or not in PATH" -ForegroundColor Red
    Write-Host "Please install Git from: https://git-scm.com/download/win" -ForegroundColor Yellow
    exit 1
}

# Check if repository is initialized
if (-not (Test-Path ".git")) {
    Write-Host "Initializing Git repository..." -ForegroundColor Yellow
    git init
    Write-Host "Repository initialized!" -ForegroundColor Green
} else {
    Write-Host "Git repository already initialized" -ForegroundColor Green
}

# Add all files
Write-Host "Staging all files..." -ForegroundColor Yellow
git add .

# Check if there are changes to commit
$status = git status --porcelain
if ($status) {
    Write-Host "Committing changes..." -ForegroundColor Yellow
    git commit -m "Update WepStore: Team images, homepage rearrangement, and social links"
    Write-Host "Changes committed!" -ForegroundColor Green
} else {
    Write-Host "No changes to commit" -ForegroundColor Yellow
}

# Check if remote exists
$remote = git remote get-url origin 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "No remote repository configured." -ForegroundColor Yellow
    Write-Host "Please provide your GitHub repository URL:" -ForegroundColor Cyan
    $repoUrl = Read-Host "GitHub Repository URL (e.g., https://github.com/username/repo.git)"
    
    if ($repoUrl) {
        git remote add origin $repoUrl
        Write-Host "Remote added!" -ForegroundColor Green
    } else {
        Write-Host "No URL provided. Skipping remote setup." -ForegroundColor Yellow
        Write-Host "You can add it later with: git remote add origin <your-repo-url>" -ForegroundColor Cyan
        exit 0
    }
} else {
    Write-Host "Remote repository: $remote" -ForegroundColor Green
}

# Set main branch
Write-Host "Setting main branch..." -ForegroundColor Yellow
git branch -M main 2>$null

# Push to GitHub
Write-Host ""
Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
Write-Host "You may be prompted for your GitHub credentials." -ForegroundColor Cyan
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "Successfully pushed to GitHub! 🎉" -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "Push failed. Please check:" -ForegroundColor Red
    Write-Host "1. Your GitHub credentials are correct" -ForegroundColor Yellow
    Write-Host "2. The repository exists and you have access" -ForegroundColor Yellow
    Write-Host "3. Your internet connection is working" -ForegroundColor Yellow
}
