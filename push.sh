#!/bin/sh

build() {
  echo "deneme" > a.txt
}

upload_files() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
  git add .
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
  git push https://${GH_TOKEN}@github.com/bugra9/test.git master
}

build
upload_files