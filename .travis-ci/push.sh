for VAR in $(find . -maxdepth 1 -type d -name [^\.]\* | sed 's:^\./::')
do
	echo ${VAR}
done

git push https://${GH_TOKEN}@github.com/bugra9/test.git HEAD:master
