#!/bin/bash

echo "Start clone $1"
git clone --branch $2 $1 source
cd source
docsite build
git add .
COMMIT_ID=`git rev-parse HEAD`
git commit -m "generate from $COMMIT_ID"