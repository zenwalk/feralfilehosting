
```
mkdir -p ~/private/programs
wget -qNO ~/imagemagick.tar.gz http://www.imagemagick.org/download/ImageMagick.tar.gz
tar -xzf ~/imagemagick.tar.gz
cd ~/ImageMagick-6.8.6-2
./configure --prefix=$HOME/private/programs
make && make install
cd && rm -rf ~/imagemagick.tar.gz ~/ImageMagick-6.8.6-2
```

