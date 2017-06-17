#!/bin/bash


# you can replace $HOME with any dir
sed -i 's@\$TEXLIVEHOME@'"$HOME"'@' texlive.profile
wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
tar zxf install-tl-unx.tar.gz
./install-tl*/install-tl -profile texlive.profile

# texlive.tar.gz is a portable and full TeXLive package
tar zcf texlive.tar.gz -C $HOME texlive

# symlink TeXLive executables to /usr/local/bin/
sudo $HOME/texlive/bin/x86_64-linux/tlmgr path add

# inform apt that all TeXLive dependencies are satisfied
sudo apt-get install equivs
wget https://github.com/scottkosty/install-tl-ubuntu/raw/master/debian-control-texlive-in.txt
equivs-build debian-control-texlive-in.txt
sudo dpkg -i texlive-local*.deb



# sudo apt install pandoc texlive-xetex texlive-lang-european

mkdir temp
cp _posts/$1* temp/

FILES=./temp/*
latexTemplate="_pdf.latex"
mainFont="Ubuntu"
lang="turkish"
for f in $FILES
do
  echo "Processing $f file..."
  f2=$(cat $f | grep -m 1 'permalink:' | awk '{print $2}' | sed 's/\r//g;s/\"//g')
  fo="assets/post/$f2/$f2.pdf"

  sed -i -- 's/{{ site.assetsDir }}{{ page.permalink }}/assets\/post\/'$f2'/g' $f
  
  pandoc -f markdown+hard_line_breaks -s --template=$latexTemplate  --variable mainfont="$mainFont" --latex-engine=xelatex --toc  $f -o $fo --chapters  -V documentclass=report --listings --variable lang=$lang --variable babel-lang=$lang --variable polyglossia-lang=$lang -N
done

rm -r temp
