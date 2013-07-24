#!/bin/bash
# Install and configure Autodl-irssi and its rutorrent plugin
# Bobtentpeg 
# FeralHosting  || www.feralhosting.com
# Feral Hosting is a small team of individuals working towards managed solutions for a variety of problems focusing on minimal systems that can do more.
# Current version : v1.2.3
# Changelog
# v1.2.3
#   Added disclaimer
# v1.2.2
#   Fixed mv steps, dir struct did in fact change by using the release builds
# v1.2.1
#   Code cleanup (cleaner var names, better structure)...more commenting
# v1.2
#   Updated plugin to community edition, freeleech flag and a few other extras
# v1.1
#   Set the password prompt to tell you not to use spaces, fixed a typo and made sure to set svn to --quiet.
#   Groundwork for version checking
# v1.0.1
#   Finish rutorrent check mechanism -- checks for rutorrent folder in vhost
# v1.0
#   Initial release
echo
echo -e "######################################""\033[33m""DISCLAIMER""\e[0m""#############################################
#############################################################################################
#############################################################################################
### This script is supplied as is, neither I nor FeralHosting take any responsibility for ###
### any problems arising due to usage of this script.  There is no implied or explicit    ###
### warranty and FeralHosting will provide no support for autodl-irssi. If updates and or ###
### revisions to either autodl or its plugin cause this script to break, this script will ###
### be updated at the authors convenience if at all.                                      ###
#############################################################################################
#############################################################################################
#############################################################################################"
echo
read -ep "If you understand the above disclaimer, enter 'yes' to continue: " license
echo
if [[ $license = yes ]]
then
    #checks for rutorrent...see bottom else statement for negative return
    if [ -d ~/www/$(whoami).$(hostname)/public_html/rutorrent/ ]
    then
        echo -e "\033[32m""Installing autodl-irssi and its rutorrent plugin""\e[0m"
        echo
        #Makes the directories for irssi and autodl, as well as make the autodl config file
        mkdir -p ~/.irssi/scripts/autorun ~/.autodl
        #Ask for user to enter their password. 
        #Saves password as $sedpass variable for usage later
        read -ep "Enter Password (No spaces please!): " pass
        echo
        #Shows uers the password they entered
        echo -e "You entered" "\033[32m""$pass""\e[0m" "as your password."
        echo
        #Confirms user password before they start
        read -p "Please confirm this is the password you wish to use [y/n]: " confirm
        echo
        #If they like their chosen password, the script installs autodl. =~ ^[Yy] is matching for Y or y
        if [[ $confirm =~ ^[Yy]$ ]]
        then
            #Please note, the sleep lines are there to artificially slow down the process at some steps 
            #and to allow ample time to give user feedback
            #Downloads the newest  RELEASE version  of the autodl community edition and saves it as a zip file
            #Substitute googlecode link with "https://github.com/autodl-community/autodl-rutorrent/archive/master.zip" for devel
            # Kill any existing processes
            killall -9 irssi -u $(whoami) 2> /dev/null 
            screen -wipe > /dev/null 2>&1
            echo "Downloading autodl-irssi"
            wget -qNO ~/autodl-irssi.zip https://autodl-irssi-community.googlecode.com/files/autodl-irssi-community.zip  2> /dev/null
            echo "autodl-irssi download finished"
            sleep 2
            #Unzips the files downloaded above
            echo "Unzipping"
            unzip -qo ~/autodl-irssi.zip -d ~/.irssi/scripts/ 2> /dev/null
            sleep 2
            echo "Unzipping complete"
            #Moves the files around to their proper homes.  The .pl file is moved to autorun so that autodl 
            #starts automatically when we open irssi
            #the AutodlIrssi folder is moved to scripts  (inside the perl path) so that  its contents can
            #be loaded by irssi when it starts
            echo "Moving files around"
            cp -f ~/.irssi/scripts/autodl-irssi.pl ~/.irssi/scripts/autorun/ 
            rm -f ~/autodl-irssi.zip ~/.irssi/scripts/README* ~/.irssi/scripts/autodl-irssi.pl 
            sleep 2
            #Uses shuf to pick a random port between 6000 and 50000
            port=$(shuf -i 6000-50000 -n 1)
            #cd into your www/.../rutorrent/plugins folder to make paths nicer
            cd ~/www/$(whoami).$(hostname)/public_html/rutorrent/plugins/
            #Downloads the latest version of the autodl-irssi plugin
            echo "Downloading autodl-irssi Rutorrent plugin"
            wget -qNO autodl-rutorrent.zip https://github.com/autodl-community/autodl-rutorrent/archive/master.zip 2> /dev/null
            echo "Plugin download finished"
            unzip -qo autodl-rutorrent.zip
            cp -rf autodl-rutorrent-master/. autodl-irssi
            rm -rf autodl-rutorrent.zip autodl-rutorrent-master
            #Uses echo to make our autodl.cfg config file.  Takes the two perviously made variables, $port and 
            #$sedpass to  populate per user
            echo "Writing configuration files"
            echo -e "[options]\ngui-server-port = $port\ngui-server-password = $pass" > ~/.autodl/autodl.cfg
            #sets of two new variables to make things easier in the echo
            autodlPort='$autodlPort'
            autodlPassword='$autodlPassword'
            #Uses echo to make the config file for the rutorrent plugun.  Uses previously set vars to populate
            echo -e "<?php\n$autodlPort = $port;\n$autodlPassword = \"$pass\";\n?>" > ~/www/$(whoami).$(hostname)/public_html/rutorrent/plugins/autodl-irssi/conf.php
            sleep 3
            echo "Starting your irssi"
            #starts irssi with screen named 'autodl'
            screen -dmS autodl irssi
            sleep 3
            echo "Your autodl-irssi has been started. Please open irssi (screen -r autodl) and configure your IRC servers"
            echo
        #If they dont like it, it restarts the script because Im lazy and I dont feel like writing this properly
        else
            bash ~/installautodl.sh
        fi
    else
        echo -e "\033[31m Install rtorrent/rutorrent first" "\e[0m"
    fi
else
    echo "This installer will now exit"
    sleep 2
    exit 1
fi
