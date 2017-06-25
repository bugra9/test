RUN=0
for VAR in $(git log --name-only -n 1 HEAD~1..HEAD)
do
  if [[ $VAR == assets/post/*/[!card_]*[.jpg.jpeg.JPG.JPEG.gif.GIF.png.PNG] ]]; then
    RUN=1
  fi
done

if [[ $RUN == 1 ]]; then
  bash ./install.sh
  
  for VAR in $(git log --name-only -n 1 HEAD~1..HEAD)
  do
    if [[ $VAR == assets/post/*/[!card_]*[.jpg.jpeg.JPG.JPEG.gif.GIF.png.PNG] ]]; then
      bash ./createThumbnail.sh $VAR
    fi
  done
  
else
  echo "No new image found."
fi


sudo apt-get install imagemagick
convert  -resize 1024X768  source.png dest.jpg
convert  -resize 1024X768  source.png dest.jpg
