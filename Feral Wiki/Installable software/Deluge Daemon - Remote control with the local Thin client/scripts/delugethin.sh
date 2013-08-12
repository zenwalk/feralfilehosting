#!/bin/bash
# Script name
scriptversion="0.8.0"
scriptname="delugethin.sh"
# randomessence
#
# How do i customise this updater? Search and replace all instances of "somescript" with the name of your script, do not include the .sh
# The replace all "https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/" with the url to the raw script.
# Insert you script in the "Script goes here" labelled section 
#
###### Self Updater Starts
#
mkdir -p $HOME/bin
#
if [ ! -f  $HOME/delugethin.sh ]
then
    wget -qO $HOME/delugethin.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/Deluge%20Daemon%20-%20Remote%20control%20with%20the%20local%20Thin%20client/scripts/delugethin.sh
fi
if [ ! -f $HOME/bin/delugethin ]
then
    wget -qO $HOME/bin/delugethin https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/Deluge%20Daemon%20-%20Remote%20control%20with%20the%20local%20Thin%20client/scripts/delugethin.sh
fi
#
wget -qO $HOME/000delugethin.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/Deluge%20Daemon%20-%20Remote%20control%20with%20the%20local%20Thin%20client/scripts/delugethin.sh
#
if ! diff -q $HOME/000delugethin.sh $HOME/delugethin.sh > /dev/null 2>&1
then
	echo '#!/bin/bash
	wget -qO $HOME/delugethin.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/Deluge%20Daemon%20-%20Remote%20control%20with%20the%20local%20Thin%20client/scripts/delugethin.sh
	wget -qO $HOME/bin/delugethin https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/Deluge%20Daemon%20-%20Remote%20control%20with%20the%20local%20Thin%20client/scripts/delugethin.sh
	bash $HOME/delugethin.sh
	exit 1' > $HOME/111delugethin.sh
	bash $HOME/111delugethin.sh
	exit 1
fi
if ! diff -q $HOME/000delugethin.sh $HOME/bin/delugethin > /dev/null 2>&1
then
	echo '#!/bin/bash
	wget -qO $HOME/delugethin.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/Deluge%20Daemon%20-%20Remote%20control%20with%20the%20local%20Thin%20client/scripts/delugethin.sh
	wget -qO $HOME/bin/delugethin https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/Deluge%20Daemon%20-%20Remote%20control%20with%20the%20local%20Thin%20client/scripts/delugethin.sh
	bash $HOME/delugethin.sh
	exit 1' > $HOME/222delugethin.sh
	bash $HOME/222delugethin.sh
	exit 1
fi
#
echo
echo -e "Hello $(whoami), you have the latest version of the" "\033[36m""$scriptname""\e[0m" "script. This script version is:" "\033[31m""$scriptversion""\e[0m"
echo
#
rm -f $HOME/000delugethin.sh $HOME/111delugethin.sh $HOME/222delugethin.sh
chmod -f 700 $HOME/bin/delugethin
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
# Is it installed?
if [ -f ~/.config/deluge/core.conf ]
then
# Get hostname
echo -e "Your hostname is:" "\033[32m""$(hostname)""\e[0m"
# Get port
echo -e "Your daemon port for the thin client is:" "\033[31m""$(sed -n -e 's/  "daemon_port": \(.*\),/\1/p' ~/.config/deluge/core.conf)""\e[0m"
# Get username
echo -e "Your username is:" "\033[33m""$(whoami)""\e[0m"
# Get Password
echo -e "Your password for the thin client is:" "\033[32m""$(cat ~/.config/deluge/auth | grep $(whoami) | cut -d\:  -f2)""\e[0m"
# Enable remote connections
sed -i 's|"allow_remote": false|"allow_remote": true|g' ~/.config/deluge/core.conf
# kill deluge and the web gui
killall -9 -u $(whoami) deluged deluge-web
# restart it.
deluged && deluge-web --fork
else
echo -e "\033[31m""Deluge is not installed""\e[0m" "or the" "\033[36m""~/.config/deluge/core.conf""\e[0m" "is missing. Please install it via the software page in your manager first.""\e[0m"
echo
exit 1
fi
#
####################
#
else
	echo -e "You chose to exit after updating the scripts."
	echo
	exit 1
	cd && bash
fi