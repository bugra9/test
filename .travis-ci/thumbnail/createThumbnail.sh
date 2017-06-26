cd ..
cd ..

DEST=$(sed -i -- 's/assets\/post\/(.*)\/(.*)/assets\/post\/(.*)\/card_\2/g' $1)
echo $DEST
convert -resize 1024X768 $1 $DEST

cd .travis-ci/thumbnail
