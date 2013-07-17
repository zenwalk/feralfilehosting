#!/bin/bash
# Autodl change ports and pass
port=$(shuf -i 6000-50000 -n 1)
read -ep "Enter Password (No spaces please!): " pass
echo
echo -e "You entered" "\033[32m""$pass""\e[0m" "as your password."
echo
read -p "Please confirm this is the password you wish to use [y/n]: " confirm
echo
if [[ $confirm =~ ^[Yy]$ ]]
then
    if [[ -f ~/.autodl/autodl.cfg ]]
    then
        echo -e "[options]\ngui-server-port = $port\ngui-server-password = $pass" > ~/.autodl/autodl.cfg
    else
        echo -e "\033[36m""autodl.cfg""\e[0m" "does not exist, please install autodl irssi using the bash script first."
    fi
    if [[ -f ~/www/$(whoami).$(hostname)/public_html/rutorrent/plugins/autodl-irssi/conf.php ]]
    then
        echo -e "<?php\n\$autodlPort = $port;\n\$autodlPassword = \"$pass\";\n?>" > ~/www/$(whoami).$(hostname)/public_html/rutorrent/plugins/autodl-irssi/conf.php
    else
        echo -e "\033[36m""conf.php""\e[0m" "does not exist, please install autodl irssi using the bash script first."
    fi
else
    bash ~/autodlport.sh
fi
killall -9 irssi -u $(whoami) 2> /dev/null 
screen -wipe > /dev/null 2>&1
screen -dmS autodl irssi
echo "The port and password have been updated. Attach to the running screen using this command:"
echo "screen -r autodl"