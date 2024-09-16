#!/bin/bash

# Variables
GITHUB_USERNAME="REDX-at"
REPO_NAME="shell-scripting"
REPO_DESCRIPTION="shell scripting repository"
LOCAL_DIR="/Users/aitaouss/Desktop/shell_scripting"  # Change this to your local repo path

# Prompt for commit message
echo "Enter your commit message:"
read COMMIT_MESSAGE

# Create GitHub repository using GitHub CLI
gh repo create "$GITHUB_USERNAME/$REPO_NAME" --description "$REPO_DESCRIPTION" --public

# Navigate to your local directory
cd "$LOCAL_DIR" || { echo "Directory $LOCAL_DIR not found!"; exit 1; }

# Initialize a new git repository (if not already initialized)
if [ ! -d ".git" ]; then
  git init
fi

touch file_a
# Add the new remote repository
git remote add origin "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"

# Create a temporary file

# Add all files, commit, and push to the new GitHub repository
git add .
git commit -m "$COMMIT_MESSAGE: Added temp_file.txt"
git push -u origin master

# Now delete the temporary file
rm file_a

# # Commit the deletion
# git add .
# git commit -m "$COMMIT_MESSAGE: Deleted temp_file.txt"
# git push
