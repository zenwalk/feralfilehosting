#!/bin/bash
# Install Subsonic
# Bobtentpeg 01/30/2013

mkdir -p  ~/private/subsonic/transcode && mkdir ~/private/subsonic/playlists && mkdir ~/private/subsonic/Podcasts  >/dev/null
cd ~/private/subsonic
wget -q http://sourceforge.net/projects/subsonic/files/subsonic/4.7/subsonic-4.7-standalone.tar.gz -O ~/private/subsonic/subsonic.tar.gz >/dev/null
tar -xf ~/private/subsonic/subsonic.tar.gz
wget https://bitbucket.org/feralhosting/feralfiles/src/0763d7bb800b2f567f7634f6b1c3f0d9386b1cdc/subsonic/ffmpeg/ffmpeg.static.64bit.2013-04-14.tar.gz -O ~/private/subsonic/transcode/ffmpeg.tar.gz >/dev/null
tar -xf ~/private/subsonic/transcode/ffmpeg.tar.gz -C ~/private/subsonic/transcode/
cp /usr/local/bin/lame ~/private/subsonic/transcode/
cp /usr/bin/flac ~/private/subsonic/transcode/ 
sed 's|SUBSONIC_HOME=/var/subsonic|SUBSONIC_HOME=~/private/subsonic|g' ~/private/subsonic/subsonic.sh -i
subhost=$(hostname -i)
sed "s/0.0.0.0/$subhost/g" ~/private/subsonic/subsonic.sh -i
http=$(shuf -i 6000-50000 -n 1)
https=`expr 1 + $http`
sed "s/4040/$http/g" ~/private/subsonic/subsonic.sh -i
sed "s/PORT=0/PORT=$https/g" ~/private/subsonic/subsonic.sh -i
bash ~/private/subsonic/subsonic.sh
echo Accessible at https://$(hostname):$https

