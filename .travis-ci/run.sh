cd .travis-ci
for VAR in $(find . -maxdepth 1 -type d -name [^\.]\* | sed 's:^\./::')
do
	cd $VAR
	bash run.sh
	cd ..
done

cd ..
git config --global user.email "travis@travis-ci.org"
git config --global user.name "Travis CI"
git add .
git commit --message "Travis build: $TRAVIS_BUILD_NUMBER [skip ci]"
git push https://${GH_TOKEN}@github.com/bugra9/test.git HEAD:master
