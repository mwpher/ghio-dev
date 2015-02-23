#!/bin/sh

rm -r public/*
hugo -t hyde-x -d public/
git add public
git commit
git subtree push --prefix=public public master
