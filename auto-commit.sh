#!/bin/bash

# Navigate to the Logseq directory
cd /home/simisoft/repos/logseq

# Check if there are any changes
if [[ -n $(git status --porcelain) ]]; then
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