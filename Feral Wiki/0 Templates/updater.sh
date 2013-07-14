#!/bin/bash
# Script name
scriptversion="0.0.0"
scriptname="somescript"
# Author name
#
############################
## Version History Starts ##
############################
#
# How do I customise this updater? 
# 1: scriptversion="0.0.0" replace "0.0.0" with your script version. This will be shown to the user at the current version.
# 2: scriptname="somescript" replace "somescript" with your script name. this will be shown to the user when they first run the script.
# 3: Search and replace all instances of "somescript", 29 including this one, with the name of your script, do not include the .sh aside from doing step 2.
# 4: Then replace ALL "https://raw.github.com/feralhosting" with the URL to the RAW script URL.
# 5: Insert you script in the "Script goes here" labelled section 
#
# This updater deals with updating two files at the same time, the  "~/somescript.sh" and the "~/bin/somescript" . You can remove one part of the updater, if you wish, to focus on a single file instance.
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
if [ ! -f $HOME/somescript.sh ]
then
    wget -qNO $HOME/somescript.sh https://raw.github.com/feralhosting
fi
if [ ! -f $HOME/bin/somescript ]
then
    wget -qNO $HOME/bin/somescript https://raw.github.com/feralhosting
fi
#
wget -qNO $HOME/000somescript.sh https://raw.github.com/feralhosting
#
if ! diff -q $HOME/000somescript.sh $HOME/somescript.sh > /dev/null 2>&1
then
    echo '#!/bin/bash
    wget -qNO $HOME/somescript.sh https://raw.github.com/feralhosting
    wget -qNO $HOME/bin/somescript https://raw.github.com/feralhosting
    bash $HOME/somescript.sh
    exit 1' > $HOME/111somescript.sh
    bash $HOME/111somescript.sh
    exit 1
fi
if ! diff -q $HOME/000somescript.sh $HOME/bin/somescript > /dev/null 2>&1
then
    echo '#!/bin/bash
    wget -qNO $HOME/somescript.sh https://raw.github.com/feralhosting
    wget -qNO $HOME/bin/somescript https://raw.github.com/feralhosting
    bash $HOME/somescript.sh
    exit 1' > $HOME/222somescript.sh
    bash $HOME/222somescript.sh
    exit 1
fi
#
echo
echo -e "Hello $(whoami), you have the latest version of the" "\033[36m""$scriptname""\e[0m" "script. This script version is:" "\033[31m""$scriptversion""\e[0m"
echo
#
rm -f $HOME/000somescript.sh $HOME/111somescript.sh $HOME/222somescript.sh
chmod -f 700 $HOME/bin/somescript
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
#
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