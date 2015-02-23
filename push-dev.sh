#!/bin/sh

rm -r public-test/*
hugo -F -D -t hyde-x -d public-test/
git add public-test
git commit
git subtree push --prefix=public-test test gh-pages
