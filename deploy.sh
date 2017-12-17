#!/bin/bash
if [ $# -eq 0 ]; then
    echo "No commit message supplied"
    exit 1
fi

git stash
git checkout develop
stack exec site rebuild
git fetch --all
git checkout -b master --track origin/master

rsync -a --filter='P _site/'      \
         --filter='P _cache/'     \
         --filter='P .git/'       \
         --filter='P .gitignore'  \
         --filter='P .stack-work' \
         --filter='P deploy.sh'   \
         --delete-excluded        \
         _site/ .

git add -A
git commit -m "$1"
git push origin master
git checkout develop
git branch -D master
git stash pop
