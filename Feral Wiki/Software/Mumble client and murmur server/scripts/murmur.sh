#!/bin/bash
# Script name
scriptversion="1.0.0"
scriptname="murmur"
# Author name
#
# http://git.io/t3fmNQ
#
# How do i customise this updater? 
# 1: scriptversion="0.0.0" replace "0.0.0" with your script version. This will be shown to the user at the current version.
# 2: scriptname="murmur" replace "murmur" with your script name. this will be shown to the user when they first run the script.
# 3: Search and replace all instances of "murmur", 29 including this one, with the name of your script, do not include the .sh aside from doing step 2.
# 4: Then replace ALL "https://raw.github.com/feralhosting/feralfilehosting/master/Feral" with the url to the RAW script URL.
# 5: Insert you script in the "Script goes here" labelled section 
#
# This udpater deals with updating two files at the same time, the  "~/murmur.sh" and the "~/bin/murmur" . You can remove one part of the updater, if you wish, to focus on a single file instance.
#
###### Self Updater Starts
#
mkdir -p $HOME/bin
#
if [ ! -f  $HOME/murmur.sh ]
then
    wget -qNO $HOME/murmur.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/mumble%20client%20and%20murmur%20server/scripts/murmur.sh
fi
if [ ! -f  $HOME/bin/murmur ]
then
    wget -qNO $HOME/bin/murmur https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/mumble%20client%20and%20murmur%20server/scripts/murmur.sh
fi
#
sleep 2
#
wget -qNO $HOME/000murmur.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/mumble%20client%20and%20murmur%20server/scripts/murmur.sh
#
if ! diff -q $HOME/000murmur.sh $HOME/murmur.sh > /dev/null 2>&1
then
    echo '#!/bin/bash
    wget -qNO $HOME/murmur.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/mumble%20client%20and%20murmur%20server/scripts/murmur.sh
    wget -qNO $HOME/bin/murmur https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/mumble%20client%20and%20murmur%20server/scripts/murmur.sh
    bash $HOME/murmur.sh
    exit 1' > $HOME/111murmur.sh
    bash $HOME/111murmur.sh
    exit 1
fi
if ! diff -q $HOME/000murmur.sh $HOME/bin/murmur > /dev/null 2>&1
then
    echo '#!/bin/bash
    wget -qNO $HOME/murmur.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/mumble%20client%20and%20murmur%20server/scripts/murmur.sh
    wget -qNO $HOME/bin/murmur https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/mumble%20client%20and%20murmur%20server/scripts/murmur.sh
    bash $HOME/murmur.sh
    exit 1' > $HOME/222murmur.sh
    bash $HOME/222murmur.sh
    exit 1
fi
#
echo
echo -e "Hello $(whoami), you have the latest version of the" "\033[36m""$scriptname""\e[0m" "script. This script version is:" "\033[31m""$scriptversion""\e[0m"
echo
#
rm -f $HOME/000murmur.sh $HOME/111murmur.sh $HOME/222murmur.sh
chmod -f 700 $HOME/bin/murmur
#
read -ep "The scripts have been updated, do you wish to continue [y] or exit now [q] : " updatestatus
echo
if [[ $updatestatus =~ ^[Yy]$ ]]
then
#
### Self Updater Ends
#
####################
#
echo -e "Downloading and configuring murmur"
echo
wget -qNO ~/server.tar.bz2 http://downloads.sourceforge.net/project/mumble/Mumble/1.2.4/murmur-static_x86-1.2.4.tar.bz2
tar -xjf ~/server.tar.bz2
cp -rf ~/murmur-static_x86-1.2.4/. ~/private/murmur
rm -rf ~/murmur-static_x86-1.2.4 ~/server.tar.bz2
sed -i 's|port=64738|port='$(shuf -i 6000-50000 -n 1)'|g' ~/private/murmur/murmur.ini
echo -e "Here is your murmur server:" "\033[33m""$(hostname)""\e[0m"":""\033[32m""$(sed -n -e 's/port=\(.*\)/\1/p' ~/private/murmur/murmur.ini)""\e[0m"
echo
read -ep "Would you like to set a password to connect to the server now? [y] or skip this step [s]: "  confirm
echo
if [[ $confirm =~ ^[Yy]$ ]]; then
    read -ep "please enter you password: "  mumblepass
    echo
    sed -i 's|serverpassword=|serverpassword='$mumblepass'|g' ~/private/murmur/murmur.ini
fi
~/private/murmur/./murmur.x86 -ini ~/private/murmur/murmur.ini
echo -e "The server has been started."
echo
echo -e "Here is a list of the running servers:"
echo
ps x | grep murmur | grep -v grep
echo
exit 1
#
### Script goes here
#
####################
#
else
	echo -e "You chose to exit after updating the scripts."
	exit 1
	cd && bash
fi
