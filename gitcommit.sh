#!/bin/sh
CURRENT_BRANCH="`git symbolic-ref --short HEAD`"
git add .
git commit -m "`date`"
git push -u origin $CURRENT_BRANCH
# git checkout master
# git pull
# git merge $CURRENT_BRANCH
# git push -u origin master
# git checkout $CURRENT_BRANCH
