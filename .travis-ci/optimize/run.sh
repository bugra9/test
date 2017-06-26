echo $(git diff-tree --no-commit-id --name-only -r HEAD~1..HEAD)
echo $(git diff-tree --no-commit-id --name-status -r HEAD~1..HEAD)
RUN=0
for VAR in $(git diff-tree --no-commit-id --name-only -r HEAD~1..HEAD)
do
  if [[ $VAR == *[.jpg.jpeg.JPG.JPEG.gif.GIF.png.PNG] ]]; then
    echo $VAR
    RUN=1
  fi
done

if [[ $RUN == 1 ]]; then
  echo $(git diff-tree --no-commit-id --name-only -r HEAD~1..HEAD)
  for VAR in $(git diff-tree --no-commit-id --name-only -r HEAD~1..HEAD)
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
