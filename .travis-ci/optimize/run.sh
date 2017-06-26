RUN=0
for VAR in $(git log --name-only -n 1 HEAD~1..HEAD)
do
  if [[ $VAR == *[.jpg.jpeg.JPG.JPEG.gif.GIF.png.PNG] ]]; then
    echo $VAR
    RUN=1
  fi
done

if [[ $RUN == 1 ]]; then
  echo $(git log --name-only -n 1 HEAD~1..HEAD)
  for VAR in $(git log --name-only -n 1 HEAD~1..HEAD)
  do
    if [[ $VAR == *[.jpg.jpeg.JPG.JPEG] ]]; then
      sudo apt-get install jpegoptim
      jpegoptim ../../$VAR
    elif [[ $VAR == *[.png.PNG] ]]; then
      sudo apt-get install optipng
      optipng ../../$VAR
    fi
  done
  
else
  echo "No image found."
fi
