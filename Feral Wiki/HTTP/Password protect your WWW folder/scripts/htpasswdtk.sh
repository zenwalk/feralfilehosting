#!/bin/bash
# htpasswd user and password toolkit
scriptversion="1.1.0"
# randomessence
############################
## Version History Starts ##
############################
#
# 0.0.1 Initial Version
# 0.5.0 Main options created and refined producing a usable script.
# 0.6.0
# 0.7.0
# 1.0.0 A working and functional script.
# 1.0.1 wgets itself and puts it in the ~/bin with 700. Added files exist checks for all htpasswd calls. Cosmetics
# 1.0.2 Better checks for option 1 with explanations on htaccess
# 1.0.3 Updater included.
# 1.0.4 nginx /links and apache /links options added
# 1.0.5 multi rtorrent/rutorrent options
# 1.1.0 Changes to Authname generation to avoid conflict or allow single login
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
###### Self Updater Starts
#
mkdir -p $HOME/bin
#
if [ ! -f ~/htpasswdtk.sh ]
then
    wget -qO $HOME/htpasswdtk.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/scripts/htpasswdtk.sh
fi
if [ ! -f ~/bin/htpasswdtk ]
then
    wget -qO $HOME/bin/htpasswdtk https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/scripts/htpasswdtk.sh
fi
#
wget -qO $HOME/000htpasswdtk.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/scripts/htpasswdtk.sh
#
if ! diff -q $HOME/000htpasswdtk.sh $HOME/htpasswdtk.sh > /dev/null 2>&1
then
    echo '#!/bin/bash
    wget -qO $HOME/htpasswdtk.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/scripts/htpasswdtk.sh
    wget -qO $HOME/bin/htpasswdtk https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/scripts/htpasswdtk.sh
    bash $HOME/htpasswdtk.sh
    exit 1' > $HOME/111htpasswdtk.sh
    bash $HOME/111htpasswdtk.sh
    exit 1
fi
if ! diff -q $HOME/000htpasswdtk.sh $HOME/bin/htpasswdtk > /dev/null 2>&1
then
    echo '#!/bin/bash
    wget -qO $HOME/htpasswdtk.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/scripts/htpasswdtk.sh
    wget -qO $HOME/bin/htpasswdtk https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/scripts/htpasswdtk.sh
    bash $HOME/htpasswdtk.sh
    exit 1' > $HOME/222htpasswdtk.sh
    bash $HOME/222htpasswdtk.sh
    exit 1
fi
#
echo
echo -e "Hello $(whoami), you have the latest version of this script. This script version is:" "\033[31m""$scriptversion""\e[0m"
echo
#
rm -f $HOME/000htpasswdtk.sh $HOME/111htpasswdtk.sh $HOME/222htpasswdtk.sh
chmod -f 700 ~/bin/htpasswdtk
#
### Self Updater Ends
#
###### Start of menu script
read -ep "The scripts have been updated, do you wish to continue [y] or exit now [q] : " updatestatus
echo
if [[ $updatestatus =~ ^[Yy]$ ]]
then
echo -e "\033[32m""Hello $(whoami).""\e[0m" "This is the htpasswd user and password toolkit." "\e[0m"
echo -e "\033[33m""This toolkit is designed to complement the FAQ and it is not a replacement for the FAQ""\e[0m"
echo
#
showMenu () 
{
    echo -e "\033[32m"".htpasswd options section""\e[0m"
    #
    echo -e "\033[31m""1""\e[0m" "Create a new" "\033[36m""~/private/.htpasswd""\e[0m" "and user only""\e[0m"
    #
    echo -e "\033[31m""2""\e[0m" "Create a new" "\033[36m""~/private/.htpasswd""\e[0m" "and user, and/or a .htaccess"
    #
    echo -e "\033[31m""3""\e[0m" "Add a new user or update an existing user in your" "\033[36m""~/private/.htpasswd""\e[0m"
    #
    echo -e "\033[31m""4""\e[0m" "Delete a user from your" "\033[36m""~/private/.htpasswd""\e[0m"
    #
    echo -e "\033[31m""5""\e[0m" "Protect the" "\033[36m""/links""\e[0m" "directory using" "\033[36m""~/private/.htpasswd""\e[0m"
    #   
    echo -e "\033[31m""6""\e[0m" "List" "\033[36m""~/private/.htpasswd""\e[0m" "users and their order"
    #
    echo -e "\033[32m""Rutorrent specific options section""\e[0m"
    #
    echo -e "\033[31m""7""\e[0m" "\033[1;30m""RuTorrent:""\e[0m" "Change the existing Rutorrent .htaccess to use" "\033[36m""~/private/.htpasswd""\e[0m"
    #
    echo -e "\033[31m""8""\e[0m" "\033[1;30m""RuTorrent:""\e[0m" "Add or edit a user in the existing Rutorrent .htpasswd"
    #
    echo -e "\033[31m""9""\e[0m" "\033[1;30m""RuTorrent:""\e[0m" "Delete a user in the existing Rutorrent .htpasswd"
    #
    echo -e "\033[31m""10""\e[0m" "\033[1;30m""RuTorrent:""\e[0m" "Protect the" "\033[36m""/links""\e[0m" "directory using" "\033[36m""/rutorrent/.htpasswd""\e[0m"
    #
    echo -e "\033[31m""11""\e[0m" "\033[1;30m""RuTorrent:""\e[0m" "List" "\033[36m""/rutorrent/.htpasswd""\e[0m" "users and their order"
    #
    echo -e "\033[32m""Other tools section""\e[0m"
    #
    echo -e "\033[31m""12""\e[0m" "Change all" "\033[36m""public_html""\e[0m" ".htaccess to use the" "\033[36m""~/private/.htpasswd""\e[0m" "AuthFile path" "\033[33m""(if present)""\e[0m"
    #
    echo -e "\033[31m""13""\e[0m" "Change all" "\033[36m""public_html""\e[0m" ".htaccess to use the" "\033[36m""/rutorrent/.htpasswd""\e[0m" "AuthFile path" "\033[33m""(if present)""\e[0m"
    #
    echo -e "\033[31m""14""\e[0m" "Change all" "\033[36m""public_html""\e[0m" ".htaccess to use a custom AuthFile path" "\033[33m""(if present)""\e[0m"
    #
    echo -e "\033[32m""Nginx specific options section""\e[0m"
    #
    echo -e "\033[31m""15""\e[0m" "Protect the" "\033[36m""/links""\e[0m" "directory using the" "\033[36m""~/private/.htpasswd""\e[0m"
    #
    echo -e "\033[31m""16""\e[0m" "Protect the" "\033[36m""/links""\e[0m" "directory using the" "\033[36m""/rutorrent/.htpasswd""\e[0m"
    #
    echo -e "\033[32m""Multi Rtorrent/Rutorrent specific options section""\e[0m"
    #
    echo -e "\033[31m""17""\e[0m" "\033[1;30m""Multi Rtorrent/Rutorrent:""\e[0m" "Add or edit a user in the existing Rutorrent .htpasswd"
    #
    echo -e "\033[31m""18""\e[0m" "\033[1;30m""Multi Rtorrent/Rutorrent:""\e[0m" "Delete a user in the existing Rutorrent .htpasswd"
    #
    echo -e "\033[31m""19""\e[0m" "\033[1;30m""Multi Rtorrent/Rutorrent:""\e[0m" "List" "\033[36m""/rutorrent/.htpasswd""\e[0m" "users and their order"
    #
    echo -e "\033[31m""20""\e[0m" "\033[32m""Quit""\e[0m"
}
###
#
###### Start of functions attached to menu items
while [ 1 ]
    do
        showMenu
        echo
        read -ep "Enter the number of the action you wish to complete: " CHOICE
        echo
        case "$CHOICE" in
##########
        "1") # Create a new ~/private/.htpasswd and user only
        if [ ! -f $HOME/private/.htpasswd ]
        then
                echo -e "\033[1;32m""Note: Use a good password manager like keepass so you can easily manage secure passwords." "\e[0m"
                read -ep "What is the username you wish to create?: " username
                htpasswd -cm $HOME/private/.htpasswd $username
                chmod 600 $HOME/private/.htpasswd
                echo "The .htpasswd file was created and the user: $username added"
                sleep 2
        else
            echo -e "\033[31m""The ~/private/.htpasswd exists.""\e[0m"
            read -ep "Do you wish overwrite it? [y] yes or [n] no: " confirm
            if [[ $confirm =~ ^[Yy]$ ]]
            then
                echo -e "\033[1;32m""Note: Use a good password manager like keepass so you can easily manage secure passwords." "\e[0m"
                read -ep "What is the username you wish to create?: " username
                htpasswd -cm $HOME/private/.htpasswd $username
                chmod 600 $HOME/private/.htpasswd
                echo "The .htpasswd file was created and the user: $username added"
                sleep 2
            fi
        fi
        ;;
##########
        "2") # Create a new ~/private/.htpasswd,user and .htaccess.
        if [ ! -f $HOME/private/.htpasswd ]
        then
            echo -e "\033[1;32m""Note: Use a good password manager like keepass so you can easily manage secure passwords." "\e[0m"
            echo -e "\033[33m""Note: This will append/add the settings if a .htaccess already exists in the web server root""\e[0m"
            read -ep "What is the username you wish to create?: " username
            htpasswd -cm $HOME/private/.htpasswd $username
            chmod 644 $HOME/private/.htpasswd
            echo
            echo -e "The" "\033[36m"".htpasswd""\e[0m" "file was created and the user" "\033[32m""$username""\e[0m" "added"
            echo
            # htaccess generation
            echo -e "\033[31m""If no custom location is given then it will be created in the WWW root""\e[0m"
            read -ep "Would you like to create the .htaccess in a specific location? [y] yes or [n] no: " specificloc
            echo
            if [[ $specificloc =~ ^[Yy]$ ]]
            then
                echo -e "\033[32m""This path is relative to your WWW root. For links you would enter this path:""\e[0m" "\033[36m""/links""\e[0m"
                read -ep "Give the name of the folder you with to create the .htaccess in: /" specificlocpath
                echo
                if [[ -d $HOME/www/$(whoami).$(hostname)/public_html/$specificlocpath ]]
                then
                    if [[ -f $HOME/www/$(whoami).$(hostname)/public_html/$specificlocpath/.htaccess ]]
                    then
                        if [[ -z "$(sed -n '/AuthName "Please Login"/p' $HOME/www/$(whoami).$(hostname)/public_html/$specificlocpath/.htaccess)" ]]
                        then
                            echo -e "\n######\nAuthUserFile \"$HOME/private/.htpasswd\"\nAuthGroupFile /dev/null\nAuthName \"Please Login\"\nAuthType Basic\n#####\nRequire valid-user\n####\nSatisfy All\n###" >> $HOME/www/$(whoami).$(hostname)/public_html/$specificlocpath/.htaccess
                            find $HOME/www/$(whoami).$(hostname)/public_html -type f -name ".htaccess" -exec chmod 644 {} \;
                            echo -e "The" "\033[36m"".htaccess""\e[0m" "file was created or updated in" "\033[36m""/$specificlocpath""\e[0m"
                            echo
                            echo -e "\033[32m""To make a directory user specific: Change:""\e[0m" "\033[33m""Require valid-user""\e[0m" "\033[32m""to""\e[0m" "\033[33m""Require user $username""\e[0m"
                            echo
                            sleep 2
                        else
                            echo -e "This" "\033[36m"".htaccess""\e[0m" "already has a Authfile entry."
                            sleep 2
                            echo
                        fi
                    else
                        echo -e "\n######\nAuthUserFile \"$HOME/private/.htpasswd\"\nAuthGroupFile /dev/null\nAuthName \"Please Login\"\nAuthType Basic\n#####\nRequire valid-user\n####\nSatisfy All\n###" >> $HOME/www/$(whoami).$(hostname)/public_html/$specificlocpath/.htaccess
                        find $HOME/www/$(whoami).$(hostname)/public_html -type f -name ".htaccess" -exec chmod 644 {} \;
                        echo -e "The" "\033[36m"".htaccess""\e[0m" "file was created or updated in" "\033[36m""/$specificlocpath""\e[0m"
                        echo
                            echo -e "\033[32m""To make a directory user specific: Change:""\e[0m" "\033[33m""Require valid-user""\e[0m" "\033[32m""to""\e[0m" "\033[33m""Require user $username""\e[0m"
                            echo
                        sleep 2
                    fi
                else
                    echo -e "\033[31m""This location does not exist.""\e[0m" "Please create the directory first"
                    echo
                    sleep 2
                fi
            else
                if [[ -f $HOME/www/$(whoami).$(hostname)/public_html/.htaccess ]]
                then
                    if [[ -z "$(sed -n '/AuthName "Please Login"/p' $HOME/www/$(whoami).$(hostname)/public_html/.htaccess)" ]]
                    then
                        echo -e "\n######\nAuthUserFile \"$HOME/private/.htpasswd\"\nAuthGroupFile /dev/null\nAuthName \"Please Login\"\nAuthType Basic\n#####\nRequire valid-user\n####\nSatisfy All\n###" >> $HOME/www/$(whoami).$(hostname)/public_html/.htaccess
                        find $HOME/www/$(whoami).$(hostname)/public_html -type f -name ".htaccess" -exec chmod 644 {} \;
                        echo -e "The" "\033[36m"".htaccess""\e[0m" "file was created or updated in the" "\033[36m""WWW""\e[0m" "root"
                        echo
                        echo -e "\033[32m""To make a directory user specific: Change:""\e[0m" "\033[33m""Require valid-user""\e[0m" "\033[32m""to""\e[0m" "\033[33m""Require user $username""\e[0m"
                        echo
                        sleep 2
                    else
                        echo -e "This" "\033[36m"".htaccess""\e[0m" "already has a Authfile entry."
                        sleep 2
                        echo
                    fi
                else
                    echo -e "\n######\nAuthUserFile \"$HOME/private/.htpasswd\"\nAuthGroupFile /dev/null\nAuthName \"Please Login\"\nAuthType Basic\n#####\nRequire valid-user\n####\nSatisfy All\n###" >> $HOME/www/$(whoami).$(hostname)/public_html/.htaccess
                    find $HOME/www/$(whoami).$(hostname)/public_html -type f -name ".htaccess" -exec chmod 644 {} \;
                    echo -e "The" "\033[36m"".htaccess""\e[0m" "file was created or updated in the" "\033[36m""WWW""\e[0m" "root"
                    echo
                    echo -e "\033[32m""To make a directory user specific: Copy the .htaccess there, change:""\e[0m" "\033[33m""Require valid-user""\e[0m" "\033[32m""to""\e[0m" "\033[33m""Require user $username""\e[0m"
                    echo
                    sleep 2
                fi
            fi
            # htaccess generation end
        else
            echo -e "\033[31m""The ~/private/.htpasswd exists.""\e[0m" 
            read -ep "Do you wish overwrite it? [y] yes or [n] no: " confirm
            if [[ $confirm =~ ^[Yy]$ ]]
            then
                echo -e "\033[1;32m""Note: Use a good password manager like keepass so you can easily manage secure passwords." "\e[0m"
                echo -e "\033[33m""Note: This will append/add the settings if a .htaccess already exists in the web server root""\e[0m"
                read -ep "What is the username you wish to create?: " username
                htpasswd -cm $HOME/private/.htpasswd $username
                chmod 644 $HOME/private/.htpasswd
                echo
                echo -e "The" "\033[36m"".htpasswd""\e[0m" "file was created and the user" "\033[32m""$username""\e[0m" "added"
                echo
            # htaccess generation
            echo -e "\033[31m""If no custom location is given then it will be created in the WWW root""\e[0m"
            read -ep "Would you like to create the .htaccess in a specific location? [y] yes or [n] no: " specificloc
            echo
            if [[ $specificloc =~ ^[Yy]$ ]]
            then
                echo -e "\033[32m""This path is relative to your WWW root. For links you would enter this path:""\e[0m" "\033[36m""/links""\e[0m"
                read -ep "Give the name of the folder you with to create the .htaccess in: /" specificlocpath
                echo
                if [[ -d $HOME/www/$(whoami).$(hostname)/public_html/$specificlocpath ]]
                then
                    if [[ -f $HOME/www/$(whoami).$(hostname)/public_html/$specificlocpath/.htaccess ]]
                    then
                        if [[ -z "$(sed -n '/AuthName "Please Login"/p' $HOME/www/$(whoami).$(hostname)/public_html/$specificlocpath/.htaccess)" ]]
                        then
                            echo -e "\n######\nAuthUserFile \"$HOME/private/.htpasswd\"\nAuthGroupFile /dev/null\nAuthName \"Please Login\"\nAuthType Basic\n#####\nRequire valid-user\n####\nSatisfy All\n###" >> $HOME/www/$(whoami).$(hostname)/public_html/$specificlocpath/.htaccess
                            find $HOME/www/$(whoami).$(hostname)/public_html -type f -name ".htaccess" -exec chmod 644 {} \;
                            echo -e "The" "\033[36m"".htaccess""\e[0m" "file was created or updated in" "\033[36m""/$specificlocpath""\e[0m"
                            echo
                            echo -e "\033[32m""To make a directory user specific: Change:""\e[0m" "\033[33m""Require valid-user""\e[0m" "\033[32m""to""\e[0m" "\033[33m""Require user $username""\e[0m"
                            echo
                            sleep 2
                        else
                            echo -e "This" "\033[36m"".htaccess""\e[0m" "already has a Authfile entry."
                            sleep 2
                            echo
                        fi
                    else
                        echo -e "\n######\nAuthUserFile \"$HOME/private/.htpasswd\"\nAuthGroupFile /dev/null\nAuthName \"Please Login\"\nAuthType Basic\n#####\nRequire valid-user\n####\nSatisfy All\n###" >> $HOME/www/$(whoami).$(hostname)/public_html/$specificlocpath/.htaccess
                        find $HOME/www/$(whoami).$(hostname)/public_html -type f -name ".htaccess" -exec chmod 644 {} \;
                        echo -e "The" "\033[36m"".htaccess""\e[0m" "file was created or updated in" "\033[36m""/$specificlocpath""\e[0m"
                        echo
                            echo -e "\033[32m""To make a directory user specific: Change:""\e[0m" "\033[33m""Require valid-user""\e[0m" "\033[32m""to""\e[0m" "\033[33m""Require user $username""\e[0m"
                            echo
                        sleep 2
                    fi
                else
                    echo -e "\033[31m""This location does not exist.""\e[0m" "Please create the directory first"
                    echo
                    sleep 2
                fi
            else
                if [[ -f $HOME/www/$(whoami).$(hostname)/public_html/.htaccess ]]
                then
                    if [[ -z "$(sed -n '/AuthName "Please Login"/p' $HOME/www/$(whoami).$(hostname)/public_html/.htaccess)" ]]
                    then
                        echo -e "\n######\nAuthUserFile \"$HOME/private/.htpasswd\"\nAuthGroupFile /dev/null\nAuthName \"Please Login\"\nAuthType Basic\n#####\nRequire valid-user\n####\nSatisfy All\n###" >> $HOME/www/$(whoami).$(hostname)/public_html/.htaccess
                        find $HOME/www/$(whoami).$(hostname)/public_html -type f -name ".htaccess" -exec chmod 644 {} \;
                        echo -e "The" "\033[36m"".htaccess""\e[0m" "file was created or updated in the" "\033[36m""WWW""\e[0m" "root"
                        echo
                        echo -e "\033[32m""To make a directory user specific: Change:""\e[0m" "\033[33m""Require valid-user""\e[0m" "\033[32m""to""\e[0m" "\033[33m""Require user $username""\e[0m"
                        echo
                        sleep 2
                    else
                        echo -e "This" "\033[36m"".htaccess""\e[0m" "already has a Authfile entry."
                        sleep 2
                        echo
                    fi
                else
                    echo -e "\n######\nAuthUserFile \"$HOME/private/.htpasswd\"\nAuthGroupFile /dev/null\nAuthName \"Please Login\"\nAuthType Basic\n#####\nRequire valid-user\n####\nSatisfy All\n###" >> $HOME/www/$(whoami).$(hostname)/public_html/.htaccess
                    find $HOME/www/$(whoami).$(hostname)/public_html -type f -name ".htaccess" -exec chmod 644 {} \;
                    echo -e "The" "\033[36m"".htaccess""\e[0m" "file was created or updated in the" "\033[36m""WWW""\e[0m" "root"
                    echo
                    echo -e "\033[32m""To make a directory user specific: Copy the .htaccess there, change:""\e[0m" "\033[33m""Require valid-user""\e[0m" "\033[32m""to""\e[0m" "\033[33m""Require user $username""\e[0m"
                    echo
                    sleep 2
                fi
            fi
            # htaccess generation end
            else
                read -ep "Would you like to just generate the .htaccess? [y] yes or [n] no: " justdoit
                if [[ $justdoit =~ ^[Yy]$ ]]
                then
                    # htaccess generation
                    echo -e "\033[31m""If no custom location is given then it will be created in the WWW root""\e[0m"
                    read -ep "Would you like to create the .htaccess in a specific location? [y] yes or [n] no: " specificloc
                    echo
                    if [[ $specificloc =~ ^[Yy]$ ]]
                    then
                        echo -e "\033[32m""This path is relative to your WWW root. For links you would enter this path:""\e[0m" "\033[36m""/links""\e[0m"
                        read -ep "Give the name of the folder you with to create the .htaccess in: /" specificlocpath
                        echo
                        if [[ -d $HOME/www/$(whoami).$(hostname)/public_html/$specificlocpath ]]
                        then
                            if [[ -f $HOME/www/$(whoami).$(hostname)/public_html/$specificlocpath/.htaccess ]]
                            then
                                if [[ -z "$(sed -n '/AuthName "Please Login"/p' $HOME/www/$(whoami).$(hostname)/public_html/$specificlocpath/.htaccess)" ]]
                                then
                                    echo -e "\n######\nAuthUserFile \"$HOME/private/.htpasswd\"\nAuthGroupFile /dev/null\nAuthName \"Please Login\"\nAuthType Basic\n#####\nRequire valid-user\n####\nSatisfy All\n###" >> $HOME/www/$(whoami).$(hostname)/public_html/$specificlocpath/.htaccess
                                    find $HOME/www/$(whoami).$(hostname)/public_html -type f -name ".htaccess" -exec chmod 644 {} \;
                                    echo -e "The" "\033[36m"".htaccess""\e[0m" "file was created or updated in" "\033[36m""/$specificlocpath""\e[0m"
                                    echo
                                    echo -e "\033[32m""To make a directory user specific: Change:""\e[0m" "\033[33m""Require valid-user""\e[0m" "\033[32m""to""\e[0m" "\033[33m""Require user $username""\e[0m"
                                    echo
                                    sleep 2
                                else
                                    echo -e "This" "\033[36m"".htaccess""\e[0m" "already has a Authfile entry."
                                    sleep 2
                                    echo
                                fi
                            else
                                echo -e "\n######\nAuthUserFile \"$HOME/private/.htpasswd\"\nAuthGroupFile /dev/null\nAuthName \"Please Login\"\nAuthType Basic\n#####\nRequire valid-user\n####\nSatisfy All\n###" >> $HOME/www/$(whoami).$(hostname)/public_html/$specificlocpath/.htaccess
                                find $HOME/www/$(whoami).$(hostname)/public_html -type f -name ".htaccess" -exec chmod 644 {} \;
                                echo -e "The" "\033[36m"".htaccess""\e[0m" "file was created or updated in" "\033[36m""/$specificlocpath""\e[0m"
                                echo
                                    echo -e "\033[32m""To make a directory user specific: Change:""\e[0m" "\033[33m""Require valid-user""\e[0m" "\033[32m""to""\e[0m" "\033[33m""Require user $username""\e[0m"
                                    echo
                                sleep 2
                            fi
                        else
                            echo -e "\033[31m""This location does not exist.""\e[0m" "Please create the directory first"
                            echo
                            sleep 2
                        fi
                    else
                        if [[ -f $HOME/www/$(whoami).$(hostname)/public_html/.htaccess ]]
                        then
                            if [[ -z "$(sed -n '/AuthName "Please Login"/p' $HOME/www/$(whoami).$(hostname)/public_html/.htaccess)" ]]
                            then
                                echo -e "\n######\nAuthUserFile \"$HOME/private/.htpasswd\"\nAuthGroupFile /dev/null\nAuthName \"Please Login\"\nAuthType Basic\n#####\nRequire valid-user\n####\nSatisfy All\n###" >> $HOME/www/$(whoami).$(hostname)/public_html/.htaccess
                                find $HOME/www/$(whoami).$(hostname)/public_html -type f -name ".htaccess" -exec chmod 644 {} \;
                                echo -e "The" "\033[36m"".htaccess""\e[0m" "file was created or updated in the" "\033[36m""WWW""\e[0m" "root"
                                echo
                                echo -e "\033[32m""To make a directory user specific: Change:""\e[0m" "\033[33m""Require valid-user""\e[0m" "\033[32m""to""\e[0m" "\033[33m""Require user $username""\e[0m"
                                echo
                                sleep 2
                            else
                                echo -e "This" "\033[36m"".htaccess""\e[0m" "already has a Authfile entry."
                                sleep 2
                                echo
                            fi
                        else
                            echo -e "\n######\nAuthUserFile \"$HOME/private/.htpasswd\"\nAuthGroupFile /dev/null\nAuthName \"Please Login\"\nAuthType Basic\n#####\nRequire valid-user\n####\nSatisfy All\n###" >> $HOME/www/$(whoami).$(hostname)/public_html/.htaccess
                            find $HOME/www/$(whoami).$(hostname)/public_html -type f -name ".htaccess" -exec chmod 644 {} \;
                            echo -e "The" "\033[36m"".htaccess""\e[0m" "file was created or updated in the" "\033[36m""WWW""\e[0m" "root"
                            echo
                            echo -e "\033[32m""To make a directory user specific: Copy the .htaccess there, change:""\e[0m" "\033[33m""Require valid-user""\e[0m" "\033[32m""to""\e[0m" "\033[33m""Require user $username""\e[0m"
                            echo
                            sleep 2
                        fi
                    fi
                    # htaccess generation end
                fi
            fi
        fi
        ;;
##########
        "3") # Add a new user or update an existing user, in your ~/private/.htpasswd
        if [ -f $HOME/private/.htpasswd ]
        then
            echo -e "\033[1;32m""Note: Use a good password manager like keepass so you can easily manage good passwords.""\e[0m"
            echo -e "\033[31m""Enter an existing username to update, or a new username to create an entry.""\e[0m"
            echo
            echo -e "Here is a list of the usernames and their order in your" "\033[36m""$HOME/private/.htpasswd""\e[0m"
            echo -e "\033[1;31m"
            cat $HOME/private/.htpasswd | cut -d:  -f1
            echo -e "\e[0m"
            read -ep "What is the username you wish to create, if they are not listed above, or edit if they exist?: " username
            htpasswd -m $HOME/private/.htpasswd $username
            sleep 3
        else
            echo -e "\033[31m" "The file does not exist." "\033[32m""Use option 1 first""\e[0m"
            sleep 2
        fi
        ;;
##########
        "4") # Delete a user from your ~/private/.htpasswd
        if [ -f $HOME/private/.htpasswd ]
        then
            echo -e "Here is a list of the usernames and their order in your" "\033[36m""$HOME/private/.htpasswd""\e[0m"
            echo -e "\033[1;31m"
            cat $HOME/private/.htpasswd | cut -d:  -f1
            echo -e "\e[0m"
            echo -e "Enter username from the list to delete them."
            read -ep "What is the username you wish to remove?: " username
            htpasswd -D $HOME/private/.htpasswd $username
            find $HOME/www/$(whoami).$(hostname)/public_html -type f -name ".htaccess" -exec sed -i "/user $username/d" {} \; -exec chmod 644 {} \;
            echo
            echo -e "The user:""\033[31m""$username""\e[0m" "was deleted from all .htaccess files, if present"
            sleep 3
        else
            echo -e "\033[31m" "The file does not exist." "\033[32m""Use option 1 first""\e[0m"
            sleep 2
        fi
            
        ;;
##########
        "5") # Protect the /links directory using ~/private/.htpasswd
        if [ -d $HOME/www/$(whoami).$(hostname)/public_html/links ]
        then
            echo -e "######\nAuthUserFile \"$HOME/private/.htpasswd\"\nAuthGroupFile /dev/null\nAuthName \"Please Login\"\nAuthType Basic\n#####\nRequire valid-user\n####\nSatisfy All\n###" > $HOME/www/$(whoami).$(hostname)/public_html/links/.htaccess
            echo -e "The" "\033[36m""/links""\e[0m" "directory has been protected using the" "\033[36m""~/private/.htpasswd""\e[0m"
        else
            echo -e "The" "\033[36m""$HOME/www/$(whoami).$(hostname)/public_html/links""\e[0m" "does not exist"
        fi
        sleep 2
        ;;
##########
        "6") # List ~/private/.htpasswd users and their order
        if [ -f $HOME/private/.htpasswd ]
        then
            echo -e "Here is a list of the usernames and their order in your" "\033[36m""$HOME/private/.htpasswd""\e[0m"
            echo -e "\033[1;31m"
            cat $HOME/private/.htpasswd | cut -d:  -f1
            echo -e "\e[0m"
            sleep 4
        else
            echo -e "\033[31m" "The file does not exist." "\033[32m""Use option 1 first""\e[0m"
            sleep 2
        fi
        ;;
##########
        "7") # RuTorrent: Change the existing Rutorrent .htaccess to use ~/private/.htpasswd
        if [ -f $HOME/www/$(whoami).$(hostname)/public_html/rutorrent/.htaccess ]
        then
            echo -e "\033[32m""This will change where the rutorrent htaccess looks for the htpasswd file""\e[0m"
            read -ep "Are you sure you want to change this [y] or quit back to the menu [q] : " confirm
            if [[ $confirm =~ ^[Yy]$ ]]; then
                sed -i "s|AuthUserFile .*|AuthUserFile \"$HOME/private/.htpasswd\"|g" $HOME/www/$(whoami).$(hostname)/public_html/rutorrent/.htaccess
                sed -i "s|AuthName .*|AuthName \"Please Login\"|g" $HOME/www/$(whoami).$(hostname)/public_html/rutorrent/.htaccess
                echo -e "The path has been changed to:" "\033[36m""$HOME/private/.htpasswd""\e[0m"
                sleep 2
            fi
        else
            echo -e "\033[31m" "The file does not exist." "\033[32m""Is RuTorrent installed?""\e[0m"
            sleep 2
        fi
        ;;
##########
        "8") # RuTorrent: Add or edit a user in the existing Rutorrent .htpasswd
        if [ -f $HOME/www/$(whoami).$(hostname)/public_html/rutorrent/.htpasswd ]
        then
            echo -e "\033[1;32m""Note: Use a good password manager like keepass so you can easily manage good passwords.""\e[0m"
            echo -e "\033[32m""Here is a list of the usernames and their order in your" "\033[36m""/rutorrent/.htpasswd""\e[0m"
            echo -e "\033[1;31m"
            cat $HOME/www/$(whoami).$(hostname)/public_html/rutorrent/.htpasswd | cut -d:  -f1
            echo -e "\e[0m"
            echo -e "\033[33m""Enter an existing username to update or a new one to create an entry.""\e[0m"
            read -ep "What is the username you wish to create, if they are not listed above, or edit if they exist?: " username
            htpasswd -m $HOME/www/$(whoami).$(hostname)/public_html/rutorrent/.htpasswd $username
            sleep 2
        else
            echo -e "\033[31m" "The file does not exist." "\033[32m""Is RuTorrent installed?""\e[0m"
            sleep 2
        fi
        ;;
##########
        "9") # RuTorrent: Delete a user in the existing Rutorrent .htpasswd
        if [ -f $HOME/www/$(whoami).$(hostname)/public_html/rutorrent/.htpasswd ]
        then
            echo -e "\033[32m""Here is a list of the usernames and their order in your" "\033[36m""/rutorrent/.htpasswd""\e[0m"
            echo -e "\033[1;31m"
            cat $HOME/www/$(whoami).$(hostname)/public_html/rutorrent/.htpasswd | cut -d:  -f1
            echo -e "\e[0m"
            echo -e "\033[33m""Enter username from the list to delete them.""\e[0m"
            read -ep "What is the username you wish to remove?: " username
            htpasswd -D $HOME/www/$(whoami).$(hostname)/public_html/rutorrent/.htpasswd $username
            sleep 2
        else
            echo -e "\033[31m" "The file does not exist." "\033[32m""Is RuTorrent installed?""\e[0m"
            sleep 2
        fi
        ;;
##########
        "10") #RuTorrent: Protect the /links directory using /rutorrent/.htpasswd
        if [ -d $HOME/www/$(whoami).$(hostname)/public_html/links ]
        then
            echo -e "######\nAuthUserFile \"$HOME/www/$(whoami).$(hostname)/public_html/rutorrent/.htpasswd\"\nAuthGroupFile /dev/null\nAuthName \"$(whoami)\"\nAuthType Basic\n#####\nRequire valid-user\n####\nSatisfy All\n###" > $HOME/www/$(whoami).$(hostname)/public_html/links/.htaccess
            echo -e "The" "\033[36m""/links""\e[0m" "directory has been protected using the" "\033[36m""/rutorrent/.htpasswd""\e[0m"
        else
            echo -e "The" "\033[36m""$HOME/www/$(whoami).$(hostname)/public_html/links""\e[0m" "does not exist"
        fi
        sleep 2
        ;;
##########
        "11") # RuTorrent: List .htpasswd users and their order
        if [ -f $HOME/www/$(whoami).$(hostname)/public_html/rutorrent/.htpasswd ]
        then
            echo -e "\033[32m""Here is a list of the usernames and their order in your" "\033[36m""/rutorrent/.htpasswd""\e[0m"
            echo -e "\033[1;31m"
            cat $HOME/www/$(whoami).$(hostname)/public_html/rutorrent/.htpasswd | cut -d:  -f1
            echo -e "\e[0m"
            sleep 4
        else
            echo -e "\033[31m" "The file does not exist." "\033[32m""Is RuTorrent installed?""\e[0m"
            sleep 2
        fi
        ;;
##########
        "12") # Change all public_html .htaccess to use the ~/private/.htpasswd AuthFile path (if present)
            echo -e "\033[31m""Warning: This will edit EVERY" "\033[36m"".htaccess""\e[0m" "\033[31m""in your WWW""\e[0m"
            echo -e "This will change all" "\033[31m"".htaccess""\e[0m" "files AuthFile line if it is present"
            read -ep "Do you wish to do this? [y] yes or [n] no: " confirm
            echo
            if [[ $confirm =~ ^[Yy]$ ]]
            then
                if [[ -f $HOME/private/.htpasswd ]]
                then
                    find $HOME/www/$(whoami).$(hostname)/public_html -type f -name ".htaccess" -exec sed -i "s|AuthUserFile .*|AuthUserFile \"$HOME/private/.htpasswd\"|g" {} \; -exec chmod 644 {} \;
                    find $HOME/www/$(whoami).$(hostname)/public_html -type f -name ".htaccess" -exec sed -i "s|AuthName .*|AuthName \"Please Login\"|g" {} \; -exec chmod 644 {} \;
                    echo "Job done."
                    sleep 2
                else
                    echo "The file does not exist. Make sure the path is correct"
                    sleep 2
                fi
            fi
        ;;
##########
        "13") # Change all public_html .htaccess to use the ~/rutorrent/.htpasswd AuthFile path (if present)
            echo -e "\033[31m""Warning: This will edit EVERY" "\033[36m"".htaccess""\e[0m" "\033[31m""in your WWW""\e[0m"
            echo -e "This will change all" "\033[31m"".htaccess""\e[0m" "files AuthFile line if it is present"
            read -ep "Do you wish to do this? [y] yes or [n] no: " confirm
            echo
            if [[ $confirm =~ ^[Yy]$ ]]
            then
                if [[ -f $HOME/www/$(whoami).$(hostname)/public_html/rutorrent/.htpasswd ]]
                then
                    find $HOME/www/$(whoami).$(hostname)/public_html -type f -name ".htaccess" -exec sed -i "s|AuthUserFile .*|AuthUserFile \"$HOME/www/$(whoami).$(hostname)/public_html/rutorrent/.htpasswd\"|g" {} \; -exec chmod 644 {} \;
                    find $HOME/www/$(whoami).$(hostname)/public_html -type f -name ".htaccess" -exec sed -i "s|AuthName .*|AuthName \"$(whoami)\"|g" {} \; -exec chmod 644 {} \;
                    echo "Job done."
                    sleep 2
                else
                    echo "The file does not exist. Make sure the path is correct"
                    sleep 2
                fi
            fi
        ;;
##########
        "14") # Change all public_html .htaccess to use a custom AuthFile path (if present)
            echo -e "\033[31m""Warning: This will edit EVERY" "\033[36m"".htaccess""\e[0m" "\033[31m""in your WWW""\e[0m"
            echo -e "Please include" "\033[31m"".htpasswd""\e[0m" "in your path"
            echo -e "For example" "\033[31m""private/.htpasswd""\e[0m" "will work"
            read -ep "Please enter the relative path to your .htpasswd: ~/" path
            echo
            if [[ -f $HOME/$path ]]
            then
                find $HOME/www/$(whoami).$(hostname)/public_html -type f -name ".htaccess" -exec sed -i "s|AuthUserFile .*|AuthUserFile \"$HOME/$path\"|g" {} \; -exec chmod 644 {} \;
                find $HOME/www/$(whoami).$(hostname)/public_html -type f -name ".htaccess" -exec sed -i "s|AuthName .*|AuthName \"Please Login\"|g" {} \; -exec chmod 644 {} \;
                echo "Job done."
                sleep 2
            else
                echo "The file ~/$path does not exist. Make sure the path is correct"
                sleep 2
            fi
        ;;
##########
        "15") # Protect the /links directory using the ~/private/.htpasswd
        if [[ -f ~/private/.htpasswd && -d ~/.nginx/conf.d  ]]
        then
        echo -e 'location /links {\n    auth_basic "Please log in";\n    auth_basic_user_file '$HOME'/private/.htpasswd;\n}' > ~/.nginx/conf.d/000-default-server.d/links.conf
        killall -9 nginx php5-fpm -u $(whoami)
        echo "Now wait up to 5 minutes for nginx to restart"
        echo
        sleep 2
        else
            echo -e "\033[31m""required files and the folder" "\033[36m""~/.nginx/conf.d""\e[0m" "\033[31m""do not exist""\e[0m"
            echo
            sleep 2
        fi
        ;;
##########
        "16") # Protect the /links directory using the /rutorrent/.htpasswd
        if [[ -f ~/www/$(whoami).$(hostname)/public_html/rutorrent/.htpasswd && -d ~/.nginx/conf.d ]]
        then
        echo -e 'location /links {\n    auth_basic "Please log in";\n    auth_basic_user_file '$HOME'/www/'$(whoami)'.'$(hostname)'/public_html/rutorrent/.htpasswd;\n}' > ~/.nginx/conf.d/000-default-server.d/links.conf
        killall -9 nginx php5-fpm -u $(whoami)
        echo "Now wait up to 5 minutes for nginx to restart"
        echo
        sleep 2
        else
            echo -e "\033[31m""required files and the folder" "\033[36m""~/.nginx/conf.d""\e[0m" "\033[31m""do not exist""\e[0m"
            echo
            sleep 2
        fi
        ;;
##########
        "17") # Multi Rtorrent/RuTorrent: Add or edit a user in the existing Rutorrent .htpasswd
        echo -e "Where you have" "\033[32m""rutorrent-4""\e[0m" "then" "\033[31m""4""\e[0m" "is the suffix."
        read -ep "Please state the suffix of the instance you wish to modify: " suffix
        echo
        if [ -f $HOME/www/$(whoami).$(hostname)/public_html/rutorrent-$suffix/.htpasswd ]
        then
            echo -e "\033[1;32m""Note: Use a good password manager like keepass so you can easily manage good passwords.""\e[0m"
            echo -e "\033[32m""Here is a list of the usernames and their order in your" "\033[36m""/rutorrent-$suffix/.htpasswd""\e[0m"
            echo -e "\033[1;31m"
            cat $HOME/www/$(whoami).$(hostname)/public_html/rutorrent-$suffix/.htpasswd | cut -d:  -f1
            echo -e "\e[0m"
            echo -e "\033[33m""Enter an existing username to update or a new one to create an entry.""\e[0m"
            read -ep "What is the username you wish to create, if they are not listed above, or edit if they exist?: " username
            htpasswd -m $HOME/www/$(whoami).$(hostname)/public_html/rutorrent-$suffix/.htpasswd $username
            sleep 2
        else
            echo -e "\033[31m" "The file does not exist at rutorrent-$suffix." "\033[32m""Check the suffix was correct""\e[0m"
            sleep 2
        fi
        ;;
##########
        "18") # Multi Rtorrent/RuTorrent: Delete a user in the existing Rutorrent .htpasswd
        echo -e "Where you have" "\033[32m""rutorrent-4""\e[0m" "then" "\033[31m""4""\e[0m" "is the suffix."
        read -ep "Please state the suffix of the instance you wish to modify: " suffix
        echo
        if [ -f $HOME/www/$(whoami).$(hostname)/public_html/rutorrent-$suffix/.htpasswd ]
        then
            echo -e "\033[32m""Here is a list of the usernames and their order in your" "\033[36m""/rutorrent-$suffix/.htpasswd""\e[0m"
            echo -e "\033[1;31m"
            cat $HOME/www/$(whoami).$(hostname)/public_html/rutorrent-$suffix/.htpasswd | cut -d:  -f1
            echo -e "\e[0m"
            echo -e "\033[33m""Enter username from the list to delete them.""\e[0m"
            read -ep "What is the username you wish to remove?: " username
            htpasswd -D $HOME/www/$(whoami).$(hostname)/public_html/rutorrent-$suffix/.htpasswd $username
            sleep 2
        else
            echo -e "\033[31m" "The file does not exist at rutorrent-$suffix." "\033[32m""Is RuTorrent installed?""\e[0m"
            sleep 2
        fi
        ;;
##########
        "19") # Multi Rtorrent/RuTorrent: List .htpasswd users and their order
        echo -e "Where you have" "\033[32m""rutorrent-4""\e[0m" "then" "\033[31m""4""\e[0m" "is the suffix."
        read -ep "Please state the suffix of the instance you wish to modify: " suffix
        echo
        if [ -f $HOME/www/$(whoami).$(hostname)/public_html/rutorrent-$suffix/.htpasswd ]
        then
            echo -e "\033[32m""Here is a list of the usernames and their order in your" "\033[36m""/rutorrent-$suffix/.htpasswd""\e[0m"
            echo -e "\033[1;31m"
            cat $HOME/www/$(whoami).$(hostname)/public_html/rutorrent-$suffix/.htpasswd | cut -d:  -f1
            echo -e "\e[0m"
            sleep 4
        else
            echo -e "\033[31m" "The file does not exist at rutorrent-$suffix." "\033[32m""Is RuTorrent installed?""\e[0m"
            sleep 2
        fi
        ;;
##########
        "20") # Quit
        exit 1
        ;;
##########
    esac
done
#
else
    echo -e "You chose to exit after updating the scripts."
    exit 1
    cd && bash
fi
#
############################
####### Script Ends  #######
############################
#
############################
########## Credit ##########
############################
#
# http://grover.open2space.com/content/bash-script-menus-and-functions
#