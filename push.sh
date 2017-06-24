#!/bin/sh

git config --global user.email "travis@travis-ci.org"
git config --global user.name "Travis CI"
git add .
git commit --message "Travis build: $TRAVIS_BUILD_NUMBER [skip ci]"
git push https://${GH_TOKEN}@github.com/bugra9/test.git HEAD:master
