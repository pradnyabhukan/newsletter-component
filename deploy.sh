#!/usr/bin/env sh

# abort on errors
set -e
npm run build

cd dist

git init
git add -A
git commit -m 'deploy'
git push -f git@github.com:<pradnyabhukan>/<WWC-frontend-friday-task2>.git main:gh-pages

cd -