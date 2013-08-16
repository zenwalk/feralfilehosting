#!/bin/bash
# multi rtorrent/rutorrent
scriptversion="1.0.2"
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
echo -e "\033[31m""This script will create a new rutorrent and rtorrent instance using a suffix, for example:""\e[0m"
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
        echo -e "\033[31m""1:""\e[0m" "Creating the installation"
        echo
        # Create some folders we need
        mkdir -p ~/private/rtorrent-$suffix/data ~/private/rtorrent-$suffix/watch ~/private/rtorrent-$suffix/work
        # Copy the Feral rutorrent template
        cp -rf /opt/rutorrent/current/. ~/www/$(whoami).$(hostname)/public_html/rutorrent-$suffix
        # Download and install the Feral stats plugin
        wget -qO ~/www/$(whoami).$(hostname)/public_html/rutorrent-$suffix/plugins/feralstats.zip http://git.io/nB1WyA
        unzip -qo ~/www/$(whoami).$(hostname)/public_html/rutorrent-$suffix/plugins/feralstats.zip -d ~/www/$(whoami).$(hostname)/public_html/rutorrent-$suffix/plugins/
        rm -f ~/www/$(whoami).$(hostname)/public_html/rutorrent-$suffix/feralstats.zip
        # Download and install the ratio colour plugin
        wget -qO ~/www/$(whoami).$(hostname)/public_html/rutorrent-$suffix/plugins/ratiocolor.zip http://git.io/5rBXAQ
        unzip -qo ~/www/$(whoami).$(hostname)/public_html/rutorrent-$suffix/plugins/ratiocolor.zip -d ~/www/$(whoami).$(hostname)/public_html/rutorrent-$suffix/plugins/
        rm -f ~/www/$(whoami).$(hostname)/public_html/rutorrent-$suffix/ratiocolor.zip
        # Download and configure the custom .rtorrent.rc
        wget -qO ~/.rtorrent-$suffix.rc http://git.io/oJ5P9w
        #
        # sed custom ~/.rtorrent.rc
        echo -e "\033[31m""2""\e[0m" "\033[32m""Part 1:""\e[0m" "Editing the files: rtorrent"
        echo
        sed -i 's|/media/DiskID/home/username/private/rtorrent/|'$HOME'/private/rtorrent-'$suffix'/|g' ~/.rtorrent-$suffix.rc
        sed -i 's|/media/DiskID/home/username/www/username.server.feralhosting.com/public_html/rutorrent/php/initplugins.php username|'$HOME'/www/'$(whoami)'.'$(hostname)'/public_html/rutorrent-'$suffix'/php/initplugins.php '$(whoami)'|g' ~/.rtorrent-$suffix.rc
        # sed /rutorrent/
        echo -e "\033[31m""2""\e[0m" "\033[33m""Part 2:""\e[0m" "Editing the files: rutorrent"
        echo
        sed -i 's|/private/rtorrent/.socket|/private/rtorrent-'$suffix'/.socket|g' ~/www/$(whoami).$(hostname)/public_html/rutorrent-$suffix/conf/config.php
        # Password protect the setup
        echo -e "\033[31m""3:""\e[0m" "Password Protect the Installation"
        echo
        echo -e 'AuthType Basic\nAuthName "rtorrent-'$suffix'"\nAuthUserFile "'$HOME'/www/'$(whoami)'.'$(hostname)'/public_html/rutorrent-'$suffix'/.htpasswd"\nRequire valid-user' > ~/www/$(whoami).$(hostname)/public_html/rutorrent-$suffix/.htaccess
        read -ep "Please give me a username for the user we are creating: " username
        echo
        if [[ -n "$username" ]]
        then
            echo -e "You entered" "\033[32m""$username""\e[0m" "as the choice of username"
            echo
            htpasswd -cm ~/www/$(whoami).$(hostname)/public_html/rutorrent-$suffix/.htpasswd $username
        else
            echo -e "No username was give so i am using a generic username which is:" "\033[32m""rutorrent-$suffix""\e[0m"
            echo
            htpasswd -cm ~/www/$(whoami).$(hostname)/public_html/rutorrent-$suffix/.htpasswd rutorrent-$suffix
        fi
        echo
        echo -e "\033[31m""You can use the htpasswdtk script to manage these installations.""\e[0m"
        chmod 644 ~/www/$(whoami).$(hostname)/public_html/rutorrent-$suffix/.htaccess ~/www/$(whoami).$(hostname)/public_html/rutorrent-$suffix/.htpasswd
        echo
        # create the screen
        echo -e "\033[32m""4:""\e[0m" "Creating the screen process"
        screen -fa -dmS rtorrent-$suffix rtorrent -n -o import=~/.rtorrent-$suffix.rc
        echo 'screen -fa -dmS rtorrent-'$suffix' rtorrent -n -o import=~/.rtorrent-'$suffix'.rc' >> ~/multirtru.restart.txt
        echo
        echo -e "\033[32m""This command was added to""\e[0m" "\033[36m""~/multirtru.restart.txt""\e[0m" "\033[32m""so you can easily restart this instance""\e[0m"
        echo "To reattach to this screen type:"
        echo
        echo -e "\033[33m""screen -r rtorrent-$suffix""\e[0m"
        echo
        echo "Is it running?"
        echo
        screen -ls | grep rtorrent-$suffix
        echo
        if [[ -n "$username" ]]
        then
            echo -e "The username for this instance is:" "\033[32m""$username""\e[0m"
            echo
        else
            echo -e "The username for this instance is:" "\033[32m""rutorrent-$suffix""\e[0m"
            echo
        fi
        echo -e "The URL is:" "\033[32m""https://$(hostname)/$(whoami)/rutorrent-$suffix""\e[0m"
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