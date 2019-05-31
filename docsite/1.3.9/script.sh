#!/bin/bash

echo "Start clone $1"
git clone --branch $2 $1 source
cd source

ehco "Install npm depdenency"
npm i
docsite build

echo "Start push changes back"
git add .
COMMIT_ID=`git rev-parse HEAD`
git commit -m "generate from $COMMIT_ID"
git push
echo "Done"