# Git Auto-Push Setup for Cursor

This guide helps you set up automatic Git pushing from Cursor.

## Quick Setup

### Option 1: Use the Push Script (Recommended)

Run this command in Cursor's terminal:

```powershell
.\git-push.ps1 "Your commit message here"
```

**Example:**
```powershell
.\git-push.ps1 "Update David Bandoh team image"
```

### Option 2: Enable Auto-Push Hook

The post-commit hook will automatically push after every commit:

1. Make sure Git is installed and in your PATH
2. The hook is already created at `.git/hooks/post-commit`
3. After each commit, it will automatically push to GitHub

### Option 3: Manual Git Commands

If Git is in your PATH, you can use standard Git commands:

```powershell
git add .
git commit -m "Your message"
git push origin main
```

## Installing Git (if needed)

1. Download from: https://git-scm.com/download/win
2. During installation, make sure to select "Add Git to PATH"
3. Restart Cursor after installation

## Adding Git to PATH (if already installed)

1. Find where Git is installed (usually `C:\Program Files\Git\bin`)
2. Add it to your system PATH:
   - Right-click "This PC" → Properties
   - Advanced System Settings → Environment Variables
   - Edit "Path" → Add Git's bin directory
   - Restart Cursor

## Using Cursor's Built-in Git

Cursor has built-in Git support:

1. Open Source Control panel (Ctrl+Shift+G)
2. Stage your changes (+ icon)
3. Write commit message
4. Click "Commit"
5. Click "..." menu → "Push"

## Troubleshooting

**Git not found:**
- Install Git or add to PATH
- Restart Cursor after installation

**Push fails:**
- Check your GitHub credentials
- Use Personal Access Token instead of password
- Or use GitHub Desktop for authentication

**Auto-push hook not working:**
- Make sure `.git/hooks/post-commit` is executable
- On Windows, Git should handle this automatically

## Quick Reference

- **Push script:** `.\git-push.ps1 "message"`
- **Manual push:** `git push origin main`
- **Check status:** `git status`
- **View commits:** `git log --oneline`


