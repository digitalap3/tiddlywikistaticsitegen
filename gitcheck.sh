#!/bin/bash
echo Checking with Server
git fetch origin master
git diff origin/master
echo merge or diff as necessary
echo re: git diff master origin/master
echo or
echo re: git merge origin/master
