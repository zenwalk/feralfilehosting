#!/bin/bash
# multi rtorrent/rutorrent
scriptversion="1.0.0"
scriptname="multirtru"
# Author name
#
# wget -qO ~/multirtru.sh http://git.io/m_dugQ && bash ~/multirtru.sh
#
############################
## Version History Starts ##
############################
#
# How do I customise this updater? 
# 1: scriptversion="0.0.0" replace "0.0.0" with your script version. This will be shown to the user at the current version.
# 2: scriptname="multirtru" replace "multirtru" with your script name. this will be shown to the user when they first run the script.
# 3: Search and replace all instances of "multirtru", 29 including this one, with the name of your script, do not include the .sh aside from doing step 2.
# 4: Then replace ALL "https://raw.github.com/feralhosting" with the URL to the RAW script URL.
# 5: Insert you script in the "Script goes here" labelled section 
#
# This updater deals with updating two files at the same time, the  "~/multirtru.sh" and the "~/bin/multirtru" . You can remove one part of the updater, if you wish, to focus on a single file instance.
#
############################
### Version History Ends ###
############################
#
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
#### Self Updater Start ####
############################
#
mkdir -p $HOME/bin
#
if [ ! -f $HOME/multirtru.sh ]
then
    wget -qO $HOME/multirtru.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Multiple%20instances%20-%20rtorrent%20and%20rutorrent/script/multirtru.sh
fi
if [ ! -f $HOME/bin/multirtru ]
then
    wget -qO $HOME/bin/multirtru https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Multiple%20instances%20-%20rtorrent%20and%20rutorrent/script/multirtru.sh
fi
#
wget -qO $HOME/000multirtru.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Multiple%20instances%20-%20rtorrent%20and%20rutorrent/script/multirtru.sh
#
if ! diff -q $HOME/000multirtru.sh $HOME/multirtru.sh > /dev/null 2>&1
then
    echo '#!/bin/bash
    wget -qO $HOME/multirtru.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Multiple%20instances%20-%20rtorrent%20and%20rutorrent/script/multirtru.sh
    wget -qO $HOME/bin/multirtru https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Multiple%20instances%20-%20rtorrent%20and%20rutorrent/script/multirtru.sh
    bash $HOME/multirtru.sh
    exit 1' > $HOME/111multirtru.sh
    bash $HOME/111multirtru.sh
    exit 1
fi
if ! diff -q $HOME/000multirtru.sh $HOME/bin/multirtru > /dev/null 2>&1
then
    echo '#!/bin/bash
    wget -qO $HOME/multirtru.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Multiple%20instances%20-%20rtorrent%20and%20rutorrent/script/multirtru.sh
    wget -qO $HOME/bin/multirtru https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Multiple%20instances%20-%20rtorrent%20and%20rutorrent/script/multirtru.sh
    bash $HOME/multirtru.sh
    exit 1' > $HOME/222multirtru.sh
    bash $HOME/222multirtru.sh
    exit 1
fi
#
echo
echo -e "Hello $(whoami), you have the latest version of the" "\033[36m""$scriptname""\e[0m" "script. This script version is:" "\033[31m""$scriptversion""\e[0m"
echo
#
rm -f $HOME/000multirtru.sh $HOME/111multirtru.sh $HOME/222multirtru.sh
chmod -f 700 $HOME/bin/multirtru
#
############################
##### Self Updater End #####
############################
#
read -ep "The scripts have been updated, do you wish to continue [y] or exit now [q] : " updatestatus
echo
if [[ $updatestatus =~ ^[Yy]$ ]]
then
#
############################
####### Script Start #######
############################
#
echo -e "To do this we are going to clone the existing set-up and add a suffix to the end of it. For example:"
echo
echo -e "\033[32m""/public_html/rutorrent-1""\e[0m""," "\033[33m""~/.rtorrent-1.rc""\e[0m" "and" "\033[36m""~/private/rutorrent-1""\e[0m"
echo
echo -e "\033[31m""The first thing we need to do is pick a suffix to use:""\e[0m"
read -ep "Please chose a suffix to use for our new rtorrent and rutorrent instances: " suffix
echo
if [[ -z "$suffix" ]]
then
    echo -e "\033[31m""You did not give a suffix to use. Please enter one. The script will restart""\e[0m"
    bash ~/multirtru.sh
    exit 1
else
    if [[ ! -f ~/.rtorrent-$suffix.rc && ! -d ~/private/rutorrent-$suffix && ! -d ~/www/$(whoami).$(hostname)/public_html/rutorrent-$suffix ]]
    then
        # clone the installation
        echo "1: Cloning the installation"
        echo
        cp -f ~/.rtorrent.rc ~/.rtorrent-$suffix.rc
        mkdir -p ~/private/rtorrent-$suffix/data ~/private/rtorrent-$suffix/watch ~/private/rtorrent-$suffix/work
        cp -rf ~/www/$(whoami).$(hostname)/public_html/rutorrent/. ~/www/$(whoami).$(hostname)/public_html/rutorrent-$suffix
        # sed ~/.rtorrent-*.rc
        echo "2 Part 1: Editing the files: rtorrent"
        echo
        sed -i 's|'$HOME'/private/rtorrent|'$HOME'/private/rtorrent-'$suffix'|g' ~/.rtorrent-$suffix.rc
        sed -i 's|/public_html/rutorrent/php/initplugins.php|/public_html/rutorrent-'$suffix'/php/initplugins.php|g' ~/.rtorrent-$suffix.rc
        # sed /rutorrent/
        echo "2 Part 2: Editing the files: rutorrent"
        echo
        sed -i 's|/private/rtorrent/.socket|/private/rtorrent-'$suffix'/.socket|g' ~/www/$(whoami).$(hostname)/public_html/rutorrent-$suffix/conf/config.php
        # create the screen
        echo "3: Creating the screen process"
        echo
        screen -dmS rtorrent-$suffix rtorrent -n -o import=~/.rtorrent-$suffix.rc
        echo "Done. To reattach to this screen type:" 
        echo "screen -r rtorrent-$suffix"
        echo
        exit 1
    else
        echo -e "\033[31m""This particular suffix already exists, try another. The script will restart.""\e[0m"
        bash ~/multirtru.sh
        exit 1
    fi
fi
#
############################
####### Script Ends  #######
############################
#
else
    echo -e "You chose to exit after updating the scripts."
    exit 1
    cd && bash
fi