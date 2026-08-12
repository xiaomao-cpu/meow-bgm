#!/bin/sh
set -eu

if [ -z "${GITHUB_REPO:-}" ]; then
  echo "Please set GITHUB_REPO to your GitHub repository URL, e.g."
  echo "  export GITHUB_REPO=https://github.com/yourname/yourrepo.git"
  exit 1
fi

if [ ! -f index.html ]; then
  echo "Error: index.html not found in $(pwd)."
  exit 1
fi

git init

git add .

git commit -m "Deploy soundboard" || true

git branch -M main

git remote remove origin 2>/dev/null || true

git remote add origin "$GITHUB_REPO"

git push -u origin main

echo "Pushed to $GITHUB_REPO"
echo "Enable GitHub Pages for this repository using branch 'main' and folder '/' in GitHub repository settings."
