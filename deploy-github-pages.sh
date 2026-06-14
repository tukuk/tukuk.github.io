#!/bin/bash

set -euo pipefail

repo_url="$1"

if [ -z "$repo_url" ]; then
  echo "Usage: ./deploy-github-pages.sh https://github.com/USERNAME/REPO.git"
  exit 1
fi

git init
git branch -M gh-pages
git add index.html
git commit -m "Deploy Tukuk website"
git remote remove origin 2>/dev/null || true
git remote add origin "$repo_url"
git push -f origin gh-pages
