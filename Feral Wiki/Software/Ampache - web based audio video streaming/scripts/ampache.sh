#!/bin/bash
# Ampache installer.
# Current Version: 1.0.0
# randomessence
############################
## Version History Starts ##
############################
#
# 1.0.0 Initial Version
#
############################
### Version History Ends ###
############################
#
############################
###### Variable Start ######
############################
#
#
#
############################
####### Variable End #######
############################
#
############################
####### Script Start #######
############################
#
wget -qNO $HOME/ampache.zip https://github.com/ampache/ampache/archive/master.zip
# download the pre patched version
mkdir -p $HOME/www/$(whoami).$(hostname)/public_html/ampache && mkdir -p $HOME/ampache/ffmpeg && mkdir -p $HOME/ampache/log
# make the required directories
unzip -qo $HOME/ampache.zip -d $HOME/www/$(whoami).$(hostname)/public_html && rm -f $HOME/ampache.zip
# unpack the master zip to the public_html directory
cp -fr $HOME/www/$(whoami).$(hostname)/public_html/ampache-master/. $HOME/www/$(whoami).$(hostname)/public_html/ampache
# copy the contents, including hidden files, to /ampache
rm -rf $HOME/www/$(whoami).$(hostname)/public_html/ampache-master
# remove the unpacked ampache-master directory as we no longer need it.
wget -qNO $HOME/ffmpeg.tar.gz  https://bitbucket.org/feralhosting/feralfiles/downloads/ffmpeg.static.64bit.2013-05-22.tar.gz
# download a static binary of ffmpeg
tar -xzf $HOME/ffmpeg.tar.gz -C $HOME/ampache/ffmpeg && rm -f $HOME/ffmpeg.tar.gz
# unpack this to ~/ampache/ffmpeg for use with ampache.
echo "php_value memory_limit 512M" >> $HOME/www/$(whoami).$(hostname)/public_html/ampache/.htaccess && chmod 644 $HOME/www/$(whoami).$(hostname)/public_html/ampache/.htaccess
# change memory limit for ampache in htaccess since it cannot overide it.
echo done downloading and unpacking.
######
sed -i 's/;memory_limit = 32/memory_limit = 512/g' $HOME/www/$(whoami).$(hostname)/public_html/ampache/config/ampache.cfg.php.dist
sed -i 's/;debug = "false"/debug = "true"/g' $HOME/www/$(whoami).$(hostname)/public_html/ampache/config/ampache.cfg.php.dist
sed -i 's|;log_path = "/var/log/ampache"|log_path = "'$HOME'/ampache/log"|g' $HOME/www/$(whoami).$(hostname)/public_html/ampache/config/ampache.cfg.php.dist
sed -i 's/;min_bit_rate = 48/min_bit_rate = 192/g' $HOME/www/$(whoami).$(hostname)/public_html/ampache/config/ampache.cfg.php.dist
echo Change some default settings done
### Change some default settings.
######
sed -i 's|;transcode_cmd = "ffmpeg -i %FILE%"|transcode_cmd = "'$HOME'/ampache/ffmpeg/ffmpeg -i %FILE%\"|g' $HOME/www/$(whoami).$(hostname)/public_html/ampache/config/ampache.cfg.php.dist
echo Change the transcode_cmd to use our custom ffmpeg build done
### Change the transcode_cmd to use our custom ffmpeg build.
######
sed -i 's/;transcode_m4a      = allowed/transcode_m4a = allowed/g' $HOME/www/$(whoami).$(hostname)/public_html/ampache/config/ampache.cfg.php.dist
sed -i 's/;transcode_flac     = required/transcode_flac = required/g' $HOME/www/$(whoami).$(hostname)/public_html/ampache/config/ampache.cfg.php.dist
sed -i 's/;transcode_mp3      = allowed/transcode_mp3 = allowed/g' $HOME/www/$(whoami).$(hostname)/public_html/ampache/config/ampache.cfg.php.dist
sed -i 's/;encode_target = mp3/encode_target = mp3/g' $HOME/www/$(whoami).$(hostname)/public_html/ampache/config/ampache.cfg.php.dist
sed -i 's/;encode_args_mp3 = "-vn -b:a %SAMPLE%K -c:a libmp3lame -f mp3 pipe:1"/encode_args_mp3 = "-vn -b:a %SAMPLE%K -c:a libmp3lame -f mp3 pipe:1"/g' $HOME/www/$(whoami).$(hostname)/public_html/ampache/config/ampache.cfg.php.dist
sed -i 's/;encode_args_ogg = "-vn -b:a %SAMPLE%K -c:a libvorbis -f ogg pipe:1"/encode_args_ogg = "-vn -b:a %SAMPLE%K -c:a libvorbis -f ogg pipe:1"/g' $HOME/www/$(whoami).$(hostname)/public_html/ampache/config/ampache.cfg.php.dist
echo Enable transcoding done
### Enable transcoding.
#
############################
####### Script Ends  #######
############################
#
############################
########## Credit ##########
############################
#
#
#
############################