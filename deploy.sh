#!/bin/bash

# The Pollinator's Return - Deployment Script
# Run this from the pollinator-showcase directory

echo "🐝 THE POLLINATOR'S RETURN - Deployment Script"
echo "================================================"
echo ""

# Check if we're in the right directory
if [ ! -f "index.html" ]; then
    echo "❌ Error: index.html not found."
    echo "Please run this script from the pollinator-showcase directory."
    exit 1
fi

# Get GitHub username
echo "Enter your GitHub username:"
read github_username

if [ -z "$github_username" ]; then
    echo "❌ GitHub username cannot be empty."
    exit 1
fi

# Get repository name (with default)
echo ""
echo "Enter repository name [default: pollinator-showcase]:"
read repo_name

if [ -z "$repo_name" ]; then
    repo_name="pollinator-showcase"
fi

echo ""
echo "📋 Configuration:"
echo "   GitHub User: $github_username"
echo "   Repo Name: $repo_name"
echo ""
echo "⚠️  Make sure you've created the repository on GitHub first!"
echo "   Visit: https://github.com/new"
echo ""
echo "Press Enter to continue, or Ctrl+C to cancel..."
read

# Initialize git if not already done
if [ ! -d ".git" ]; then
    echo ""
    echo "📦 Initializing git repository..."
    git init
    echo "✅ Git initialized"
else
    echo ""
    echo "📦 Git repository already exists"
fi

# Add all files
echo ""
echo "📦 Adding files..."
git add .
echo "✅ Files added"

# Commit
echo ""
echo "📦 Creating initial commit..."
git commit -m "Initial commit: The Pollinator's Return showcase"
echo "✅ Commit created"

# Set main branch
echo ""
echo "📦 Setting main branch..."
git branch -M main
echo "✅ Branch set to main"

# Add remote
echo ""
echo "📦 Adding remote repository..."
git remote add origin "https://github.com/$github_username/$repo_name.git"
echo "✅ Remote added"

# Push
echo ""
echo "📦 Pushing to GitHub..."
echo ""
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Successfully deployed!"
    echo ""
    echo "🎉 Next steps:"
    echo ""
    echo "1. Enable GitHub Pages:"
    echo "   → Go to: https://github.com/$github_username/$repo_name/settings/pages"
    echo "   → Source: Deploy from 'main' branch, '/ (root)' folder"
    echo "   → Save"
    echo ""
    echo "2. Your site will be live at:"
    echo "   → https://$github_username.github.io/$repo_name"
    echo ""
    echo "3. (Optional) Configure custom domain:"
    echo "   → Add CNAME record in your DNS"
    echo "   → Enable in GitHub Pages settings"
    echo ""
    echo "4. Wait 2-3 minutes, then visit your site!"
    echo ""
    echo "📚 Full documentation in README.md and QUICKSTART.md"
    echo ""
else
    echo ""
    echo "❌ Push failed. Common issues:"
    echo "   • Repository doesn't exist on GitHub"
    echo "   • Authentication failed (check credentials)"
    echo "   • Repository already has content (use git push -f origin main)"
    echo ""
    echo "Visit: https://github.com/$github_username/$repo_name"
    echo ""
fi
