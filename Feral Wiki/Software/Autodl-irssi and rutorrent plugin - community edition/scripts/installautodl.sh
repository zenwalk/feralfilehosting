#!/bin/bash
scriptversion="1.2.4"
scriptname="installautodl"
# Install and configure Autodl-irssi and its rutorrent plugin
# Bobtentpeg 
# FeralHosting  || www.feralhosting.com
# Feral Hosting is a small team of individuals working towards managed solutions for a variety of problems focusing on minimal systems that can do more.
# Current version : v1.2.4
# Changelog
#
# v1.2.4
#   merged fix script
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
############################
#### Self Updater Start ####
############################
#
mkdir -p $HOME/bin
#
if [ ! -f $HOME/installautodl.sh ]
then
    wget -qO $HOME/installautodl.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Autodl-irssi%20and%20rutorrent%20plugin%20-%20community%20edition/scripts/installautodl.sh
fi
if [ ! -f $HOME/bin/installautodl ]
then
    wget -qO $HOME/bin/installautodl https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Autodl-irssi%20and%20rutorrent%20plugin%20-%20community%20edition/scripts/installautodl.sh
fi
#
wget -qO $HOME/000installautodl.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Autodl-irssi%20and%20rutorrent%20plugin%20-%20community%20edition/scripts/installautodl.sh
#
if ! diff -q $HOME/000installautodl.sh $HOME/installautodl.sh > /dev/null 2>&1
then
    echo '#!/bin/bash
    wget -qO $HOME/installautodl.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Autodl-irssi%20and%20rutorrent%20plugin%20-%20community%20edition/scripts/installautodl.sh
    wget -qO $HOME/bin/installautodl https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Autodl-irssi%20and%20rutorrent%20plugin%20-%20community%20edition/scripts/installautodl.sh
    bash $HOME/installautodl.sh
    exit 1' > $HOME/111installautodl.sh
    bash $HOME/111installautodl.sh
    exit 1
fi
if ! diff -q $HOME/000installautodl.sh $HOME/bin/installautodl > /dev/null 2>&1
then
    echo '#!/bin/bash
    wget -qO $HOME/installautodl.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Autodl-irssi%20and%20rutorrent%20plugin%20-%20community%20edition/scripts/installautodl.sh
    wget -qO $HOME/bin/installautodl https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Autodl-irssi%20and%20rutorrent%20plugin%20-%20community%20edition/scripts/installautodl.sh
    bash $HOME/installautodl.sh
    exit 1' > $HOME/222installautodl.sh
    bash $HOME/222installautodl.sh
    exit 1
fi
#
echo
echo -e "Hello $(whoami), you have the latest version of the" "\033[36m""$scriptname""\e[0m" "script. This script version is:" "\033[31m""$scriptversion""\e[0m"
echo
#
rm -f $HOME/000installautodl.sh $HOME/111installautodl.sh $HOME/222installautodl.sh
chmod -f 700 $HOME/bin/installautodl
#
############################
##### Self Updater End #####
############################
#
read -ep "The script has been updated, do you wish to continue [y] or exit now [q] : " updatestatus
echo
if [[ $updatestatus =~ ^[Yy]$ ]]
then
#
############################
####### Script Start #######
############################
    #
    echo -e "    ######################################""\033[33m""DISCLAIMER""\e[0m""#############################################
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
                killall -9 -u $(whoami) irssi 2> /dev/null 
                screen -wipe > /dev/null 2>&1
                echo "Downloading autodl-irssi"
                wget -qO ~/autodl-irssi.zip https://autodl-irssi-community.googlecode.com/files/autodl-irssi-community.zip  2> /dev/null
                echo "autodl-irssi download finished"
                #Unzips the files downloaded above
                echo "Unzipping"
                unzip -qo ~/autodl-irssi.zip -d ~/.irssi/scripts/ 2> /dev/null
                echo "Unzipping complete"
                #Moves the files around to their proper homes.  The .pl file is moved to autorun so that autodl 
                #starts automatically when we open irssi
                #the AutodlIrssi folder is moved to scripts  (inside the perl path) so that  its contents can
                #be loaded by irssi when it starts
                echo "Moving files around"
                cp -f ~/.irssi/scripts/autodl-irssi.pl ~/.irssi/scripts/autorun/ 
                rm -f ~/autodl-irssi.zip ~/.irssi/scripts/README* ~/.irssi/scripts/autodl-irssi.pl 
                #Uses shuf to pick a random port between 6000 and 50000
                port=$(shuf -i 6000-50000 -n 1)
                #cd into your www/.../rutorrent/plugins folder to make paths nicer
                cd ~/www/$(whoami).$(hostname)/public_html/rutorrent/plugins/
                #Downloads the latest version of the autodl-irssi plugin
                echo "Downloading autodl-irssi Rutorrent plugin"
                wget -qO autodl-rutorrent.zip https://github.com/autodl-community/autodl-rutorrent/archive/master.zip 2> /dev/null
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
                #If they dont like it, it restarts the script because Im lazy and I dont feel like writing this properly
                echo
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
    # Now we fix it
    echo "Applying the fix script as part of the installation:"
    echo
    if [ -d ~/.irssi/scripts/AutodlIrssi/ ]
    then
        echo -e "\033[33m""Autodl Before""\e[0m"
        echo -e "\033[32m""~/.irssi/scripts/AutodlIrssi/GuiServer.pm =" "\033[31m""$(sed -n "s/use constant LISTEN_ADDRESS => '\(.*\)';/\1/p" ~/.irssi/scripts/AutodlIrssi/GuiServer.pm 2> /dev/null)""\e[0m"
        echo -e "\033[32m""~/.irssi/scripts/AutodlIrssi/MatchedRelease.pm Result 1 =" "\033[31m""$(sed -n 's/\(.*\)$rtAddress = "\(.*\)$rtAddress" if $rtAddress =~ \/^:\\d{1,5}$\/;/\2/p' ~/.irssi/scripts/AutodlIrssi/MatchedRelease.pm 2> /dev/null)""\e[0m"
        echo -e "\033[32m""~/.irssi/scripts/AutodlIrssi/MatchedRelease.pm Result 2 =" "\033[31m""$(sed -n 's/\(.*\)my $scgi = new AutodlIrssi::Scgi($rtAddress, {REMOTE_ADDR => "\(.*\)"});/\2/p' ~/.irssi/scripts/AutodlIrssi/MatchedRelease.pm 2> /dev/null)""\e[0m" 
        echo
        #
        echo -e "\033[31m""Applying some fixes to autodl if needed.""\e[0m"
        echo
        sed -i "s/use constant LISTEN_ADDRESS => '127.0.0.1';/use constant LISTEN_ADDRESS => '10.0.0.1';/g" ~/.irssi/scripts/AutodlIrssi/GuiServer.pm
        sed -i 's|$rtAddress = "127.0.0.1$rtAddress"|$rtAddress = "10.0.0.1$rtAddress"|g' ~/.irssi/scripts/AutodlIrssi/MatchedRelease.pm
        sed -i 's/my $scgi = new AutodlIrssi::Scgi($rtAddress, {REMOTE_ADDR => "127.0.0.1"});/my $scgi = new AutodlIrssi::Scgi($rtAddress, {REMOTE_ADDR => "10.0.0.1"});/g' ~/.irssi/scripts/AutodlIrssi/MatchedRelease.pm
        #
        echo -e "\033[33m""Autodl After""\e[0m"
        echo -e "\033[32m""~/.irssi/scripts/AutodlIrssi/GuiServer.pm =" "\033[31m""$(sed -n "s/use constant LISTEN_ADDRESS => '\(.*\)';/\1/p" ~/.irssi/scripts/AutodlIrssi/GuiServer.pm 2> /dev/null)""\e[0m"
        echo -e "\033[32m""~/.irssi/scripts/AutodlIrssi/MatchedRelease.pm Result 1 =" "\033[31m""$(sed -n 's/\(.*\)$rtAddress = "\(.*\)$rtAddress" if $rtAddress =~ \/^:\\d{1,5}$\/;/\2/p' ~/.irssi/scripts/AutodlIrssi/MatchedRelease.pm 2> /dev/null)""\e[0m"
        echo -e "\033[32m""~/.irssi/scripts/AutodlIrssi/MatchedRelease.pm Result 2 =" "\033[31m""$(sed -n 's/\(.*\)my $scgi = new AutodlIrssi::Scgi($rtAddress, {REMOTE_ADDR => "\(.*\)"});/\2/p' ~/.irssi/scripts/AutodlIrssi/MatchedRelease.pm 2> /dev/null)""\e[0m" 
        echo
    else
        echo -e "\033[36m""~/.irssi/scripts/AutodlIrssi/""\e[0m" "does not exist"
        echo -e "\033[36m""Install autodl using the bash script installer in the FAQ"
        echo
        exit
    fi
    #
    if [ -d ~/www/$(whoami).$(hostname)/public_html/rutorrent/plugins/autodl-irssi/ ]
    then
        echo -e "\033[33m""Autodl-rutorrent Before""\e[0m"
        echo -e "\033[32m""/rutorrent/plugins/autodl-irssi/getConf.php =" "\033[31m""$(sed -n 's/\(.*\)if (\!socket_connect($socket, "\(.*\)", $autodlPort))/\2/p' ~/www/$(whoami).$(hostname)/public_html/rutorrent/plugins/autodl-irssi/getConf.php 2> /dev/null)""\e[0m"
        echo
        #
        echo -e "\033[31m""Applying some fixes to autodl rutorrent plugin if needed.""\e[0m"
        echo
        sed -i 's/if (!socket_connect($socket, "127.0.0.1", $autodlPort))/if (!socket_connect($socket, "10.0.0.1", $autodlPort))/g' ~/www/$(whoami).$(hostname)/public_html/rutorrent/plugins/autodl-irssi/getConf.php
        echo -e "\033[33m""Autodl-rutorrent After""\e[0m"
        echo -e "\033[32m""/rutorrent/plugins/autodl-irssi/getConf.php =" "\033[31m""$(sed -n 's/\(.*\)if (\!socket_connect($socket, "\(.*\)", $autodlPort))/\2/p' ~/www/$(whoami).$(hostname)/public_html/rutorrent/plugins/autodl-irssi/getConf.php 2> /dev/null)""\e[0m"
        echo
    else
        echo -e "\033[36m""~/www/$(whoami).$(hostname)/public_html/rutorrent/plugins/autodl-irssi/""\e[0m" "does not exist"
        echo
        exit 1
    fi
    killall -9 -u $(whoami) irssi 2> /dev/null 
    screen -wipe > /dev/null 2>&1
    screen -dmS autodl irssi
    echo -e "\033[33m""Checking we have started irssi or if there are multiple screens/processes""\e[0m"
    echo
    screen -ls | grep autodl
    echo
    echo -e "Done. Please refresh/reload rutorrent using CTRL + F5 and start using autodl"
    echo
    echo -e "The fix might have to be run each time you update/overwrite the autodl or autodl-rutorrent files."
    echo
    exit 1
    #
else
    echo -e "You chose to exit after updating the scripts."
    exit 1
    cd && bash
fi
############################
####### Script Ends  #######
############################
#