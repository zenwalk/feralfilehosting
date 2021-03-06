#!/bin/bash
# author: randomessence
# transmission remote gui basic info.sh
# wget -qO ~/info.sh http://git.io/QsfUKA && bash ~/info.sh
if [ -f $HOME/.config/transmission-daemon/settings.json ]
then
    echo
    echo -e "Your hostname is:" "\033[33m""$(hostname)""\e[0m"
    echo -e "Your username is:" "\033[32m""$(whoami)""\e[0m"
    echo -e "Your RPC port is:" "\033[31m""$(sed -rn 's/(.*)"rpc-port":(\s+)(.*),/\3/p' ~/.config/transmission-daemon/settings.json)""\e[0m"
    echo
    echo -e "You can find your password in your" "\033[32m""Account Manager""\e[0m" "on the" "\033[31m""Slot Details""\e[0m" "page for that slot under Transmission"
    echo -e "\033[33m""Your password is the same as the Transmission Web Gui password.""\e[0m"
    echo
else
    echo
    echo -e "You will need to first install Transmission from the" "\033[31m""Install Software""\e[0m" "link in your" "\033[32m""Account Manager" "for this slot"
    echo
fi
exit 1