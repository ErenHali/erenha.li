#!/bin/zsh

cd site

# 1. Ask for the commit message
read -r "message?Enter commit message: "

if [[ -z "$message" ]]; then
    echo "Error: Commit message cannot be empty. Aborting script."
    exit 1
fi

# 2. Stage all your modified/new files in the site
git add .

# 3. Commit and push the site changes
git commit -m "$message"
git push

# Go back to the root folder
cd ..

# 4. Handle the submodule update
git submodule update --remote --merge

# 5. Stage the fact that the 'site' submodule has been updated
git add site

# 6. Commit and push the root folder changes
git commit -m "Update site"
git push