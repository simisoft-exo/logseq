#!/bin/bash

# Navigate to the Logseq directory
cd /home/simisoft/repos/logseq

# Check for staged changes or unstaged modifications
STAGED=$(git diff --cached --name-only)
UNSTAGED=$(git diff --name-only)
UNTRACKED=$(git ls-files --others --exclude-standard)

# Check if there are any actual changes (staged, unstaged, or untracked)
if [[ -n "$STAGED" ]] || [[ -n "$UNSTAGED" ]] || [[ -n "$UNTRACKED" ]]; then
    # Add all changes
    git add .
    
    # Create commit with timestamp
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
    git commit -m "Auto-commit: $TIMESTAMP"
    
    # Push to GitHub
    git push origin main
    
    echo "Changes committed and pushed at $TIMESTAMP"
else
    echo "No changes to commit at $(date '+%Y-%m-%d %H:%M:%S')"
fi