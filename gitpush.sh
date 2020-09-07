#!/bin/bash
echo Pushing to Server
git add .
echo What is the message? use quotes
read MESSAGE
git commit -m "$MESSAGE" -a
git push origin master
