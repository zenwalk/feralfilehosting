#!/bin/bash
# Wordpress
# Current Version: 1.0.1
# randomessence
############################
## Version History Starts ##
############################
#
# 1.0.0 not much to it really.
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
echo -e "Copying to ~/bin and making excutable"
mkdir -p $HOME/bin
wget -qNO $HOME/bin/wordpress https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Worpress/scripts/wordpress.sh
chmod -f 700 $HOME/bin/wordpress
echo -e "Done"
#
if [ ! -d $HOME/www/$(whoami).$(hostname)/public_html/wordpress ]
then
    echo -e "Downloading and extracting latest version to: $(whoami).$(hostname)/wordpress"
    echo
    echo "and (they are the same physical location):"
    echo
    echo -e "$(hostname)/$(whoami)/wordpress"
    echo
    wget -qNO $HOME/latest.tar.gz http://wordpress.org/latest.tar.gz
    tar -xzf $HOME/latest.tar.gz -C $HOME/www/$(whoami).$(hostname)/public_html
    rm -f $HOME/latest.tar.gz
    echo -e "Done: Visit your WWW/wordpress to complete the installaion."
else
    echo -e "The wordpress directory already exists."
    read -ep "Do you want to overwrite it anyway? [y] yes or [n] no : " confirm
    echo
    if [[ $confirm =~ ^[Yy]$ ]]
    then
        echo -e "Downloading and extracting latest version to:"
        echo
        echo -e "\033[32m""$(whoami).$(hostname)/wordpress""\e[0m"
        echo "and (they are the same physical location)"
        echo -e "\033[33m""$(hostname)/$(whoami)/wordpress""\e[0m"
        wget -qNO $HOME/latest.tar.gz http://wordpress.org/latest.tar.gz
        tar -xzf $HOME/latest.tar.gz -C $HOME/www/$(whoami).$(hostname)/public_html
        rm -f $HOME/latest.tar.gz
        echo -e "Done: Visit your WWW/wordpress to complete the installaion."
    fi
fi
cd && bash
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