cd ..
cd ..

DEST=${1/%\//\/card_}
echo $DEST
convert -resize 1024X768 $1 $DEST

cd .travis-ci/thumbnail
